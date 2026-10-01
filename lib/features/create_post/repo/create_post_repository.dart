import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    String? plotArea,
    String? areaUnit,
    String? facing,
    String? roadWidth,
    String? postedBy,
    String? approvalStatus,
    String? dimensions,
    bool? isCornerPlot,
    bool? isGatedCommunity,
    String? mainCategory,
    String? subCategory,
    bool? isNegotiable,
    String? securityDeposit,
    String? propertyStatus,
    bool? contactViaPhone,
    bool? contactViaWhatsApp,
    String? carpetArea,
    String? carpetAreaUnit,
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
    String? plotArea,
    String? areaUnit,
    String? facing,
    String? roadWidth,
    String? postedBy,
    String? approvalStatus,
    String? dimensions,
    bool? isCornerPlot,
    bool? isGatedCommunity,
    String? mainCategory,
    String? subCategory,
    bool? isNegotiable,
    String? securityDeposit,
    String? propertyStatus,
    bool? contactViaPhone,
    bool? contactViaWhatsApp,
    String? carpetArea,
    String? carpetAreaUnit,
  }) async {
    try {
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
        if (plotArea != null && plotArea.isNotEmpty) 'plot_area': plotArea,
        if (areaUnit != null && areaUnit.isNotEmpty) 'area_unit': areaUnit,
        if (facing != null && facing.isNotEmpty) 'facing': facing,
        if (roadWidth != null && roadWidth.isNotEmpty) 'road_width': roadWidth,
        if (postedBy != null && postedBy.isNotEmpty) 'posted_by': postedBy,
        if (approvalStatus != null && approvalStatus.isNotEmpty) 'approval_status': approvalStatus,
        if (dimensions != null && dimensions.isNotEmpty) 'dimensions': dimensions,
        if (isCornerPlot != null) 'is_corner_plot': isCornerPlot,
        if (isGatedCommunity != null) 'is_gated_community': isGatedCommunity,
        if (mainCategory != null && mainCategory.isNotEmpty) 'main_category': mainCategory,
        if (subCategory != null && subCategory.isNotEmpty) 'sub_category': subCategory,
        if (isNegotiable != null) 'is_negotiable': isNegotiable,
        if (securityDeposit != null && securityDeposit.isNotEmpty) 'security_deposit': securityDeposit,
        if (propertyStatus != null && propertyStatus.isNotEmpty) 'property_status': propertyStatus,
        if (contactViaPhone != null) 'contact_via_phone': contactViaPhone,
        if (contactViaWhatsApp != null) 'contact_via_whatsapp': contactViaWhatsApp,
        if (carpetArea != null && carpetArea.isNotEmpty) 'carpet_area': carpetArea,
        if (carpetAreaUnit != null && carpetAreaUnit.isNotEmpty) 'carpet_area_unit': carpetAreaUnit,
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
        '/properties',
        data: formData,
        options: Options(
          sendTimeout: const Duration(seconds: 120),
          receiveTimeout: const Duration(seconds: 120),
        ),
      );

      final responseData = await response.getResponse();
      return responseData.fold((failure) => Left(failure), (right) {
        final addPostResponse = AddPostResponse.fromJson(right);

        // Cache plot & property specs locally as fallback
        if (addPostResponse.id != null) {
          final prefs = serviceLocator<SharedPreferences>();
          final postId = addPostResponse.id!;
          if (plotArea != null && plotArea.isNotEmpty) prefs.setString('plot_area_$postId', plotArea);
          if (areaUnit != null && areaUnit.isNotEmpty) prefs.setString('area_unit_$postId', areaUnit);
          if (facing != null && facing.isNotEmpty) prefs.setString('facing_$postId', facing);
          if (roadWidth != null && roadWidth.isNotEmpty) prefs.setString('road_width_$postId', roadWidth);
          if (postedBy != null && postedBy.isNotEmpty) prefs.setString('posted_by_$postId', postedBy);
          if (approvalStatus != null && approvalStatus.isNotEmpty) prefs.setString('approval_status_$postId', approvalStatus);
          if (dimensions != null && dimensions.isNotEmpty) prefs.setString('dimensions_$postId', dimensions);
          if (isCornerPlot != null) prefs.setBool('is_corner_plot_$postId', isCornerPlot);
          if (isGatedCommunity != null) prefs.setBool('is_gated_community_$postId', isGatedCommunity);
          if (propertyStatus != null && propertyStatus.isNotEmpty) prefs.setString('property_status_$postId', propertyStatus);
          if (securityDeposit != null && securityDeposit.isNotEmpty) prefs.setString('security_deposit_$postId', securityDeposit);
          if (isNegotiable != null) prefs.setBool('is_negotiable_$postId', isNegotiable);
          if (contactViaPhone != null) prefs.setBool('contact_via_phone_$postId', contactViaPhone);
          if (contactViaWhatsApp != null) prefs.setBool('contact_via_whatsapp_$postId', contactViaWhatsApp);
          if (carpetArea != null && carpetArea.isNotEmpty) prefs.setString('carpet_area_$postId', carpetArea);
          if (carpetAreaUnit != null && carpetAreaUnit.isNotEmpty) prefs.setString('carpet_area_unit_$postId', carpetAreaUnit);
        }

        return Right(addPostResponse);
      });
    } catch (e) {
      print('Error creating post: $e');
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<List<String>> getLocations() async {
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
    await Future.delayed(const Duration(milliseconds: 500));
    return ['House', 'Villas', 'Apartments', 'Properties'];
  }
}
