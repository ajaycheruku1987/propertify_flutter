import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/utils/extensions/http_extension.dart';

import '../../../core/api_request/api_request.dart';
import '../../../core/failure.dart';
import '../models/feed_posts_response_model.dart';

class HomeRepo {
  final ftPyroApiRequest = serviceLocator<ApiRequest>();

  /// Get User Posts API
  Future<Either<Failure, List<FeedPostsResponseModel>>> getUserPosts({
    required String userId,
    required int limit,
    required int offset,
  }) async {
    final response = await ftPyroApiRequest.get(
      '/properties/users/$userId?limit=$limit&offset=$offset',
    );
    final responseData = await response.getResponse();
    return responseData.fold((failure) => Left(failure), (right) {
      final List<dynamic> data = right as List<dynamic>;
      final posts = data
          .map(
            (item) =>
                FeedPostsResponseModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
      return Right(posts);
    });
  }
}
