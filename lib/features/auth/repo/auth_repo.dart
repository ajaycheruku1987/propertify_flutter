import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/utils/extensions/http_extension.dart';

import '../../../core/api_request/api_request.dart';
import '../../../core/failure.dart';
import '../models/forgot_password_response_model.dart';
import '../models/login_response_model.dart';

class AuthRepo {
  final ftPyroApiRequest = serviceLocator<ApiRequest>();

  String get _platform =>
      defaultTargetPlatform == TargetPlatform.iOS ? 'ios' : 'android';

  /// Login API
  Future<Either<Failure, LoginResponseModel>> login({
    required String mobile,
    required String password,
    String? fcmToken,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/login',
      data: {
        "phone_number": mobile,
        "password": password,
        "fcm_token": fcmToken,
        "platform": _platform,
      },
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(LoginResponseModel.fromJson(right)),
    );
  }

  /// Check Phone Number API
  Future<Either<Failure, Map<String, dynamic>>> verifyPhoneNumber({
    required String mobile,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/validate-phone',
      queryParameters: {"phone_number": mobile},
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right),
    );
  }

  /// Get OTP for Signup API
  Future<Either<Failure, Map<String, dynamic>>> getOtp({
    required String phoneNumber,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/otp/send',
      data: {"phone_number": phoneNumber},
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right),
    );
  }

  /// Signup API
  Future<Either<Failure, LoginResponseModel>> signup({
    required String username,
    String? email,
    required String phoneNumber,
    required String password,
    required String otp,
    String? fcmToken,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/signup',
      data: {
        "username": username,
        // "email": email,
        "phone_number": phoneNumber,
        "password": password,
        "otp": otp,
        "fcm_token": fcmToken,
        "platform": _platform,
      },
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(LoginResponseModel.fromJson(right)),
    );
  }

  /// Change Password API
  Future<Either<Failure, Map<String, dynamic>>> changePassword({
    required String token,
    required String mobile,
    required String oldPassword,
    required String newPassword,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/change-mpin',
      data: {
        'mobile': mobile,
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      },
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Forgot Password API
  Future<Either<Failure, ForgotPasswordResponseModel>> forgotPassword({
    required String mobile,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/forgot-mpin',
      data: {'mobile': mobile},
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(ForgotPasswordResponseModel.fromJson(right)),
    );
  }

  /// Reset Password API
  Future<Either<Failure, ForgotPasswordResponseModel>> resetForgotPassword({
    required String mobile,
    required String newPassword,
    required String otp,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/reset-forgot-mpin',
      data: {'mobile': mobile, 'newPassword': newPassword, 'otp': otp},
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(ForgotPasswordResponseModel.fromJson(right)),
    );
  }

  /// Send Forgot Password OTP API
  Future<Either<Failure, Map<String, dynamic>>> sendForgotPasswordOtp({
    required String phoneNumber,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/otp/forgot-password/send',
      data: {"phone_number": phoneNumber},
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Confirm Forgot Password API
  Future<Either<Failure, Map<String, dynamic>>> confirmForgotPassword({
    required String phoneNumber,
    required String newPassword,
    required String otp,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/forgot-password',
      data: {
        "phone_number": phoneNumber,
        "new_password": newPassword,
        "otp": otp,
      },
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Register/refresh this device for push notifications
  Future<Either<Failure, Map<String, dynamic>>> updateFcmToken({
    required String fcmToken,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/devices',
      data: {"fcm_token": fcmToken, "platform": _platform},
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Stop push notifications for this device (on logout)
  Future<Either<Failure, Map<String, dynamic>>> removeFcmToken({
    required String fcmToken,
  }) async {
    final response = await ftPyroApiRequest.delete(
      '/devices',
      data: {"fcm_token": fcmToken},
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }
}
