import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app.dart';
import '../../core/api_request/api_request.dart';
import '../../core/app_cache_service.dart';
import '../../core/failure.dart';
import '../../core/service_locator.dart';
import '../../features/auth/presentation/auth_screen.dart';
import '../custom_toast.dart';
import 'status_codes_extension.dart';

extension HttpExtension on Response {
  Future<Either<Failure, dynamic>> getResponse() async {
    if (statusCode == 200 || statusCode == 201) {
      if (data is Map && data['statusCode'] != null) {
        final resStatus = data['statusCode'] as int;
        if (resStatus != 200 && resStatus != 201) {
          return _getErrorMessage();
        } else if (data['status'] == 'Failed') {
          return _getErrorMessage();
        }
      }
      return Right(data);
    } else {
      if (statusCode == 403) {
        final appCache = AppCacheService();
        await ApiRequest(appCache).updateAuthorization(clearToken: true);
        await appCache.clearAll();
        // CustomToast.showErrorToast(msg: 'Session Timed Out').then(
        //   (value) => navigationKey.currentContext!.go(AuthScreen.routeName),
        // );
      }
      return _getErrorMessage();
    }
  }

  Left<Failure, dynamic> _getErrorMessage() {
    try {
      debugPrint('_getErrorMessage: $data');
      final message = data['detail'] ?? '';
      final error = data['description'] ?? '';
      final errMsg = message.toString().isNotEmpty ? message : error;

      if (errMsg.isNotEmpty) {
        return Left(ApiFailure(errMsg));
      } else {
        return Left(ApiFailure(statusCode.getStatusMessage()));
      }
    } catch (e) {
      return Left(ApiFailure(statusCode.getStatusMessage()));
    }
  }
}
