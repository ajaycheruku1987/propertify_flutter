import 'package:go_router/go_router.dart';
import 'package:propertify/app.dart';
import 'package:propertify/features/admin/presentation/services_verification_requests_screen.dart';
import 'package:propertify/features/company/presentation/create_company_screen.dart';
import 'package:propertify/features/create_post/presentation/create_post_details_screen.dart';
import 'package:propertify/features/feed/presentation/post_details.dart';
import 'package:propertify/features/home/presentation/home_interior_screen.dart';
import 'package:propertify/features/home/presentation/home_loan_screen.dart';
import 'package:propertify/features/sales/models/sales_model.dart';
import 'package:propertify/features/sales/presentation/sale_view_screen.dart';
import 'package:propertify/features/services/presentation/create_service_details.dart';
import 'package:propertify/features/services/presentation/create_service_media.dart';
import 'package:propertify/features/services/presentation/view_service.dart';
import 'package:propertify/features/services/presentation/write_review_screen.dart';
import 'package:propertify/features/services/models/services_response_model.dart';
import 'package:propertify/features/services/presentation/aadhar_verification_screen.dart';
import 'package:propertify/features/services/presentation/service_reviews_screen.dart';
import 'package:propertify/features/profile/presentation/other_user_profile_screen.dart';
import 'package:propertify/features/requests/models/request_response_model.dart';
import 'package:propertify/features/requests/presentation/create_request_details.dart';
import 'package:propertify/features/sales/presentation/create_sales.dart';
import 'package:propertify/features/sales/presentation/create_sales_media.dart';
import 'package:propertify/features/company/presentation/gst_verification_screen.dart';
import 'package:propertify/features/company/presentation/my_company.dart';
import 'package:propertify/features/home/presentation/banner_ad_detail_view.dart';
import 'package:propertify/features/profile/models/banner_ad_model.dart';

import 'package:propertify/features/requests/presentation/edit_request.dart';

import '../../features/admin/presentation/admin_dashboard_screen.dart';
import '../../features/admin/presentation/banner_ads_screen.dart';
import '../../features/admin/presentation/callback_request_screen.dart';
import '../../features/admin/presentation/home_loan_screen.dart' as admin;
import '../../features/admin/presentation/interior_designs_screen.dart'
    as admin;
import '../../features/admin/presentation/admin_profile_screen.dart';
import '../../features/admin/presentation/manage_projects_screen.dart';
import '../../features/admin/presentation/post_ads_screen.dart';
import '../../features/admin/presentation/requests_screen.dart';
import '../../features/admin/presentation/user_list_screen.dart';
import '../../features/admin/presentation/verification_request_screen.dart';
import '../../features/admin/presentation/all_services_list_admin_view.dart';
import '../../features/admin/presentation/properties_list_view_screen.dart';
import '../../features/admin/presentation/admin_companies_screen.dart';
import '../../features/admin/presentation/admin_reels_screen.dart';
import '../../features/admin/presentation/gst_verification_requests_screen.dart';

import '../../features/auth/presentation/auth_screen.dart';
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/auth/presentation/forgot_password_otp_update_password_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/create_post/presentation/create_post_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/my_dashboard_screen.dart';
import '../../features/profile/presentation/my_posts_screen.dart';
import '../../features/profile/presentation/create_banner_ad.dart';
import '../../features/profile/presentation/my_banner_ads_screen.dart';
import '../../features/services/presentation/my_services_screen.dart';
import '../../features/services/presentation/edit_service_screen.dart';
import '../../features/feed/presentation/edit_feed_screen.dart';
import '../../features/feed/presentation/favorites_screen.dart';
import '../../features/requests/presentation/my_requests_screen.dart';
import '../../features/home/models/feed_posts_response_model.dart';
import '../../features/reels/presentation/create_reel.dart';
import '../../features/reels/presentation/my_reels_screen.dart';
import '../../utils/common_widgets/post_success_screen.dart';
import '../../utils/common_widgets/select_plan_screen.dart';
import '../../utils/common_widgets/payment_success_screen.dart';
import '../../utils/common_widgets/payment_failed_screen.dart';
import '../../utils/common_widgets/verification_payment_screen.dart';
import '../../core/content_type.dart';

