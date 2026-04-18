import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:propertify/utils/extensions/http_extension.dart';
import 'dart:io';

import '../../../core/api_request/api_request.dart';
import '../../../core/failure.dart';
import '../models/user_profile_model.dart';
import '../models/create_banner_ad_model.dart';
import '../models/banner_ad_model.dart';

class ProfileRepo {
  final ftPyroApiRequest = GetIt.instance<ApiRequest>();

  /// Get User Profile API
  Future<Either<Failure, UserProfileModel>> getUserProfile() async {
    final response = await ftPyroApiRequest.get('/profile');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(UserProfileModel.fromJson(right)),
    );
  }

  /// Update Profile API
  Future<Either<Failure, UserProfileModel>> updateProfile({
    required String name,
    required String email,
    required String phoneNumber,
  }) async {
    final response = await ftPyroApiRequest.put(
      '/profile',
      data: {"name": name, "email": email, "phone_number": phoneNumber},
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(UserProfileModel.fromJson(right['data'])),
    );
  }

  /// Upload Profile Image API
  Future<Either<Failure, UserProfileModel>> uploadProfileImage(
    String imagePath,
  ) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imagePath),
    });
    final response = await ftPyroApiRequest.post(
      '/profile/upload',
      data: formData,
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(UserProfileModel.fromJson(right)),
    );
  }

  /// Change Password API
  Future<Either<Failure, bool>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final response = await ftPyroApiRequest.put(
      '/profile/change-password',
      data: {"current_password": currentPassword, "new_password": newPassword},
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => const Right(true),
    );
  }

  /// Create Banner Ad API
  Future<Either<Failure, BannerAdModel>> createBannerAd({
    required List<File> images,
    required String description,
    required String planName,
    required int planDays,
    required double amount,
    required bool termsAccepted,
  }) async {
    try {
      // Prepare multipart form data
      final formData = FormData();

      // Add images
      for (var image in images) {
        formData.files.add(
          MapEntry(
            'images',
            await MultipartFile.fromFile(
              image.path,
              filename: image.path.split('/').last,
            ),
          ),
        );
      }

      // Add other fields
      formData.fields.add(MapEntry('description', description));
      formData.fields.add(MapEntry('plan_name', planName));
      formData.fields.add(MapEntry('plan_days', planDays.toString()));
      formData.fields.add(MapEntry('amount', amount.toString()));
      formData.fields.add(MapEntry('terms_accepted', termsAccepted.toString()));

      final response = await ftPyroApiRequest.post(
        '/banner-ads',
        data: formData,
      );
      final responseData = await response.getResponse();
      return responseData.fold((failure) => Left(failure), (right) {
        return Right(BannerAdModel.fromJson(right));
      });
    } catch (e) {
      return Left(ApiFailure('Failed to create banner ad: $e'));
    }
  }

  /// Get Banner Ads API
  Future<Either<Failure, List<BannerAdModel>>> getBannerAds() async {
    final response = await ftPyroApiRequest.get('/banner-ads');
    final responseData = await response.getResponse();
    return responseData.fold((failure) => Left(failure), (right) {
      final List<dynamic> data = right as List<dynamic>;
      final bannerAds = data
          .map((item) => BannerAdModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return Right(bannerAds);
    });
  }

  /// Get Banner Ads API
  Future<Either<Failure, List<BannerAdModel>>> getMyBannerAds() async {
    final response = await ftPyroApiRequest.get('/banner-ads/me');
    final responseData = await response.getResponse();
    return responseData.fold((failure) => Left(failure), (right) {
      final List<dynamic> data = right as List<dynamic>;
      final bannerAds = data
          .map((item) => BannerAdModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return Right(bannerAds);
    });
  }

  /// Delete Account API
  Future<Either<Failure, bool>> deleteAccount() async {
    final response = await ftPyroApiRequest.delete('/profile');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => const Right(true),
    );
  }

  /// Get Other User Profile API
  Future<Either<Failure, UserProfileModel>> getOtherUserProfile(
    String userId,
  ) async {
    final response = await ftPyroApiRequest.get('/profile/$userId');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(UserProfileModel.fromJson(right)),
    );
  }
}
