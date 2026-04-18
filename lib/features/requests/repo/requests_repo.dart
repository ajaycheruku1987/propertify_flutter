import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/utils/extensions/http_extension.dart';

import '../../../core/api_request/api_request.dart';
import '../../../core/failure.dart';
import '../models/request_response_model.dart';

class RequestsRepo {
  final ftPyroApiRequest = serviceLocator<ApiRequest>();

  /// Get Requests API
  Future<Either<Failure, List<RequestResponseModel>>> getRequests({
    int? skip,
    int? limit,
    double? latitude,
    double? longitude,
    double? radiusKm,
    String? search,
  }) async {
    try {
      // Build query parameters map
      final Map<String, dynamic> queryParams = {};
      if (skip != null) queryParams['skip'] = skip;
      if (limit != null) queryParams['limit'] = limit;
      if (latitude != null) queryParams['latitude'] = latitude;
      if (longitude != null) queryParams['longitude'] = longitude;
      if (radiusKm != null) queryParams['radius_km'] = radiusKm;
      if (search != null && search.isNotEmpty) queryParams['search'] = search;

      // Build query string manually since get method may not support queryParameters
      String queryString = '';
      if (queryParams.isNotEmpty) {
        final List<String> parts = [];
        queryParams.forEach((key, value) {
          parts.add(
            '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(value.toString())}',
          );
        });
        queryString = '?${parts.join('&')}';
      }

      final response = await ftPyroApiRequest.get('/requests/$queryString');

      final responseData = await response.getResponse();
      return responseData.fold((failure) => Left(failure), (right) {
        return Right(requestResponseModelFromJson(jsonEncode(right)));
      });
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Get Request Details API
  Future<Either<Failure, RequestResponseModel>> getRequestDetails({
    required String requestId,
  }) async {
    try {
      final response = await ftPyroApiRequest.get('/requests/$requestId');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(RequestResponseModel.fromJson(right)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Create Request API
  Future<Either<Failure, RequestResponseModel>> createRequest({
    required String title,
    required String category,
    required String state,
    required String city,
    required String address,
    required int budget,
    required String description,
    required bool termsAgreed,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'title': title,
        'category': category,
        'state': state,
        'city': city,
        'address': address,
        'budget': budget,
        'description': description,
        'terms_agreed': termsAgreed,
        'latitude': latitude,
        'longitude': longitude,
      };

      final response = await ftPyroApiRequest.post('/requests/', data: data);

      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(RequestResponseModel.fromJson(right)),
      );
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  /// Update Request API
  Future<Either<Failure, RequestResponseModel>> updateRequest({
    required String requestId,
    required String title,
    required String category,
    required String state,
    required String city,
    required String address,
    required int budget,
    required String description,
    required bool termsAgreed,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'title': title,
        'category': category,
        'state': state,
        'city': city,
        'address': address,
        'budget': budget,
        'description': description,
        'terms_agreed': termsAgreed,
        'latitude': latitude,
        'longitude': longitude,
      };

      final response =
          await ftPyroApiRequest.put('/requests/$requestId', data: data);

      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(RequestResponseModel.fromJson(right)),
      );
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  /// Delete Request API
  Future<Either<Failure, bool>> deleteRequest({
    required String requestId,
  }) async {
    try {
      final response = await ftPyroApiRequest.delete('/requests/$requestId');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => const Right(true),
      );
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<RequestResponseModel>>> getMyRequests() async {
    try {
      final response = await ftPyroApiRequest.get('/requests/me');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(
          (right as List<dynamic>)
              .map((json) => RequestResponseModel.fromJson(json))
              .toList(),
        ),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }
}
