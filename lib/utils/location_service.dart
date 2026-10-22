import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

/// Fast location helpers optimized for app launch (city-level accuracy is enough).
class LocationService {
  LocationService._();

  /// Medium accuracy + short timeout uses network/cell when possible instead of
  /// waiting for a cold GPS lock (often 15–30s+ on first install).
  static const _quickSettings = LocationSettings(
    accuracy: LocationAccuracy.medium,
    distanceFilter: 100,
    timeLimit: Duration(seconds: 8),
  );

  /// Ensures permission is granted. Returns false if denied / services off.
  static Future<bool> ensurePermission() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      try {
        permission = await Geolocator.requestPermission();
      } catch (e) {
        return false;
      }
    }

    return permission != LocationPermission.denied &&
        permission != LocationPermission.deniedForever;
  }

  /// Instant cached fix when the OS has one (null on first install / cold start).
  static Future<Position?> getLastKnown() async {
    try {
      return await Geolocator.getLastKnownPosition();
    } catch (_) {
      return null;
    }
  }

  /// Fresh position with medium accuracy and an 8s cap.
  /// Falls back to [fallback] (e.g. last-known) on timeout.
  static Future<Position?> getQuickCurrentPosition({
    Position? fallback,
  }) async {
    try {
      return await Geolocator.getCurrentPosition(
        locationSettings: _quickSettings,
      );
    } catch (_) {
      return fallback;
    }
  }

  /// Reverse-geocode coordinates into city / state / village labels.
  static Future<({String city, String state, String village})> reverseGeocode(
    double lat,
    double lng,
  ) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng).timeout(
        const Duration(seconds: 5),
        onTimeout: () => <Placemark>[],
      );

      if (placemarks.isEmpty) {
        return (city: '', state: '', village: '');
      }

      final placemark = placemarks.first;
      return (
        city: placemark.locality ??
            placemark.subAdministrativeArea ??
            placemark.administrativeArea ??
            '',
        state: placemark.administrativeArea ?? '',
        village: placemark.subLocality ??
            placemark.thoroughfare ??
            placemark.subThoroughfare ??
            '',
      );
    } catch (_) {
      return (city: '', state: '', village: '');
    }
  }
}
