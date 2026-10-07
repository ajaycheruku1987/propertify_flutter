import 'dart:developer';

import 'package:propertify/core/app_cache_service.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/features/admin/presentation/requests_screen.dart';
import 'package:propertify/features/company/presentation/my_company.dart';
import 'package:propertify/features/feed/presentation/post_details.dart';
import 'package:propertify/features/notifications/presentation/notifications_screen.dart';
import 'package:propertify/features/reels/presentation/reels_screen.dart';
import 'package:propertify/features/sales/models/sales_model.dart';
import 'package:propertify/features/sales/presentation/sale_view_screen.dart';
import 'package:propertify/features/services/presentation/view_service.dart';
import 'package:propertify/utils/app_routing/app_navigations.dart';

/// Opens the screen a push notification points to, based on the backend's
/// `type` and id fields in the payload.
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

  static void open(Map<String, dynamic> data) {
    if (!_appReady) {
      _pending = data;
      return;
    }
    String field(String key) => (data[key] ?? '').toString().trim();

    final type = field('type');
    final propertyId = field('property_id');
    final reelId = field('reel_id');
    final serviceId = field('service_id');
    final projectId = field('project_id');
    log('Opening notification: type=$type data=$data');

    switch (type) {
      case 'new_post':
      case 'like':
      case 'comment':
      case 'view':
      case 'share':
      case 'favourite':
      case 'contact_click':
        if (propertyId.isNotEmpty) {
          router.push('${PostDetailsScreen.routeName}?postId=$propertyId');
          return;
        }
      case 'reel_like':
      case 'reel_comment':
        if (reelId.isNotEmpty) {
          router.push('${ReelsScreen.routeName}?reelId=$reelId');
          return;
        }
      case 'service_review':
      case 'verification':
        if (serviceId.isNotEmpty) {
          router.push(ViewServiceScreen.routeName, extra: serviceId);
          return;
        }
      case 'gst_verification':
        final userId = serviceLocator<AppCacheService>().customerAccountId;
        if (userId != null) {
          router.push(MyCompanyScreen.routeName, extra: userId);
          return;
        }
      case 'callback_request':
        if (projectId.isNotEmpty) {
          router.push(SaleViewScreen.routeName, extra: SaleRecord(id: projectId));
          return;
        }
      case 'new_request':
        final category = field('category');
        router.push(category.isEmpty
            ? RequestsScreen.routeName
            : '${RequestsScreen.routeName}?category=${Uri.encodeQueryComponent(category)}');
        return;
    }
    router.push(NotificationsScreen.routeName);
  }
}
