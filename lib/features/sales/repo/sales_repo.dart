import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/api_request/api_request.dart';
import '../../../core/failure.dart';
import '../../../core/service_locator.dart';
import '../../../utils/extensions/http_extension.dart';
import '../../admin/models/callback_request_model.dart';
import '../models/sales_model.dart';
import '../models/sales_unit_model.dart';
import '../models/callback_request_response_model.dart';

class SalesRepo {
  final apiRequest = serviceLocator<ApiRequest>();

  // Get Sales listings
  Future<Either<Failure, SalesModel>> getSales({
    double? latitude,
    double? longitude,
    double? radiusKm,
    String? location,
    String? propertyType,
    List<String>? propertyTypes,
    String? city,
    String? state,
    int? page,
    int? pageSize,
    double? minPrice,
    double? maxPrice,
    String? search,
    int? limit,
    int? offset,
  }) async {
    try {
      // Build query parameters, mirroring services repo behavior
      final Map<String, dynamic> queryParams = {};

      // Map offset/limit to page/page_size if not provided
      final int effectiveLimit = (limit ?? 10);
      final int effectiveOffset = (offset ?? 0);
      final int effectivePageSize = (pageSize ?? effectiveLimit);
      final int effectivePage =
          (page ?? ((effectiveOffset ~/ effectiveLimit) + 1));

      queryParams['page'] = effectivePage;
      queryParams['page_size'] = effectivePageSize;

      if (city != null && city.isNotEmpty) {
        queryParams['city'] = city;
      }
      if (state != null && state.isNotEmpty) {
        queryParams['state'] = state;
      }
      if (location != null && location.isNotEmpty) {
        queryParams['location'] = location;
      }

      if (latitude != null) queryParams['latitude'] = latitude;
      if (longitude != null) queryParams['longitude'] = longitude;
      queryParams['radius_km'] = (radiusKm != null && radiusKm >= 0)
          ? radiusKm
          : 5;

      // property_types: array<string>
      if (propertyTypes != null && propertyTypes.isNotEmpty) {
        queryParams['property_types'] = propertyTypes;
      } else if (propertyType != null && propertyType.isNotEmpty) {
        queryParams['property_types'] = [propertyType];
      }

      // Note: minPrice, maxPrice, search are currently not part of schema.
      // Keeping params in signature for backward compatibility, but not sending.

      // Build query string manually
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

      final response = await apiRequest.get('/sales-projects$queryString');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(SalesModel.fromJson(right as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Get Sales Project By Id
  Future<Either<Failure, SaleRecord>> getSaleDetails({
    required String projectId,
  }) async {
    try {
      final response = await apiRequest.get('/sales-projects/$projectId');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(SaleRecord.fromJson(right as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Get Sales Projects By User Id
  Future<Either<Failure, SalesModel>> getSalesProjectsByUserId({
    required String userId,
    int? page,
    int? pageSize,
  }) async {
    try {
      final int effectivePage = page ?? 1;
      final int effectivePageSize = pageSize ?? 20;

      final queryString = '?page=$effectivePage&page_size=$effectivePageSize';
      final response = await apiRequest.get(
        '/users/$userId/sales-projects$queryString',
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(SalesModel.fromJson(right as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Create Sales Project (aligned with provided payload schema)
  Future<Either<Failure, SalesModel>> createSalesProject({
    required String propertyType, // property_type
    required String projectName, // project_name
    String? rera, // rera
    required num area, // area
    required String areaUnit, // area_unit
    int? noOfUnits, // no_of_units
    int? noOfFloors, // no_of_floors
    String? description, // description
    String? specifications, // specifications
    String? address, // address
    String? city, // city
    String? state, // state
    String? location, // location
    double? latitude, // latitude
    double? longitude, // longitude
    String? publicFacilities, // public_facilities
    num? minPrice, // min_price
    num? maxPrice, // max_price
    String? saleSpecification, // sale_specification
    String? possessionDate, // possession_date
    List<File>? images, // images (array<string>)
    File? brochure, // brochure (binary)
  }) async {
    try {
      final Map<String, dynamic> body = {
        'property_type': propertyType,
        'project_name': projectName,
        if (rera != null && rera.isNotEmpty) 'rera_number': rera,
        'area': area,
        'area_unit': areaUnit,
        if (noOfUnits != null) 'no_of_units': noOfUnits,
        if (noOfFloors != null) 'no_of_floors': noOfFloors,
        if (description != null && description.isNotEmpty)
          'description': description,
        if (specifications != null && specifications.isNotEmpty)
          'specifications': specifications,
        if (address != null) 'address': address,
        if (city != null) 'city': city,
        if (state != null) 'state': state,
        if (location != null) 'location': location,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
        if (minPrice != null) 'min_price': minPrice,
        if (maxPrice != null) 'max_price': maxPrice,
        if (saleSpecification != null && saleSpecification.isNotEmpty)
          'sale_specification': saleSpecification,
        if (publicFacilities != null && publicFacilities.isNotEmpty)
          'public_facilities': publicFacilities,
        if (possessionDate != null && possessionDate.isNotEmpty)
          'possession_date': possessionDate,
      };

      final formData = FormData.fromMap(body);

      if (images != null) {
        for (final img in images) {
          formData.files.add(
            MapEntry(
              'images',
              await MultipartFile.fromFile(
                img.path,
                filename: img.path.split('/').last,
              ),
            ),
          );
        }
      }

      if (brochure != null) {
        formData.files.add(
          MapEntry(
            'brochure',
            await MultipartFile.fromFile(
              brochure.path,
              filename: brochure.path.split('/').last,
            ),
          ),
        );
      }

      final response = await apiRequest.post('/sales-projects', data: formData);
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(SalesModel.fromJson(right as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  Future<Either<Failure, CallbackRequestResponseModel>> requestCallback({
    required String salesProjectId,
  }) async {
    try {
      final response = await apiRequest.post(
        '/sales-projects/callback-request',
        data: {'sales_project_id': salesProjectId},
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(
          CallbackRequestResponseModel.fromJson(right as Map<String, dynamic>),
        ),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  Future<Either<Failure, SalesUnitModel>> addProjectUnit({
    required String projectId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiRequest.post(
        '/sales-projects/$projectId/units',
        data: data,
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) =>
            Right(SalesUnitModel.fromJson(right as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  Future<Either<Failure, SalesUnitResponseModel>> getProjectUnits({
    required String projectId,
  }) async {
    try {
      final response = await apiRequest.get('/sales-projects/$projectId/units');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(
          SalesUnitResponseModel.fromJson(right as Map<String, dynamic>),
        ),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  Future<Either<Failure, SalesUnitModel>> editProjectUnit({
    required String unitId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiRequest.patch(
        '/sales-projects/units/$unitId',
        data: data,
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) =>
            Right(SalesUnitModel.fromJson(right as Map<String, dynamic>)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Get callback requests for a sales project (owner only)
  Future<Either<Failure, List<CallbackRequestModel>>> getCallbacksByProjectId({
    required String projectId,
    int page = 1,
    int limit = 50,
  }) async {
    try {
      final response = await apiRequest.get(
        '/sales-projects/$projectId/callbacks?page=$page&limit=$limit',
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) {
          final map = right as Map<String, dynamic>;
          final items = (map['items'] as List<dynamic>? ?? [])
              .map((e) => CallbackRequestModel.fromJson(e as Map<String, dynamic>))
              .toList();
          return Right(items);
        },
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  /// Delete a callback request by its id
  Future<Either<Failure, bool>> deleteCallback({
    required String callbackId,
  }) async {
    try {
      final response = await apiRequest.delete(
        '/sales-projects/callbacks/$callbackId',
      );
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (_) => const Right(true),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }
}
