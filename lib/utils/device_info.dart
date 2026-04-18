import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:geolocator/geolocator.dart';

Future<DeviceDetails?> getDeviceData() async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  late AndroidDeviceInfo androidDeviceInfo;
  late IosDeviceInfo iosDeviceInfo;
  late BaseDeviceInfo baseDeviceInfo;
  String? deviceId;

  baseDeviceInfo = await deviceInfoPlugin.deviceInfo;

  if (Platform.isAndroid) {
    androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    deviceId = androidDeviceInfo.fingerprint;
  } else if (Platform.isIOS) {
    iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    deviceId = iosDeviceInfo.identifierForVendor;
  }

  // Request location permission
  LocationPermission permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    throw Exception('Location permission denied');
  }
  // Get current position
  Position position = await Geolocator.getCurrentPosition(
    locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
  );

  String lat = position.latitude.toString();
  String long = position.longitude.toString();

  if (deviceId != null && position != null) {
    return DeviceDetails(
      deviceId: deviceId,
      latitude: position.latitude.toString(),
      longitude: position.longitude.toString(),
    );
  }
  return null;
}

class DeviceDetails {
  final String deviceId;
  final String latitude;
  final String longitude;

  DeviceDetails({
    required this.deviceId,
    required this.latitude,
    required this.longitude,
  });

  DeviceDetails copyWith({
    String? deviceId,
    String? latitude,
    String? longitude,
  }) {
    return DeviceDetails(
      deviceId: deviceId ?? this.deviceId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toJson() {
    return {'deviceId': deviceId, 'latitude': latitude, 'longitude': longitude};
  }
}
