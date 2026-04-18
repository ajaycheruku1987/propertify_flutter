import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:propertify/core/api_request/api_request.dart';
import 'package:propertify/core/failure.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/utils/extensions/http_extension.dart';

import '../models/reel_model.dart';
import '../models/reel_response_model.dart';
import '../models/like_reel_response_model.dart';
import '../models/reel_comment_model.dart';
import '../models/reel_view_response_model.dart';

abstract class ReelsRepo {
  Future<Either<Failure, List<ReelResponseModel>>> getReels({
    int? skip,
    int? limit,
  });

  Future<Either<Failure, ReelResponseModel>> createReel({
    required File videoFile,
    String? description,
    List<String>? category,
    String? location,
    String? city,
    String? state,
    String? address,
    double? latitude,
    double? longitude,
    bool? isPromoted,
    String? promotedUntil,
  });

  Future<Either<Failure, LikeReelResponseModel>> toggleLikeReel({
    required String reelId,
  });

  Future<Either<Failure, List<ReelCommentModel>>> getReelComments({
    required String reelId,
  });

  Future<Either<Failure, ReelCommentModel>> addCommentToReel({
    required String reelId,
    required String text,
  });

  Future<Either<Failure, ReelViewResponseModel>> recordReelView({
    required String reelId,
  });

  Future<Either<Failure, List<ReelResponseModel>>> getUserReels({
    required String userId,
  });

  Future<Either<Failure, bool>> deleteReel({required String reelId});

  Future<Either<Failure, List<ReelResponseModel>>> getMyReels();
}

class ReelsRepoImpl implements ReelsRepo {
  @override
  Future<Either<Failure, List<ReelResponseModel>>> getReels({
    int? skip,
    int? limit,
  }) async {
    try {
      final s = skip ?? 0;
      final l = limit ?? 10;
      final apiRequest = serviceLocator<ApiRequest>();

      final response = await apiRequest.get('/reels/?skip=$s&limit=$l');

      final responseData = await response.getResponse();

      return responseData.fold((failure) => Left(failure), (data) {
        final List<dynamic> results = data is List ? data : [];
        final List<ReelResponseModel> reels = results.map((e) {
          final reelResponse = ReelResponseModel.fromJson(e);
          return reelResponse;
        }).toList();
        return Right(reels);
      });
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ReelResponseModel>> createReel({
    required File videoFile,
    String? description,
    List<String>? category,
    String? location,
    String? city,
    String? state,
    String? address,
    double? latitude,
    double? longitude,
    bool? isPromoted,
    String? promotedUntil,
  }) async {
    try {
      // TODO: Replace with actual API integration using ApiRequest
      // Example implementation structure:

      final apiRequest = serviceLocator<ApiRequest>();
      final Map<String, dynamic> body = {
        if (description != null) 'description': description,
        if (category != null && category.isNotEmpty) 'category': category,
        if (location != null) 'location': location,
        if (city != null) 'city': city,
        if (state != null) 'state': state,
        if (address != null) 'address': 'qweqwe',
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
        if (isPromoted != null) 'is_promoted': isPromoted,
        if (promotedUntil != null) 'promoted_until': promotedUntil,
      };

      final formData = FormData.fromMap(body);
      formData.files.add(
        MapEntry(
          'video',
          await MultipartFile.fromFile(
            videoFile.path,
            filename: videoFile.path.split('/').last,
            // contentType: MediaType('video', 'mp4'),
          ),
        ),
      );

      final response = await apiRequest.post('/reels/', data: formData);
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(ReelResponseModel.fromJson(right)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, LikeReelResponseModel>> toggleLikeReel({
    required String reelId,
  }) async {
    try {
      final apiRequest = serviceLocator<ApiRequest>();
      final response = await apiRequest.post('/reels/$reelId/like');
      final responseData = await response.getResponse();

      return responseData.fold(
        (failure) => Left(failure),
        (data) => Right(LikeReelResponseModel.fromJson(data)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<ReelCommentModel>>> getReelComments({
    required String reelId,
  }) async {
    try {
      final apiRequest = serviceLocator<ApiRequest>();
      final response = await apiRequest.get('/reels/$reelId/comments');
      final responseData = await response.getResponse();

      return responseData.fold((failure) => Left(failure), (data) {
        final List<dynamic> results = data is List ? data : [];
        final List<ReelCommentModel> comments = results.map((e) {
          return ReelCommentModel.fromJson(e);
        }).toList();
        return Right(comments);
      });
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ReelCommentModel>> addCommentToReel({
    required String reelId,
    required String text,
  }) async {
    try {
      final apiRequest = serviceLocator<ApiRequest>();
      final response = await apiRequest.post(
        '/reels/$reelId/comments',
        data: {'text': text},
      );
      final responseData = await response.getResponse();

      return responseData.fold(
        (failure) => Left(failure),
        (data) => Right(ReelCommentModel.fromJson(data)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ReelViewResponseModel>> recordReelView({
    required String reelId,
  }) async {
    try {
      final apiRequest = serviceLocator<ApiRequest>();
      final response = await apiRequest.post('/reels/$reelId/view');
      final responseData = await response.getResponse();

      return responseData.fold(
        (failure) => Left(failure),
        (data) => Right(ReelViewResponseModel.fromJson(data)),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<ReelResponseModel>>> getUserReels({
    required String userId,
  }) async {
    try {
      final apiRequest = serviceLocator<ApiRequest>();
      final response = await apiRequest.get('/reels/users/$userId');
      final responseData = await response.getResponse();

      return responseData.fold((failure) => Left(failure), (data) {
        final List<dynamic> results = data is List ? data : [];
        final List<ReelResponseModel> reels = results.map((e) {
          return ReelResponseModel.fromJson(e);
        }).toList();
        return Right(reels);
      });
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteReel({required String reelId}) async {
    try {
      final apiRequest = serviceLocator<ApiRequest>();
      final response = await apiRequest.delete('/reels/$reelId');
      final responseData = await response.getResponse();

      return responseData.fold(
        (failure) => Left(failure),
        (data) => const Right(true),
      );
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<ReelResponseModel>>> getMyReels() async {
    try {
      final apiRequest = serviceLocator<ApiRequest>();
      final response = await apiRequest.get('/reels/me');
      final responseData = await response.getResponse();

      return responseData.fold((failure) => Left(failure), (data) {
        final List<dynamic> results = data is List ? data : [];
        final List<ReelResponseModel> reels = results.map((e) {
          return ReelResponseModel.fromJson(e);
        }).toList();
        return Right(reels);
      });
    } catch (e) {
      return Left(ApiFailure('An error occurred: ${e.toString()}'));
    }
  }
}
