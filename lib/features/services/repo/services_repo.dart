import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/features/services/models/service_reviews_response_model.dart';
import 'package:propertify/utils/extensions/http_extension.dart';

import '../../../core/api_request/api_request.dart';
import '../../../core/failure.dart';
import '../models/services_response_model.dart';

class ServicesRepo {
  final ftPyroApiRequest = serviceLocator<ApiRequest>();

  /// Get Services API
  Future<Either<Failure, List<ServicesResponseModel>>> getServices({
    int? skip,
    int? limit,
    double? latitude,
    double? longitude,
    double? radiusKm,
    List<String>? categoryNames,
    double? minRating,
    String? search,
  }) async {
    // Build query parameters map
    Map<String, dynamic> queryParams = {};

    if (skip != null) queryParams['skip'] = skip;
    if (limit != null) queryParams['limit'] = limit;
    if (latitude != null) queryParams['latitude'] = latitude;
    if (longitude != null) queryParams['longitude'] = longitude;
    // Always include a radius; default to 5km if not provided
    queryParams['radius_km'] = radiusKm ?? 5;
    if (search != null && search.isNotEmpty) queryParams['search'] = search;
    // if (categoryNames != null && categoryNames.isNotEmpty) {
    //   // Handle multiple category_names
    //   for (final cat in categoryNames) {
    //     queryParams.putIfAbsent('category_names', () => <String>[]).add(cat);
    //   }
    // }
    // if (minRating != null) queryParams['min_rating'] = minRating;

    // Build query string manually since get method doesn't support queryParameters
    String queryString = '';
    if (queryParams.isNotEmpty) {
      final List<String> parts = [];
      queryParams.forEach((key, value) {
        if (value is List) {
          for (final v in value) {
            parts.add(
              '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(v.toString())}',
            );
          }
        } else {
          parts.add(
            '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(value.toString())}',
          );
        }
      });
      queryString = '?${parts.join('&')}';
    }

    final response = await ftPyroApiRequest.get('/services$queryString');

    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(servicesResponseModelFromJson(jsonEncode(right))),
    );
  }

  /// Get Service Details API
  Future<Either<Failure, ServicesResponseModel>> getServiceDetails({
    required String serviceId,
  }) async {
    try {
      final response = await ftPyroApiRequest.get('/services/$serviceId');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(ServicesResponseModel.fromJson(right)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Get Similar Services API
  Future<Either<Failure, List<ServicesResponseModel>>> getSimilarServices({
    String? city,
    String? category,
    String? excludeServiceId,
    int? limit,
  }) async {
    // Build query parameters map
    Map<String, dynamic> queryParams = {};

    if (city != null) queryParams['city'] = city;
    if (category != null) queryParams['category'] = category;
    if (excludeServiceId != null) queryParams['exclude_id'] = excludeServiceId;
    if (limit != null) queryParams['limit'] = limit;

    // Build query string
    String queryString = '';
    if (queryParams.isNotEmpty) {
      queryString =
          '?' +
          queryParams.entries
              .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
              .join('&');
    }

    try {
      final response = await ftPyroApiRequest.get(
        '/services/similar$queryString',
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(
          (right as List<dynamic>)
              .map((json) => ServicesResponseModel.fromJson(json))
              .toList(),
        ),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  Future<Either<Failure, List<ServicesResponseModel>>> getMyServices() async {
    try {
      final response = await ftPyroApiRequest.get('/services/me');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(
          (right as List<dynamic>)
              .map((json) => ServicesResponseModel.fromJson(json))
              .toList(),
        ),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Create Service API
  Future<Either<Failure, List<ServicesResponseModel>>> createService({
    required String agentName,
    required String description,
    required String city,
    required String state,
    required String address,
    required String pincode,
    required double latitude,
    required double longitude,
    required String phoneNumber,
    required String email,
    required List<String> categoryNames,
    required List<File> files,
    String? socialInstagram,
    String? socialLinkedin,
    String? socialFacebook,
  }) async {
    try {
      // Create FormData for multipart request
      FormData formData = FormData.fromMap({
        'agent_name': agentName,
        'description': description,
        'city': city,
        'state': state,
        'address': address,
        'pincode': pincode,
        'latitude': latitude,
        'longitude': longitude,
        'phone_number': '9700232668',
        'email': 'xyz@mail.cim',
        'category_names': categoryNames,
        if (socialInstagram != null) 'social_instagram': socialInstagram,
        if (socialLinkedin != null) 'social_linkedin': socialLinkedin,
        if (socialFacebook != null) 'social_facebook': socialFacebook,
      });

      // Add image files to FormData
      for (int i = 0; i < files.length; i++) {
        var file = files[i];
        formData.files.add(
          MapEntry(
            'files',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      // Send request using ApiRequest
      final response = await ftPyroApiRequest.post('/services', data: formData);

      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(servicesResponseModelFromJson(jsonEncode(right))),
      );
    } catch (e) {
      print('Error creating service: $e');
      return Left(ApiFailure(e.toString()));
    }
  }

  /// Update Service API
  Future<Either<Failure, ServicesResponseModel>> updateService({
    required String serviceId,
    required String agentName,
    required String description,
    required String city,
    required String state,
    required String address,
    required String pincode,
    required double latitude,
    required double longitude,
    required String phoneNumber,
    required String email,
    required List<String> categoryNames,
    required List<File> newImages,
    required List<String> existingImageUrls,
    String? socialInstagram,
    String? socialLinkedin,
    String? socialFacebook,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'agent_name': agentName,
        'description': description,
        'city': city,
        'state': state,
        'address': address,
        'pincode': pincode,
        'latitude': latitude,
        'longitude': longitude,
        'phone_number': phoneNumber,
        'email': email,
        // Join list items correctly or send as is based on backend expectation
        'category_names': jsonEncode(categoryNames), // Adjusted per multipart standard, or use list directly
        'existing_image_urls': jsonEncode(existingImageUrls),
        if (socialInstagram != null) 'social_instagram': socialInstagram,
        if (socialLinkedin != null) 'social_linkedin': socialLinkedin,
        if (socialFacebook != null) 'social_facebook': socialFacebook,
      });

      // To handle lists correctly in formdata for fastapi or other backends
      formData.fields.removeWhere((element) => element.key == 'category_names');
      for (var cat in categoryNames) {
        formData.fields.add(MapEntry('category_names', cat));
      }

      formData.fields.removeWhere((element) => element.key == 'existing_image_urls');
      for (var url in existingImageUrls) {
        formData.fields.add(MapEntry('existing_image_urls', url));
      }

      for (int i = 0; i < newImages.length; i++) {
        var file = newImages[i];
        formData.files.add(
          MapEntry(
            'new_images',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      final response = await ftPyroApiRequest.put('/services/$serviceId', data: formData);

      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(ServicesResponseModel.fromJson(right)),
      );
    } catch (e) {
      print('Error updating service: $e');
      return Left(ApiFailure(e.toString()));
    }
  }

  /// Delete Service API
  Future<Either<Failure, bool>> deleteService({
    required String serviceId,
  }) async {
    try {
      final response = await ftPyroApiRequest.delete('/services/$serviceId');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => const Right(true),
      );
    } catch (e) {
      print('Error deleting service: $e');
      return Left(ApiFailure(e.toString()));
    }
  }

  Future<Either<Failure, ServiceReviewsResponseModel>> postReview({
    required double rating,
    required String review,
    required String serviceId,
  }) async {
    try {
      final response = await ftPyroApiRequest.post(
        '/services/$serviceId/reviews',
        data: {'rating': rating, 'review': review},
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(ServiceReviewsResponseModel.fromJson(right)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  Future<Either<Failure, ServiceReviewsResponseModel>> editReview({
    required String reviewId,
    required double rating,
    required String review,
  }) async {
    try {
      final response = await ftPyroApiRequest.patch(
        '/services/reviews/$reviewId',
        data: {'rating': rating, 'review': review},
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(ServiceReviewsResponseModel.fromJson(right)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Get Service Reviews API
  Future<Either<Failure, List<ServiceReviewsResponseModel>>> getServiceReviews({
    required String serviceId,
    int? skip,
    int? limit,
  }) async {
    try {
      // Build query parameters
      Map<String, dynamic> queryParams = {};
      if (skip != null) queryParams['skip'] = skip;
      if (limit != null) queryParams['limit'] = limit;

      // Build query string
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

      final response = await ftPyroApiRequest.get(
        '/services/$serviceId/reviews$queryString',
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(
          (right as List<dynamic>)
              .map((json) => ServiceReviewsResponseModel.fromJson(json))
              .toList(),
        ),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Upload Aadhar API
  Future<Either<Failure, dynamic>> uploadAadhar({
    required String serviceId,
    required File aadharFile,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          aadharFile.path,
          filename: aadharFile.path.split('/').last,
        ),
      });

      final response = await ftPyroApiRequest.post(
        '/services/$serviceId/upload-aadhar',
        data: formData,
      );

      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(right),
      );
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  /// Get User Services API
  Future<Either<Failure, List<ServicesResponseModel>>> getUserServices({
    required String userId,
    required int skip,
    required int limit,
  }) async {
    try {
      final response = await ftPyroApiRequest.get(
        '/services/users/$userId?skip=$skip&limit=$limit',
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(
          (right as List<dynamic>)
              .map((json) => ServicesResponseModel.fromJson(json))
              .toList(),
        ),
      );
    } catch (e) {
      return Left(ApiFailure('Failed to get user services: $e'));
    }
  }
}
