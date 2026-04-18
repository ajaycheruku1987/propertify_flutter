import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propertify/core/api_request/api_request.dart';
import 'package:propertify/core/notify_message.dart';
import 'package:propertify/utils/custom_toast.dart';

import '../../../core/failure.dart';
import '../../profile/models/banner_ad_model.dart';
import '../models/ad_user_model.dart';
import '../models/ads_response_model.dart';
import '../models/banner_ads_response_model.dart';
import '../models/callback_request_model.dart';
import '../models/callback_requests_response_model.dart';
import '../models/home_loan_model.dart';
import '../models/home_loans_response_model.dart';
import '../models/interior_design_model.dart';
import '../models/interior_designs_response_model.dart';
import '../models/post_ad_model.dart';
import '../models/post_ads_response_model.dart';
import '../models/projects_admin_view_model.dart';
import '../models/project_model.dart';
import '../models/projects_response_model.dart';
import '../models/request_model.dart';
import '../models/requests_response_model.dart';
import '../models/admin_view_services_model.dart';
import '../../services/models/services_response_model.dart';
import '../models/user_list_response_model.dart';
import '../models/admin_view_properties_model.dart';
import '../../home/models/feed_posts_response_model.dart';
import '../models/user_model.dart';
import '../models/verification_request_model.dart';
import '../models/verification_requests_response_model.dart';
import '../models/admin_companies_response_model.dart';
import '../repo/admin_repo.dart';
import '../../reels/models/reel_response_model.dart';

