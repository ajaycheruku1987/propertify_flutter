import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
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
    if (latitude != null) queryParams['latitude'] = latitude;
    if (longitude != null) queryParams['longitude'] = longitude;
    queryParams['radius_km'] = 5;

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
        (right) => Right(FeedPostsResponseModel.fromJson(right)),
      );
    } catch (e) {
      return Left(Exception('An error occurred: ${e.toString()}'));
    }
  }

  /// Get Similar Properties API
  Future<Either<Failure, List<FeedPostsResponseModel>>> getSimilarProperties({
    String? city,
    String? propertyType,
    String? excludePostId,
    int? limit,
  }) async {
    try {
      // Build query parameters map
      Map<String, dynamic> queryParams = {};

      if (city != null) queryParams['city'] = city;
      if (propertyType != null) queryParams['property_type'] = propertyType;
      if (excludePostId != null) queryParams['exclude_id'] = excludePostId;
      if (limit != null) queryParams['limit'] = limit;

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

      final response = await ftPyroApiRequest.get('/posts/similar$queryString');
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
}
