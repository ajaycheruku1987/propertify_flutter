part of 'admin_bloc.dart';

@Freezed()
class AdminEvent with _$AdminEvent {
  const factory AdminEvent.getUserList({
    @Default(1) int page,
    @Default(30) int limit,
    String? role,
    String? search,
  }) = _GetUserListEvent;

  const factory AdminEvent.removeUser({required String userId}) =
      _RemoveUserEvent;

  const factory AdminEvent.isLoading(bool flag) = _IsLoadingEvent;

  const factory AdminEvent.reset() = _ResetEvent;
  const factory AdminEvent.clearAdminState() = _ClearAdminStateEvent;

  const factory AdminEvent.getPostAds({
    @Default(1) int page,
    @Default(30) int limit,
  }) = _GetPostAdsEvent;

  const factory AdminEvent.deletePostAd({required String postId}) =
      _DeletePostAdEvent;

  const factory AdminEvent.getBannerAds({
    @Default(1) int page,
    @Default(30) int limit,
  }) = _GetBannerAdsEvent;

  const factory AdminEvent.deleteBannerAd({required String bannerAdId}) =
      _DeleteBannerAdEvent;

  const factory AdminEvent.getProjects({
    @Default(1) int page,
    @Default(30) int limit,
  }) = _GetProjectsEvent;

  const factory AdminEvent.deleteProject({required String projectId}) =
      _DeleteProjectEvent;

  const factory AdminEvent.getCallbackRequests({
    @Default(1) int page,
    @Default(30) int limit,
  }) = _GetCallbackRequestsEvent;

  const factory AdminEvent.deleteCallbackRequest({
    required String callbackRequestId,
  }) = _DeleteCallbackRequestEvent;

  const factory AdminEvent.getVerificationRequests({
    @Default(1) int page,
    @Default(30) int limit,
  }) = _GetVerificationRequestsEvent;

  const factory AdminEvent.deleteVerificationRequest({
    required String verificationRequestId,
  }) = _DeleteVerificationRequestEvent;

  const factory AdminEvent.updateVerificationStatus({
    required String verificationRequestId,
    required String status,
  }) = _UpdateVerificationStatusEvent;

  const factory AdminEvent.getHomeLoans({
    @Default(1) int page,
    @Default(30) int limit,
  }) = _GetHomeLoansEvent;

  const factory AdminEvent.getInteriorDesigns({
    @Default(1) int page,
    @Default(30) int limit,
  }) = _GetInteriorDesignsEvent;

  const factory AdminEvent.getRequests({
    @Default(1) int page,
    @Default(30) int limit,
    String? category,
    String? search,
  }) = _GetRequestsEvent;

  const factory AdminEvent.deleteRequest({required String requestId}) =
      _DeleteRequestEvent;

  const factory AdminEvent.getAds({
    @Default(1) int page,
    @Default(30) int limit,
  }) = _GetAdsEvent;

  const factory AdminEvent.removeAdUser({required String adUserId}) =
      _RemoveAdUserEvent;

  const factory AdminEvent.getServices({
    @Default(1) int page,
    @Default(30) int limit,
    String? search,
  }) = _GetServicesEvent;

  const factory AdminEvent.deleteService({required String serviceId}) =
      _DeleteServiceEvent;

  const factory AdminEvent.getAdminProperties({
    @Default(1) int page,
    @Default(30) int limit,
    String? search,
  }) = _GetAdminPropertiesEvent;

  const factory AdminEvent.deleteAdminProperty({required String propertyId}) =
      _DeleteAdminPropertyEvent;

  const factory AdminEvent.verifyService({
    required String serviceId,
    @Default(true) bool isVerified,
  }) = _VerifyServiceEvent;

  const factory AdminEvent.getCompanies({
    @Default(1) int page,
    @Default(30) int limit,
  }) = _GetCompaniesEvent;

  const factory AdminEvent.deleteCompany({required String companyId}) =
      _DeleteCompanyEvent;

  const factory AdminEvent.convertToAdmin({
    required List<String> userIds,
    String? role,
  }) = _ConvertToAdminEvent;

  const factory AdminEvent.convertToSeller({
    required List<String> userIds,
    String? role,
  }) = _ConvertToSellerEvent;

  const factory AdminEvent.convertToUser({
    required List<String> userIds,
    String? role,
  }) = _ConvertToUserEvent;

  const factory AdminEvent.getAdminReels({
    @Default(1) int page,
    @Default(30) int limit,
  }) = _GetAdminReelsEvent;

  const factory AdminEvent.deleteAdminReel({required String reelId}) =
      _DeleteAdminReelEvent;
  const factory AdminEvent.getGstPendingCompanies({
    @Default(1) int page,
    @Default(30) int limit,
  }) = _GetGstPendingCompaniesEvent;

  const factory AdminEvent.approveGst({required String companyId}) =
      _ApproveGstEvent;

  const factory AdminEvent.rejectGst({required String companyId}) =
      _RejectGstEvent;
}
