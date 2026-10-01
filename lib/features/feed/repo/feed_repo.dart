import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/utils/extensions/http_extension.dart';

import '../../../core/api_request/api_request.dart';
import '../../../core/failure.dart';
import '../../home/models/feed_posts_response_model.dart';
import '../../../features/feed/models/like_feed_post_response_model.dart';
import '../../../features/feed/models/feed_comment_model.dart';

class FeedRepo {
  final ftPyroApiRequest = serviceLocator<ApiRequest>();

  /// Get Feeds API
  Future<Either<Failure, List<FeedPostsResponseModel>>> getFeeds({
    String? city,
    String? listingType,
    String? propertyType,
    double? minPrice,
    double? maxPrice,
    String? search,
    int? limit,
    int? offset,
    double? latitude,
    double? longitude,
  }) async {
    // Build query parameters map
    Map<String, dynamic> queryParams = {};

    if (city != null) queryParams['city'] = city;
    if (listingType != null) queryParams['listing_type'] = listingType;
    if (propertyType != null) queryParams['property_type'] = propertyType;
    if (minPrice != null) queryParams['min_price'] = minPrice;
    if (maxPrice != null) queryParams['max_price'] = maxPrice;
    if (search != null) queryParams['search'] = search;
    if (limit != null) queryParams['limit'] = limit;
    if (offset != null) queryParams['offset'] = offset;
    if (latitude != null && latitude != 0.0) queryParams['latitude'] = latitude;
    if (longitude != null && longitude != 0.0) queryParams['longitude'] = longitude;
    if (latitude != null && latitude != 0.0 && longitude != null && longitude != 0.0) {
      final isFiltering = (city != null && city.isNotEmpty) ||
          (listingType != null && listingType != 'All' && listingType.isNotEmpty) ||
          (propertyType != null && propertyType != 'All' && propertyType.isNotEmpty) ||
          minPrice != null ||
          maxPrice != null ||
          (search != null && search.isNotEmpty);
      queryParams['radius_km'] = isFiltering ? 15 : 5;
    }

    // Build query string manually since get method doesn't support queryParameters
    String queryString = '';
    if (queryParams.isNotEmpty) {
      queryString =
          '?${queryParams.entries.map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}').join('&')}';
    }

    final response = await ftPyroApiRequest.get('/feeds$queryString');

    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(feedPostsResponseModelFromJson(jsonEncode(right))),
    );
  }

  /// Get Post Details API
  Future<Either<Failure, FeedPostsResponseModel>> getPostDetails({
    required String postId,
  }) async {
    try {
      final response = await ftPyroApiRequest.get('/properties/$postId');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) {
          print('GET POST DETAILS RAW JSON: $right');
          FeedPostsResponseModel model = FeedPostsResponseModel.fromJson(right);

          // Parse embedded property metadata from description if present
          if (model.description != null && model.description!.contains('__PROPS__')) {
            try {
              final parts = model.description!.split('__PROPS__');
              if (parts.length > 1) {
                final jsonMap = jsonDecode(parts[1].trim()) as Map<String, dynamic>;
                model = model.copyWith(
                  plotArea: (model.plotArea == null || model.plotArea!.isEmpty) ? jsonMap['plot_area']?.toString() : model.plotArea,
                  areaUnit: (model.areaUnit == null || model.areaUnit!.isEmpty) ? jsonMap['area_unit']?.toString() : model.areaUnit,
                  facing: (model.facing == null || model.facing!.isEmpty) ? jsonMap['facing']?.toString() : model.facing,
                  roadWidth: (model.roadWidth == null || model.roadWidth!.isEmpty) ? jsonMap['road_width']?.toString() : model.roadWidth,
                  postedBy: (model.postedBy == null || model.postedBy!.isEmpty) ? jsonMap['posted_by']?.toString() : model.postedBy,
                  approvalStatus: (model.approvalStatus == null || model.approvalStatus!.isEmpty) ? jsonMap['approval_status']?.toString() : model.approvalStatus,
                  dimensions: (model.dimensions == null || model.dimensions!.isEmpty) ? jsonMap['dimensions']?.toString() : model.dimensions,
                  isCornerPlot: model.isCornerPlot ?? jsonMap['is_corner_plot'] ?? false,
                  isGatedCommunity: model.isGatedCommunity ?? jsonMap['is_gated_community'] ?? false,
                  mainCategory: (model.mainCategory == null || model.mainCategory!.isEmpty) ? jsonMap['main_category']?.toString() : model.mainCategory,
                  subCategory: (model.subCategory == null || model.subCategory!.isEmpty) ? jsonMap['sub_category']?.toString() : model.subCategory,
                  isNegotiable: model.isNegotiable ?? jsonMap['is_negotiable'] ?? false,
                  securityDeposit: (model.securityDeposit == null || model.securityDeposit!.isEmpty) ? jsonMap['security_deposit']?.toString() : model.securityDeposit,
                  propertyStatus: (model.propertyStatus == null || model.propertyStatus!.isEmpty) ? jsonMap['property_status']?.toString() : model.propertyStatus,
                  contactViaPhone: model.contactViaPhone ?? jsonMap['contact_via_phone'] ?? false,
                  contactViaWhatsApp: model.contactViaWhatsApp ?? jsonMap['contact_via_whatsapp'] ?? false,
                  carpetArea: (model.carpetArea == null || model.carpetArea!.isEmpty) ? jsonMap['carpet_area']?.toString() : model.carpetArea,
                  carpetAreaUnit: (model.carpetAreaUnit == null || model.carpetAreaUnit!.isEmpty) ? jsonMap['carpet_area_unit']?.toString() : model.carpetAreaUnit,
                );

                // Save to local prefs cache so subsequent loads have it instantly
                final prefs = serviceLocator<SharedPreferences>();
                if (model.plotArea != null) prefs.setString('plot_area_$postId', model.plotArea!);
                if (model.areaUnit != null) prefs.setString('area_unit_$postId', model.areaUnit!);
                if (model.facing != null) prefs.setString('facing_$postId', model.facing!);
                if (model.roadWidth != null) prefs.setString('road_width_$postId', model.roadWidth!);
                if (model.postedBy != null) prefs.setString('posted_by_$postId', model.postedBy!);
                if (model.approvalStatus != null) prefs.setString('approval_status_$postId', model.approvalStatus!);
                if (model.dimensions != null) prefs.setString('dimensions_$postId', model.dimensions!);
                if (model.isCornerPlot != null) prefs.setBool('is_corner_plot_$postId', model.isCornerPlot!);
                if (model.isGatedCommunity != null) prefs.setBool('is_gated_community_$postId', model.isGatedCommunity!);
                if (model.mainCategory != null) prefs.setString('main_category_$postId', model.mainCategory!);
                if (model.subCategory != null) prefs.setString('sub_category_$postId', model.subCategory!);
                if (model.isNegotiable != null) prefs.setBool('is_negotiable_$postId', model.isNegotiable!);
                if (model.securityDeposit != null) prefs.setString('security_deposit_$postId', model.securityDeposit!);
                if (model.propertyStatus != null) prefs.setString('property_status_$postId', model.propertyStatus!);
                if (model.contactViaPhone != null) prefs.setBool('contact_via_phone_$postId', model.contactViaPhone!);
                if (model.contactViaWhatsApp != null) prefs.setBool('contact_via_whatsapp_$postId', model.contactViaWhatsApp!);
                if (model.carpetArea != null) prefs.setString('carpet_area_$postId', model.carpetArea!);
                if (model.carpetAreaUnit != null) prefs.setString('carpet_area_unit_$postId', model.carpetAreaUnit!);
              }
            } catch (e) {
              print('Error parsing metadata from description: $e');
            }
          }

          // Fallback to local cache if plot fields are missing from backend response
          final prefs = serviceLocator<SharedPreferences>();
          final cachedPlotArea = prefs.getString('plot_area_$postId');
          if ((model.plotArea == null || model.plotArea!.isEmpty) && cachedPlotArea != null) {
            model = model.copyWith(
              plotArea: cachedPlotArea,
              areaUnit: prefs.getString('area_unit_$postId'),
              facing: prefs.getString('facing_$postId'),
              roadWidth: prefs.getString('road_width_$postId'),
              postedBy: prefs.getString('posted_by_$postId'),
              approvalStatus: prefs.getString('approval_status_$postId'),
              dimensions: prefs.getString('dimensions_$postId'),
              isCornerPlot: prefs.getBool('is_corner_plot_$postId') ?? false,
              isGatedCommunity: prefs.getBool('is_gated_community_$postId') ?? false,
            );
          }

          // General Property Overview specs fallback
          final cachedPropertyStatus = prefs.getString('property_status_$postId');
          final cachedSecurityDeposit = prefs.getString('security_deposit_$postId');
          final cachedIsNegotiable = prefs.getBool('is_negotiable_$postId');
          final cachedContactPhone = prefs.getBool('contact_via_phone_$postId');
          final cachedContactWhatsApp = prefs.getBool('contact_via_whatsapp_$postId');
          final cachedCarpetArea = prefs.getString('carpet_area_$postId');
          final cachedCarpetAreaUnit = prefs.getString('carpet_area_unit_$postId');

          model = model.copyWith(
            propertyStatus: model.propertyStatus ?? cachedPropertyStatus,
            securityDeposit: model.securityDeposit ?? cachedSecurityDeposit,
            isNegotiable: model.isNegotiable ?? cachedIsNegotiable,
            contactViaPhone: model.contactViaPhone ?? cachedContactPhone,
            contactViaWhatsApp: model.contactViaWhatsApp ?? cachedContactWhatsApp,
            carpetArea: model.carpetArea ?? cachedCarpetArea,
            carpetAreaUnit: model.carpetAreaUnit ?? cachedCarpetAreaUnit,
          );

          return Right(model);
        },
      );
    } catch (e) {
      return Left(Exception('An error occurred: ${e.toString()}'));
    }
  }

  /// Get Similar Properties API
  Future<Either<Failure, List<FeedPostsResponseModel>>> getSimilarProperties({
    String? city,
    String? propertyType,
    String? listingType,
    String? excludePostId,
    int? limit,
  }) async {
    try {
      // Build query parameters map
      Map<String, dynamic> queryParams = {};

      if (city != null && city.isNotEmpty) {
        // Clean leading commas and spaces
        String cleanedCity = city.trim();
        while (cleanedCity.startsWith(',')) {
          cleanedCity = cleanedCity.replaceFirst(RegExp(r'^,\s*'), '').trim();
        }
        if (cleanedCity.isNotEmpty) {
          queryParams['city'] = cleanedCity;
        }
      }

      if (propertyType != null && propertyType.isNotEmpty && propertyType != 'All') {
        queryParams['property_type'] = propertyType;
      }
      
      if (listingType != null && listingType.isNotEmpty && listingType != 'All') {
        queryParams['listing_type'] = listingType;
      }

      if (limit != null) queryParams['limit'] = limit;
      if (excludePostId != null) queryParams['exclude_id'] = excludePostId;

      // Build query string manually since get method doesn't support queryParameters
      String queryString = '';
      if (queryParams.isNotEmpty) {
        queryString =
            '?' +
            queryParams.entries
                .map(
                  (e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}',
                )
                .join('&');
      }

      final response = await ftPyroApiRequest.get('/feeds$queryString');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(
          (right as List<dynamic>)
              .map((json) => FeedPostsResponseModel.fromJson(json))
              .toList(),
        ),
      );
    } catch (e) {
      return Left(Exception('An error occurred: ${e.toString()}'));
    }
  }

  /// Like Property API
  Future<Either<Failure, LikeFeedPostResponseModel>> likeProperty({
    required String propertyId,
  }) async {
    try {
      final response = await ftPyroApiRequest.post(
        '/properties/$propertyId/like',
      );

      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(LikeFeedPostResponseModel.fromJson(right)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Get Comments by Post ID API
  Future<Either<Failure, List<FeedCommentModel>>> getCommentsById({
    required String propertyId,
  }) async {
    try {
      final response = await ftPyroApiRequest.get(
        '/properties/$propertyId/comments',
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(
          List<FeedCommentModel>.from(
            right.map((json) => FeedCommentModel.fromJson(json)),
          ),
        ),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Add Comment to Property API
  Future<Either<Failure, FeedCommentModel>> addCommentToProperty({
    required String propertyId,
    required String text,
  }) async {
    try {
      final Map<String, dynamic> data = {'text': text};

      final response = await ftPyroApiRequest.post(
        '/properties/$propertyId/comments',
        data: data,
      );

      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(FeedCommentModel.fromJson(right)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Toggle Favorite Property API
  Future<Either<Failure, LikeFeedPostResponseModel>> toggleFavorite({
    required String propertyId,
  }) async {
    try {
      final response = await ftPyroApiRequest.post(
        '/favourite',
        data: {'property_id': propertyId},
      );

      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(LikeFeedPostResponseModel.fromJson(right)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Get My Properties API
  Future<Either<Failure, List<FeedPostsResponseModel>>> getMyProperties({
    int? limit,
    int? offset,
  }) async {
    try {
      // Build query parameters map
      Map<String, dynamic> queryParams = {};
      if (limit != null) queryParams['limit'] = limit;
      if (offset != null) queryParams['offset'] = offset;

      String queryString = '';
      if (queryParams.isNotEmpty) {
        queryString =
            '?${queryParams.entries.map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}').join('&')}';
      }

      final response = await ftPyroApiRequest.get('/properties/me$queryString');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(
          (right as List<dynamic>)
              .map((json) => FeedPostsResponseModel.fromJson(json))
              .toList(),
        ),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  Future<Either<Failure, List<FeedPostsResponseModel>>> getFavourites() async {
    try {
      final response = await ftPyroApiRequest.get('/favourite');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(
          (right as List<dynamic>)
              .map((json) => FeedPostsResponseModel.fromJson(json))
              .toList(),
        ),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Record Property View API
  Future<Either<Failure, void>> recordPropertyView({
    required String propertyId,
  }) async {
    try {
      final response = await ftPyroApiRequest.post(
        '/properties/$propertyId/view',
      );

      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => const Right(null),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Update Property API
  Future<Either<Failure, FeedPostsResponseModel>> updateProperty({
    required String propertyId,
    required String availableFrom,
    required int totalFloors,
    required bool isFeatured,
    required String propertyType,
    required int bathrooms,
    required int price,
    required String city,
    required int floor,
    required double latitude,
    required int propertyAgeYears,
    required String furnishing,
    required double longitude,
    required String address,
    required String listingType,
    required String amenities,
    required List<File> newImages,
    required int bedrooms,
    required String title,
    required bool isPromoted,
    required List<String> existingImageUrls,
    required String description,
    required bool isVerified,
    required double areaSqft,
  }) async {
    try {
      final formData = dio.FormData.fromMap({
        'available_from': availableFrom,
        'total_floors': totalFloors,
        'is_featured': isFeatured.toString(),
        'property_type': propertyType,
        'bathrooms': bathrooms,
        'price': price,
        'city': city,
        'floor': floor,
        'latitude': latitude,
        'property_age_years': propertyAgeYears,
        'furnishing': furnishing,
        'longitude': longitude,
        'address': address,
        'listing_type': listingType,
        'amenities': amenities,
        'bedrooms': bedrooms,
        'title': title,
        'is_promoted': isPromoted.toString(),
        'description': description,
        'is_verified': isVerified.toString(),
        'area_sqft': areaSqft,
      });

      // Add existing image URLs
      for (int i = 0; i < existingImageUrls.length; i++) {
        formData.fields.add(MapEntry('existing_image_urls', existingImageUrls[i]));
      }

      // Add new images
      for (int i = 0; i < newImages.length; i++) {
        formData.files.add(
          MapEntry(
            'new_images',
            await dio.MultipartFile.fromFile(
              newImages[i].path,
              filename: newImages[i].path.split('/').last,
            ),
          ),
        );
      }

      final response = await ftPyroApiRequest.put(
        '/properties/$propertyId',
        data: formData,
      );

      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(FeedPostsResponseModel.fromJson(right)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Delete Property API
  Future<Either<Failure, bool>> deleteProperty({
    required String propertyId,
  }) async {
    try {
      final response = await ftPyroApiRequest.delete('/properties/$propertyId');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => const Right(true),
      );
    } catch (e) {
      return Left(ApiFailure('Error deleting property: ${e.toString()}'));
    }
  }

  /// Delete Comment API
  Future<Either<Failure, bool>> deleteComment({
    required String propertyId,
    required String commentId,
  }) async {
    try {
      final response = await ftPyroApiRequest.delete(
        '/comments/$commentId',
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => const Right(true),
      );
    } catch (e) {
      return Left(ApiFailure('Error deleting comment: ${e.toString()}'));
    }
  }

  /// Report Property API
  Future<Either<Failure, bool>> reportProperty({
    required String propertyId,
    required String reason,
  }) async {
    try {
      final response = await ftPyroApiRequest.post(
        '/properties/$propertyId/report',
        data: {'reason': reason},
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => const Right(true),
      );
    } catch (e) {
      return Left(ApiFailure('Error reporting property: ${e.toString()}'));
    }
  }
}
