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
  static const String _accessToken = 'EAASzcoBEi8ABSCrPr6ACPcnoVChrtbAblrbxThtF5Q9AGJS1r22y8ABQOG3egYhp0rcdoI6oGVAeZBBfjzg7wSL08VVK1u5vLMO1g1ZCewUsP4SX3ZCiUeCq3yH3tRBuAZBhqNd5JKwcRmSyn4q8ZAjHuNhyxx917DfmkjYMs5eFcDbyUpSotZAm0X8Gj6Ol30L5lePWenfxPmrLH6pKk68jLMhfELeLTjy9ZCtZAr9fyQZDZD';

  static const String _accessTokenInsta = 'EAASzcoBEi8ABSOAg6TNEXiMpBEyClZAqQl9z6IXXZBjwWGJg1A1Oq5lwyZCx2hBR9McfXPQmo3NdVcU984MkNrB5zTR3hud3DkebASMGmZBZAaqDjP8AX40sJVAXEyYPukEKsCd3sJ1aBsVaeElFDZChqc5n1IBRmZAyFtNnEhOvrQTSq1OEN3O1diP2ztRAZCyV0vFSyGkLmPOegtoz2jxZCwznQovhwJOlkbDOT8otabBOl0HPRZC10nC3IZBMPGQsrhzOLrbZB1zi1eRbgCuSpjfsMyIJEZB8WN7hUHisVBfZAQMtHS2EQCiu3di59IvEgDOta9ZCzyX7wZDZD';


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
