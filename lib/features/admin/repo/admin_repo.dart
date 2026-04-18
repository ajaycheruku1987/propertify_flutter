import 'package:dartz/dartz.dart';
import 'package:propertify/core/api_request/api_request.dart';
import 'package:propertify/core/failure.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/utils/extensions/http_extension.dart';

import '../models/admin_companies_response_model.dart';
import '../models/admin_view_properties_model.dart';
import '../models/admin_view_services_model.dart';
import '../models/ads_response_model.dart';
import '../models/banner_ads_response_model.dart';
import '../models/callback_requests_response_model.dart';
import '../models/home_loans_response_model.dart';
import '../models/interior_designs_response_model.dart';
import '../models/post_ads_response_model.dart';
import '../models/projects_admin_view_model.dart';
import '../models/requests_response_model.dart';
import '../models/user_list_response_model.dart';
import '../models/verification_requests_response_model.dart';
import '../models/admin_reels_response_model.dart';

class AdminRepo {
  final ftPyroApiRequest = serviceLocator<ApiRequest>();

  /// Get User List API
  Future<Either<Failure, UserListResponseModel>> getUserList({
    required int page,
    required int limit,
    String? role,
    String? search,
  }) async {
    // Build query string manually since get method doesn't support queryParameters
    var queryString = '?page=$page&limit=$limit';
    if (role != null && role.isNotEmpty) {
      queryString += '&role=$role';
    }
    if (search != null && search.isNotEmpty) {
      queryString += '&search=$search';
    }

    final response = await ftPyroApiRequest.get('/admin/users$queryString');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(UserListResponseModel.fromJson(right)),
    );
  }

  /// Remove User API
  Future<Either<Failure, Map<String, dynamic>>> removeUser({
    required String userId,
  }) async {
    final response = await ftPyroApiRequest.delete('/admin/users/$userId');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Convert Users to Admin
  Future<Either<Failure, Map<String, dynamic>>> convertToAdmin({
    required List<String> userIds,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/admin/users/convert-to-admin',
      data: {'user_ids': userIds},
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Convert Users to Seller
  Future<Either<Failure, Map<String, dynamic>>> convertToSeller({
    required List<String> userIds,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/admin/users/convert-to-seller',
      data: {'user_ids': userIds},
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Convert Users to Regular User (remove admin/seller role)
  Future<Either<Failure, Map<String, dynamic>>> convertToUser({
    required List<String> userIds,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/admin/users/convert-to-user',
      data: {'user_ids': userIds},
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Get Post Ads API
  Future<Either<Failure, PostAdsResponseModel>> getPostAds({
    required int page,
    required int limit,
  }) async {
    // Build query string manually since get method doesn't support queryParameters
    final queryString = '?page=$page&limit=$limit';

    final response = await ftPyroApiRequest.get('/admin/posts$queryString');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(PostAdsResponseModel.fromJson(right)),
    );
  }

  /// Delete Post Ad API
  Future<Either<Failure, Map<String, dynamic>>> deletePostAd({
    required String postId,
  }) async {
    final response = await ftPyroApiRequest.delete('/admin/posts/$postId');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Get Banner Ads API
  Future<Either<Failure, BannerAdsResponseModel>> getBannerAds({
    required int page,
    required int limit,
  }) async {
    // Build query string manually since get method doesn't support queryParameters
    final queryString = '?page=$page&limit=$limit';

    final response = await ftPyroApiRequest.get(
      '/admin/banner-ads$queryString',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(BannerAdsResponseModel.fromJson(right)),
    );
  }

  /// Delete Banner Ad API
  Future<Either<Failure, Map<String, dynamic>>> deleteBannerAd({
    required String bannerAdId,
  }) async {
    final response = await ftPyroApiRequest.delete(
      '/admin/banner-ads/$bannerAdId',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Get Projects API
  Future<Either<Failure, ProjectsAdminResponse>> getProjects({
    required int page,
    required int limit,
  }) async {
    final queryString = '?page=$page&limit=$limit';

    final response = await ftPyroApiRequest.get(
      '/admin/sales-projects$queryString',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(ProjectsAdminResponse.fromJson(right)),
    );
  }

  /// Delete Project API
  Future<Either<Failure, Map<String, dynamic>>> deleteProject({
    required String projectId,
  }) async {
    final response = await ftPyroApiRequest.delete(
      '/admin/sales-projects/$projectId',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Get Callback Requests
  Future<Either<Failure, CallbackRequestsResponseModel>> getCallbackRequests({
    required int page,
    required int limit,
  }) async {
    final queryString = '?page=$page&limit=$limit';

    final response = await ftPyroApiRequest.get(
      '/admin/sales-project-callbacks$queryString',
    );
    final responseData = await response.getResponse();
    return responseData.fold((failure) => Left(failure), (right) {
      return Right(
        CallbackRequestsResponseModel.fromJson(right as Map<String, dynamic>),
      );
    });
  }

  /// Delete Callback Request API
  Future<Either<Failure, Map<String, dynamic>>> deleteCallbackRequest({
    required String callbackRequestId,
  }) async {
    final response = await ftPyroApiRequest.delete(
      '/admin/sales-project-callbacks/$callbackRequestId',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Get Verification Requests API
  Future<Either<Failure, VerificationRequestsResponseModel>>
  getVerificationRequests({required int page, required int limit}) async {
    final queryString = '?page=$page&limit=$limit';

    final response = await ftPyroApiRequest.get(
      '/admin/verification-requests$queryString',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(VerificationRequestsResponseModel.fromJson(right)),
    );
  }

  /// Delete Verification Request API
  Future<Either<Failure, Map<String, dynamic>>> deleteVerificationRequest({
    required String verificationRequestId,
  }) async {
    final response = await ftPyroApiRequest.delete(
      '/admin/verification-requests/$verificationRequestId',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Update Verification Status API
  Future<Either<Failure, Map<String, dynamic>>> updateVerificationStatus({
    required String verificationRequestId,
    required String status,
  }) async {
    final response = await ftPyroApiRequest.put(
      '/admin/verification-requests/$verificationRequestId',
      data: {'status': status},
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Get Home Loans API
  Future<Either<Failure, HomeLoansResponseModel>> getHomeLoans({
    required int page,
    required int limit,
  }) async {
    final queryString = '?page=$page&limit=$limit';

    final response = await ftPyroApiRequest.get(
      '/admin/home-loans$queryString',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(HomeLoansResponseModel.fromJson(right)),
    );
  }

  /// Get Interior Designs API
  Future<Either<Failure, InteriorDesignsResponseModel>> getInteriorDesigns({
    required int page,
    required int limit,
  }) async {
    final queryString = '?page=$page&limit=$limit';

    final response = await ftPyroApiRequest.get(
      '/admin/interior-designs$queryString',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(InteriorDesignsResponseModel.fromJson(right)),
    );
  }

  /// Get Requests API
  Future<Either<Failure, AdminViewRequestsModel>> getRequests({
    required int page,
    required int limit,
    String? category,
    String? search,
  }) async {
    String queryString = '?page=$page&limit=$limit';
    if (category != null && category.isNotEmpty) {
      queryString += '&category=${Uri.encodeComponent(category)}';
    }
    if (search != null && search.isNotEmpty) {
      queryString += '&search=${Uri.encodeComponent(search)}';
    }

    final response = await ftPyroApiRequest.get('/admin/requests$queryString');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(AdminViewRequestsModel.fromJson(right)),
    );
  }

  /// Delete Request API
  Future<Either<Failure, Map<String, dynamic>>> deleteRequest({
    required String requestId,
  }) async {
    final response = await ftPyroApiRequest.delete(
      '/admin/requests/$requestId',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Get Ads API
  Future<Either<Failure, AdsResponseModel>> getAds({
    required int page,
    required int limit,
  }) async {
    final queryString = '?page=$page&limit=$limit';

    final response = await ftPyroApiRequest.get('/admin/ads$queryString');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(AdsResponseModel.fromJson(right)),
    );
  }

  /// Remove Ad User API
  Future<Either<Failure, Map<String, dynamic>>> removeAdUser({
    required String adUserId,
  }) async {
    final response = await ftPyroApiRequest.delete('/admin/ads/$adUserId');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Get Services API
  Future<Either<Failure, AdminViewServicesModel>> getServices({
    required int page,
    required int limit,
    String? search,
  }) async {
    String queryString = '?page=$page&limit=$limit';
    if (search != null && search.isNotEmpty) {
      queryString += '&search=${Uri.encodeComponent(search)}';
    }

    final response = await ftPyroApiRequest.get('/admin/services$queryString');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(AdminViewServicesModel.fromJson(right)),
    );
  }

  /// Delete Service API
  Future<Either<Failure, Map<String, dynamic>>> deleteService({
    required String serviceId,
  }) async {
    final response = await ftPyroApiRequest.delete(
      '/admin/services/$serviceId',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Get Admin Properties API
  Future<Either<Failure, AdminViewPropertiesModel>> getAdminProperties({
    required int page,
    required int limit,
    String? search,
  }) async {
    String queryString = '?page=$page&limit=$limit';
    if (search != null && search.isNotEmpty) {
      queryString += '&search=${Uri.encodeComponent(search)}';
    }

    final response = await ftPyroApiRequest.get(
      '/admin/properties$queryString',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(AdminViewPropertiesModel.fromJson(right)),
    );
  }

  /// Delete Admin Property API
  Future<Either<Failure, Map<String, dynamic>>> deleteAdminProperty({
    required String propertyId,
  }) async {
    final response = await ftPyroApiRequest.delete(
      '/admin/properties/$propertyId',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Verify Service API
  Future<Either<Failure, Map<String, dynamic>>> verifyService({
    required String serviceId,
    required bool isVerified,
  }) async {
    final response = await ftPyroApiRequest.patch(
      '/admin/services/$serviceId/verify?is_verified=$isVerified',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Get Companies API
  Future<Either<Failure, AdminCompaniesResponseModel>> getCompanies({
    required int page,
    required int limit,
  }) async {
    final queryString = '?page=$page&limit=$limit';

    final response = await ftPyroApiRequest.get('/admin/companies$queryString');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(AdminCompaniesResponseModel.fromJson(right)),
    );
  }

  /// Delete Company API
  Future<Either<Failure, String>> deleteCompany({
    required String companyId,
  }) async {
    final response = await ftPyroApiRequest.delete(
      '/admin/companies/$companyId',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right['message'] ?? 'Company deleted successfully'),
    );
  }

  /// Get Admin Reels API
  Future<Either<Failure, AdminReelsResponseModel>> getAdminReels({
    required int page,
    required int limit,
  }) async {
    final queryString = '?page=$page&limit=$limit';

    final response = await ftPyroApiRequest.get('/admin/reels$queryString');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(AdminReelsResponseModel.fromJson(right)),
    );
  }

  /// Delete Reel API
  Future<Either<Failure, Map<String, dynamic>>> deleteAdminReel({
    required String reelId,
  }) async {
    final response = await ftPyroApiRequest.delete('/admin/reels/$reelId');
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Get GST Pending Companies API
  Future<Either<Failure, AdminCompaniesResponseModel>> getGstPendingCompanies({
    required int page,
    required int limit,
  }) async {
    final queryString = '?page=$page&limit=$limit';

    final response = await ftPyroApiRequest.get(
      '/admin/companies/gst-pending$queryString',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(AdminCompaniesResponseModel.fromJson(right)),
    );
  }

  /// Approve GST API
  Future<Either<Failure, Map<String, dynamic>>> approveGst({
    required String companyId,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/admin/companies/$companyId/gst-approve',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }

  /// Reject GST API
  Future<Either<Failure, Map<String, dynamic>>> rejectGst({
    required String companyId,
  }) async {
    final response = await ftPyroApiRequest.post(
      '/admin/companies/$companyId/gst-reject',
    );
    final responseData = await response.getResponse();
    return responseData.fold(
      (failure) => Left(failure),
      (right) => Right(right as Map<String, dynamic>),
    );
  }
}
