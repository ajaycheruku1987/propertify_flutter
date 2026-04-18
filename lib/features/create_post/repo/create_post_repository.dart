import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:propertify/core/api_request/api_request.dart';
import 'package:propertify/core/failure.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/features/create_post/models/add_post_response.dart';
import 'package:propertify/utils/extensions/http_extension.dart';

abstract class CreatePostRepository {
  Future<Either<Failure, AddPostResponse>> createPost({
    required String title,
    required String propertyType,
    required String listingType,
    required String address,
    required String city,
    required String price,
    String? description,
    double? latitude,
    double? longitude,
    required List<File> images,
  });

  Future<List<String>> getLocations();
  Future<List<String>> getPropertyTypes();
}

class CreatePostRepositoryImpl implements CreatePostRepository {
  final ApiRequest _apiRequest = serviceLocator<ApiRequest>();

  @override
  Future<Either<Failure, AddPostResponse>> createPost({
    required String title,
    required String propertyType,
    required String listingType,
    required String address,
    required String city,
    required String price,
    String? description,
    double? latitude,
    double? longitude,
    required List<File> images,
  }) async {
    try {
      // Create FormData for multipart request
      // Convert price string to double by removing currency symbol and commas
      final double priceValue = double.parse(
        price.replaceAll('₹', '').replaceAll(',', '').trim(),
      );

      FormData formData = FormData.fromMap({
        'title': title,
        'property_type': propertyType,
        'listing_type': listingType,
        'address': address,
        'city': city,
        'price': priceValue,
        if (description != null) 'description': description,
        if (latitude != null) 'latitude': latitude.toString(),
        if (longitude != null) 'longitude': longitude.toString(),
      });

      // Add image files to FormData
      for (int i = 0; i < images.length; i++) {
        var file = images[i];
        formData.files.add(
          MapEntry(
            'images',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
              contentType: MediaType('image', 'jpeg'),
            ),
          ),
        );
      }

      // Send request using ApiRequest
      final response = await _apiRequest.post(
        '/properties', // Replace with actual endpoint path
        data: formData,
      );

      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(AddPostResponse.fromJson(right)),
      );
    } catch (e) {
      print('Error creating post: $e');
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<List<String>> getLocations() async {
    // TODO: Implement API call to get locations
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      'Hyderabad',
      'Mumbai',
      'Delhi',
      'Bangalore',
      'Chennai',
      'Kolkata',
      'Pune',
      'Ahmedabad',
    ];
  }

  @override
  Future<List<String>> getPropertyTypes() async {
    // TODO: Implement API call to get property types
    await Future.delayed(const Duration(milliseconds: 500));
    return ['House', 'Villas', 'Apartments', 'Properties'];
  }
}
