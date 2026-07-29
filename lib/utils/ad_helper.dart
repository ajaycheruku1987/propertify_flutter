import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static bool adsTesting = false;

  // Real-time App ID: ca-app-pub-3593529842650176~9003903616
  static String get appId => Platform.isAndroid 
      ? "ca-app-pub-3593529842650176~9003903616" 
      : "ca-app-pub-3593529842650176~9003903616";

  // Test ad IDs
  static const String _bannerTestId = "ca-app-pub-3940256099942544/6300978111";
  
  // Real-time ad IDs from your provided code
  static const String _bannerIdInlineAndroid = "ca-app-pub-3593529842650176/6375317991";
  static const String _bannerIdInlineIOS = "ca-app-pub-3593529842650176/3824890860";

  static String get bannerAdUnitId {
    if (adsTesting) {
      return _bannerTestId;
    }
    if (Platform.isAndroid) {
      return _bannerIdInlineAndroid;
    } else {
      return _bannerIdInlineIOS;
    }
  }

  static const AdRequest adRequest = AdRequest(
    keywords: <String>['property', 'real estate', 'house', 'rent'],
    nonPersonalizedAds: false,
  );
}
