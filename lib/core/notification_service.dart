import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  FirebaseMessaging? _fcm;
  FirebaseMessaging get fcm => _fcm ??= FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    // Request permission for iOS and Android 13+
    NotificationSettings settings = await fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
    }

    // Initialize local notifications for foreground
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();
    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle notification tap
        log('Notification tapped: ${response.payload}');
      },
    );

    // Create Android Notification Channel
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    // Set presentation options for iOS
    await fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Get FCM Token
    String? token = await getToken();
    log('FCM Token: $token');

    // Handle Foreground Messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Received foreground message: ${message.notification?.title}');

      RemoteNotification? notification = message.notification;

      if (notification != null) {
        _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              importance: Importance.high,
              priority: Priority.high,
              icon: '@mipmap/ic_launcher',
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
          payload: message.data.toString(),
        );
      }
    });

    // Handle Background Messages (when app is opened from notification)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log(
        'Notification opened from background: ${message.notification?.title}',
      );
      // Navigate to specific screen if needed
    });

    // Check if app was opened from terminated state by a notification
    RemoteMessage? initialMessage = await fcm.getInitialMessage();
    if (initialMessage != null) {
      log(
        'App opened from terminated state by notification: ${initialMessage.notification?.title}',
      );
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

// Global background message handler
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("Handling a background message: ${message.messageId}");
}
