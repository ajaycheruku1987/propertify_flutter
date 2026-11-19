import 'package:dartz/dartz.dart';
import 'package:propertify/core/api_request/api_request.dart';
import 'package:propertify/core/failure.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/features/notifications/models/notification_model.dart';
import 'package:propertify/utils/extensions/http_extension.dart';

class NotificationsRepo {
  final _api = serviceLocator<ApiRequest>();

  Future<Either<Failure, List<NotificationModel>>> fetchNotifications({
    int limit = 50,
    int offset = 0,
  }) async {
    final response = await _api.get(
      '/notifications',
      queryParameters: {'limit': limit, 'offset': offset},
    );
    final parsed = await response.getResponse();
    return parsed.fold(
      (failure) => Left(failure),
      (data) {
        final list = (data as List<dynamic>)
            .map((e) => NotificationModel.fromApi(e as Map<String, dynamic>))
            .toList();
        return Right(list);
      },
    );
  }

  Future<Either<Failure, void>> markAsRead(String notificationId) async {
    final response = await _api.post('/notifications/$notificationId/read');
    final parsed = await response.getResponse();
    return parsed.fold((failure) => Left(failure), (_) => const Right(null));
  }

  Future<Either<Failure, void>> markAllAsRead() async {
    final response = await _api.post('/notifications/read-all');
    final parsed = await response.getResponse();
    return parsed.fold((failure) => Left(failure), (_) => const Right(null));
  }
}
