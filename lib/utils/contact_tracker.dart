import 'package:get_it/get_it.dart';
import 'package:propertify/core/api_request/api_request.dart';

class ContactTracker {
  /// Track a Call or WhatsApp interaction on a property
  static Future<void> trackPropertyContact({
    required String propertyId,
    required String interactionType, // 'call' or 'whatsapp'
  }) async {
    if (propertyId.isEmpty) return;
    try {
      final apiRequest = GetIt.instance<ApiRequest>();
      await apiRequest.post(
        '/properties/$propertyId/increment-contact?interaction_type=$interactionType',
      );
    } catch (_) {}
  }

  /// Track a Call or WhatsApp interaction on a banner ad
  static Future<void> trackBannerContact({
    required String bannerId,
    required String interactionType, // 'call' or 'whatsapp'
  }) async {
    if (bannerId.isEmpty) return;
    try {
      final apiRequest = GetIt.instance<ApiRequest>();
      await apiRequest.post(
        '/banner-ads/$bannerId/increment-contact?interaction_type=$interactionType',
      );
    } catch (_) {}
  }
}
