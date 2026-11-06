import 'dart:developer';

import 'package:propertify/core/app_cache_service.dart';
import 'package:propertify/core/notification_service.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/features/profile/repo/profile_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _profileRegionSyncedKey = 'profile_region_synced';

/// Keeps the signed-in user's state topic and profile state in sync.
class RegionAlerts {
  RegionAlerts._();

  /// Subscribe to [stateName] and save it on the profile when it changed.
  static Future<void> bindState(String stateName) async {
    final state = stateName.trim();
    if (state.isEmpty) return;
    await NotificationService.instance.subscribeToState(state);
    await _syncProfileState(state);
  }

  static Future<void> _syncProfileState(String stateName) async {
    final prefs = serviceLocator<SharedPreferences>();
    if (prefs.getString(_profileRegionSyncedKey) == stateName) return;

    final token = serviceLocator<AppCacheService>().getToken();
    if (token == null || token.isEmpty) return;

    try {
      final result = await ProfileRepo().updateProfile(state: stateName);
      result.fold(
        (failure) => log('Could not save region on profile: ${failure.message}'),
        (_) => prefs.setString(_profileRegionSyncedKey, stateName),
      );
    } catch (e) {
      log('Could not save region on profile: $e');
    }
  }
}
