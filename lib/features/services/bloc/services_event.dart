part of 'services_bloc.dart';

@freezed
class ServicesEvent with _$ServicesEvent {
  const factory ServicesEvent.reset() = _Reset;
  const factory ServicesEvent.getServicesEvent({
    int? skip,
    int? limit,
    double? latitude,
    double? longitude,
    double? radiusKm,
    List<String>? categoryNames,
    double? minRating,
    String? search,
  }) = _GetServicesEvent;

  const factory ServicesEvent.getServiceDetailsEvent({
    required String serviceId,
  }) = _GetServiceDetailsEvent;

  const factory ServicesEvent.getSimilarServicesEvent({
    String? city,
    String? category,
    String? excludeServiceId,
    int? limit,
  }) = _GetSimilarServicesEvent;

  const factory ServicesEvent.isLoading() = _IsLoading;

  const factory ServicesEvent.updateAgentDetails({
    required CreateServiceDataModel createServiceDataModel,
  }) = _UpdateAgentDetailsEvent;

  const factory ServicesEvent.updateImagesAndMediaDetails({
    required CreateServiceDataModel createServiceDataModel,
  }) = _UpdateImagesAndMediaDetailsEvent;

  const factory ServicesEvent.updateServiceEvent({
    required String serviceId,
    required CreateServiceDataModel updateServiceDataModel,
    required List<String> existingImageUrls,
  }) = _UpdateServiceEvent;

  const factory ServicesEvent.deleteServiceEvent({
    required String serviceId,
  }) = _DeleteServiceEvent;

  const factory ServicesEvent.postReviewEvent({
    required String serviceId,
    required double rating,
    required String review,
  }) = _PostReviewEvent;

  const factory ServicesEvent.editReviewEvent({
    required String serviceId,
    required String reviewId,
    required double rating,
    required String review,
  }) = _EditReviewEvent;

  const factory ServicesEvent.getServiceReviewsEvent({
    required String serviceId,
    int? skip,
    int? limit,
  }) = _GetServiceReviewsEvent;

  const factory ServicesEvent.getMyServicesEvent() = _GetMyServicesEvent;
  const factory ServicesEvent.uploadAadharEvent({
    required String serviceId,
    required File aadharFile,
  }) = _UploadAadharEvent;

  const factory ServicesEvent.loadOtherUserServices({
    required String userId,
    required int skip,
    required int limit,
  }) = _LoadOtherUserServices;
}
