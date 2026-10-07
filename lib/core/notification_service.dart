import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui' show Color;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image/image.dart' as img;
import 'package:propertify/app.dart';
import 'package:propertify/core/app_cache_service.dart';
import 'package:propertify/core/notification_router.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/features/auth/bloc/auth_bloc.dart';
import 'package:propertify/features/notifications/bloc/notifications_bloc.dart';
import 'package:propertify/features/notifications/models/notification_model.dart';
import 'package:propertify/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _channelId = 'high_importance_channel';
const String _channelName = 'High Importance Notifications';
const String _channelDescription =
    'This channel is used for important notifications.';
const String _notificationIcon = '@drawable/ic_notification';
// App logo, shown when a notification has no picture of its own.
const String _fallbackLargeIcon = 'notification_large_icon';
const Color _brandColor = Color(0xFF7B68EE);
// Every notification is bundled under one expandable group on Android
// (iOS groups by the thread-id the backend sets).
const String _groupKey = 'com.placeofsalesrealestate.NOTIFICATIONS';
const int _groupSummaryId = 0;
const String _summaryPayload = '{"type":"summary"}';
// The backend broadcasts to every install through this topic.
const String _allUsersTopic = 'all';
// Large photos are scaled down so the notification stays under Android's size limits.
const int _maxPictureSide = 1024;

class NotificationService {
  static final NotificationService instance = NotificationService._internal();
  factory NotificationService() => instance;
  NotificationService._internal();

  FirebaseMessaging? _fcm;
  FirebaseMessaging get fcm => _fcm ??= FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    await _initLocalNotifications(
      _localNotifications,
      onTap: _onLocalNotificationTap,
    );

    // Tap handling is wired up before the permission prompt below, which can
    // block until the user answers.
    final launchDetails =
        await _localNotifications.getNotificationAppLaunchDetails();
    final launchResponse = launchDetails?.notificationResponse;
    if ((launchDetails?.didNotificationLaunchApp ?? false) &&
        launchResponse != null) {
      _onLocalNotificationTap(launchResponse);
    }

