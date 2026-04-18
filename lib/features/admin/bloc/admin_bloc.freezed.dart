// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminEventCopyWith<$Res> {
  factory $AdminEventCopyWith(
          AdminEvent value, $Res Function(AdminEvent) then) =
      _$AdminEventCopyWithImpl<$Res, AdminEvent>;
}

/// @nodoc
class _$AdminEventCopyWithImpl<$Res, $Val extends AdminEvent>
    implements $AdminEventCopyWith<$Res> {
  _$AdminEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetUserListEventImplCopyWith<$Res> {
  factory _$$GetUserListEventImplCopyWith(_$GetUserListEventImpl value,
          $Res Function(_$GetUserListEventImpl) then) =
      __$$GetUserListEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit, String? role, String? search});
}

/// @nodoc
class __$$GetUserListEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetUserListEventImpl>
    implements _$$GetUserListEventImplCopyWith<$Res> {
  __$$GetUserListEventImplCopyWithImpl(_$GetUserListEventImpl _value,
      $Res Function(_$GetUserListEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? role = freezed,
    Object? search = freezed,
  }) {
    return _then(_$GetUserListEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetUserListEventImpl implements _GetUserListEvent {
  const _$GetUserListEventImpl(
      {this.page = 1, this.limit = 30, this.role, this.search});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  final String? role;
  @override
  final String? search;

  @override
  String toString() {
    return 'AdminEvent.getUserList(page: $page, limit: $limit, role: $role, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserListEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit, role, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserListEventImplCopyWith<_$GetUserListEventImpl> get copyWith =>
      __$$GetUserListEventImplCopyWithImpl<_$GetUserListEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getUserList(page, limit, role, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getUserList?.call(page, limit, role, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getUserList != null) {
      return getUserList(page, limit, role, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getUserList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getUserList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getUserList != null) {
      return getUserList(this);
    }
    return orElse();
  }
}

abstract class _GetUserListEvent implements AdminEvent {
  const factory _GetUserListEvent(
      {final int page,
      final int limit,
      final String? role,
      final String? search}) = _$GetUserListEventImpl;

  int get page;
  int get limit;
  String? get role;
  String? get search;
  @JsonKey(ignore: true)
  _$$GetUserListEventImplCopyWith<_$GetUserListEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveUserEventImplCopyWith<$Res> {
  factory _$$RemoveUserEventImplCopyWith(_$RemoveUserEventImpl value,
          $Res Function(_$RemoveUserEventImpl) then) =
      __$$RemoveUserEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$RemoveUserEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$RemoveUserEventImpl>
    implements _$$RemoveUserEventImplCopyWith<$Res> {
  __$$RemoveUserEventImplCopyWithImpl(
      _$RemoveUserEventImpl _value, $Res Function(_$RemoveUserEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$RemoveUserEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveUserEventImpl implements _RemoveUserEvent {
  const _$RemoveUserEventImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'AdminEvent.removeUser(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveUserEventImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveUserEventImplCopyWith<_$RemoveUserEventImpl> get copyWith =>
      __$$RemoveUserEventImplCopyWithImpl<_$RemoveUserEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return removeUser(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return removeUser?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (removeUser != null) {
      return removeUser(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return removeUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return removeUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (removeUser != null) {
      return removeUser(this);
    }
    return orElse();
  }
}

abstract class _RemoveUserEvent implements AdminEvent {
  const factory _RemoveUserEvent({required final String userId}) =
      _$RemoveUserEventImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$RemoveUserEventImplCopyWith<_$RemoveUserEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsLoadingEventImplCopyWith<$Res> {
  factory _$$IsLoadingEventImplCopyWith(_$IsLoadingEventImpl value,
          $Res Function(_$IsLoadingEventImpl) then) =
      __$$IsLoadingEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool flag});
}

/// @nodoc
class __$$IsLoadingEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$IsLoadingEventImpl>
    implements _$$IsLoadingEventImplCopyWith<$Res> {
  __$$IsLoadingEventImplCopyWithImpl(
      _$IsLoadingEventImpl _value, $Res Function(_$IsLoadingEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flag = null,
  }) {
    return _then(_$IsLoadingEventImpl(
      null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsLoadingEventImpl implements _IsLoadingEvent {
  const _$IsLoadingEventImpl(this.flag);

  @override
  final bool flag;

  @override
  String toString() {
    return 'AdminEvent.isLoading(flag: $flag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsLoadingEventImpl &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsLoadingEventImplCopyWith<_$IsLoadingEventImpl> get copyWith =>
      __$$IsLoadingEventImplCopyWithImpl<_$IsLoadingEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return isLoading(flag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return isLoading?.call(flag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(flag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class _IsLoadingEvent implements AdminEvent {
  const factory _IsLoadingEvent(final bool flag) = _$IsLoadingEventImpl;

  bool get flag;
  @JsonKey(ignore: true)
  _$$IsLoadingEventImplCopyWith<_$IsLoadingEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetEventImplCopyWith<$Res> {
  factory _$$ResetEventImplCopyWith(
          _$ResetEventImpl value, $Res Function(_$ResetEventImpl) then) =
      __$$ResetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$ResetEventImpl>
    implements _$$ResetEventImplCopyWith<$Res> {
  __$$ResetEventImplCopyWithImpl(
      _$ResetEventImpl _value, $Res Function(_$ResetEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetEventImpl implements _ResetEvent {
  const _$ResetEventImpl();

  @override
  String toString() {
    return 'AdminEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _ResetEvent implements AdminEvent {
  const factory _ResetEvent() = _$ResetEventImpl;
}

/// @nodoc
abstract class _$$ClearAdminStateEventImplCopyWith<$Res> {
  factory _$$ClearAdminStateEventImplCopyWith(_$ClearAdminStateEventImpl value,
          $Res Function(_$ClearAdminStateEventImpl) then) =
      __$$ClearAdminStateEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearAdminStateEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$ClearAdminStateEventImpl>
    implements _$$ClearAdminStateEventImplCopyWith<$Res> {
  __$$ClearAdminStateEventImplCopyWithImpl(_$ClearAdminStateEventImpl _value,
      $Res Function(_$ClearAdminStateEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearAdminStateEventImpl implements _ClearAdminStateEvent {
  const _$ClearAdminStateEventImpl();

  @override
  String toString() {
    return 'AdminEvent.clearAdminState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearAdminStateEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return clearAdminState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return clearAdminState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (clearAdminState != null) {
      return clearAdminState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return clearAdminState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return clearAdminState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (clearAdminState != null) {
      return clearAdminState(this);
    }
    return orElse();
  }
}

abstract class _ClearAdminStateEvent implements AdminEvent {
  const factory _ClearAdminStateEvent() = _$ClearAdminStateEventImpl;
}

/// @nodoc
abstract class _$$GetPostAdsEventImplCopyWith<$Res> {
  factory _$$GetPostAdsEventImplCopyWith(_$GetPostAdsEventImpl value,
          $Res Function(_$GetPostAdsEventImpl) then) =
      __$$GetPostAdsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetPostAdsEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetPostAdsEventImpl>
    implements _$$GetPostAdsEventImplCopyWith<$Res> {
  __$$GetPostAdsEventImplCopyWithImpl(
      _$GetPostAdsEventImpl _value, $Res Function(_$GetPostAdsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetPostAdsEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetPostAdsEventImpl implements _GetPostAdsEvent {
  const _$GetPostAdsEventImpl({this.page = 1, this.limit = 30});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'AdminEvent.getPostAds(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPostAdsEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPostAdsEventImplCopyWith<_$GetPostAdsEventImpl> get copyWith =>
      __$$GetPostAdsEventImplCopyWithImpl<_$GetPostAdsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getPostAds(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getPostAds?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getPostAds != null) {
      return getPostAds(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getPostAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getPostAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getPostAds != null) {
      return getPostAds(this);
    }
    return orElse();
  }
}

abstract class _GetPostAdsEvent implements AdminEvent {
  const factory _GetPostAdsEvent({final int page, final int limit}) =
      _$GetPostAdsEventImpl;

  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$GetPostAdsEventImplCopyWith<_$GetPostAdsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletePostAdEventImplCopyWith<$Res> {
  factory _$$DeletePostAdEventImplCopyWith(_$DeletePostAdEventImpl value,
          $Res Function(_$DeletePostAdEventImpl) then) =
      __$$DeletePostAdEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$$DeletePostAdEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$DeletePostAdEventImpl>
    implements _$$DeletePostAdEventImplCopyWith<$Res> {
  __$$DeletePostAdEventImplCopyWithImpl(_$DeletePostAdEventImpl _value,
      $Res Function(_$DeletePostAdEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_$DeletePostAdEventImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeletePostAdEventImpl implements _DeletePostAdEvent {
  const _$DeletePostAdEventImpl({required this.postId});

  @override
  final String postId;

  @override
  String toString() {
    return 'AdminEvent.deletePostAd(postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletePostAdEventImpl &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletePostAdEventImplCopyWith<_$DeletePostAdEventImpl> get copyWith =>
      __$$DeletePostAdEventImplCopyWithImpl<_$DeletePostAdEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return deletePostAd(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return deletePostAd?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (deletePostAd != null) {
      return deletePostAd(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return deletePostAd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return deletePostAd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (deletePostAd != null) {
      return deletePostAd(this);
    }
    return orElse();
  }
}

abstract class _DeletePostAdEvent implements AdminEvent {
  const factory _DeletePostAdEvent({required final String postId}) =
      _$DeletePostAdEventImpl;

  String get postId;
  @JsonKey(ignore: true)
  _$$DeletePostAdEventImplCopyWith<_$DeletePostAdEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetBannerAdsEventImplCopyWith<$Res> {
  factory _$$GetBannerAdsEventImplCopyWith(_$GetBannerAdsEventImpl value,
          $Res Function(_$GetBannerAdsEventImpl) then) =
      __$$GetBannerAdsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetBannerAdsEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetBannerAdsEventImpl>
    implements _$$GetBannerAdsEventImplCopyWith<$Res> {
  __$$GetBannerAdsEventImplCopyWithImpl(_$GetBannerAdsEventImpl _value,
      $Res Function(_$GetBannerAdsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetBannerAdsEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetBannerAdsEventImpl implements _GetBannerAdsEvent {
  const _$GetBannerAdsEventImpl({this.page = 1, this.limit = 30});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'AdminEvent.getBannerAds(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBannerAdsEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBannerAdsEventImplCopyWith<_$GetBannerAdsEventImpl> get copyWith =>
      __$$GetBannerAdsEventImplCopyWithImpl<_$GetBannerAdsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getBannerAds(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getBannerAds?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getBannerAds != null) {
      return getBannerAds(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getBannerAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getBannerAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getBannerAds != null) {
      return getBannerAds(this);
    }
    return orElse();
  }
}

abstract class _GetBannerAdsEvent implements AdminEvent {
  const factory _GetBannerAdsEvent({final int page, final int limit}) =
      _$GetBannerAdsEventImpl;

  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$GetBannerAdsEventImplCopyWith<_$GetBannerAdsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteBannerAdEventImplCopyWith<$Res> {
  factory _$$DeleteBannerAdEventImplCopyWith(_$DeleteBannerAdEventImpl value,
          $Res Function(_$DeleteBannerAdEventImpl) then) =
      __$$DeleteBannerAdEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String bannerAdId});
}

/// @nodoc
class __$$DeleteBannerAdEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$DeleteBannerAdEventImpl>
    implements _$$DeleteBannerAdEventImplCopyWith<$Res> {
  __$$DeleteBannerAdEventImplCopyWithImpl(_$DeleteBannerAdEventImpl _value,
      $Res Function(_$DeleteBannerAdEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerAdId = null,
  }) {
    return _then(_$DeleteBannerAdEventImpl(
      bannerAdId: null == bannerAdId
          ? _value.bannerAdId
          : bannerAdId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteBannerAdEventImpl implements _DeleteBannerAdEvent {
  const _$DeleteBannerAdEventImpl({required this.bannerAdId});

  @override
  final String bannerAdId;

  @override
  String toString() {
    return 'AdminEvent.deleteBannerAd(bannerAdId: $bannerAdId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBannerAdEventImpl &&
            (identical(other.bannerAdId, bannerAdId) ||
                other.bannerAdId == bannerAdId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bannerAdId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteBannerAdEventImplCopyWith<_$DeleteBannerAdEventImpl> get copyWith =>
      __$$DeleteBannerAdEventImplCopyWithImpl<_$DeleteBannerAdEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return deleteBannerAd(bannerAdId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return deleteBannerAd?.call(bannerAdId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteBannerAd != null) {
      return deleteBannerAd(bannerAdId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return deleteBannerAd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return deleteBannerAd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteBannerAd != null) {
      return deleteBannerAd(this);
    }
    return orElse();
  }
}

abstract class _DeleteBannerAdEvent implements AdminEvent {
  const factory _DeleteBannerAdEvent({required final String bannerAdId}) =
      _$DeleteBannerAdEventImpl;

  String get bannerAdId;
  @JsonKey(ignore: true)
  _$$DeleteBannerAdEventImplCopyWith<_$DeleteBannerAdEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetProjectsEventImplCopyWith<$Res> {
  factory _$$GetProjectsEventImplCopyWith(_$GetProjectsEventImpl value,
          $Res Function(_$GetProjectsEventImpl) then) =
      __$$GetProjectsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetProjectsEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetProjectsEventImpl>
    implements _$$GetProjectsEventImplCopyWith<$Res> {
  __$$GetProjectsEventImplCopyWithImpl(_$GetProjectsEventImpl _value,
      $Res Function(_$GetProjectsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetProjectsEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetProjectsEventImpl implements _GetProjectsEvent {
  const _$GetProjectsEventImpl({this.page = 1, this.limit = 30});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'AdminEvent.getProjects(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProjectsEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProjectsEventImplCopyWith<_$GetProjectsEventImpl> get copyWith =>
      __$$GetProjectsEventImplCopyWithImpl<_$GetProjectsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getProjects(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getProjects?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getProjects != null) {
      return getProjects(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getProjects(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getProjects?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getProjects != null) {
      return getProjects(this);
    }
    return orElse();
  }
}

abstract class _GetProjectsEvent implements AdminEvent {
  const factory _GetProjectsEvent({final int page, final int limit}) =
      _$GetProjectsEventImpl;

  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$GetProjectsEventImplCopyWith<_$GetProjectsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteProjectEventImplCopyWith<$Res> {
  factory _$$DeleteProjectEventImplCopyWith(_$DeleteProjectEventImpl value,
          $Res Function(_$DeleteProjectEventImpl) then) =
      __$$DeleteProjectEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectId});
}

/// @nodoc
class __$$DeleteProjectEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$DeleteProjectEventImpl>
    implements _$$DeleteProjectEventImplCopyWith<$Res> {
  __$$DeleteProjectEventImplCopyWithImpl(_$DeleteProjectEventImpl _value,
      $Res Function(_$DeleteProjectEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
  }) {
    return _then(_$DeleteProjectEventImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteProjectEventImpl implements _DeleteProjectEvent {
  const _$DeleteProjectEventImpl({required this.projectId});

  @override
  final String projectId;

  @override
  String toString() {
    return 'AdminEvent.deleteProject(projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteProjectEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteProjectEventImplCopyWith<_$DeleteProjectEventImpl> get copyWith =>
      __$$DeleteProjectEventImplCopyWithImpl<_$DeleteProjectEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return deleteProject(projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return deleteProject?.call(projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteProject != null) {
      return deleteProject(projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return deleteProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return deleteProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteProject != null) {
      return deleteProject(this);
    }
    return orElse();
  }
}

abstract class _DeleteProjectEvent implements AdminEvent {
  const factory _DeleteProjectEvent({required final String projectId}) =
      _$DeleteProjectEventImpl;

  String get projectId;
  @JsonKey(ignore: true)
  _$$DeleteProjectEventImplCopyWith<_$DeleteProjectEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCallbackRequestsEventImplCopyWith<$Res> {
  factory _$$GetCallbackRequestsEventImplCopyWith(
          _$GetCallbackRequestsEventImpl value,
          $Res Function(_$GetCallbackRequestsEventImpl) then) =
      __$$GetCallbackRequestsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetCallbackRequestsEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetCallbackRequestsEventImpl>
    implements _$$GetCallbackRequestsEventImplCopyWith<$Res> {
  __$$GetCallbackRequestsEventImplCopyWithImpl(
      _$GetCallbackRequestsEventImpl _value,
      $Res Function(_$GetCallbackRequestsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetCallbackRequestsEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetCallbackRequestsEventImpl implements _GetCallbackRequestsEvent {
  const _$GetCallbackRequestsEventImpl({this.page = 1, this.limit = 30});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'AdminEvent.getCallbackRequests(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCallbackRequestsEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCallbackRequestsEventImplCopyWith<_$GetCallbackRequestsEventImpl>
      get copyWith => __$$GetCallbackRequestsEventImplCopyWithImpl<
          _$GetCallbackRequestsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getCallbackRequests(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getCallbackRequests?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getCallbackRequests != null) {
      return getCallbackRequests(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getCallbackRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getCallbackRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getCallbackRequests != null) {
      return getCallbackRequests(this);
    }
    return orElse();
  }
}

abstract class _GetCallbackRequestsEvent implements AdminEvent {
  const factory _GetCallbackRequestsEvent({final int page, final int limit}) =
      _$GetCallbackRequestsEventImpl;

  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$GetCallbackRequestsEventImplCopyWith<_$GetCallbackRequestsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCallbackRequestEventImplCopyWith<$Res> {
  factory _$$DeleteCallbackRequestEventImplCopyWith(
          _$DeleteCallbackRequestEventImpl value,
          $Res Function(_$DeleteCallbackRequestEventImpl) then) =
      __$$DeleteCallbackRequestEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String callbackRequestId});
}

/// @nodoc
class __$$DeleteCallbackRequestEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$DeleteCallbackRequestEventImpl>
    implements _$$DeleteCallbackRequestEventImplCopyWith<$Res> {
  __$$DeleteCallbackRequestEventImplCopyWithImpl(
      _$DeleteCallbackRequestEventImpl _value,
      $Res Function(_$DeleteCallbackRequestEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callbackRequestId = null,
  }) {
    return _then(_$DeleteCallbackRequestEventImpl(
      callbackRequestId: null == callbackRequestId
          ? _value.callbackRequestId
          : callbackRequestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteCallbackRequestEventImpl implements _DeleteCallbackRequestEvent {
  const _$DeleteCallbackRequestEventImpl({required this.callbackRequestId});

  @override
  final String callbackRequestId;

  @override
  String toString() {
    return 'AdminEvent.deleteCallbackRequest(callbackRequestId: $callbackRequestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteCallbackRequestEventImpl &&
            (identical(other.callbackRequestId, callbackRequestId) ||
                other.callbackRequestId == callbackRequestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, callbackRequestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCallbackRequestEventImplCopyWith<_$DeleteCallbackRequestEventImpl>
      get copyWith => __$$DeleteCallbackRequestEventImplCopyWithImpl<
          _$DeleteCallbackRequestEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return deleteCallbackRequest(callbackRequestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return deleteCallbackRequest?.call(callbackRequestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteCallbackRequest != null) {
      return deleteCallbackRequest(callbackRequestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return deleteCallbackRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return deleteCallbackRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteCallbackRequest != null) {
      return deleteCallbackRequest(this);
    }
    return orElse();
  }
}

abstract class _DeleteCallbackRequestEvent implements AdminEvent {
  const factory _DeleteCallbackRequestEvent(
          {required final String callbackRequestId}) =
      _$DeleteCallbackRequestEventImpl;

  String get callbackRequestId;
  @JsonKey(ignore: true)
  _$$DeleteCallbackRequestEventImplCopyWith<_$DeleteCallbackRequestEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetVerificationRequestsEventImplCopyWith<$Res> {
  factory _$$GetVerificationRequestsEventImplCopyWith(
          _$GetVerificationRequestsEventImpl value,
          $Res Function(_$GetVerificationRequestsEventImpl) then) =
      __$$GetVerificationRequestsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetVerificationRequestsEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetVerificationRequestsEventImpl>
    implements _$$GetVerificationRequestsEventImplCopyWith<$Res> {
  __$$GetVerificationRequestsEventImplCopyWithImpl(
      _$GetVerificationRequestsEventImpl _value,
      $Res Function(_$GetVerificationRequestsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetVerificationRequestsEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetVerificationRequestsEventImpl
    implements _GetVerificationRequestsEvent {
  const _$GetVerificationRequestsEventImpl({this.page = 1, this.limit = 30});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'AdminEvent.getVerificationRequests(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetVerificationRequestsEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetVerificationRequestsEventImplCopyWith<
          _$GetVerificationRequestsEventImpl>
      get copyWith => __$$GetVerificationRequestsEventImplCopyWithImpl<
          _$GetVerificationRequestsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getVerificationRequests(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getVerificationRequests?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getVerificationRequests != null) {
      return getVerificationRequests(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getVerificationRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getVerificationRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getVerificationRequests != null) {
      return getVerificationRequests(this);
    }
    return orElse();
  }
}

abstract class _GetVerificationRequestsEvent implements AdminEvent {
  const factory _GetVerificationRequestsEvent(
      {final int page, final int limit}) = _$GetVerificationRequestsEventImpl;

  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$GetVerificationRequestsEventImplCopyWith<
          _$GetVerificationRequestsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteVerificationRequestEventImplCopyWith<$Res> {
  factory _$$DeleteVerificationRequestEventImplCopyWith(
          _$DeleteVerificationRequestEventImpl value,
          $Res Function(_$DeleteVerificationRequestEventImpl) then) =
      __$$DeleteVerificationRequestEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationRequestId});
}

/// @nodoc
class __$$DeleteVerificationRequestEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$DeleteVerificationRequestEventImpl>
    implements _$$DeleteVerificationRequestEventImplCopyWith<$Res> {
  __$$DeleteVerificationRequestEventImplCopyWithImpl(
      _$DeleteVerificationRequestEventImpl _value,
      $Res Function(_$DeleteVerificationRequestEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationRequestId = null,
  }) {
    return _then(_$DeleteVerificationRequestEventImpl(
      verificationRequestId: null == verificationRequestId
          ? _value.verificationRequestId
          : verificationRequestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteVerificationRequestEventImpl
    implements _DeleteVerificationRequestEvent {
  const _$DeleteVerificationRequestEventImpl(
      {required this.verificationRequestId});

  @override
  final String verificationRequestId;

  @override
  String toString() {
    return 'AdminEvent.deleteVerificationRequest(verificationRequestId: $verificationRequestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteVerificationRequestEventImpl &&
            (identical(other.verificationRequestId, verificationRequestId) ||
                other.verificationRequestId == verificationRequestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationRequestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteVerificationRequestEventImplCopyWith<
          _$DeleteVerificationRequestEventImpl>
      get copyWith => __$$DeleteVerificationRequestEventImplCopyWithImpl<
          _$DeleteVerificationRequestEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return deleteVerificationRequest(verificationRequestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return deleteVerificationRequest?.call(verificationRequestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteVerificationRequest != null) {
      return deleteVerificationRequest(verificationRequestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return deleteVerificationRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return deleteVerificationRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteVerificationRequest != null) {
      return deleteVerificationRequest(this);
    }
    return orElse();
  }
}

abstract class _DeleteVerificationRequestEvent implements AdminEvent {
  const factory _DeleteVerificationRequestEvent(
          {required final String verificationRequestId}) =
      _$DeleteVerificationRequestEventImpl;

  String get verificationRequestId;
  @JsonKey(ignore: true)
  _$$DeleteVerificationRequestEventImplCopyWith<
          _$DeleteVerificationRequestEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateVerificationStatusEventImplCopyWith<$Res> {
  factory _$$UpdateVerificationStatusEventImplCopyWith(
          _$UpdateVerificationStatusEventImpl value,
          $Res Function(_$UpdateVerificationStatusEventImpl) then) =
      __$$UpdateVerificationStatusEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationRequestId, String status});
}

/// @nodoc
class __$$UpdateVerificationStatusEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$UpdateVerificationStatusEventImpl>
    implements _$$UpdateVerificationStatusEventImplCopyWith<$Res> {
  __$$UpdateVerificationStatusEventImplCopyWithImpl(
      _$UpdateVerificationStatusEventImpl _value,
      $Res Function(_$UpdateVerificationStatusEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationRequestId = null,
    Object? status = null,
  }) {
    return _then(_$UpdateVerificationStatusEventImpl(
      verificationRequestId: null == verificationRequestId
          ? _value.verificationRequestId
          : verificationRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateVerificationStatusEventImpl
    implements _UpdateVerificationStatusEvent {
  const _$UpdateVerificationStatusEventImpl(
      {required this.verificationRequestId, required this.status});

  @override
  final String verificationRequestId;
  @override
  final String status;

  @override
  String toString() {
    return 'AdminEvent.updateVerificationStatus(verificationRequestId: $verificationRequestId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateVerificationStatusEventImpl &&
            (identical(other.verificationRequestId, verificationRequestId) ||
                other.verificationRequestId == verificationRequestId) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationRequestId, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateVerificationStatusEventImplCopyWith<
          _$UpdateVerificationStatusEventImpl>
      get copyWith => __$$UpdateVerificationStatusEventImplCopyWithImpl<
          _$UpdateVerificationStatusEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return updateVerificationStatus(verificationRequestId, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return updateVerificationStatus?.call(verificationRequestId, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (updateVerificationStatus != null) {
      return updateVerificationStatus(verificationRequestId, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return updateVerificationStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return updateVerificationStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (updateVerificationStatus != null) {
      return updateVerificationStatus(this);
    }
    return orElse();
  }
}

abstract class _UpdateVerificationStatusEvent implements AdminEvent {
  const factory _UpdateVerificationStatusEvent(
      {required final String verificationRequestId,
      required final String status}) = _$UpdateVerificationStatusEventImpl;

  String get verificationRequestId;
  String get status;
  @JsonKey(ignore: true)
  _$$UpdateVerificationStatusEventImplCopyWith<
          _$UpdateVerificationStatusEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetHomeLoansEventImplCopyWith<$Res> {
  factory _$$GetHomeLoansEventImplCopyWith(_$GetHomeLoansEventImpl value,
          $Res Function(_$GetHomeLoansEventImpl) then) =
      __$$GetHomeLoansEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetHomeLoansEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetHomeLoansEventImpl>
    implements _$$GetHomeLoansEventImplCopyWith<$Res> {
  __$$GetHomeLoansEventImplCopyWithImpl(_$GetHomeLoansEventImpl _value,
      $Res Function(_$GetHomeLoansEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetHomeLoansEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetHomeLoansEventImpl implements _GetHomeLoansEvent {
  const _$GetHomeLoansEventImpl({this.page = 1, this.limit = 30});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'AdminEvent.getHomeLoans(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHomeLoansEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetHomeLoansEventImplCopyWith<_$GetHomeLoansEventImpl> get copyWith =>
      __$$GetHomeLoansEventImplCopyWithImpl<_$GetHomeLoansEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getHomeLoans(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getHomeLoans?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getHomeLoans != null) {
      return getHomeLoans(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getHomeLoans(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getHomeLoans?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getHomeLoans != null) {
      return getHomeLoans(this);
    }
    return orElse();
  }
}

abstract class _GetHomeLoansEvent implements AdminEvent {
  const factory _GetHomeLoansEvent({final int page, final int limit}) =
      _$GetHomeLoansEventImpl;

  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$GetHomeLoansEventImplCopyWith<_$GetHomeLoansEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetInteriorDesignsEventImplCopyWith<$Res> {
  factory _$$GetInteriorDesignsEventImplCopyWith(
          _$GetInteriorDesignsEventImpl value,
          $Res Function(_$GetInteriorDesignsEventImpl) then) =
      __$$GetInteriorDesignsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetInteriorDesignsEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetInteriorDesignsEventImpl>
    implements _$$GetInteriorDesignsEventImplCopyWith<$Res> {
  __$$GetInteriorDesignsEventImplCopyWithImpl(
      _$GetInteriorDesignsEventImpl _value,
      $Res Function(_$GetInteriorDesignsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetInteriorDesignsEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetInteriorDesignsEventImpl implements _GetInteriorDesignsEvent {
  const _$GetInteriorDesignsEventImpl({this.page = 1, this.limit = 30});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'AdminEvent.getInteriorDesigns(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetInteriorDesignsEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetInteriorDesignsEventImplCopyWith<_$GetInteriorDesignsEventImpl>
      get copyWith => __$$GetInteriorDesignsEventImplCopyWithImpl<
          _$GetInteriorDesignsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getInteriorDesigns(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getInteriorDesigns?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getInteriorDesigns != null) {
      return getInteriorDesigns(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getInteriorDesigns(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getInteriorDesigns?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getInteriorDesigns != null) {
      return getInteriorDesigns(this);
    }
    return orElse();
  }
}

abstract class _GetInteriorDesignsEvent implements AdminEvent {
  const factory _GetInteriorDesignsEvent({final int page, final int limit}) =
      _$GetInteriorDesignsEventImpl;

  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$GetInteriorDesignsEventImplCopyWith<_$GetInteriorDesignsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetRequestsEventImplCopyWith<$Res> {
  factory _$$GetRequestsEventImplCopyWith(_$GetRequestsEventImpl value,
          $Res Function(_$GetRequestsEventImpl) then) =
      __$$GetRequestsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit, String? category, String? search});
}

/// @nodoc
class __$$GetRequestsEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetRequestsEventImpl>
    implements _$$GetRequestsEventImplCopyWith<$Res> {
  __$$GetRequestsEventImplCopyWithImpl(_$GetRequestsEventImpl _value,
      $Res Function(_$GetRequestsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? category = freezed,
    Object? search = freezed,
  }) {
    return _then(_$GetRequestsEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetRequestsEventImpl implements _GetRequestsEvent {
  const _$GetRequestsEventImpl(
      {this.page = 1, this.limit = 30, this.category, this.search});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  final String? category;
  @override
  final String? search;

  @override
  String toString() {
    return 'AdminEvent.getRequests(page: $page, limit: $limit, category: $category, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRequestsEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit, category, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRequestsEventImplCopyWith<_$GetRequestsEventImpl> get copyWith =>
      __$$GetRequestsEventImplCopyWithImpl<_$GetRequestsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getRequests(page, limit, category, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getRequests?.call(page, limit, category, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getRequests != null) {
      return getRequests(page, limit, category, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getRequests != null) {
      return getRequests(this);
    }
    return orElse();
  }
}

abstract class _GetRequestsEvent implements AdminEvent {
  const factory _GetRequestsEvent(
      {final int page,
      final int limit,
      final String? category,
      final String? search}) = _$GetRequestsEventImpl;

  int get page;
  int get limit;
  String? get category;
  String? get search;
  @JsonKey(ignore: true)
  _$$GetRequestsEventImplCopyWith<_$GetRequestsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteRequestEventImplCopyWith<$Res> {
  factory _$$DeleteRequestEventImplCopyWith(_$DeleteRequestEventImpl value,
          $Res Function(_$DeleteRequestEventImpl) then) =
      __$$DeleteRequestEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String requestId});
}

/// @nodoc
class __$$DeleteRequestEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$DeleteRequestEventImpl>
    implements _$$DeleteRequestEventImplCopyWith<$Res> {
  __$$DeleteRequestEventImplCopyWithImpl(_$DeleteRequestEventImpl _value,
      $Res Function(_$DeleteRequestEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$DeleteRequestEventImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteRequestEventImpl implements _DeleteRequestEvent {
  const _$DeleteRequestEventImpl({required this.requestId});

  @override
  final String requestId;

  @override
  String toString() {
    return 'AdminEvent.deleteRequest(requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteRequestEventImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteRequestEventImplCopyWith<_$DeleteRequestEventImpl> get copyWith =>
      __$$DeleteRequestEventImplCopyWithImpl<_$DeleteRequestEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return deleteRequest(requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return deleteRequest?.call(requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteRequest != null) {
      return deleteRequest(requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return deleteRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return deleteRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteRequest != null) {
      return deleteRequest(this);
    }
    return orElse();
  }
}

abstract class _DeleteRequestEvent implements AdminEvent {
  const factory _DeleteRequestEvent({required final String requestId}) =
      _$DeleteRequestEventImpl;

  String get requestId;
  @JsonKey(ignore: true)
  _$$DeleteRequestEventImplCopyWith<_$DeleteRequestEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAdsEventImplCopyWith<$Res> {
  factory _$$GetAdsEventImplCopyWith(
          _$GetAdsEventImpl value, $Res Function(_$GetAdsEventImpl) then) =
      __$$GetAdsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetAdsEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetAdsEventImpl>
    implements _$$GetAdsEventImplCopyWith<$Res> {
  __$$GetAdsEventImplCopyWithImpl(
      _$GetAdsEventImpl _value, $Res Function(_$GetAdsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetAdsEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetAdsEventImpl implements _GetAdsEvent {
  const _$GetAdsEventImpl({this.page = 1, this.limit = 30});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'AdminEvent.getAds(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAdsEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAdsEventImplCopyWith<_$GetAdsEventImpl> get copyWith =>
      __$$GetAdsEventImplCopyWithImpl<_$GetAdsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getAds(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getAds?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getAds != null) {
      return getAds(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getAds != null) {
      return getAds(this);
    }
    return orElse();
  }
}

abstract class _GetAdsEvent implements AdminEvent {
  const factory _GetAdsEvent({final int page, final int limit}) =
      _$GetAdsEventImpl;

  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$GetAdsEventImplCopyWith<_$GetAdsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveAdUserEventImplCopyWith<$Res> {
  factory _$$RemoveAdUserEventImplCopyWith(_$RemoveAdUserEventImpl value,
          $Res Function(_$RemoveAdUserEventImpl) then) =
      __$$RemoveAdUserEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String adUserId});
}

/// @nodoc
class __$$RemoveAdUserEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$RemoveAdUserEventImpl>
    implements _$$RemoveAdUserEventImplCopyWith<$Res> {
  __$$RemoveAdUserEventImplCopyWithImpl(_$RemoveAdUserEventImpl _value,
      $Res Function(_$RemoveAdUserEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adUserId = null,
  }) {
    return _then(_$RemoveAdUserEventImpl(
      adUserId: null == adUserId
          ? _value.adUserId
          : adUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveAdUserEventImpl implements _RemoveAdUserEvent {
  const _$RemoveAdUserEventImpl({required this.adUserId});

  @override
  final String adUserId;

  @override
  String toString() {
    return 'AdminEvent.removeAdUser(adUserId: $adUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveAdUserEventImpl &&
            (identical(other.adUserId, adUserId) ||
                other.adUserId == adUserId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, adUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveAdUserEventImplCopyWith<_$RemoveAdUserEventImpl> get copyWith =>
      __$$RemoveAdUserEventImplCopyWithImpl<_$RemoveAdUserEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return removeAdUser(adUserId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return removeAdUser?.call(adUserId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (removeAdUser != null) {
      return removeAdUser(adUserId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return removeAdUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return removeAdUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (removeAdUser != null) {
      return removeAdUser(this);
    }
    return orElse();
  }
}

abstract class _RemoveAdUserEvent implements AdminEvent {
  const factory _RemoveAdUserEvent({required final String adUserId}) =
      _$RemoveAdUserEventImpl;

  String get adUserId;
  @JsonKey(ignore: true)
  _$$RemoveAdUserEventImplCopyWith<_$RemoveAdUserEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetServicesEventImplCopyWith<$Res> {
  factory _$$GetServicesEventImplCopyWith(_$GetServicesEventImpl value,
          $Res Function(_$GetServicesEventImpl) then) =
      __$$GetServicesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit, String? search});
}

/// @nodoc
class __$$GetServicesEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetServicesEventImpl>
    implements _$$GetServicesEventImplCopyWith<$Res> {
  __$$GetServicesEventImplCopyWithImpl(_$GetServicesEventImpl _value,
      $Res Function(_$GetServicesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? search = freezed,
  }) {
    return _then(_$GetServicesEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetServicesEventImpl implements _GetServicesEvent {
  const _$GetServicesEventImpl({this.page = 1, this.limit = 30, this.search});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  final String? search;

  @override
  String toString() {
    return 'AdminEvent.getServices(page: $page, limit: $limit, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetServicesEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetServicesEventImplCopyWith<_$GetServicesEventImpl> get copyWith =>
      __$$GetServicesEventImplCopyWithImpl<_$GetServicesEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getServices(page, limit, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getServices?.call(page, limit, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getServices != null) {
      return getServices(page, limit, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getServices != null) {
      return getServices(this);
    }
    return orElse();
  }
}

abstract class _GetServicesEvent implements AdminEvent {
  const factory _GetServicesEvent(
      {final int page,
      final int limit,
      final String? search}) = _$GetServicesEventImpl;

  int get page;
  int get limit;
  String? get search;
  @JsonKey(ignore: true)
  _$$GetServicesEventImplCopyWith<_$GetServicesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteServiceEventImplCopyWith<$Res> {
  factory _$$DeleteServiceEventImplCopyWith(_$DeleteServiceEventImpl value,
          $Res Function(_$DeleteServiceEventImpl) then) =
      __$$DeleteServiceEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serviceId});
}

/// @nodoc
class __$$DeleteServiceEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$DeleteServiceEventImpl>
    implements _$$DeleteServiceEventImplCopyWith<$Res> {
  __$$DeleteServiceEventImplCopyWithImpl(_$DeleteServiceEventImpl _value,
      $Res Function(_$DeleteServiceEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
  }) {
    return _then(_$DeleteServiceEventImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteServiceEventImpl implements _DeleteServiceEvent {
  const _$DeleteServiceEventImpl({required this.serviceId});

  @override
  final String serviceId;

  @override
  String toString() {
    return 'AdminEvent.deleteService(serviceId: $serviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteServiceEventImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteServiceEventImplCopyWith<_$DeleteServiceEventImpl> get copyWith =>
      __$$DeleteServiceEventImplCopyWithImpl<_$DeleteServiceEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return deleteService(serviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return deleteService?.call(serviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteService != null) {
      return deleteService(serviceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return deleteService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return deleteService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteService != null) {
      return deleteService(this);
    }
    return orElse();
  }
}

abstract class _DeleteServiceEvent implements AdminEvent {
  const factory _DeleteServiceEvent({required final String serviceId}) =
      _$DeleteServiceEventImpl;

  String get serviceId;
  @JsonKey(ignore: true)
  _$$DeleteServiceEventImplCopyWith<_$DeleteServiceEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAdminPropertiesEventImplCopyWith<$Res> {
  factory _$$GetAdminPropertiesEventImplCopyWith(
          _$GetAdminPropertiesEventImpl value,
          $Res Function(_$GetAdminPropertiesEventImpl) then) =
      __$$GetAdminPropertiesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit, String? search});
}

/// @nodoc
class __$$GetAdminPropertiesEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetAdminPropertiesEventImpl>
    implements _$$GetAdminPropertiesEventImplCopyWith<$Res> {
  __$$GetAdminPropertiesEventImplCopyWithImpl(
      _$GetAdminPropertiesEventImpl _value,
      $Res Function(_$GetAdminPropertiesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? search = freezed,
  }) {
    return _then(_$GetAdminPropertiesEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetAdminPropertiesEventImpl implements _GetAdminPropertiesEvent {
  const _$GetAdminPropertiesEventImpl(
      {this.page = 1, this.limit = 30, this.search});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  final String? search;

  @override
  String toString() {
    return 'AdminEvent.getAdminProperties(page: $page, limit: $limit, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAdminPropertiesEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAdminPropertiesEventImplCopyWith<_$GetAdminPropertiesEventImpl>
      get copyWith => __$$GetAdminPropertiesEventImplCopyWithImpl<
          _$GetAdminPropertiesEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getAdminProperties(page, limit, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getAdminProperties?.call(page, limit, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getAdminProperties != null) {
      return getAdminProperties(page, limit, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getAdminProperties(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getAdminProperties?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getAdminProperties != null) {
      return getAdminProperties(this);
    }
    return orElse();
  }
}

abstract class _GetAdminPropertiesEvent implements AdminEvent {
  const factory _GetAdminPropertiesEvent(
      {final int page,
      final int limit,
      final String? search}) = _$GetAdminPropertiesEventImpl;

  int get page;
  int get limit;
  String? get search;
  @JsonKey(ignore: true)
  _$$GetAdminPropertiesEventImplCopyWith<_$GetAdminPropertiesEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAdminPropertyEventImplCopyWith<$Res> {
  factory _$$DeleteAdminPropertyEventImplCopyWith(
          _$DeleteAdminPropertyEventImpl value,
          $Res Function(_$DeleteAdminPropertyEventImpl) then) =
      __$$DeleteAdminPropertyEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String propertyId});
}

/// @nodoc
class __$$DeleteAdminPropertyEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$DeleteAdminPropertyEventImpl>
    implements _$$DeleteAdminPropertyEventImplCopyWith<$Res> {
  __$$DeleteAdminPropertyEventImplCopyWithImpl(
      _$DeleteAdminPropertyEventImpl _value,
      $Res Function(_$DeleteAdminPropertyEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
  }) {
    return _then(_$DeleteAdminPropertyEventImpl(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteAdminPropertyEventImpl implements _DeleteAdminPropertyEvent {
  const _$DeleteAdminPropertyEventImpl({required this.propertyId});

  @override
  final String propertyId;

  @override
  String toString() {
    return 'AdminEvent.deleteAdminProperty(propertyId: $propertyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAdminPropertyEventImpl &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAdminPropertyEventImplCopyWith<_$DeleteAdminPropertyEventImpl>
      get copyWith => __$$DeleteAdminPropertyEventImplCopyWithImpl<
          _$DeleteAdminPropertyEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return deleteAdminProperty(propertyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return deleteAdminProperty?.call(propertyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteAdminProperty != null) {
      return deleteAdminProperty(propertyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return deleteAdminProperty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return deleteAdminProperty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteAdminProperty != null) {
      return deleteAdminProperty(this);
    }
    return orElse();
  }
}

abstract class _DeleteAdminPropertyEvent implements AdminEvent {
  const factory _DeleteAdminPropertyEvent({required final String propertyId}) =
      _$DeleteAdminPropertyEventImpl;

  String get propertyId;
  @JsonKey(ignore: true)
  _$$DeleteAdminPropertyEventImplCopyWith<_$DeleteAdminPropertyEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyServiceEventImplCopyWith<$Res> {
  factory _$$VerifyServiceEventImplCopyWith(_$VerifyServiceEventImpl value,
          $Res Function(_$VerifyServiceEventImpl) then) =
      __$$VerifyServiceEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serviceId, bool isVerified});
}

/// @nodoc
class __$$VerifyServiceEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$VerifyServiceEventImpl>
    implements _$$VerifyServiceEventImplCopyWith<$Res> {
  __$$VerifyServiceEventImplCopyWithImpl(_$VerifyServiceEventImpl _value,
      $Res Function(_$VerifyServiceEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? isVerified = null,
  }) {
    return _then(_$VerifyServiceEventImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VerifyServiceEventImpl implements _VerifyServiceEvent {
  const _$VerifyServiceEventImpl(
      {required this.serviceId, this.isVerified = true});

  @override
  final String serviceId;
  @override
  @JsonKey()
  final bool isVerified;

  @override
  String toString() {
    return 'AdminEvent.verifyService(serviceId: $serviceId, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyServiceEventImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceId, isVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyServiceEventImplCopyWith<_$VerifyServiceEventImpl> get copyWith =>
      __$$VerifyServiceEventImplCopyWithImpl<_$VerifyServiceEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return verifyService(serviceId, isVerified);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return verifyService?.call(serviceId, isVerified);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (verifyService != null) {
      return verifyService(serviceId, isVerified);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return verifyService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return verifyService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (verifyService != null) {
      return verifyService(this);
    }
    return orElse();
  }
}

abstract class _VerifyServiceEvent implements AdminEvent {
  const factory _VerifyServiceEvent(
      {required final String serviceId,
      final bool isVerified}) = _$VerifyServiceEventImpl;

  String get serviceId;
  bool get isVerified;
  @JsonKey(ignore: true)
  _$$VerifyServiceEventImplCopyWith<_$VerifyServiceEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCompaniesEventImplCopyWith<$Res> {
  factory _$$GetCompaniesEventImplCopyWith(_$GetCompaniesEventImpl value,
          $Res Function(_$GetCompaniesEventImpl) then) =
      __$$GetCompaniesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetCompaniesEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetCompaniesEventImpl>
    implements _$$GetCompaniesEventImplCopyWith<$Res> {
  __$$GetCompaniesEventImplCopyWithImpl(_$GetCompaniesEventImpl _value,
      $Res Function(_$GetCompaniesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetCompaniesEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetCompaniesEventImpl implements _GetCompaniesEvent {
  const _$GetCompaniesEventImpl({this.page = 1, this.limit = 30});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'AdminEvent.getCompanies(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCompaniesEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCompaniesEventImplCopyWith<_$GetCompaniesEventImpl> get copyWith =>
      __$$GetCompaniesEventImplCopyWithImpl<_$GetCompaniesEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getCompanies(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getCompanies?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getCompanies != null) {
      return getCompanies(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getCompanies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getCompanies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getCompanies != null) {
      return getCompanies(this);
    }
    return orElse();
  }
}

abstract class _GetCompaniesEvent implements AdminEvent {
  const factory _GetCompaniesEvent({final int page, final int limit}) =
      _$GetCompaniesEventImpl;

  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$GetCompaniesEventImplCopyWith<_$GetCompaniesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCompanyEventImplCopyWith<$Res> {
  factory _$$DeleteCompanyEventImplCopyWith(_$DeleteCompanyEventImpl value,
          $Res Function(_$DeleteCompanyEventImpl) then) =
      __$$DeleteCompanyEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String companyId});
}

/// @nodoc
class __$$DeleteCompanyEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$DeleteCompanyEventImpl>
    implements _$$DeleteCompanyEventImplCopyWith<$Res> {
  __$$DeleteCompanyEventImplCopyWithImpl(_$DeleteCompanyEventImpl _value,
      $Res Function(_$DeleteCompanyEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = null,
  }) {
    return _then(_$DeleteCompanyEventImpl(
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteCompanyEventImpl implements _DeleteCompanyEvent {
  const _$DeleteCompanyEventImpl({required this.companyId});

  @override
  final String companyId;

  @override
  String toString() {
    return 'AdminEvent.deleteCompany(companyId: $companyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteCompanyEventImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, companyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCompanyEventImplCopyWith<_$DeleteCompanyEventImpl> get copyWith =>
      __$$DeleteCompanyEventImplCopyWithImpl<_$DeleteCompanyEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return deleteCompany(companyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return deleteCompany?.call(companyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteCompany != null) {
      return deleteCompany(companyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return deleteCompany(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return deleteCompany?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteCompany != null) {
      return deleteCompany(this);
    }
    return orElse();
  }
}

abstract class _DeleteCompanyEvent implements AdminEvent {
  const factory _DeleteCompanyEvent({required final String companyId}) =
      _$DeleteCompanyEventImpl;

  String get companyId;
  @JsonKey(ignore: true)
  _$$DeleteCompanyEventImplCopyWith<_$DeleteCompanyEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConvertToAdminEventImplCopyWith<$Res> {
  factory _$$ConvertToAdminEventImplCopyWith(_$ConvertToAdminEventImpl value,
          $Res Function(_$ConvertToAdminEventImpl) then) =
      __$$ConvertToAdminEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> userIds, String? role});
}

/// @nodoc
class __$$ConvertToAdminEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$ConvertToAdminEventImpl>
    implements _$$ConvertToAdminEventImplCopyWith<$Res> {
  __$$ConvertToAdminEventImplCopyWithImpl(_$ConvertToAdminEventImpl _value,
      $Res Function(_$ConvertToAdminEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIds = null,
    Object? role = freezed,
  }) {
    return _then(_$ConvertToAdminEventImpl(
      userIds: null == userIds
          ? _value._userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ConvertToAdminEventImpl implements _ConvertToAdminEvent {
  const _$ConvertToAdminEventImpl(
      {required final List<String> userIds, this.role})
      : _userIds = userIds;

  final List<String> _userIds;
  @override
  List<String> get userIds {
    if (_userIds is EqualUnmodifiableListView) return _userIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIds);
  }

  @override
  final String? role;

  @override
  String toString() {
    return 'AdminEvent.convertToAdmin(userIds: $userIds, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConvertToAdminEventImpl &&
            const DeepCollectionEquality().equals(other._userIds, _userIds) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userIds), role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConvertToAdminEventImplCopyWith<_$ConvertToAdminEventImpl> get copyWith =>
      __$$ConvertToAdminEventImplCopyWithImpl<_$ConvertToAdminEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return convertToAdmin(userIds, role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return convertToAdmin?.call(userIds, role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (convertToAdmin != null) {
      return convertToAdmin(userIds, role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return convertToAdmin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return convertToAdmin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (convertToAdmin != null) {
      return convertToAdmin(this);
    }
    return orElse();
  }
}

abstract class _ConvertToAdminEvent implements AdminEvent {
  const factory _ConvertToAdminEvent(
      {required final List<String> userIds,
      final String? role}) = _$ConvertToAdminEventImpl;

  List<String> get userIds;
  String? get role;
  @JsonKey(ignore: true)
  _$$ConvertToAdminEventImplCopyWith<_$ConvertToAdminEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConvertToSellerEventImplCopyWith<$Res> {
  factory _$$ConvertToSellerEventImplCopyWith(_$ConvertToSellerEventImpl value,
          $Res Function(_$ConvertToSellerEventImpl) then) =
      __$$ConvertToSellerEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> userIds, String? role});
}

/// @nodoc
class __$$ConvertToSellerEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$ConvertToSellerEventImpl>
    implements _$$ConvertToSellerEventImplCopyWith<$Res> {
  __$$ConvertToSellerEventImplCopyWithImpl(_$ConvertToSellerEventImpl _value,
      $Res Function(_$ConvertToSellerEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIds = null,
    Object? role = freezed,
  }) {
    return _then(_$ConvertToSellerEventImpl(
      userIds: null == userIds
          ? _value._userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ConvertToSellerEventImpl implements _ConvertToSellerEvent {
  const _$ConvertToSellerEventImpl(
      {required final List<String> userIds, this.role})
      : _userIds = userIds;

  final List<String> _userIds;
  @override
  List<String> get userIds {
    if (_userIds is EqualUnmodifiableListView) return _userIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIds);
  }

  @override
  final String? role;

  @override
  String toString() {
    return 'AdminEvent.convertToSeller(userIds: $userIds, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConvertToSellerEventImpl &&
            const DeepCollectionEquality().equals(other._userIds, _userIds) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userIds), role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConvertToSellerEventImplCopyWith<_$ConvertToSellerEventImpl>
      get copyWith =>
          __$$ConvertToSellerEventImplCopyWithImpl<_$ConvertToSellerEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return convertToSeller(userIds, role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return convertToSeller?.call(userIds, role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (convertToSeller != null) {
      return convertToSeller(userIds, role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return convertToSeller(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return convertToSeller?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (convertToSeller != null) {
      return convertToSeller(this);
    }
    return orElse();
  }
}

abstract class _ConvertToSellerEvent implements AdminEvent {
  const factory _ConvertToSellerEvent(
      {required final List<String> userIds,
      final String? role}) = _$ConvertToSellerEventImpl;

  List<String> get userIds;
  String? get role;
  @JsonKey(ignore: true)
  _$$ConvertToSellerEventImplCopyWith<_$ConvertToSellerEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConvertToUserEventImplCopyWith<$Res> {
  factory _$$ConvertToUserEventImplCopyWith(_$ConvertToUserEventImpl value,
          $Res Function(_$ConvertToUserEventImpl) then) =
      __$$ConvertToUserEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> userIds, String? role});
}

/// @nodoc
class __$$ConvertToUserEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$ConvertToUserEventImpl>
    implements _$$ConvertToUserEventImplCopyWith<$Res> {
  __$$ConvertToUserEventImplCopyWithImpl(_$ConvertToUserEventImpl _value,
      $Res Function(_$ConvertToUserEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userIds = null,
    Object? role = freezed,
  }) {
    return _then(_$ConvertToUserEventImpl(
      userIds: null == userIds
          ? _value._userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ConvertToUserEventImpl implements _ConvertToUserEvent {
  const _$ConvertToUserEventImpl(
      {required final List<String> userIds, this.role})
      : _userIds = userIds;

  final List<String> _userIds;
  @override
  List<String> get userIds {
    if (_userIds is EqualUnmodifiableListView) return _userIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIds);
  }

  @override
  final String? role;

  @override
  String toString() {
    return 'AdminEvent.convertToUser(userIds: $userIds, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConvertToUserEventImpl &&
            const DeepCollectionEquality().equals(other._userIds, _userIds) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userIds), role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConvertToUserEventImplCopyWith<_$ConvertToUserEventImpl> get copyWith =>
      __$$ConvertToUserEventImplCopyWithImpl<_$ConvertToUserEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return convertToUser(userIds, role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return convertToUser?.call(userIds, role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (convertToUser != null) {
      return convertToUser(userIds, role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return convertToUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return convertToUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (convertToUser != null) {
      return convertToUser(this);
    }
    return orElse();
  }
}

abstract class _ConvertToUserEvent implements AdminEvent {
  const factory _ConvertToUserEvent(
      {required final List<String> userIds,
      final String? role}) = _$ConvertToUserEventImpl;

  List<String> get userIds;
  String? get role;
  @JsonKey(ignore: true)
  _$$ConvertToUserEventImplCopyWith<_$ConvertToUserEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAdminReelsEventImplCopyWith<$Res> {
  factory _$$GetAdminReelsEventImplCopyWith(_$GetAdminReelsEventImpl value,
          $Res Function(_$GetAdminReelsEventImpl) then) =
      __$$GetAdminReelsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetAdminReelsEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetAdminReelsEventImpl>
    implements _$$GetAdminReelsEventImplCopyWith<$Res> {
  __$$GetAdminReelsEventImplCopyWithImpl(_$GetAdminReelsEventImpl _value,
      $Res Function(_$GetAdminReelsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetAdminReelsEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetAdminReelsEventImpl implements _GetAdminReelsEvent {
  const _$GetAdminReelsEventImpl({this.page = 1, this.limit = 30});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'AdminEvent.getAdminReels(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAdminReelsEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAdminReelsEventImplCopyWith<_$GetAdminReelsEventImpl> get copyWith =>
      __$$GetAdminReelsEventImplCopyWithImpl<_$GetAdminReelsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getAdminReels(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getAdminReels?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getAdminReels != null) {
      return getAdminReels(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getAdminReels(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getAdminReels?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getAdminReels != null) {
      return getAdminReels(this);
    }
    return orElse();
  }
}

abstract class _GetAdminReelsEvent implements AdminEvent {
  const factory _GetAdminReelsEvent({final int page, final int limit}) =
      _$GetAdminReelsEventImpl;

  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$GetAdminReelsEventImplCopyWith<_$GetAdminReelsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAdminReelEventImplCopyWith<$Res> {
  factory _$$DeleteAdminReelEventImplCopyWith(_$DeleteAdminReelEventImpl value,
          $Res Function(_$DeleteAdminReelEventImpl) then) =
      __$$DeleteAdminReelEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reelId});
}

/// @nodoc
class __$$DeleteAdminReelEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$DeleteAdminReelEventImpl>
    implements _$$DeleteAdminReelEventImplCopyWith<$Res> {
  __$$DeleteAdminReelEventImplCopyWithImpl(_$DeleteAdminReelEventImpl _value,
      $Res Function(_$DeleteAdminReelEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reelId = null,
  }) {
    return _then(_$DeleteAdminReelEventImpl(
      reelId: null == reelId
          ? _value.reelId
          : reelId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteAdminReelEventImpl implements _DeleteAdminReelEvent {
  const _$DeleteAdminReelEventImpl({required this.reelId});

  @override
  final String reelId;

  @override
  String toString() {
    return 'AdminEvent.deleteAdminReel(reelId: $reelId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAdminReelEventImpl &&
            (identical(other.reelId, reelId) || other.reelId == reelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAdminReelEventImplCopyWith<_$DeleteAdminReelEventImpl>
      get copyWith =>
          __$$DeleteAdminReelEventImplCopyWithImpl<_$DeleteAdminReelEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return deleteAdminReel(reelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return deleteAdminReel?.call(reelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteAdminReel != null) {
      return deleteAdminReel(reelId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return deleteAdminReel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return deleteAdminReel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (deleteAdminReel != null) {
      return deleteAdminReel(this);
    }
    return orElse();
  }
}

abstract class _DeleteAdminReelEvent implements AdminEvent {
  const factory _DeleteAdminReelEvent({required final String reelId}) =
      _$DeleteAdminReelEventImpl;

  String get reelId;
  @JsonKey(ignore: true)
  _$$DeleteAdminReelEventImplCopyWith<_$DeleteAdminReelEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetGstPendingCompaniesEventImplCopyWith<$Res> {
  factory _$$GetGstPendingCompaniesEventImplCopyWith(
          _$GetGstPendingCompaniesEventImpl value,
          $Res Function(_$GetGstPendingCompaniesEventImpl) then) =
      __$$GetGstPendingCompaniesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetGstPendingCompaniesEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$GetGstPendingCompaniesEventImpl>
    implements _$$GetGstPendingCompaniesEventImplCopyWith<$Res> {
  __$$GetGstPendingCompaniesEventImplCopyWithImpl(
      _$GetGstPendingCompaniesEventImpl _value,
      $Res Function(_$GetGstPendingCompaniesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
  }) {
    return _then(_$GetGstPendingCompaniesEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetGstPendingCompaniesEventImpl
    implements _GetGstPendingCompaniesEvent {
  const _$GetGstPendingCompaniesEventImpl({this.page = 1, this.limit = 30});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'AdminEvent.getGstPendingCompanies(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetGstPendingCompaniesEventImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetGstPendingCompaniesEventImplCopyWith<_$GetGstPendingCompaniesEventImpl>
      get copyWith => __$$GetGstPendingCompaniesEventImplCopyWithImpl<
          _$GetGstPendingCompaniesEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return getGstPendingCompanies(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return getGstPendingCompanies?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (getGstPendingCompanies != null) {
      return getGstPendingCompanies(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return getGstPendingCompanies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return getGstPendingCompanies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (getGstPendingCompanies != null) {
      return getGstPendingCompanies(this);
    }
    return orElse();
  }
}

abstract class _GetGstPendingCompaniesEvent implements AdminEvent {
  const factory _GetGstPendingCompaniesEvent(
      {final int page, final int limit}) = _$GetGstPendingCompaniesEventImpl;

  int get page;
  int get limit;
  @JsonKey(ignore: true)
  _$$GetGstPendingCompaniesEventImplCopyWith<_$GetGstPendingCompaniesEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApproveGstEventImplCopyWith<$Res> {
  factory _$$ApproveGstEventImplCopyWith(_$ApproveGstEventImpl value,
          $Res Function(_$ApproveGstEventImpl) then) =
      __$$ApproveGstEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String companyId});
}

/// @nodoc
class __$$ApproveGstEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$ApproveGstEventImpl>
    implements _$$ApproveGstEventImplCopyWith<$Res> {
  __$$ApproveGstEventImplCopyWithImpl(
      _$ApproveGstEventImpl _value, $Res Function(_$ApproveGstEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = null,
  }) {
    return _then(_$ApproveGstEventImpl(
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ApproveGstEventImpl implements _ApproveGstEvent {
  const _$ApproveGstEventImpl({required this.companyId});

  @override
  final String companyId;

  @override
  String toString() {
    return 'AdminEvent.approveGst(companyId: $companyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveGstEventImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, companyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveGstEventImplCopyWith<_$ApproveGstEventImpl> get copyWith =>
      __$$ApproveGstEventImplCopyWithImpl<_$ApproveGstEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return approveGst(companyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return approveGst?.call(companyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (approveGst != null) {
      return approveGst(companyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return approveGst(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return approveGst?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (approveGst != null) {
      return approveGst(this);
    }
    return orElse();
  }
}

abstract class _ApproveGstEvent implements AdminEvent {
  const factory _ApproveGstEvent({required final String companyId}) =
      _$ApproveGstEventImpl;

  String get companyId;
  @JsonKey(ignore: true)
  _$$ApproveGstEventImplCopyWith<_$ApproveGstEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectGstEventImplCopyWith<$Res> {
  factory _$$RejectGstEventImplCopyWith(_$RejectGstEventImpl value,
          $Res Function(_$RejectGstEventImpl) then) =
      __$$RejectGstEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String companyId});
}

/// @nodoc
class __$$RejectGstEventImplCopyWithImpl<$Res>
    extends _$AdminEventCopyWithImpl<$Res, _$RejectGstEventImpl>
    implements _$$RejectGstEventImplCopyWith<$Res> {
  __$$RejectGstEventImplCopyWithImpl(
      _$RejectGstEventImpl _value, $Res Function(_$RejectGstEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = null,
  }) {
    return _then(_$RejectGstEventImpl(
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RejectGstEventImpl implements _RejectGstEvent {
  const _$RejectGstEventImpl({required this.companyId});

  @override
  final String companyId;

  @override
  String toString() {
    return 'AdminEvent.rejectGst(companyId: $companyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectGstEventImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, companyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectGstEventImplCopyWith<_$RejectGstEventImpl> get copyWith =>
      __$$RejectGstEventImplCopyWithImpl<_$RejectGstEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int limit, String? role, String? search)
        getUserList,
    required TResult Function(String userId) removeUser,
    required TResult Function(bool flag) isLoading,
    required TResult Function() reset,
    required TResult Function() clearAdminState,
    required TResult Function(int page, int limit) getPostAds,
    required TResult Function(String postId) deletePostAd,
    required TResult Function(int page, int limit) getBannerAds,
    required TResult Function(String bannerAdId) deleteBannerAd,
    required TResult Function(int page, int limit) getProjects,
    required TResult Function(String projectId) deleteProject,
    required TResult Function(int page, int limit) getCallbackRequests,
    required TResult Function(String callbackRequestId) deleteCallbackRequest,
    required TResult Function(int page, int limit) getVerificationRequests,
    required TResult Function(String verificationRequestId)
        deleteVerificationRequest,
    required TResult Function(String verificationRequestId, String status)
        updateVerificationStatus,
    required TResult Function(int page, int limit) getHomeLoans,
    required TResult Function(int page, int limit) getInteriorDesigns,
    required TResult Function(
            int page, int limit, String? category, String? search)
        getRequests,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function(int page, int limit) getAds,
    required TResult Function(String adUserId) removeAdUser,
    required TResult Function(int page, int limit, String? search) getServices,
    required TResult Function(String serviceId) deleteService,
    required TResult Function(int page, int limit, String? search)
        getAdminProperties,
    required TResult Function(String propertyId) deleteAdminProperty,
    required TResult Function(String serviceId, bool isVerified) verifyService,
    required TResult Function(int page, int limit) getCompanies,
    required TResult Function(String companyId) deleteCompany,
    required TResult Function(List<String> userIds, String? role)
        convertToAdmin,
    required TResult Function(List<String> userIds, String? role)
        convertToSeller,
    required TResult Function(List<String> userIds, String? role) convertToUser,
    required TResult Function(int page, int limit) getAdminReels,
    required TResult Function(String reelId) deleteAdminReel,
    required TResult Function(int page, int limit) getGstPendingCompanies,
    required TResult Function(String companyId) approveGst,
    required TResult Function(String companyId) rejectGst,
  }) {
    return rejectGst(companyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult? Function(String userId)? removeUser,
    TResult? Function(bool flag)? isLoading,
    TResult? Function()? reset,
    TResult? Function()? clearAdminState,
    TResult? Function(int page, int limit)? getPostAds,
    TResult? Function(String postId)? deletePostAd,
    TResult? Function(int page, int limit)? getBannerAds,
    TResult? Function(String bannerAdId)? deleteBannerAd,
    TResult? Function(int page, int limit)? getProjects,
    TResult? Function(String projectId)? deleteProject,
    TResult? Function(int page, int limit)? getCallbackRequests,
    TResult? Function(String callbackRequestId)? deleteCallbackRequest,
    TResult? Function(int page, int limit)? getVerificationRequests,
    TResult? Function(String verificationRequestId)? deleteVerificationRequest,
    TResult? Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult? Function(int page, int limit)? getHomeLoans,
    TResult? Function(int page, int limit)? getInteriorDesigns,
    TResult? Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function(int page, int limit)? getAds,
    TResult? Function(String adUserId)? removeAdUser,
    TResult? Function(int page, int limit, String? search)? getServices,
    TResult? Function(String serviceId)? deleteService,
    TResult? Function(int page, int limit, String? search)? getAdminProperties,
    TResult? Function(String propertyId)? deleteAdminProperty,
    TResult? Function(String serviceId, bool isVerified)? verifyService,
    TResult? Function(int page, int limit)? getCompanies,
    TResult? Function(String companyId)? deleteCompany,
    TResult? Function(List<String> userIds, String? role)? convertToAdmin,
    TResult? Function(List<String> userIds, String? role)? convertToSeller,
    TResult? Function(List<String> userIds, String? role)? convertToUser,
    TResult? Function(int page, int limit)? getAdminReels,
    TResult? Function(String reelId)? deleteAdminReel,
    TResult? Function(int page, int limit)? getGstPendingCompanies,
    TResult? Function(String companyId)? approveGst,
    TResult? Function(String companyId)? rejectGst,
  }) {
    return rejectGst?.call(companyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int limit, String? role, String? search)?
        getUserList,
    TResult Function(String userId)? removeUser,
    TResult Function(bool flag)? isLoading,
    TResult Function()? reset,
    TResult Function()? clearAdminState,
    TResult Function(int page, int limit)? getPostAds,
    TResult Function(String postId)? deletePostAd,
    TResult Function(int page, int limit)? getBannerAds,
    TResult Function(String bannerAdId)? deleteBannerAd,
    TResult Function(int page, int limit)? getProjects,
    TResult Function(String projectId)? deleteProject,
    TResult Function(int page, int limit)? getCallbackRequests,
    TResult Function(String callbackRequestId)? deleteCallbackRequest,
    TResult Function(int page, int limit)? getVerificationRequests,
    TResult Function(String verificationRequestId)? deleteVerificationRequest,
    TResult Function(String verificationRequestId, String status)?
        updateVerificationStatus,
    TResult Function(int page, int limit)? getHomeLoans,
    TResult Function(int page, int limit)? getInteriorDesigns,
    TResult Function(int page, int limit, String? category, String? search)?
        getRequests,
    TResult Function(String requestId)? deleteRequest,
    TResult Function(int page, int limit)? getAds,
    TResult Function(String adUserId)? removeAdUser,
    TResult Function(int page, int limit, String? search)? getServices,
    TResult Function(String serviceId)? deleteService,
    TResult Function(int page, int limit, String? search)? getAdminProperties,
    TResult Function(String propertyId)? deleteAdminProperty,
    TResult Function(String serviceId, bool isVerified)? verifyService,
    TResult Function(int page, int limit)? getCompanies,
    TResult Function(String companyId)? deleteCompany,
    TResult Function(List<String> userIds, String? role)? convertToAdmin,
    TResult Function(List<String> userIds, String? role)? convertToSeller,
    TResult Function(List<String> userIds, String? role)? convertToUser,
    TResult Function(int page, int limit)? getAdminReels,
    TResult Function(String reelId)? deleteAdminReel,
    TResult Function(int page, int limit)? getGstPendingCompanies,
    TResult Function(String companyId)? approveGst,
    TResult Function(String companyId)? rejectGst,
    required TResult orElse(),
  }) {
    if (rejectGst != null) {
      return rejectGst(companyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserListEvent value) getUserList,
    required TResult Function(_RemoveUserEvent value) removeUser,
    required TResult Function(_IsLoadingEvent value) isLoading,
    required TResult Function(_ResetEvent value) reset,
    required TResult Function(_ClearAdminStateEvent value) clearAdminState,
    required TResult Function(_GetPostAdsEvent value) getPostAds,
    required TResult Function(_DeletePostAdEvent value) deletePostAd,
    required TResult Function(_GetBannerAdsEvent value) getBannerAds,
    required TResult Function(_DeleteBannerAdEvent value) deleteBannerAd,
    required TResult Function(_GetProjectsEvent value) getProjects,
    required TResult Function(_DeleteProjectEvent value) deleteProject,
    required TResult Function(_GetCallbackRequestsEvent value)
        getCallbackRequests,
    required TResult Function(_DeleteCallbackRequestEvent value)
        deleteCallbackRequest,
    required TResult Function(_GetVerificationRequestsEvent value)
        getVerificationRequests,
    required TResult Function(_DeleteVerificationRequestEvent value)
        deleteVerificationRequest,
    required TResult Function(_UpdateVerificationStatusEvent value)
        updateVerificationStatus,
    required TResult Function(_GetHomeLoansEvent value) getHomeLoans,
    required TResult Function(_GetInteriorDesignsEvent value)
        getInteriorDesigns,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_GetAdsEvent value) getAds,
    required TResult Function(_RemoveAdUserEvent value) removeAdUser,
    required TResult Function(_GetServicesEvent value) getServices,
    required TResult Function(_DeleteServiceEvent value) deleteService,
    required TResult Function(_GetAdminPropertiesEvent value)
        getAdminProperties,
    required TResult Function(_DeleteAdminPropertyEvent value)
        deleteAdminProperty,
    required TResult Function(_VerifyServiceEvent value) verifyService,
    required TResult Function(_GetCompaniesEvent value) getCompanies,
    required TResult Function(_DeleteCompanyEvent value) deleteCompany,
    required TResult Function(_ConvertToAdminEvent value) convertToAdmin,
    required TResult Function(_ConvertToSellerEvent value) convertToSeller,
    required TResult Function(_ConvertToUserEvent value) convertToUser,
    required TResult Function(_GetAdminReelsEvent value) getAdminReels,
    required TResult Function(_DeleteAdminReelEvent value) deleteAdminReel,
    required TResult Function(_GetGstPendingCompaniesEvent value)
        getGstPendingCompanies,
    required TResult Function(_ApproveGstEvent value) approveGst,
    required TResult Function(_RejectGstEvent value) rejectGst,
  }) {
    return rejectGst(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserListEvent value)? getUserList,
    TResult? Function(_RemoveUserEvent value)? removeUser,
    TResult? Function(_IsLoadingEvent value)? isLoading,
    TResult? Function(_ResetEvent value)? reset,
    TResult? Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult? Function(_GetPostAdsEvent value)? getPostAds,
    TResult? Function(_DeletePostAdEvent value)? deletePostAd,
    TResult? Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult? Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult? Function(_GetProjectsEvent value)? getProjects,
    TResult? Function(_DeleteProjectEvent value)? deleteProject,
    TResult? Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult? Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult? Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult? Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult? Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult? Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult? Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_GetAdsEvent value)? getAds,
    TResult? Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult? Function(_GetServicesEvent value)? getServices,
    TResult? Function(_DeleteServiceEvent value)? deleteService,
    TResult? Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult? Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult? Function(_VerifyServiceEvent value)? verifyService,
    TResult? Function(_GetCompaniesEvent value)? getCompanies,
    TResult? Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult? Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult? Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult? Function(_ConvertToUserEvent value)? convertToUser,
    TResult? Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult? Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult? Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult? Function(_ApproveGstEvent value)? approveGst,
    TResult? Function(_RejectGstEvent value)? rejectGst,
  }) {
    return rejectGst?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserListEvent value)? getUserList,
    TResult Function(_RemoveUserEvent value)? removeUser,
    TResult Function(_IsLoadingEvent value)? isLoading,
    TResult Function(_ResetEvent value)? reset,
    TResult Function(_ClearAdminStateEvent value)? clearAdminState,
    TResult Function(_GetPostAdsEvent value)? getPostAds,
    TResult Function(_DeletePostAdEvent value)? deletePostAd,
    TResult Function(_GetBannerAdsEvent value)? getBannerAds,
    TResult Function(_DeleteBannerAdEvent value)? deleteBannerAd,
    TResult Function(_GetProjectsEvent value)? getProjects,
    TResult Function(_DeleteProjectEvent value)? deleteProject,
    TResult Function(_GetCallbackRequestsEvent value)? getCallbackRequests,
    TResult Function(_DeleteCallbackRequestEvent value)? deleteCallbackRequest,
    TResult Function(_GetVerificationRequestsEvent value)?
        getVerificationRequests,
    TResult Function(_DeleteVerificationRequestEvent value)?
        deleteVerificationRequest,
    TResult Function(_UpdateVerificationStatusEvent value)?
        updateVerificationStatus,
    TResult Function(_GetHomeLoansEvent value)? getHomeLoans,
    TResult Function(_GetInteriorDesignsEvent value)? getInteriorDesigns,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_GetAdsEvent value)? getAds,
    TResult Function(_RemoveAdUserEvent value)? removeAdUser,
    TResult Function(_GetServicesEvent value)? getServices,
    TResult Function(_DeleteServiceEvent value)? deleteService,
    TResult Function(_GetAdminPropertiesEvent value)? getAdminProperties,
    TResult Function(_DeleteAdminPropertyEvent value)? deleteAdminProperty,
    TResult Function(_VerifyServiceEvent value)? verifyService,
    TResult Function(_GetCompaniesEvent value)? getCompanies,
    TResult Function(_DeleteCompanyEvent value)? deleteCompany,
    TResult Function(_ConvertToAdminEvent value)? convertToAdmin,
    TResult Function(_ConvertToSellerEvent value)? convertToSeller,
    TResult Function(_ConvertToUserEvent value)? convertToUser,
    TResult Function(_GetAdminReelsEvent value)? getAdminReels,
    TResult Function(_DeleteAdminReelEvent value)? deleteAdminReel,
    TResult Function(_GetGstPendingCompaniesEvent value)?
        getGstPendingCompanies,
    TResult Function(_ApproveGstEvent value)? approveGst,
    TResult Function(_RejectGstEvent value)? rejectGst,
    required TResult orElse(),
  }) {
    if (rejectGst != null) {
      return rejectGst(this);
    }
    return orElse();
  }
}

abstract class _RejectGstEvent implements AdminEvent {
  const factory _RejectGstEvent({required final String companyId}) =
      _$RejectGstEventImpl;

  String get companyId;
  @JsonKey(ignore: true)
  _$$RejectGstEventImplCopyWith<_$RejectGstEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AdminState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<UserModel>? get users => throw _privateConstructorUsedError;
  List<PostAdModel>? get postAds => throw _privateConstructorUsedError;
  List<BannerAdModel>? get bannerAds => throw _privateConstructorUsedError;
  List<ProjectsAdminViewModel>? get projects =>
      throw _privateConstructorUsedError;
  List<CallbackRequestModel>? get callbackRequests =>
      throw _privateConstructorUsedError;
  List<VerificationRequestModel>? get verificationRequests =>
      throw _privateConstructorUsedError;
  List<HomeLoanModel>? get homeLoans => throw _privateConstructorUsedError;
  List<InteriorDesignModel>? get interiorDesigns =>
      throw _privateConstructorUsedError;
  List<RequestModel>? get requests => throw _privateConstructorUsedError;
  List<AdUserModel>? get ads => throw _privateConstructorUsedError;
  List<ServicesResponseModel>? get services =>
      throw _privateConstructorUsedError;
  List<FeedPostsResponseModel>? get properties =>
      throw _privateConstructorUsedError;
  List<AdminCompanyModel>? get companies => throw _privateConstructorUsedError;
  NotifyStatus? get notifyStatus => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get currentPostAdsPage => throw _privateConstructorUsedError;
  int get currentBannerAdsPage => throw _privateConstructorUsedError;
  int get currentProjectsPage => throw _privateConstructorUsedError;
  int get currentCallbackRequestsPage => throw _privateConstructorUsedError;
  int get currentVerificationRequestsPage => throw _privateConstructorUsedError;
  int get currentHomeLoansPage => throw _privateConstructorUsedError;
  int get currentInteriorDesignsPage => throw _privateConstructorUsedError;
  int get currentRequestsPage => throw _privateConstructorUsedError;
  int get currentAdsPage => throw _privateConstructorUsedError;
  int get currentServicesPage => throw _privateConstructorUsedError;
  int get currentPropertiesPage => throw _privateConstructorUsedError;
  int get currentCompaniesPage => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  bool get hasMorePostAds => throw _privateConstructorUsedError;
  bool get hasMoreBannerAds => throw _privateConstructorUsedError;
  bool get hasMoreProjects => throw _privateConstructorUsedError;
  bool get hasMoreCallbackRequests => throw _privateConstructorUsedError;
  bool get hasMoreVerificationRequests => throw _privateConstructorUsedError;
  bool get hasMoreHomeLoans => throw _privateConstructorUsedError;
  bool get hasMoreInteriorDesigns => throw _privateConstructorUsedError;
  bool get hasMoreRequests => throw _privateConstructorUsedError;
  bool get hasMoreAds => throw _privateConstructorUsedError;
  bool get hasMoreServices => throw _privateConstructorUsedError;
  bool get hasMoreProperties => throw _privateConstructorUsedError;
  bool get hasMoreCompanies => throw _privateConstructorUsedError;
  List<ReelResponseModel>? get adminReels => throw _privateConstructorUsedError;
  int get currentAdminReelsPage => throw _privateConstructorUsedError;
  bool get hasMoreAdminReels => throw _privateConstructorUsedError;
  List<AdminCompanyModel>? get gstPendingCompanies =>
      throw _privateConstructorUsedError;
  int get currentGstPendingPage => throw _privateConstructorUsedError;
  bool get hasMoreGstPending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdminStateCopyWith<AdminState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminStateCopyWith<$Res> {
  factory $AdminStateCopyWith(
          AdminState value, $Res Function(AdminState) then) =
      _$AdminStateCopyWithImpl<$Res, AdminState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<UserModel>? users,
      List<PostAdModel>? postAds,
      List<BannerAdModel>? bannerAds,
      List<ProjectsAdminViewModel>? projects,
      List<CallbackRequestModel>? callbackRequests,
      List<VerificationRequestModel>? verificationRequests,
      List<HomeLoanModel>? homeLoans,
      List<InteriorDesignModel>? interiorDesigns,
      List<RequestModel>? requests,
      List<AdUserModel>? ads,
      List<ServicesResponseModel>? services,
      List<FeedPostsResponseModel>? properties,
      List<AdminCompanyModel>? companies,
      NotifyStatus? notifyStatus,
      int currentPage,
      int currentPostAdsPage,
      int currentBannerAdsPage,
      int currentProjectsPage,
      int currentCallbackRequestsPage,
      int currentVerificationRequestsPage,
      int currentHomeLoansPage,
      int currentInteriorDesignsPage,
      int currentRequestsPage,
      int currentAdsPage,
      int currentServicesPage,
      int currentPropertiesPage,
      int currentCompaniesPage,
      bool hasMore,
      bool hasMorePostAds,
      bool hasMoreBannerAds,
      bool hasMoreProjects,
      bool hasMoreCallbackRequests,
      bool hasMoreVerificationRequests,
      bool hasMoreHomeLoans,
      bool hasMoreInteriorDesigns,
      bool hasMoreRequests,
      bool hasMoreAds,
      bool hasMoreServices,
      bool hasMoreProperties,
      bool hasMoreCompanies,
      List<ReelResponseModel>? adminReels,
      int currentAdminReelsPage,
      bool hasMoreAdminReels,
      List<AdminCompanyModel>? gstPendingCompanies,
      int currentGstPendingPage,
      bool hasMoreGstPending});
}

/// @nodoc
class _$AdminStateCopyWithImpl<$Res, $Val extends AdminState>
    implements $AdminStateCopyWith<$Res> {
  _$AdminStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? users = freezed,
    Object? postAds = freezed,
    Object? bannerAds = freezed,
    Object? projects = freezed,
    Object? callbackRequests = freezed,
    Object? verificationRequests = freezed,
    Object? homeLoans = freezed,
    Object? interiorDesigns = freezed,
    Object? requests = freezed,
    Object? ads = freezed,
    Object? services = freezed,
    Object? properties = freezed,
    Object? companies = freezed,
    Object? notifyStatus = freezed,
    Object? currentPage = null,
    Object? currentPostAdsPage = null,
    Object? currentBannerAdsPage = null,
    Object? currentProjectsPage = null,
    Object? currentCallbackRequestsPage = null,
    Object? currentVerificationRequestsPage = null,
    Object? currentHomeLoansPage = null,
    Object? currentInteriorDesignsPage = null,
    Object? currentRequestsPage = null,
    Object? currentAdsPage = null,
    Object? currentServicesPage = null,
    Object? currentPropertiesPage = null,
    Object? currentCompaniesPage = null,
    Object? hasMore = null,
    Object? hasMorePostAds = null,
    Object? hasMoreBannerAds = null,
    Object? hasMoreProjects = null,
    Object? hasMoreCallbackRequests = null,
    Object? hasMoreVerificationRequests = null,
    Object? hasMoreHomeLoans = null,
    Object? hasMoreInteriorDesigns = null,
    Object? hasMoreRequests = null,
    Object? hasMoreAds = null,
    Object? hasMoreServices = null,
    Object? hasMoreProperties = null,
    Object? hasMoreCompanies = null,
    Object? adminReels = freezed,
    Object? currentAdminReelsPage = null,
    Object? hasMoreAdminReels = null,
    Object? gstPendingCompanies = freezed,
    Object? currentGstPendingPage = null,
    Object? hasMoreGstPending = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
      postAds: freezed == postAds
          ? _value.postAds
          : postAds // ignore: cast_nullable_to_non_nullable
              as List<PostAdModel>?,
      bannerAds: freezed == bannerAds
          ? _value.bannerAds
          : bannerAds // ignore: cast_nullable_to_non_nullable
              as List<BannerAdModel>?,
      projects: freezed == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectsAdminViewModel>?,
      callbackRequests: freezed == callbackRequests
          ? _value.callbackRequests
          : callbackRequests // ignore: cast_nullable_to_non_nullable
              as List<CallbackRequestModel>?,
      verificationRequests: freezed == verificationRequests
          ? _value.verificationRequests
          : verificationRequests // ignore: cast_nullable_to_non_nullable
              as List<VerificationRequestModel>?,
      homeLoans: freezed == homeLoans
          ? _value.homeLoans
          : homeLoans // ignore: cast_nullable_to_non_nullable
              as List<HomeLoanModel>?,
      interiorDesigns: freezed == interiorDesigns
          ? _value.interiorDesigns
          : interiorDesigns // ignore: cast_nullable_to_non_nullable
              as List<InteriorDesignModel>?,
      requests: freezed == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<RequestModel>?,
      ads: freezed == ads
          ? _value.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<AdUserModel>?,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServicesResponseModel>?,
      properties: freezed == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>?,
      companies: freezed == companies
          ? _value.companies
          : companies // ignore: cast_nullable_to_non_nullable
              as List<AdminCompanyModel>?,
      notifyStatus: freezed == notifyStatus
          ? _value.notifyStatus
          : notifyStatus // ignore: cast_nullable_to_non_nullable
              as NotifyStatus?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPostAdsPage: null == currentPostAdsPage
          ? _value.currentPostAdsPage
          : currentPostAdsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentBannerAdsPage: null == currentBannerAdsPage
          ? _value.currentBannerAdsPage
          : currentBannerAdsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentProjectsPage: null == currentProjectsPage
          ? _value.currentProjectsPage
          : currentProjectsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentCallbackRequestsPage: null == currentCallbackRequestsPage
          ? _value.currentCallbackRequestsPage
          : currentCallbackRequestsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentVerificationRequestsPage: null == currentVerificationRequestsPage
          ? _value.currentVerificationRequestsPage
          : currentVerificationRequestsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentHomeLoansPage: null == currentHomeLoansPage
          ? _value.currentHomeLoansPage
          : currentHomeLoansPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentInteriorDesignsPage: null == currentInteriorDesignsPage
          ? _value.currentInteriorDesignsPage
          : currentInteriorDesignsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentRequestsPage: null == currentRequestsPage
          ? _value.currentRequestsPage
          : currentRequestsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentAdsPage: null == currentAdsPage
          ? _value.currentAdsPage
          : currentAdsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentServicesPage: null == currentServicesPage
          ? _value.currentServicesPage
          : currentServicesPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPropertiesPage: null == currentPropertiesPage
          ? _value.currentPropertiesPage
          : currentPropertiesPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentCompaniesPage: null == currentCompaniesPage
          ? _value.currentCompaniesPage
          : currentCompaniesPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMorePostAds: null == hasMorePostAds
          ? _value.hasMorePostAds
          : hasMorePostAds // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreBannerAds: null == hasMoreBannerAds
          ? _value.hasMoreBannerAds
          : hasMoreBannerAds // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreProjects: null == hasMoreProjects
          ? _value.hasMoreProjects
          : hasMoreProjects // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreCallbackRequests: null == hasMoreCallbackRequests
          ? _value.hasMoreCallbackRequests
          : hasMoreCallbackRequests // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreVerificationRequests: null == hasMoreVerificationRequests
          ? _value.hasMoreVerificationRequests
          : hasMoreVerificationRequests // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreHomeLoans: null == hasMoreHomeLoans
          ? _value.hasMoreHomeLoans
          : hasMoreHomeLoans // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreInteriorDesigns: null == hasMoreInteriorDesigns
          ? _value.hasMoreInteriorDesigns
          : hasMoreInteriorDesigns // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreRequests: null == hasMoreRequests
          ? _value.hasMoreRequests
          : hasMoreRequests // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreAds: null == hasMoreAds
          ? _value.hasMoreAds
          : hasMoreAds // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreServices: null == hasMoreServices
          ? _value.hasMoreServices
          : hasMoreServices // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreProperties: null == hasMoreProperties
          ? _value.hasMoreProperties
          : hasMoreProperties // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreCompanies: null == hasMoreCompanies
          ? _value.hasMoreCompanies
          : hasMoreCompanies // ignore: cast_nullable_to_non_nullable
              as bool,
      adminReels: freezed == adminReels
          ? _value.adminReels
          : adminReels // ignore: cast_nullable_to_non_nullable
              as List<ReelResponseModel>?,
      currentAdminReelsPage: null == currentAdminReelsPage
          ? _value.currentAdminReelsPage
          : currentAdminReelsPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMoreAdminReels: null == hasMoreAdminReels
          ? _value.hasMoreAdminReels
          : hasMoreAdminReels // ignore: cast_nullable_to_non_nullable
              as bool,
      gstPendingCompanies: freezed == gstPendingCompanies
          ? _value.gstPendingCompanies
          : gstPendingCompanies // ignore: cast_nullable_to_non_nullable
              as List<AdminCompanyModel>?,
      currentGstPendingPage: null == currentGstPendingPage
          ? _value.currentGstPendingPage
          : currentGstPendingPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMoreGstPending: null == hasMoreGstPending
          ? _value.hasMoreGstPending
          : hasMoreGstPending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminStateImplCopyWith<$Res>
    implements $AdminStateCopyWith<$Res> {
  factory _$$AdminStateImplCopyWith(
          _$AdminStateImpl value, $Res Function(_$AdminStateImpl) then) =
      __$$AdminStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<UserModel>? users,
      List<PostAdModel>? postAds,
      List<BannerAdModel>? bannerAds,
      List<ProjectsAdminViewModel>? projects,
      List<CallbackRequestModel>? callbackRequests,
      List<VerificationRequestModel>? verificationRequests,
      List<HomeLoanModel>? homeLoans,
      List<InteriorDesignModel>? interiorDesigns,
      List<RequestModel>? requests,
      List<AdUserModel>? ads,
      List<ServicesResponseModel>? services,
      List<FeedPostsResponseModel>? properties,
      List<AdminCompanyModel>? companies,
      NotifyStatus? notifyStatus,
      int currentPage,
      int currentPostAdsPage,
      int currentBannerAdsPage,
      int currentProjectsPage,
      int currentCallbackRequestsPage,
      int currentVerificationRequestsPage,
      int currentHomeLoansPage,
      int currentInteriorDesignsPage,
      int currentRequestsPage,
      int currentAdsPage,
      int currentServicesPage,
      int currentPropertiesPage,
      int currentCompaniesPage,
      bool hasMore,
      bool hasMorePostAds,
      bool hasMoreBannerAds,
      bool hasMoreProjects,
      bool hasMoreCallbackRequests,
      bool hasMoreVerificationRequests,
      bool hasMoreHomeLoans,
      bool hasMoreInteriorDesigns,
      bool hasMoreRequests,
      bool hasMoreAds,
      bool hasMoreServices,
      bool hasMoreProperties,
      bool hasMoreCompanies,
      List<ReelResponseModel>? adminReels,
      int currentAdminReelsPage,
      bool hasMoreAdminReels,
      List<AdminCompanyModel>? gstPendingCompanies,
      int currentGstPendingPage,
      bool hasMoreGstPending});
}

/// @nodoc
class __$$AdminStateImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$AdminStateImpl>
    implements _$$AdminStateImplCopyWith<$Res> {
  __$$AdminStateImplCopyWithImpl(
      _$AdminStateImpl _value, $Res Function(_$AdminStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? users = freezed,
    Object? postAds = freezed,
    Object? bannerAds = freezed,
    Object? projects = freezed,
    Object? callbackRequests = freezed,
    Object? verificationRequests = freezed,
    Object? homeLoans = freezed,
    Object? interiorDesigns = freezed,
    Object? requests = freezed,
    Object? ads = freezed,
    Object? services = freezed,
    Object? properties = freezed,
    Object? companies = freezed,
    Object? notifyStatus = freezed,
    Object? currentPage = null,
    Object? currentPostAdsPage = null,
    Object? currentBannerAdsPage = null,
    Object? currentProjectsPage = null,
    Object? currentCallbackRequestsPage = null,
    Object? currentVerificationRequestsPage = null,
    Object? currentHomeLoansPage = null,
    Object? currentInteriorDesignsPage = null,
    Object? currentRequestsPage = null,
    Object? currentAdsPage = null,
    Object? currentServicesPage = null,
    Object? currentPropertiesPage = null,
    Object? currentCompaniesPage = null,
    Object? hasMore = null,
    Object? hasMorePostAds = null,
    Object? hasMoreBannerAds = null,
    Object? hasMoreProjects = null,
    Object? hasMoreCallbackRequests = null,
    Object? hasMoreVerificationRequests = null,
    Object? hasMoreHomeLoans = null,
    Object? hasMoreInteriorDesigns = null,
    Object? hasMoreRequests = null,
    Object? hasMoreAds = null,
    Object? hasMoreServices = null,
    Object? hasMoreProperties = null,
    Object? hasMoreCompanies = null,
    Object? adminReels = freezed,
    Object? currentAdminReelsPage = null,
    Object? hasMoreAdminReels = null,
    Object? gstPendingCompanies = freezed,
    Object? currentGstPendingPage = null,
    Object? hasMoreGstPending = null,
  }) {
    return _then(_$AdminStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
      postAds: freezed == postAds
          ? _value._postAds
          : postAds // ignore: cast_nullable_to_non_nullable
              as List<PostAdModel>?,
      bannerAds: freezed == bannerAds
          ? _value._bannerAds
          : bannerAds // ignore: cast_nullable_to_non_nullable
              as List<BannerAdModel>?,
      projects: freezed == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectsAdminViewModel>?,
      callbackRequests: freezed == callbackRequests
          ? _value._callbackRequests
          : callbackRequests // ignore: cast_nullable_to_non_nullable
              as List<CallbackRequestModel>?,
      verificationRequests: freezed == verificationRequests
          ? _value._verificationRequests
          : verificationRequests // ignore: cast_nullable_to_non_nullable
              as List<VerificationRequestModel>?,
      homeLoans: freezed == homeLoans
          ? _value._homeLoans
          : homeLoans // ignore: cast_nullable_to_non_nullable
              as List<HomeLoanModel>?,
      interiorDesigns: freezed == interiorDesigns
          ? _value._interiorDesigns
          : interiorDesigns // ignore: cast_nullable_to_non_nullable
              as List<InteriorDesignModel>?,
      requests: freezed == requests
          ? _value._requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<RequestModel>?,
      ads: freezed == ads
          ? _value._ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<AdUserModel>?,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServicesResponseModel>?,
      properties: freezed == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>?,
      companies: freezed == companies
          ? _value._companies
          : companies // ignore: cast_nullable_to_non_nullable
              as List<AdminCompanyModel>?,
      notifyStatus: freezed == notifyStatus
          ? _value.notifyStatus
          : notifyStatus // ignore: cast_nullable_to_non_nullable
              as NotifyStatus?,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPostAdsPage: null == currentPostAdsPage
          ? _value.currentPostAdsPage
          : currentPostAdsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentBannerAdsPage: null == currentBannerAdsPage
          ? _value.currentBannerAdsPage
          : currentBannerAdsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentProjectsPage: null == currentProjectsPage
          ? _value.currentProjectsPage
          : currentProjectsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentCallbackRequestsPage: null == currentCallbackRequestsPage
          ? _value.currentCallbackRequestsPage
          : currentCallbackRequestsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentVerificationRequestsPage: null == currentVerificationRequestsPage
          ? _value.currentVerificationRequestsPage
          : currentVerificationRequestsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentHomeLoansPage: null == currentHomeLoansPage
          ? _value.currentHomeLoansPage
          : currentHomeLoansPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentInteriorDesignsPage: null == currentInteriorDesignsPage
          ? _value.currentInteriorDesignsPage
          : currentInteriorDesignsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentRequestsPage: null == currentRequestsPage
          ? _value.currentRequestsPage
          : currentRequestsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentAdsPage: null == currentAdsPage
          ? _value.currentAdsPage
          : currentAdsPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentServicesPage: null == currentServicesPage
          ? _value.currentServicesPage
          : currentServicesPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPropertiesPage: null == currentPropertiesPage
          ? _value.currentPropertiesPage
          : currentPropertiesPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentCompaniesPage: null == currentCompaniesPage
          ? _value.currentCompaniesPage
          : currentCompaniesPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMorePostAds: null == hasMorePostAds
          ? _value.hasMorePostAds
          : hasMorePostAds // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreBannerAds: null == hasMoreBannerAds
          ? _value.hasMoreBannerAds
          : hasMoreBannerAds // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreProjects: null == hasMoreProjects
          ? _value.hasMoreProjects
          : hasMoreProjects // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreCallbackRequests: null == hasMoreCallbackRequests
          ? _value.hasMoreCallbackRequests
          : hasMoreCallbackRequests // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreVerificationRequests: null == hasMoreVerificationRequests
          ? _value.hasMoreVerificationRequests
          : hasMoreVerificationRequests // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreHomeLoans: null == hasMoreHomeLoans
          ? _value.hasMoreHomeLoans
          : hasMoreHomeLoans // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreInteriorDesigns: null == hasMoreInteriorDesigns
          ? _value.hasMoreInteriorDesigns
          : hasMoreInteriorDesigns // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreRequests: null == hasMoreRequests
          ? _value.hasMoreRequests
          : hasMoreRequests // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreAds: null == hasMoreAds
          ? _value.hasMoreAds
          : hasMoreAds // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreServices: null == hasMoreServices
          ? _value.hasMoreServices
          : hasMoreServices // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreProperties: null == hasMoreProperties
          ? _value.hasMoreProperties
          : hasMoreProperties // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreCompanies: null == hasMoreCompanies
          ? _value.hasMoreCompanies
          : hasMoreCompanies // ignore: cast_nullable_to_non_nullable
              as bool,
      adminReels: freezed == adminReels
          ? _value._adminReels
          : adminReels // ignore: cast_nullable_to_non_nullable
              as List<ReelResponseModel>?,
      currentAdminReelsPage: null == currentAdminReelsPage
          ? _value.currentAdminReelsPage
          : currentAdminReelsPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMoreAdminReels: null == hasMoreAdminReels
          ? _value.hasMoreAdminReels
          : hasMoreAdminReels // ignore: cast_nullable_to_non_nullable
              as bool,
      gstPendingCompanies: freezed == gstPendingCompanies
          ? _value._gstPendingCompanies
          : gstPendingCompanies // ignore: cast_nullable_to_non_nullable
              as List<AdminCompanyModel>?,
      currentGstPendingPage: null == currentGstPendingPage
          ? _value.currentGstPendingPage
          : currentGstPendingPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasMoreGstPending: null == hasMoreGstPending
          ? _value.hasMoreGstPending
          : hasMoreGstPending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AdminStateImpl implements _AdminState {
  const _$AdminStateImpl(
      {this.isLoading = false,
      final List<UserModel>? users,
      final List<PostAdModel>? postAds,
      final List<BannerAdModel>? bannerAds,
      final List<ProjectsAdminViewModel>? projects,
      final List<CallbackRequestModel>? callbackRequests,
      final List<VerificationRequestModel>? verificationRequests,
      final List<HomeLoanModel>? homeLoans,
      final List<InteriorDesignModel>? interiorDesigns,
      final List<RequestModel>? requests,
      final List<AdUserModel>? ads,
      final List<ServicesResponseModel>? services,
      final List<FeedPostsResponseModel>? properties,
      final List<AdminCompanyModel>? companies,
      this.notifyStatus,
      this.currentPage = 1,
      this.currentPostAdsPage = 1,
      this.currentBannerAdsPage = 1,
      this.currentProjectsPage = 1,
      this.currentCallbackRequestsPage = 1,
      this.currentVerificationRequestsPage = 1,
      this.currentHomeLoansPage = 1,
      this.currentInteriorDesignsPage = 1,
      this.currentRequestsPage = 1,
      this.currentAdsPage = 1,
      this.currentServicesPage = 1,
      this.currentPropertiesPage = 1,
      this.currentCompaniesPage = 1,
      this.hasMore = false,
      this.hasMorePostAds = false,
      this.hasMoreBannerAds = false,
      this.hasMoreProjects = false,
      this.hasMoreCallbackRequests = false,
      this.hasMoreVerificationRequests = false,
      this.hasMoreHomeLoans = false,
      this.hasMoreInteriorDesigns = false,
      this.hasMoreRequests = false,
      this.hasMoreAds = false,
      this.hasMoreServices = false,
      this.hasMoreProperties = false,
      this.hasMoreCompanies = false,
      final List<ReelResponseModel>? adminReels,
      this.currentAdminReelsPage = 1,
      this.hasMoreAdminReels = false,
      final List<AdminCompanyModel>? gstPendingCompanies,
      this.currentGstPendingPage = 1,
      this.hasMoreGstPending = false})
      : _users = users,
        _postAds = postAds,
        _bannerAds = bannerAds,
        _projects = projects,
        _callbackRequests = callbackRequests,
        _verificationRequests = verificationRequests,
        _homeLoans = homeLoans,
        _interiorDesigns = interiorDesigns,
        _requests = requests,
        _ads = ads,
        _services = services,
        _properties = properties,
        _companies = companies,
        _adminReels = adminReels,
        _gstPendingCompanies = gstPendingCompanies;

  @override
  @JsonKey()
  final bool isLoading;
  final List<UserModel>? _users;
  @override
  List<UserModel>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PostAdModel>? _postAds;
  @override
  List<PostAdModel>? get postAds {
    final value = _postAds;
    if (value == null) return null;
    if (_postAds is EqualUnmodifiableListView) return _postAds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BannerAdModel>? _bannerAds;
  @override
  List<BannerAdModel>? get bannerAds {
    final value = _bannerAds;
    if (value == null) return null;
    if (_bannerAds is EqualUnmodifiableListView) return _bannerAds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProjectsAdminViewModel>? _projects;
  @override
  List<ProjectsAdminViewModel>? get projects {
    final value = _projects;
    if (value == null) return null;
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CallbackRequestModel>? _callbackRequests;
  @override
  List<CallbackRequestModel>? get callbackRequests {
    final value = _callbackRequests;
    if (value == null) return null;
    if (_callbackRequests is EqualUnmodifiableListView)
      return _callbackRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<VerificationRequestModel>? _verificationRequests;
  @override
  List<VerificationRequestModel>? get verificationRequests {
    final value = _verificationRequests;
    if (value == null) return null;
    if (_verificationRequests is EqualUnmodifiableListView)
      return _verificationRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<HomeLoanModel>? _homeLoans;
  @override
  List<HomeLoanModel>? get homeLoans {
    final value = _homeLoans;
    if (value == null) return null;
    if (_homeLoans is EqualUnmodifiableListView) return _homeLoans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<InteriorDesignModel>? _interiorDesigns;
  @override
  List<InteriorDesignModel>? get interiorDesigns {
    final value = _interiorDesigns;
    if (value == null) return null;
    if (_interiorDesigns is EqualUnmodifiableListView) return _interiorDesigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RequestModel>? _requests;
  @override
  List<RequestModel>? get requests {
    final value = _requests;
    if (value == null) return null;
    if (_requests is EqualUnmodifiableListView) return _requests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AdUserModel>? _ads;
  @override
  List<AdUserModel>? get ads {
    final value = _ads;
    if (value == null) return null;
    if (_ads is EqualUnmodifiableListView) return _ads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ServicesResponseModel>? _services;
  @override
  List<ServicesResponseModel>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FeedPostsResponseModel>? _properties;
  @override
  List<FeedPostsResponseModel>? get properties {
    final value = _properties;
    if (value == null) return null;
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AdminCompanyModel>? _companies;
  @override
  List<AdminCompanyModel>? get companies {
    final value = _companies;
    if (value == null) return null;
    if (_companies is EqualUnmodifiableListView) return _companies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final NotifyStatus? notifyStatus;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int currentPostAdsPage;
  @override
  @JsonKey()
  final int currentBannerAdsPage;
  @override
  @JsonKey()
  final int currentProjectsPage;
  @override
  @JsonKey()
  final int currentCallbackRequestsPage;
  @override
  @JsonKey()
  final int currentVerificationRequestsPage;
  @override
  @JsonKey()
  final int currentHomeLoansPage;
  @override
  @JsonKey()
  final int currentInteriorDesignsPage;
  @override
  @JsonKey()
  final int currentRequestsPage;
  @override
  @JsonKey()
  final int currentAdsPage;
  @override
  @JsonKey()
  final int currentServicesPage;
  @override
  @JsonKey()
  final int currentPropertiesPage;
  @override
  @JsonKey()
  final int currentCompaniesPage;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final bool hasMorePostAds;
  @override
  @JsonKey()
  final bool hasMoreBannerAds;
  @override
  @JsonKey()
  final bool hasMoreProjects;
  @override
  @JsonKey()
  final bool hasMoreCallbackRequests;
  @override
  @JsonKey()
  final bool hasMoreVerificationRequests;
  @override
  @JsonKey()
  final bool hasMoreHomeLoans;
  @override
  @JsonKey()
  final bool hasMoreInteriorDesigns;
  @override
  @JsonKey()
  final bool hasMoreRequests;
  @override
  @JsonKey()
  final bool hasMoreAds;
  @override
  @JsonKey()
  final bool hasMoreServices;
  @override
  @JsonKey()
  final bool hasMoreProperties;
  @override
  @JsonKey()
  final bool hasMoreCompanies;
  final List<ReelResponseModel>? _adminReels;
  @override
  List<ReelResponseModel>? get adminReels {
    final value = _adminReels;
    if (value == null) return null;
    if (_adminReels is EqualUnmodifiableListView) return _adminReels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int currentAdminReelsPage;
  @override
  @JsonKey()
  final bool hasMoreAdminReels;
  final List<AdminCompanyModel>? _gstPendingCompanies;
  @override
  List<AdminCompanyModel>? get gstPendingCompanies {
    final value = _gstPendingCompanies;
    if (value == null) return null;
    if (_gstPendingCompanies is EqualUnmodifiableListView)
      return _gstPendingCompanies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int currentGstPendingPage;
  @override
  @JsonKey()
  final bool hasMoreGstPending;

  @override
  String toString() {
    return 'AdminState(isLoading: $isLoading, users: $users, postAds: $postAds, bannerAds: $bannerAds, projects: $projects, callbackRequests: $callbackRequests, verificationRequests: $verificationRequests, homeLoans: $homeLoans, interiorDesigns: $interiorDesigns, requests: $requests, ads: $ads, services: $services, properties: $properties, companies: $companies, notifyStatus: $notifyStatus, currentPage: $currentPage, currentPostAdsPage: $currentPostAdsPage, currentBannerAdsPage: $currentBannerAdsPage, currentProjectsPage: $currentProjectsPage, currentCallbackRequestsPage: $currentCallbackRequestsPage, currentVerificationRequestsPage: $currentVerificationRequestsPage, currentHomeLoansPage: $currentHomeLoansPage, currentInteriorDesignsPage: $currentInteriorDesignsPage, currentRequestsPage: $currentRequestsPage, currentAdsPage: $currentAdsPage, currentServicesPage: $currentServicesPage, currentPropertiesPage: $currentPropertiesPage, currentCompaniesPage: $currentCompaniesPage, hasMore: $hasMore, hasMorePostAds: $hasMorePostAds, hasMoreBannerAds: $hasMoreBannerAds, hasMoreProjects: $hasMoreProjects, hasMoreCallbackRequests: $hasMoreCallbackRequests, hasMoreVerificationRequests: $hasMoreVerificationRequests, hasMoreHomeLoans: $hasMoreHomeLoans, hasMoreInteriorDesigns: $hasMoreInteriorDesigns, hasMoreRequests: $hasMoreRequests, hasMoreAds: $hasMoreAds, hasMoreServices: $hasMoreServices, hasMoreProperties: $hasMoreProperties, hasMoreCompanies: $hasMoreCompanies, adminReels: $adminReels, currentAdminReelsPage: $currentAdminReelsPage, hasMoreAdminReels: $hasMoreAdminReels, gstPendingCompanies: $gstPendingCompanies, currentGstPendingPage: $currentGstPendingPage, hasMoreGstPending: $hasMoreGstPending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._postAds, _postAds) &&
            const DeepCollectionEquality()
                .equals(other._bannerAds, _bannerAds) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            const DeepCollectionEquality()
                .equals(other._callbackRequests, _callbackRequests) &&
            const DeepCollectionEquality()
                .equals(other._verificationRequests, _verificationRequests) &&
            const DeepCollectionEquality()
                .equals(other._homeLoans, _homeLoans) &&
            const DeepCollectionEquality()
                .equals(other._interiorDesigns, _interiorDesigns) &&
            const DeepCollectionEquality().equals(other._requests, _requests) &&
            const DeepCollectionEquality().equals(other._ads, _ads) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            const DeepCollectionEquality()
                .equals(other._companies, _companies) &&
            (identical(other.notifyStatus, notifyStatus) ||
                other.notifyStatus == notifyStatus) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.currentPostAdsPage, currentPostAdsPage) ||
                other.currentPostAdsPage == currentPostAdsPage) &&
            (identical(other.currentBannerAdsPage, currentBannerAdsPage) ||
                other.currentBannerAdsPage == currentBannerAdsPage) &&
            (identical(other.currentProjectsPage, currentProjectsPage) ||
                other.currentProjectsPage == currentProjectsPage) &&
            (identical(other.currentCallbackRequestsPage, currentCallbackRequestsPage) ||
                other.currentCallbackRequestsPage ==
                    currentCallbackRequestsPage) &&
            (identical(other.currentVerificationRequestsPage, currentVerificationRequestsPage) ||
                other.currentVerificationRequestsPage ==
                    currentVerificationRequestsPage) &&
            (identical(other.currentHomeLoansPage, currentHomeLoansPage) ||
                other.currentHomeLoansPage == currentHomeLoansPage) &&
            (identical(other.currentInteriorDesignsPage, currentInteriorDesignsPage) ||
                other.currentInteriorDesignsPage ==
                    currentInteriorDesignsPage) &&
            (identical(other.currentRequestsPage, currentRequestsPage) ||
                other.currentRequestsPage == currentRequestsPage) &&
            (identical(other.currentAdsPage, currentAdsPage) ||
                other.currentAdsPage == currentAdsPage) &&
            (identical(other.currentServicesPage, currentServicesPage) ||
                other.currentServicesPage == currentServicesPage) &&
            (identical(other.currentPropertiesPage, currentPropertiesPage) ||
                other.currentPropertiesPage == currentPropertiesPage) &&
            (identical(other.currentCompaniesPage, currentCompaniesPage) ||
                other.currentCompaniesPage == currentCompaniesPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.hasMorePostAds, hasMorePostAds) ||
                other.hasMorePostAds == hasMorePostAds) &&
            (identical(other.hasMoreBannerAds, hasMoreBannerAds) ||
                other.hasMoreBannerAds == hasMoreBannerAds) &&
            (identical(other.hasMoreProjects, hasMoreProjects) ||
                other.hasMoreProjects == hasMoreProjects) &&
            (identical(other.hasMoreCallbackRequests, hasMoreCallbackRequests) ||
                other.hasMoreCallbackRequests == hasMoreCallbackRequests) &&
            (identical(other.hasMoreVerificationRequests, hasMoreVerificationRequests) ||
                other.hasMoreVerificationRequests ==
                    hasMoreVerificationRequests) &&
            (identical(other.hasMoreHomeLoans, hasMoreHomeLoans) ||
                other.hasMoreHomeLoans == hasMoreHomeLoans) &&
            (identical(other.hasMoreInteriorDesigns, hasMoreInteriorDesigns) ||
                other.hasMoreInteriorDesigns == hasMoreInteriorDesigns) &&
            (identical(other.hasMoreRequests, hasMoreRequests) || other.hasMoreRequests == hasMoreRequests) &&
            (identical(other.hasMoreAds, hasMoreAds) || other.hasMoreAds == hasMoreAds) &&
            (identical(other.hasMoreServices, hasMoreServices) || other.hasMoreServices == hasMoreServices) &&
            (identical(other.hasMoreProperties, hasMoreProperties) || other.hasMoreProperties == hasMoreProperties) &&
            (identical(other.hasMoreCompanies, hasMoreCompanies) || other.hasMoreCompanies == hasMoreCompanies) &&
            const DeepCollectionEquality().equals(other._adminReels, _adminReels) &&
            (identical(other.currentAdminReelsPage, currentAdminReelsPage) || other.currentAdminReelsPage == currentAdminReelsPage) &&
            (identical(other.hasMoreAdminReels, hasMoreAdminReels) || other.hasMoreAdminReels == hasMoreAdminReels) &&
            const DeepCollectionEquality().equals(other._gstPendingCompanies, _gstPendingCompanies) &&
            (identical(other.currentGstPendingPage, currentGstPendingPage) || other.currentGstPendingPage == currentGstPendingPage) &&
            (identical(other.hasMoreGstPending, hasMoreGstPending) || other.hasMoreGstPending == hasMoreGstPending));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        const DeepCollectionEquality().hash(_users),
        const DeepCollectionEquality().hash(_postAds),
        const DeepCollectionEquality().hash(_bannerAds),
        const DeepCollectionEquality().hash(_projects),
        const DeepCollectionEquality().hash(_callbackRequests),
        const DeepCollectionEquality().hash(_verificationRequests),
        const DeepCollectionEquality().hash(_homeLoans),
        const DeepCollectionEquality().hash(_interiorDesigns),
        const DeepCollectionEquality().hash(_requests),
        const DeepCollectionEquality().hash(_ads),
        const DeepCollectionEquality().hash(_services),
        const DeepCollectionEquality().hash(_properties),
        const DeepCollectionEquality().hash(_companies),
        notifyStatus,
        currentPage,
        currentPostAdsPage,
        currentBannerAdsPage,
        currentProjectsPage,
        currentCallbackRequestsPage,
        currentVerificationRequestsPage,
        currentHomeLoansPage,
        currentInteriorDesignsPage,
        currentRequestsPage,
        currentAdsPage,
        currentServicesPage,
        currentPropertiesPage,
        currentCompaniesPage,
        hasMore,
        hasMorePostAds,
        hasMoreBannerAds,
        hasMoreProjects,
        hasMoreCallbackRequests,
        hasMoreVerificationRequests,
        hasMoreHomeLoans,
        hasMoreInteriorDesigns,
        hasMoreRequests,
        hasMoreAds,
        hasMoreServices,
        hasMoreProperties,
        hasMoreCompanies,
        const DeepCollectionEquality().hash(_adminReels),
        currentAdminReelsPage,
        hasMoreAdminReels,
        const DeepCollectionEquality().hash(_gstPendingCompanies),
        currentGstPendingPage,
        hasMoreGstPending
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminStateImplCopyWith<_$AdminStateImpl> get copyWith =>
      __$$AdminStateImplCopyWithImpl<_$AdminStateImpl>(this, _$identity);
}

abstract class _AdminState implements AdminState {
  const factory _AdminState(
      {final bool isLoading,
      final List<UserModel>? users,
      final List<PostAdModel>? postAds,
      final List<BannerAdModel>? bannerAds,
      final List<ProjectsAdminViewModel>? projects,
      final List<CallbackRequestModel>? callbackRequests,
      final List<VerificationRequestModel>? verificationRequests,
      final List<HomeLoanModel>? homeLoans,
      final List<InteriorDesignModel>? interiorDesigns,
      final List<RequestModel>? requests,
      final List<AdUserModel>? ads,
      final List<ServicesResponseModel>? services,
      final List<FeedPostsResponseModel>? properties,
      final List<AdminCompanyModel>? companies,
      final NotifyStatus? notifyStatus,
      final int currentPage,
      final int currentPostAdsPage,
      final int currentBannerAdsPage,
      final int currentProjectsPage,
      final int currentCallbackRequestsPage,
      final int currentVerificationRequestsPage,
      final int currentHomeLoansPage,
      final int currentInteriorDesignsPage,
      final int currentRequestsPage,
      final int currentAdsPage,
      final int currentServicesPage,
      final int currentPropertiesPage,
      final int currentCompaniesPage,
      final bool hasMore,
      final bool hasMorePostAds,
      final bool hasMoreBannerAds,
      final bool hasMoreProjects,
      final bool hasMoreCallbackRequests,
      final bool hasMoreVerificationRequests,
      final bool hasMoreHomeLoans,
      final bool hasMoreInteriorDesigns,
      final bool hasMoreRequests,
      final bool hasMoreAds,
      final bool hasMoreServices,
      final bool hasMoreProperties,
      final bool hasMoreCompanies,
      final List<ReelResponseModel>? adminReels,
      final int currentAdminReelsPage,
      final bool hasMoreAdminReels,
      final List<AdminCompanyModel>? gstPendingCompanies,
      final int currentGstPendingPage,
      final bool hasMoreGstPending}) = _$AdminStateImpl;

  @override
  bool get isLoading;
  @override
  List<UserModel>? get users;
  @override
  List<PostAdModel>? get postAds;
  @override
  List<BannerAdModel>? get bannerAds;
  @override
  List<ProjectsAdminViewModel>? get projects;
  @override
  List<CallbackRequestModel>? get callbackRequests;
  @override
  List<VerificationRequestModel>? get verificationRequests;
  @override
  List<HomeLoanModel>? get homeLoans;
  @override
  List<InteriorDesignModel>? get interiorDesigns;
  @override
  List<RequestModel>? get requests;
  @override
  List<AdUserModel>? get ads;
  @override
  List<ServicesResponseModel>? get services;
  @override
  List<FeedPostsResponseModel>? get properties;
  @override
  List<AdminCompanyModel>? get companies;
  @override
  NotifyStatus? get notifyStatus;
  @override
  int get currentPage;
  @override
  int get currentPostAdsPage;
  @override
  int get currentBannerAdsPage;
  @override
  int get currentProjectsPage;
  @override
  int get currentCallbackRequestsPage;
  @override
  int get currentVerificationRequestsPage;
  @override
  int get currentHomeLoansPage;
  @override
  int get currentInteriorDesignsPage;
  @override
  int get currentRequestsPage;
  @override
  int get currentAdsPage;
  @override
  int get currentServicesPage;
  @override
  int get currentPropertiesPage;
  @override
  int get currentCompaniesPage;
  @override
  bool get hasMore;
  @override
  bool get hasMorePostAds;
  @override
  bool get hasMoreBannerAds;
  @override
  bool get hasMoreProjects;
  @override
  bool get hasMoreCallbackRequests;
  @override
  bool get hasMoreVerificationRequests;
  @override
  bool get hasMoreHomeLoans;
  @override
  bool get hasMoreInteriorDesigns;
  @override
  bool get hasMoreRequests;
  @override
  bool get hasMoreAds;
  @override
  bool get hasMoreServices;
  @override
  bool get hasMoreProperties;
  @override
  bool get hasMoreCompanies;
  @override
  List<ReelResponseModel>? get adminReels;
  @override
  int get currentAdminReelsPage;
  @override
  bool get hasMoreAdminReels;
  @override
  List<AdminCompanyModel>? get gstPendingCompanies;
  @override
  int get currentGstPendingPage;
  @override
  bool get hasMoreGstPending;
  @override
  @JsonKey(ignore: true)
  _$$AdminStateImplCopyWith<_$AdminStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
