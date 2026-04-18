part of 'requests_bloc.dart';

@freezed
class RequestsEvent with _$RequestsEvent {
  const factory RequestsEvent.reset() = _Reset;
  const factory RequestsEvent.getRequests({
    int? skip,
    int? limit,
    double? latitude,
    double? longitude,
    double? radiusKm,
    String? search,
  }) = _GetRequestsEvent;

  const factory RequestsEvent.getRequestDetails({required String requestId}) =
      _GetRequestDetailsEvent;

  const factory RequestsEvent.createRequest({
    required String title,
    required String category,
    required String state,
    required String city,
    required String address,
    required int budget,
    required String description,
    required bool termsAgreed,
    required double latitude,
    required double longitude,
  }) = _CreateRequestEvent;

  const factory RequestsEvent.updateRequest({
    required String requestId,
    required String title,
    required String category,
    required String state,
    required String city,
    required String address,
    required int budget,
    required String description,
    required bool termsAgreed,
    required double latitude,
    required double longitude,
  }) = _UpdateRequestEvent;

  const factory RequestsEvent.deleteRequest({required String requestId}) =
      _DeleteRequestEvent;

  const factory RequestsEvent.isLoading() = _IsLoading;

  const factory RequestsEvent.getMyRequests() = _GetMyRequestsEvent;
}