final router = GoRouter(
  initialLocation: SplashScreen.routeName,
  navigatorKey: navigationKey,
  routes: [
    GoRoute(
      path: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AuthScreen.routeName,
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: ForgotPasswordOtpUpdatePasswordScreen.routeName,
      builder: (context, state) {
        final phoneNumber = state.extra as String;
        return ForgotPasswordOtpUpdatePasswordScreen(phoneNumber: phoneNumber);
      },
    ),
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => HomeScreen(
        shouldRefresh: state.uri.queryParameters['refresh'] == 'true',
        initialHomeIndex: state.uri.queryParameters['tab'] == 'services'
            ? 1
            : 0,
      ),
    ),
    GoRoute(
      path: CreatePostScreen.routeName,
      builder: (context, state) => const CreatePostScreen(),
    ),
    // GoRoute(
    //   path: CreateReelScreen.routeName,
    //   builder: (context, state) => const CreateReelScreen(),
    // ),
    GoRoute(
      path: CreatePostImagesDescriptionScreen.routeName,
      builder: (context, state) => const CreatePostImagesDescriptionScreen(),
    ),
    GoRoute(
      path: ProfileScreen.routeName,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: MyPostsScreen.routeName,
      builder: (context, state) => const MyPostsScreen(),
    ),
    GoRoute(
      path: MyDashboardScreen.routeName,
      builder: (context, state) => const MyDashboardScreen(),
    ),
    GoRoute(
      path: MyServicesScreen.routeName,
      builder: (context, state) => const MyServicesScreen(),
    ),
    GoRoute(
      path: EditServiceScreen.routeName,
      builder: (context, state) {
        final service = state.extra as ServicesResponseModel;
        return EditServiceScreen(service: service);
      },
    ),
    GoRoute(
      path: EditFeedScreen.routeName,
      builder: (context, state) {
        final property = state.extra as FeedPostsResponseModel;
        return EditFeedScreen(property: property);
      },
    ),
    GoRoute(
      path: MyRequestsScreen.routeName,
      builder: (context, state) => const MyRequestsScreen(),
    ),
    GoRoute(
      path: FavoritesScreen.routeName,
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: PostDetailsScreen.routeName,
      builder: (context, state) =>
          PostDetailsScreen(postId: state.uri.queryParameters['postId']!),
    ),
    GoRoute(
      path: CreateServiceDetails.routeName,
      builder: (context, state) => const CreateServiceDetails(),
    ),
    GoRoute(
      path: CreateServiceMedia.routeName,
      builder: (context, state) => const CreateServiceMedia(),
    ),
    GoRoute(
      path: ViewServiceScreen.routeName,
      builder: (context, state) {
        final String serviceId = state.extra as String;
        return ViewServiceScreen(serviceId: serviceId);
      },
    ),
    GoRoute(
      path: WriteReviewScreen.routeName,
      builder: (context, state) {
        if (state.extra is MyReview) {
          final review = state.extra as MyReview;
          return WriteReviewScreen(
            serviceId: review.serviceId!,
            reviewId: review.id,
            initialRating: review.rating?.toDouble(),
            initialReview: review.review,
          );
        }
        final String serviceId = state.extra as String;
        return WriteReviewScreen(serviceId: serviceId);
      },
    ),
    GoRoute(
      path: ServiceReviewsScreen.routeName,
      builder: (context, state) {
        final String serviceId = state.extra as String;
        return ServiceReviewsScreen(serviceId: serviceId);
      },
    ),
    GoRoute(
      path: AadharVerificationScreen.routeName,
      builder: (context, state) {
        final String serviceId = state.extra as String;
        return AadharVerificationScreen(serviceId: serviceId);
      },
    ),
    GoRoute(
      path: OtherUserProfileScreen.routeName,
      builder: (context, state) {
        final String userId = state.extra as String;
        return OtherUserProfileScreen(userId: userId);
      },
    ),
    GoRoute(
      path: CreateRequestDetails.routeName,
      builder: (context, state) {
        final String? categoryType = state.extra as String?;
        return CreateRequestDetails(categoryType: categoryType);
      },
    ),
    GoRoute(
      path: EditRequest.routeName,
      builder: (context, state) {
        final request = state.extra as RequestResponseModel;
        return EditRequest(request: request);
      },
    ),
    GoRoute(
      path: CreateSalesScreen.routeName,
      builder: (context, state) => const CreateSalesScreen(),
    ),
    GoRoute(
      path: SalesProjectImagesDescriptionScreen.routeName,
      builder: (context, state) => const SalesProjectImagesDescriptionScreen(),
    ),
    GoRoute(
      path: HomeInteriorScreen.routeName,
      builder: (context, state) {
        return HomeInteriorScreen();
      },
    ),
    GoRoute(
      path: HomeLoanScreen.routeName,
      builder: (context, state) {
        return HomeLoanScreen();
      },
    ),
    GoRoute(
      path: SaleViewScreen.routeName,
      builder: (context, state) {
        final SaleRecord sale = state.extra as SaleRecord;
        return SaleViewScreen(sale: sale);
      },
    ),
    GoRoute(
      path: CreateReelScreen.routeName,
      builder: (context, state) {
        return CreateReelScreen();
      },
    ),
    GoRoute(
      path: MyReelsScreen.routeName,
      builder: (context, state) {
        return const MyReelsScreen();
      },
    ),
    GoRoute(
      path: CreateCompanyScreen.routeName,
      builder: (context, state) {
        return CreateCompanyScreen();
      },
    ),
    GoRoute(
      path: GstVerificationScreen.routeName,
      builder: (context, state) {
        return const GstVerificationScreen();
      },
    ),
    GoRoute(
      path: MyCompanyScreen.routeName,
      builder: (context, state) {
        final userId = state.extra as String;
        return MyCompanyScreen(userId: userId);
      },
    ),
    GoRoute(
      path: CreateBannerAdScreen.routeName,
      builder: (context, state) {
        return const CreateBannerAdScreen();
      },
    ),
    GoRoute(
      path: MyBannerAdsScreen.routeName,
      builder: (context, state) {
        return const MyBannerAdsScreen();
      },
    ),
    GoRoute(
      path: SelectPlanScreen.routeName,
      builder: (context, state) {
        final params = state.uri.queryParameters;
        return SelectPlanScreen(
          contentType: ContentType.fromString(params['contentType'] ?? 'POST'),
          contentId: params['contentId'] ?? '',
        );
      },
    ),
    GoRoute(
      path: PostSuccessScreen.routeName,
      builder: (context, state) {
        final params = state.uri.queryParameters;
        return PostSuccessScreen(
          title: params['title'],
          message: params['message'],
          boostButtonText: params['boostButtonText'] ?? 'Boost Now',
          skipButtonText: params['skipButtonText'] ?? 'Skip & Continue',
          contentType: ContentType.fromString(params['contentType'] ?? 'POST'),
          onBoostNow: () {
            // Navigate to SelectPlanScreen with content type and ID
            final contentType = params['contentType'] ?? 'post';
            final contentId = params['contentId'] ?? '';
            navigationKey.currentContext?.go(
              '${SelectPlanScreen.routeName}?contentType=$contentType&contentId=$contentId',
            );
          },
          onSkip: () {
            // Navigate to home with refresh
            final homeRoute =
                params['homeRoute'] ?? '${HomeScreen.routeName}?refresh=true';
            navigationKey.currentContext?.go(homeRoute);
          },
        );
      },
    ),
    GoRoute(
      path: PaymentSuccessScreen.routeName,
      builder: (context, state) {
        final params = state.uri.queryParameters;
        return PaymentSuccessScreen(
          contentType: ContentType.fromString(params['contentType'] ?? 'POST'),
          planTitle: params['planTitle'] ?? '',
        );
      },
    ),
    GoRoute(
      path: PaymentFailedScreen.routeName,
      builder: (context, state) {
        final params = state.uri.queryParameters;
        return PaymentFailedScreen(
          errorMessage:
              params['errorMessage'] ??
              'Payment was not completed. Please try again.',
        );
      },
    ),
    GoRoute(
      path: VerificationPaymentScreen.routeName,
      builder: (context, state) {
        final params = state.uri.queryParameters;
        final type = params['type'] ?? 'gst';
        final showSkip = params['showSkip'] == 'true';
        final entityId = params['entityId'];

        return VerificationPaymentScreen(
          verificationType: type == 'aadhaar'
              ? VerificationType.AADHAAR
              : VerificationType.GST,
          entityId: entityId,
          showSkip: showSkip,
        );
      },
    ),
    GoRoute(
      path: AdminDashboardScreen.routeName,
      builder: (context, state) {
        final isSeller = state.uri.queryParameters['isSeller'] == 'true';
        return AdminDashboardScreen(isSeller: isSeller);
      },
    ),
    GoRoute(
      path: UserListScreen.routeName,
      builder: (context, state) =>
          UserListScreen(role: state.uri.queryParameters['role']),
    ),
    GoRoute(
      path: BannerAdsScreen.routeName,
      builder: (context, state) => const BannerAdsScreen(),
    ),
    GoRoute(
      path: CallbackRequestScreen.routeName,
      builder: (context, state) => const CallbackRequestScreen(),
    ),
    GoRoute(
      path: admin.HomeLoanScreen.routeName,
      builder: (context, state) => const admin.HomeLoanScreen(),
    ),
    GoRoute(
      path: admin.InteriorDesignsScreen.routeName,
      builder: (context, state) => const admin.InteriorDesignsScreen(),
    ),
    GoRoute(
      path: ManageProjectsScreen.routeName,
      builder: (context, state) => const ManageProjectsScreen(),
    ),
    GoRoute(
      path: PostAdsScreen.routeName,
      builder: (context, state) => const PostAdsScreen(),
    ),
    GoRoute(
      path: VerificationRequestScreen.routeName,
      builder: (context, state) => const VerificationRequestScreen(),
    ),
    GoRoute(
      path: ServicesVerificationRequests.routeName,
      builder: (context, state) => const ServicesVerificationRequests(),
    ),
    GoRoute(
      path: RequestsScreen.routeName,
      builder: (context, state) =>
          RequestsScreen(category: state.uri.queryParameters['category']),
    ),
    GoRoute(
      path: AllServicesListAdminView.routeName,
      builder: (context, state) => const AllServicesListAdminView(),
    ),
    GoRoute(
      path: AdminProfileScreen.routeName,
      builder: (context, state) => const AdminProfileScreen(),
    ),
    GoRoute(
      path: PropertiesListViewScreen.routeName,
      builder: (context, state) => const PropertiesListViewScreen(),
    ),
    GoRoute(
      path: BannerAdDetailView.routeName,
      builder: (context, state) {
        final bannerAd = state.extra as BannerAdModel;
        return BannerAdDetailView(bannerAd: bannerAd);
      },
    ),
    GoRoute(
      path: AdminCompaniesScreen.routeName,
      builder: (context, state) => const AdminCompaniesScreen(),
    ),
    GoRoute(
      path: AdminReelsScreen.routeName,
      builder: (context, state) => const AdminReelsScreen(),
    ),
    GoRoute(
      path: GstVerificationRequestsScreen.routeName,
      builder: (context, state) => const GstVerificationRequestsScreen(),
    ),
  ],
);