    await fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpened);

    final RemoteMessage? initialMessage = await fcm.getInitialMessage();
    if (initialMessage != null) {
      log('App opened from terminated state by notification: ${initialMessage.messageId}');
      _onMessageOpened(initialMessage);
    }

    // Request permission for iOS and Android 13+
    final NotificationSettings settings = await fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    log('Notification permission: ${settings.authorizationStatus}');

    final String? token = await getToken();
    log('FCM Token: $token');

    // On iOS this must run after getToken(), which waits for the APNs token.
    try {
      await fcm.subscribeToTopic(_allUsersTopic);
      log('Subscribed to "$_allUsersTopic" topic');
    } catch (e) {
      log('Error subscribing to "$_allUsersTopic" topic: $e');
    }

    fcm.onTokenRefresh.listen(_syncTokenWithBackend);
  }

  Future<void> _onForegroundMessage(RemoteMessage message) async {
    log('Received foreground message: ${message.messageId} ${message.data}');
    final content = PushContent.fromMessage(message);
    if (content == null || await _isOwnPost(content.data)) return;

    _addToNotificationsBloc(content);
    // iOS presents foreground alerts itself (setForegroundNotificationPresentationOptions).
    if (Platform.isAndroid) {
      await showGroupedNotification(_localNotifications, content);
    }
  }

  // iOS taps, and Android taps on console-style messages the OS displayed.
  void _onMessageOpened(RemoteMessage message) {
    final content = PushContent.fromMessage(message);
    if (content == null) return;
    _addToNotificationsBloc(content, isRead: true);
    NotificationRouter.open(content.data);
  }

  // Android taps on notifications drawn by showGroupedNotification.
  void _onLocalNotificationTap(NotificationResponse response) {
    log('Notification tapped: ${response.payload}');
    final content = PushContent.fromPayload(response.payload);
    if (content == null) {
      NotificationRouter.open(const {});
      return;
    }
    _addToNotificationsBloc(content, isRead: true);
    NotificationRouter.open(content.data);
  }

  void _syncTokenWithBackend(String fcmToken) {
    log('FCM Token refreshed: $fcmToken');
    final accessToken = serviceLocator<AppCacheService>().getToken();
    final context = navigationKey.currentContext;
    if (accessToken == null || accessToken.isEmpty || context == null) return;
    context.read<AuthBloc>().add(AuthEvent.updateFcmToken(fcmToken: fcmToken));
  }

  Future<void> showLocalNotification({
    required String title,
    required String body,
    String? type,
    String? referenceId,
  }) async {
    final content = PushContent(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title,
      body: body,
      data: {
        'type': type,
        'reference_id': referenceId,
        'title': title,
        'body': body,
      },
    );
    _addToNotificationsBloc(content);
    await showGroupedNotification(_localNotifications, content);
  }

  void _addToNotificationsBloc(PushContent content, {bool isRead = false}) {
    try {
      final context = navigationKey.currentContext;
      if (context == null) return;
      final data = content.data;
      context.read<NotificationsBloc>().add(
            AddNotification(
              NotificationModel(
                id: content.id,
                title: content.title,
                body: content.body,
                timestamp: DateTime.now(),
                isRead: isRead,
                type: data['type']?.toString(),
                referenceId: (data['property_id'] ??
                        data['reel_id'] ??
                        data['service_id'] ??
                        data['project_id'] ??
                        data['reference_id'])
                    ?.toString(),
                imageUrl: content.imageUrl,
                data: data,
              ),
            ),
          );
    } catch (e) {
      log('Error adding to notifications bloc: $e');
    }
  }

  Future<String?> getToken() async {
    if (Platform.isIOS) {
      // For iOS, ensure APNs token is available before getting FCM token
      String? apnsToken = await fcm.getAPNSToken();
      if (apnsToken != null) {
        log('APNS Token available');
      } else {
        log('APNS Token not available yet');
        await Future<void>.delayed(const Duration(seconds: 3));
        apnsToken = await fcm.getAPNSToken();
        log('APNS Token after delay: $apnsToken');
        if (apnsToken == null) {
          log(
            'APNS token is null. If you are on a simulator, push notifications are not fully supported. Ensure Push Notifications capability is enabled in Xcode.',
          );
        }
      }
    }

    try {
      return await fcm.getToken();
    } catch (e) {
      log('Error getting FCM token: $e');
      return null;
    }
  }
}

/// Title, body, picture and routing data of one push, whether it came from
/// FCM directly or back from a tapped local notification's payload.
class PushContent {
  final String id;
  final String title;
  final String body;
  final String? imageUrl;
  final Map<String, dynamic> data;

  const PushContent({
    required this.id,
    required this.title,
    required this.body,
    required this.data,
    this.imageUrl,
  });

  static PushContent? fromMessage(RemoteMessage message) {
    final data = Map<String, dynamic>.from(message.data);
    final title = message.notification?.title ?? data['title']?.toString() ?? '';
    final body = message.notification?.body ?? data['body']?.toString() ?? '';
    if (title.isEmpty && body.isEmpty) return null;

    final id = message.messageId ?? DateTime.now().microsecondsSinceEpoch.toString();
    final image = data['image']?.toString() ??
        message.notification?.android?.imageUrl ??
        message.notification?.apple?.imageUrl;
    data
      ..['message_id'] = id
      ..['title'] = title
      ..['body'] = body;
    return PushContent(
      id: id,
      title: title,
      body: body,
      data: data,
      imageUrl: (image == null || image.isEmpty) ? null : image,
    );
  }

  static PushContent? fromPayload(String? payload) {
    if (payload == null || payload.isEmpty || payload == _summaryPayload) {
      return null;
    }
    try {
      final data = (jsonDecode(payload) as Map).cast<String, dynamic>();
      final image = data['image']?.toString();
      return PushContent(
        id: data['message_id']?.toString() ??
            DateTime.now().microsecondsSinceEpoch.toString(),
        title: data['title']?.toString() ?? '',
        body: data['body']?.toString() ?? '',
        data: data,
        imageUrl: (image == null || image.isEmpty) ? null : image,
      );
    } catch (e) {
      log('Invalid notification payload: $e');
      return null;
    }
  }
}

