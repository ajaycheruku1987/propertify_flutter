import 'dart:developer';

import 'package:propertify/core/app_cache_service.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/features/admin/presentation/requests_screen.dart';
import 'package:propertify/features/company/presentation/my_company.dart';
import 'package:propertify/features/feed/presentation/post_details.dart';
import 'package:propertify/features/notifications/models/notification_model.dart';
import 'package:propertify/features/notifications/presentation/notifications_screen.dart';
import 'package:propertify/features/reels/presentation/reels_screen.dart';
import 'package:propertify/features/sales/models/sales_model.dart';
import 'package:propertify/features/sales/presentation/sale_view_screen.dart';
import 'package:propertify/features/services/presentation/view_service.dart';
import 'package:propertify/utils/app_routing/app_navigations.dart';

/// Opens the screen a push / in-app notification points to, based on the
/// backend's `type` and id fields in the payload.
class NotificationRouter {
  NotificationRouter._();

  static bool _appReady = false;
  static Map<String, dynamic>? _pending;

  /// Called once the splash screen has moved to home. Taps that launched the
  /// app wait for this, otherwise the splash redirect would replace the screen.
  static void markAppReady() {
    _appReady = true;
    final pending = _pending;
    _pending = null;
    if (pending != null) open(pending);
  }

  /// In-app notification list tap — uses model fields when `data` is incomplete.
  static void openNotification(NotificationModel notification) {
    open(notification.routingData);
  }

  static void open(Map<String, dynamic> data) {
    if (!_appReady) {
      _pending = data;
      return;
    }
    String field(String key) => (data[key] ?? '').toString().trim();

    final type = field('type');
    final propertyId = field('property_id').isNotEmpty
        ? field('property_id')
        : _fallbackId(type, data, forProperty: true);
    final reelId = field('reel_id').isNotEmpty
        ? field('reel_id')
        : _fallbackId(type, data, forReel: true);
    final serviceId = field('service_id').isNotEmpty
        ? field('service_id')
        : _fallbackId(type, data, forService: true);
    final projectId = field('project_id').isNotEmpty
        ? field('project_id')
        : _fallbackId(type, data, forProject: true);
    log('Opening notification: type=$type data=$data');

    switch (type) {
      case 'new_post':
      case 'like':
      case 'comment':
      case 'view':
      case 'share':
      case 'favourite':
      case 'contact_click':
      case 'property':
        if (propertyId.isNotEmpty) {
          router.push('${PostDetailsScreen.routeName}?postId=$propertyId');
          return;
        }
        break;
      case 'reel_like':
      case 'reel_comment':
      case 'reel_share':
        if (reelId.isNotEmpty) {
          router.push('${ReelsScreen.routeName}?reelId=$reelId');
          return;
        }
        break;
      case 'service_review':
      case 'verification':
        if (serviceId.isNotEmpty) {
          router.push(ViewServiceScreen.routeName, extra: serviceId);
          return;
        }
        break;
      case 'gst_verification':
        final userId = serviceLocator<AppCacheService>().customerAccountId;
        if (userId != null) {
          router.push(MyCompanyScreen.routeName, extra: userId);
          return;
        }
        break;
      case 'callback_request':
        if (projectId.isNotEmpty) {
          router.push(SaleViewScreen.routeName, extra: SaleRecord(id: projectId));
          return;
        }
        break;
      case 'new_request':
        final category = field('category');
        router.push(category.isEmpty
            ? RequestsScreen.routeName
            : '${RequestsScreen.routeName}?category=${Uri.encodeQueryComponent(category)}');
        return;
    }
    // Last-resort: if we have a reference id but unknown/empty type, open post.
    final ref = field('reference_id');
    if (ref.isNotEmpty) {
      router.push('${PostDetailsScreen.routeName}?postId=$ref');
      return;
    }
    router.push(NotificationsScreen.routeName);
  }

  static String _fallbackId(
    String type,
    Map<String, dynamic> data, {
    bool forProperty = false,
    bool forReel = false,
    bool forService = false,
    bool forProject = false,
  }) {
    final ref = (data['reference_id'] ?? '').toString().trim();
    if (ref.isEmpty) return '';
    if (forProperty) {
      return const {
        'new_post',
        'like',
        'comment',
        'view',
        'share',
        'favourite',
        'contact_click',
        'property',
        '',
      }.contains(type)
          ? ref
          : '';
    }
    if (forReel) {
      return const {'reel_like', 'reel_comment', 'reel_share'}.contains(type)
          ? ref
          : '';
    }
    if (forService) {
      return const {'service_review', 'verification'}.contains(type) ? ref : '';
    }
    if (forProject) {
      return type == 'callback_request' ? ref : '';
    }
    return '';
  }
}