part 'admin_bloc.freezed.dart';
part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminRepo _adminRepo = AdminRepo();

  AdminBloc() : super(const AdminState()) {
    on<_GetUserListEvent>(_onGetUserListEvent);
    on<_RemoveUserEvent>(_onRemoveUserEvent);
    on<_IsLoadingEvent>(_onIsLoadingEvent);
    on<_ClearAdminStateEvent>(_onClearAdminStateEvent);
    on<_GetPostAdsEvent>(_onGetPostAdsEvent);
    on<_DeletePostAdEvent>(_onDeletePostAdEvent);
    on<_GetBannerAdsEvent>(_onGetBannerAdsEvent);
    on<_DeleteBannerAdEvent>(_onDeleteBannerAdEvent);
    on<_GetProjectsEvent>(_onGetProjectsEvent);
    on<_DeleteProjectEvent>(_onDeleteProjectEvent);
    on<_GetCallbackRequestsEvent>(_onGetCallbackRequestsEvent);
    on<_DeleteCallbackRequestEvent>(_onDeleteCallbackRequestEvent);
    on<_GetVerificationRequestsEvent>(_onGetVerificationRequestsEvent);
    on<_DeleteVerificationRequestEvent>(_onDeleteVerificationRequestEvent);
    on<_UpdateVerificationStatusEvent>(_onUpdateVerificationStatusEvent);
    on<_GetHomeLoansEvent>(_onGetHomeLoansEvent);
    on<_GetInteriorDesignsEvent>(_onGetInteriorDesignsEvent);
    on<_GetRequestsEvent>(_onGetRequestsEvent);
    on<_DeleteRequestEvent>(_onDeleteRequestEvent);
    on<_GetAdsEvent>(_onGetAdsEvent);
    on<_RemoveAdUserEvent>(_onRemoveAdUserEvent);
    on<_GetServicesEvent>(_onGetServicesEvent);
    on<_DeleteServiceEvent>(_onDeleteServiceEvent);
    on<_GetAdminPropertiesEvent>(_onGetAdminPropertiesEvent);
    on<_DeleteAdminPropertyEvent>(_onDeleteAdminPropertyEvent);
    on<_VerifyServiceEvent>(_onVerifyServiceEvent);
    on<_GetCompaniesEvent>(_onGetCompaniesEvent);
    on<_DeleteCompanyEvent>(_onDeleteCompanyEvent);
    on<_ConvertToAdminEvent>(_onConvertToAdminEvent);
    on<_ConvertToSellerEvent>(_onConvertToSellerEvent);
    on<_ConvertToUserEvent>(_onConvertToUserEvent);
    on<_GetAdminReelsEvent>(_onGetAdminReelsEvent);
    on<_DeleteAdminReelEvent>(_onDeleteAdminReelEvent);
    on<_GetGstPendingCompaniesEvent>(_onGetGstPendingCompaniesEvent);
    on<_ApproveGstEvent>(_onApproveGstEvent);
    on<_RejectGstEvent>(_onRejectGstEvent);
    on<_ResetEvent>(_onResetEvent);
  }

  void _onClearAdminStateEvent(
    _ClearAdminStateEvent event,
    Emitter<AdminState> emit,
  ) {
    emit(state.copyWith(notifyStatus: null, isLoading: false));
  }

  void _onResetEvent(_ResetEvent event, Emitter<AdminState> emit) {
    emit(const AdminState());
  }

  void _onIsLoadingEvent(_IsLoadingEvent event, Emitter<AdminState> emit) {
    emit(state.copyWith(isLoading: event.flag));
  }

  Future<void> _onGetUserListEvent(
    _GetUserListEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getUserList(
      page: event.page,
      limit: event.limit,
      role: event.role,
      search: event.search,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final users = response.users ?? [];
        final hasMore = users.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            users: event.page == 1 ? users : [...(state.users ?? []), ...users],
            currentPage: event.page,
            hasMore: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onRemoveUserEvent(
    _RemoveUserEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.removeUser(userId: event.userId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        // Remove user from local list
        final updatedUsers = state.users
            ?.where((user) => user.id != event.userId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            users: updatedUsers,
            notifyStatus: NotifyStatus(
              message: 'User removed successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onGetPostAdsEvent(
    _GetPostAdsEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getPostAds(
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final posts = response.posts ?? [];
        final hasMore = posts.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            postAds: event.page == 1
                ? posts
                : [...(state.postAds ?? []), ...posts],
            currentPostAdsPage: event.page,
            hasMorePostAds: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onDeletePostAdEvent(
    _DeletePostAdEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.deletePostAd(postId: event.postId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        // Remove post from local list
        final updatedPosts = state.postAds
            ?.where((post) => post.id != event.postId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            postAds: updatedPosts,
            notifyStatus: NotifyStatus(
              message: 'Post ad deleted successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onGetBannerAdsEvent(
    _GetBannerAdsEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getBannerAds(
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final ads = response.bannerAds ?? [];
        final hasMore = ads.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            bannerAds: event.page == 1
                ? ads
                : [...(state.bannerAds ?? []), ...ads],
            currentBannerAdsPage: event.page,
            hasMoreBannerAds: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onDeleteBannerAdEvent(
    _DeleteBannerAdEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.deleteBannerAd(
      bannerAdId: event.bannerAdId,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        // Remove banner ad from local list
        final updatedAds = state.bannerAds
            ?.where((ad) => ad.id != event.bannerAdId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            bannerAds: updatedAds,
            notifyStatus: NotifyStatus(
              message: 'Banner ad deleted successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onGetProjectsEvent(
    _GetProjectsEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getProjects(
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final projects = response.items ?? [];
        final hasMore = projects.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            projects: event.page == 1
                ? projects
                : [...(state.projects ?? []), ...projects],
            currentProjectsPage: event.page,
            hasMoreProjects: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onDeleteProjectEvent(
    _DeleteProjectEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.deleteProject(projectId: event.projectId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        final updatedProjects = state.projects
            ?.where((project) => project.id != event.projectId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            projects: updatedProjects,
            notifyStatus: NotifyStatus(
              message: 'Project deleted successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onGetCallbackRequestsEvent(
    _GetCallbackRequestsEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getCallbackRequests(
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final requests = response.callbackRequests ?? [];
        final hasMore = requests.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            callbackRequests: event.page == 1
                ? requests
                : [...(state.callbackRequests ?? []), ...requests],
            currentCallbackRequestsPage: event.page,
            hasMoreCallbackRequests: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onDeleteCallbackRequestEvent(
    _DeleteCallbackRequestEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.deleteCallbackRequest(
      callbackRequestId: event.callbackRequestId,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        final updatedRequests = state.callbackRequests
            ?.where((request) => request.id != event.callbackRequestId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            callbackRequests: updatedRequests,
            notifyStatus: NotifyStatus(
              message: 'Callback request deleted successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onGetVerificationRequestsEvent(
    _GetVerificationRequestsEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getVerificationRequests(
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final requests = response.verificationRequests ?? [];
        final hasMore = requests.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            verificationRequests: event.page == 1
                ? requests
                : [...(state.verificationRequests ?? []), ...requests],
            currentVerificationRequestsPage: event.page,
            hasMoreVerificationRequests: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onDeleteVerificationRequestEvent(
    _DeleteVerificationRequestEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.deleteVerificationRequest(
      verificationRequestId: event.verificationRequestId,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        final updatedRequests = state.verificationRequests
            ?.where((request) => request.id != event.verificationRequestId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            verificationRequests: updatedRequests,
            notifyStatus: NotifyStatus(
              message: 'Verification request deleted successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onUpdateVerificationStatusEvent(
    _UpdateVerificationStatusEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.updateVerificationStatus(
      verificationRequestId: event.verificationRequestId,
      status: event.status,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        // Update the status in local list for verification requests
        final updatedRequests = state.verificationRequests?.map((request) {
          if (request.id == event.verificationRequestId) {
            return request.copyWith(status: event.status);
          }
          return request;
        }).toList();

        // Also update the status in local list for services if applicable
        final updatedServices = state.services?.map((service) {
          if (service.id == event.verificationRequestId) {
            return service.copyWith(
              isVerified: event.status == 'approved'
                  ? true
                  : service.isVerified,
            );
          }
          return service;
        }).toList();

        emit(
          state.copyWith(
            isLoading: false,
            verificationRequests: updatedRequests,
            services: updatedServices,
            notifyStatus: NotifyStatus(
              message: 'Verification status updated successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onGetHomeLoansEvent(
    _GetHomeLoansEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getHomeLoans(
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final loans = response.homeLoans ?? [];
        final hasMore = loans.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            homeLoans: event.page == 1
                ? loans
                : [...(state.homeLoans ?? []), ...loans],
            currentHomeLoansPage: event.page,
            hasMoreHomeLoans: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onGetInteriorDesignsEvent(
    _GetInteriorDesignsEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getInteriorDesigns(
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final designs = response.interiorDesigns ?? [];
        final hasMore = designs.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            interiorDesigns: event.page == 1
                ? designs
                : [...(state.interiorDesigns ?? []), ...designs],
            currentInteriorDesignsPage: event.page,
            hasMoreInteriorDesigns: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onGetRequestsEvent(
    _GetRequestsEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getRequests(
      page: event.page,
      limit: event.limit,
      category: event.category,
      search: event.search,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final requests = response.requests ?? [];
        final hasMore = requests.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            requests: event.page == 1
                ? requests
                : [...(state.requests ?? []), ...requests],
            currentRequestsPage: event.page,
            hasMoreRequests: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onDeleteRequestEvent(
    _DeleteRequestEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.deleteRequest(requestId: event.requestId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        final updatedRequests = state.requests
            ?.where((request) => request.id != event.requestId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            requests: updatedRequests,
            notifyStatus: NotifyStatus(
              message: 'Request deleted successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onGetAdsEvent(
    _GetAdsEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getAds(
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final ads = response.ads ?? [];
        final hasMore = ads.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            ads: event.page == 1 ? ads : [...(state.ads ?? []), ...ads],
            currentAdsPage: event.page,
            hasMoreAds: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onRemoveAdUserEvent(
    _RemoveAdUserEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.removeAdUser(adUserId: event.adUserId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        final updatedAds = state.ads
            ?.where((ad) => ad.id != event.adUserId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            ads: updatedAds,
            notifyStatus: NotifyStatus(
              message: 'Ad user removed successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onGetServicesEvent(
    _GetServicesEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getServices(
      page: event.page,
      limit: event.limit,
      search: event.search,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final services = response.services ?? [];
        final hasMore = services.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            services: event.page == 1
                ? services
                : [...(state.services ?? []), ...services],
            currentServicesPage: event.page,
            hasMoreServices: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onDeleteServiceEvent(
    _DeleteServiceEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.deleteService(serviceId: event.serviceId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        final updatedServices = state.services
            ?.where((service) => service.id != event.serviceId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            services: updatedServices,
            notifyStatus: NotifyStatus(
              message: 'Service deleted successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onGetAdminPropertiesEvent(
    _GetAdminPropertiesEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getAdminProperties(
      page: event.page,
      limit: event.limit,
      search: event.search,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final properties = response.properties ?? [];
        final hasMore = properties.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            properties: event.page == 1
                ? properties
                : [...(state.properties ?? []), ...properties],
            currentPropertiesPage: event.page,
            hasMoreProperties: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onDeleteAdminPropertyEvent(
    _DeleteAdminPropertyEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.deleteAdminProperty(
      propertyId: event.propertyId,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        final updatedProperties = state.properties
            ?.where((prop) => prop.id != event.propertyId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            properties: updatedProperties,
            notifyStatus: NotifyStatus(
              message: 'Property deleted successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onVerifyServiceEvent(
    _VerifyServiceEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.verifyService(
      serviceId: event.serviceId,
      isVerified: event.isVerified,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        // Update the is_verified status in local services list
        final updatedServices = state.services?.map((service) {
          if (service.id == event.serviceId) {
            return service.copyWith(isVerified: event.isVerified);
          }
          return service;
        }).toList();

        emit(
          state.copyWith(
            isLoading: false,
            services: updatedServices,
            notifyStatus: NotifyStatus(
              message: 'Service verification updated successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onGetCompaniesEvent(
    _GetCompaniesEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getCompanies(
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final companies = response.companies ?? [];
        final hasMore = companies.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            companies: event.page == 1
                ? companies
                : [...(state.companies ?? []), ...companies],
            currentCompaniesPage: event.page,
            hasMoreCompanies: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onDeleteCompanyEvent(
    _DeleteCompanyEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.deleteCompany(companyId: event.companyId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (message) {
        // Remove company from local list
        final updatedCompanies = state.companies
            ?.where((company) => company.id != event.companyId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            companies: updatedCompanies,
            notifyStatus: NotifyStatus(
              message: message,
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onConvertToAdminEvent(
    _ConvertToAdminEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.convertToAdmin(userIds: event.userIds);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final message =
            response['message'] ?? 'Successfully converted users to Admin';
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: message,
              type: NotifyType.success,
            ),
          ),
        );
        // Refresh the user list with the current role filter
        add(AdminEvent.getUserList(role: event.role));
      },
    );
  }

  Future<void> _onConvertToSellerEvent(
    _ConvertToSellerEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.convertToSeller(userIds: event.userIds);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final message =
            response['message'] ?? 'Successfully converted users to Seller';
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: message,
              type: NotifyType.success,
            ),
          ),
        );
        // Refresh the user list with the current role filter
        add(AdminEvent.getUserList(role: event.role));
      },
    );
  }

  Future<void> _onConvertToUserEvent(
    _ConvertToUserEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.convertToUser(userIds: event.userIds);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final message =
            response['message'] ??
            'Successfully converted users to regular users';
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: message,
              type: NotifyType.success,
            ),
          ),
        );
        // Refresh the user list with the current role filter
        add(AdminEvent.getUserList(role: event.role));
      },
    );
  }

  Future<void> _onGetAdminReelsEvent(
    _GetAdminReelsEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getAdminReels(
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final reels = response.reels ?? [];
        final hasMore = reels.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            adminReels: event.page == 1
                ? reels
                : [...(state.adminReels ?? []), ...reels],
            currentAdminReelsPage: event.page,
            hasMoreAdminReels: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onDeleteAdminReelEvent(
    _DeleteAdminReelEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.deleteAdminReel(reelId: event.reelId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        // Remove the deleted reel from the list locally
        final updatedReels = state.adminReels
            ?.where((reel) => reel.id != event.reelId)
            .toList();
        emit(
          state.copyWith(
            isLoading: false,
            adminReels: updatedReels,
            notifyStatus: NotifyStatus(
              message: 'Reel deleted successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onGetGstPendingCompaniesEvent(
    _GetGstPendingCompaniesEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.getGstPendingCompanies(
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (response) {
        final companies = response.companies ?? [];
        final hasMore =
            (response.total ?? 0) > (event.page * event.limit) ||
            companies.length >= event.limit;

        emit(
          state.copyWith(
            isLoading: false,
            gstPendingCompanies: event.page == 1
                ? companies
                : [...(state.gstPendingCompanies ?? []), ...companies],
            currentGstPendingPage: event.page,
            hasMoreGstPending: hasMore,
            notifyStatus: null,
          ),
        );
      },
    );
  }

  Future<void> _onApproveGstEvent(
    _ApproveGstEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.approveGst(companyId: event.companyId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        final updatedCompanies = state.gstPendingCompanies
            ?.where((company) => company.id != event.companyId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            gstPendingCompanies: updatedCompanies,
            notifyStatus: NotifyStatus(
              message: 'GST Verification Approved successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onRejectGstEvent(
    _RejectGstEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, notifyStatus: null));

    final result = await _adminRepo.rejectGst(companyId: event.companyId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        );
      },
      (success) {
        final updatedCompanies = state.gstPendingCompanies
            ?.where((company) => company.id != event.companyId)
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            gstPendingCompanies: updatedCompanies,
            notifyStatus: NotifyStatus(
              message: 'GST Verification Rejected successfully',
              type: NotifyType.success,
            ),
          ),
        );
      },
    );
  }
}
