import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:propertify/utils/extensions/http_extension.dart';
import '../../../core/api_request/api_request.dart';
import '../../../core/failure.dart';

class FeedbackRepo {
  final _apiRequest = GetIt.instance<ApiRequest>();

  Future<Either<Failure, bool>> submitFeedback({
    required String message,
    String? subject,
  }) async {
    final response = await _apiRequest.post(
      '/feedback/',
      data: {
        'message': message,
        if (subject != null) 'subject': subject,
      },
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => const Right(true),
    );
  }
}