Future<void> _initLocalNotifications(
  FlutterLocalNotificationsPlugin plugin, {
  DidReceiveNotificationResponseCallback? onTap,
}) async {
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings(_notificationIcon);
  // Permission is requested through FirebaseMessaging.
  const DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );
  await plugin.initialize(
    const InitializationSettings(android: androidSettings, iOS: iosSettings),
    onDidReceiveNotificationResponse: onTap,
  );

  await plugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(
        const AndroidNotificationChannel(
          _channelId,
          _channelName,
          description: _channelDescription,
          importance: Importance.high,
        ),
      );
}

/// Draws [content] on Android as part of the app's single notification group,
/// with the post's picture (or the app logo when there is none).
Future<void> showGroupedNotification(
  FlutterLocalNotificationsPlugin plugin,
  PushContent content,
) async {
  final Uint8List? picture = await _downloadPicture(content.imageUrl);
  final AndroidBitmap<Object> largeIcon;
  if (picture != null) {
    largeIcon = ByteArrayAndroidBitmap(picture);
  } else {
    largeIcon = const DrawableResourceAndroidBitmap(_fallbackLargeIcon);
  }
  final StyleInformation style = picture != null
      ? BigPictureStyleInformation(
          ByteArrayAndroidBitmap(picture),
          largeIcon: largeIcon,
          contentTitle: content.title,
          summaryText: content.body,
          hideExpandedLargeIcon: true,
        )
      : BigTextStyleInformation(content.body, contentTitle: content.title);

  await plugin.show(
    _notificationIdFor(content.id),
    content.title,
    content.body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: _channelDescription,
        importance: Importance.high,
        priority: Priority.high,
        color: _brandColor,
        largeIcon: largeIcon,
        styleInformation: style,
        groupKey: _groupKey,
      ),
    ),
    payload: jsonEncode(content.data),
  );

  await plugin.show(
    _groupSummaryId,
    content.title,
    content.body,
    const NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: _channelDescription,
        importance: Importance.high,
        priority: Priority.high,
        color: _brandColor,
        groupKey: _groupKey,
        setAsGroupSummary: true,
        groupAlertBehavior: GroupAlertBehavior.children,
        onlyAlertOnce: true,
        styleInformation: InboxStyleInformation(<String>[]),
      ),
    ),
    payload: _summaryPayload,
  );
}

// Positive and never equal to the group summary's id.
int _notificationIdFor(String messageId) =>
    (messageId.hashCode & 0x7ffffffe) + 1;

Future<Uint8List?> _downloadPicture(String? url) async {
  if (url == null || url.isEmpty) return null;
  final client = HttpClient()..connectionTimeout = const Duration(seconds: 8);
  try {
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close().timeout(const Duration(seconds: 10));
    if (response.statusCode != HttpStatus.ok) return null;
    final bytes = await consolidateHttpClientResponseBytes(response);
    final decoded = img.decodeImage(bytes);
    if (decoded == null) return null;
    if (decoded.width <= _maxPictureSide && decoded.height <= _maxPictureSide) {
      return bytes;
    }
    final resized = decoded.width >= decoded.height
        ? img.copyResize(decoded, width: _maxPictureSide)
        : img.copyResize(decoded, height: _maxPictureSide);
    return Uint8List.fromList(img.encodeJpg(resized, quality: 85));
  } catch (e) {
    log('Could not load notification picture $url: $e');
    return null;
  } finally {
    client.close();
  }
}

// The poster also receives the "all" topic broadcast of their own new post.
Future<bool> _isOwnPost(Map<String, dynamic> data) async {
  if (data['type'] != 'new_post') return false;
  final ownerId = data['owner_id']?.toString();
  if (ownerId == null || ownerId.isEmpty) return false;
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(CUSTOMER_ACCOUNT_ID) == ownerId;
}

// Runs in a separate isolate; the pragma keeps it from being tree-shaken in release builds.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  log("Handling a background message: ${message.messageId}");

  // Android data-only messages are drawn here. iOS alerts, and messages with a
  // notification payload, are already shown by the OS.
  if (!Platform.isAndroid || message.notification != null) return;
  final content = PushContent.fromMessage(message);
  if (content == null || await _isOwnPost(content.data)) return;

  final plugin = FlutterLocalNotificationsPlugin();
  await _initLocalNotifications(plugin);
  await showGroupedNotification(plugin, content);
}
