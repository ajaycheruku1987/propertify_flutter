part of 'services_bloc.dart';

@freezed
class ServicesState with _$ServicesState {
  const factory ServicesState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default(false) bool isSuccess,
    ServicesResponseModel? serviceDetails,
    @Default([]) List<ServicesResponseModel> similarServices,
    @Default([]) List<ServicesResponseModel> servicesList,
    @Default([]) List<ServicesResponseModel> myServicesList,
    @Default(0) int currentOffset,
    @Default(false) bool hasMoreData,
    CreateServiceDataModel? createServiceDataModel,
    NotifyStatus? notifyStatus,
    @Default(false) bool isMyServicesLoading,
    @Default(false) bool isAadharUploading,
    @Default(false) bool isAadharUploadSuccess,
    @Default([]) List<ServiceReviewsResponseModel> serviceReviews,
    @Default(false) bool isReviewsLoading,
    @Default([]) List<ServicesResponseModel> otherUserServices,
    @Default(false) bool isLoadingOtherUserServices,
    @Default(false) bool hasMoreOtherUserServices,
  }) = _ServicesState;
}
