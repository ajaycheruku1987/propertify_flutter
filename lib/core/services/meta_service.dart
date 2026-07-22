import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

class MetaService {
  final Dio _dio = Dio();
  final SharedPreferences _prefs;

  MetaService(this._prefs);

  static const String _postCountKey = 'meta_daily_post_count';
  static const String _lastPostDateKey = 'meta_last_post_date';
  static const int _maxDailyPosts = 10;

  // --- CONFIGURATION ---
  // Page: Propertify - Buy, Sell & Rent
  static const String _pageId = '1251613104692490';
  static const String _instagramId = '17841447200916056';

  // Your actual Play Store link
  static const String _playStoreUrl = 'https://play.google.com/store/apps/details?id=com.placeofsalesrealestate';

  // Permanent PAGE Access Token (Found in /me/accounts)
  // static const String _accessToken = 'EAASzcoBEi8ABSMHRBzSZA2qUdKcZC59PZCucmsnzTawpZCRDaF9oafnEKMVz0SzpJnb4d04gQ3ZBAWcLnAGdn8AwhwSDI4erznGkRRCIr28JlZBScBuZAWUDYF4SZAMF56oOV1JUJIBNT20N4e0AcfILDkQ30cJcqZAM81uElFmzdjX8fYcAxCRpgolPNnKFAE77Ya2Wwm0ApqEXTIov39Pl8VU6MG5LxZBb7qaR8GVwoZD';
  static const String _accessToken = 'EAASzcoBEi8ABSJwRF3ZAx0bFD3CrGfY6BT83XcSupahOA7Liz8zSq8tkA1QVilQiwcZC0fW3AAc0ZCJqcauGeP0YkZB99gMEUDnqmmU4RrJoOlolLmKZAEgdZAg6qjZAXrc914jbotwNopLFSJfL1mMo6SBujMh8ZBbv4eo5Urkwo9PBB0p0CeSEwh6UZBOYZCQQ40yaU9gxvU';


  // static const String _accessTokenInsta = 'EAASzcoBEi8ABSCaXpMKwVSMmLd134lt7b9vStTHRKpJf7UxW7L0WW10xNWDWWTLdVxvBVKyZAS8Y5zF3uIXDXDxTW60Hko9qRYdfx9FjLoZBD2OeqiKuxgeXO0XrVmKf88MzGTN915YvDoHyG6L1CBKGAuGLqPK3HE4b2ZA9ZC8tfM3ZCnrnC5D1YwNclZChrURwlbkmWwpTcGBvvLqVvzVDidRDRRXBsl4EZArmMb5MRpn8DZCK5w4Y4KEkAGtraFcCFgGiSKlXtLQOnQj1T3zaRzTwchpZBh4459f1mHfWVqXaSxt8a9sRm3NvCweIUTUoJrzQZD';
  static const String _accessTokenInsta = 'EAASzcoBEi8ABSExc9jFq9IKsvms65NfEXN01uvirEA18jolzdz2Wn55jQVbmmB5XZAr10SbuTRq2IZBca9U0Gu05VOmfuXclU1N1xTXr9IQeTtZCxneZBMEYUtxUv63ul8pDfhU9xs66UwFP8ue5x2CTZBta5gWlkPjbbiYm6YZA8d5qFSJuj1dcRS7xux';


  /// Checks if the daily limit of 10 posts has been reached.
  Future<bool> _canPost() async {
    final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final String? lastPostDate = _prefs.getString(_lastPostDateKey);
    
    if (lastPostDate != today) {
      await _prefs.setString(_lastPostDateKey, today);
      await _prefs.setInt(_postCountKey, 0);
      return true;
    }

    final int currentCount = _prefs.getInt(_postCountKey) ?? 0;
    return currentCount < _maxDailyPosts;
  }

  Future<void> _incrementPostCount() async {
    final int currentCount = _prefs.getInt(_postCountKey) ?? 0;
    await _prefs.setInt(_postCountKey, currentCount + 1);
  }

  /// Automatically posts to both Facebook and Instagram.
  Future<void> autoPostToSocials({
    required String title,
    required String description,
    String? imageUrl,
  }) async {
    debugPrint("--- Meta Auto Post Started ---");

    if (!await _canPost()) {
      debugPrint("Meta auto-post limit (10/day) reached. Skipping.");
      return;
    }

    // 1. Post to Facebook (Includes full Play Store Link)
    final String fbDescription = "$description\n\nDownload our app: $_playStoreUrl\n\n#Propertify #RealEstate";
    await postToFacebook(
      title: title,
      description: fbDescription,
      imageUrl: imageUrl,
    );

    // 2. Post to Instagram (Cleaner: No link in text, just "Link in bio")
    if (imageUrl != null && imageUrl.isNotEmpty && imageUrl.startsWith('http')) {
      final String instagramCaption = "$title\n\n$description\n\n#Propertify #RealEstate\n(Link in bio - Download the app)";
      await postToInstagram(
        caption: instagramCaption,
        imageUrl: imageUrl,
      );
    }

    await _incrementPostCount();
  }

  /// Posts to Facebook Page
  Future<void> postToFacebook({
    required String title,
    required String description,
    String? imageUrl,
  }) async {
    try {
      debugPrint("Attempting to post to Facebook Page: $_pageId");
      
      // If we have a property image, use it as the link attachment. 
      // Otherwise, use the Play Store URL as the link attachment.
      final String? attachmentLink = (imageUrl != null && imageUrl.startsWith('http')) 
          ? imageUrl 
          : _playStoreUrl;

      final response = await _dio.post(
        'https://graph.facebook.com/v20.0/$_pageId/feed',
        data: {
          'message': "$title\n\n$description",
          'link': attachmentLink,
          'access_token': _accessToken,
        },
      );
      debugPrint("Facebook Response: ${response.data}");
    } catch (e) {
      if (e is DioException) {
        debugPrint("Facebook API Error: ${e.response?.data ?? e.message}");
      }
    }
  }

  /// Posts to Instagram
  Future<void> postToInstagram({
    required String caption,
    required String imageUrl,
  }) async {
    try {
      debugPrint("Attempting to post to Instagram ID: $_instagramId");
      final containerResponse = await _dio.post(
        'https://graph.facebook.com/v20.0/$_instagramId/media',
        data: {
          'image_url': imageUrl,
          'caption': caption,
          'access_token': _accessTokenInsta,
        },
      );

      final dynamic responseData = containerResponse.data;
      Map<String, dynamic> data = (responseData is String) ? jsonDecode(responseData) : Map<String, dynamic>.from(responseData);
      final String? creationId = data['id']?.toString();

      if (creationId != null) {
        debugPrint("Instagram Container Created: $creationId. Waiting for processing...");
        
        // Wait 5 seconds for Meta to process the image
        await Future.delayed(const Duration(seconds: 5));

        final publishResponse = await _dio.post(
          'https://graph.facebook.com/v20.0/$_instagramId/media_publish',
          data: {
            'creation_id': creationId,
            'access_token': _accessToken,
          },
        );
        debugPrint("Instagram Publish Response: ${publishResponse.data}");
      }
    } catch (e) {
      if (e is DioException) {
        debugPrint("Instagram API Error: ${e.response?.data ?? e.message}");
      }
    }
  }
}
