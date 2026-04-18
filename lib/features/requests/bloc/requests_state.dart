part of 'requests_bloc.dart';

@freezed
class RequestsState with _$RequestsState {
  const factory RequestsState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default(false) bool isSuccess,
    RequestResponseModel? requestDetails,
    @Default(<RequestResponseModel>[]) List<RequestResponseModel> requestsList,
    @Default(<RequestResponseModel>[]) List<RequestResponseModel> myRequestsList,
    @Default(0) int currentOffset,
    @Default(false) bool hasMoreData,
    NotifyStatus? notifyStatus,
    @Default(false) bool isMyRequestsLoading,
  }) = _RequestsState;
}
