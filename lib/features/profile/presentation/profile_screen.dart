import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/core/logout.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/company/bloc/company_bloc.dart';
import 'package:propertify/features/company/presentation/gst_verification_screen.dart';
import 'package:propertify/features/company/presentation/my_company.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/home/presentation/widgets/home_loan_widget.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import '../bloc/profile_bloc.dart';
import '../../../utils/image_picker_util.dart';
import 'package:propertify/core/app_cache_service.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_menu_item.dart';
import 'package:propertify/features/profile/presentation/my_dashboard_screen.dart';
import '../../services/presentation/my_services_screen.dart';
import '../../admin/presentation/admin_dashboard_screen.dart';
import 'package:propertify/utils/custom_toast.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    checkAccessToken();
  }

  void checkAccessToken() {
    // if (context.read<HomeBloc>().state.showAddButton) {
    context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());
    context.read<HomeBloc>().add(HomeEvent.checkToken());
    context.read<CompanyBloc>().add(const CompanyEvent.getMyCompany());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Colors.black87),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      //   title: const Text(
      //     'Profile',
      //     style: TextStyle(
      //       color: Colors.black87,
      //       fontSize: 18,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, homeState) {
          return BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state.isLoading && state.userProfile == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Profile Header with Image and Name
                    homeState.showAddButton
                        ? ProfileHeader(
                            userProfile: state.userProfile,
                            onImageTap: () => _showImagePicker(context),
                            isLoading: state.isLoading,
                          )
                        : Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.symmetric(
                              vertical: 24,
                              horizontal: 24,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).primaryColor,
                                  Theme.of(
                                    context,
                                  ).primaryColor.withOpacity(0.8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(
                                    context,
                                  ).primaryColor.withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    color: Colors.white24,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.person_outline_rounded,
                                    size: 48,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Welcome to Propertify',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Sign in to sync your favorites and manage your listings across devices',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(height: 28),
                                SizedBox(
                                  width: 180,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.go(AuthScreen.routeName);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Theme.of(
                                        context,
                                      ).primaryColor,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Text(
                                      'Get Started',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                    // Profile Stats
                    // ProfileStats(
                    //   postsCount: state.userProfile?.postsCount ?? 200,
                    //   viewsCount: state.userProfile?.viewsCount ?? 14,
                    //   enquiresCount: state.userProfile?.enquiresCount ?? 243,
                    //   soldsCount: state.userProfile?.soldsCount ?? 24,
                    // ),

                    // Menu Items
                    if (homeState.showAddButton) const Divider(),

                    BlocBuilder<CompanyBloc, CompanyState>(
                      builder: (context, companyState) {
                        return Column(
                          children: [
                            // My Company button (show if company exists)
                            if (homeState.showAddButton &&
                                companyState.myCompany != null)
                              CommonCustomButton(
                                onTap: () {
                                  if (state.userProfile?.id != null) {
                                    context.push(
                                      MyCompanyScreen.routeName,
                                      extra: state.userProfile!.id,
                                    );
                                  }
                                },
                                buttonLabel: 'My Company',
                              ),

                            // Verification Pending Banner
                            if (homeState.showAddButton &&
                                companyState.myCompany != null &&
                                companyState.myCompany?.gstVerificationStatus ==
                                    'pending') ...[
                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.orange,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.orange.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.av_timer_rounded,
                                          color: Colors.orange,
                                          size: 24,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      const Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Verification in progress',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'Usually takes 24 hours',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],

                            // Verification Rejected Banner
                            if (homeState.showAddButton &&
                                companyState.myCompany != null &&
                                companyState.myCompany?.gstVerificationStatus ==
                                    'rejected') ...[
                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    CustomToast.showWarningToast(
                                      msg: 'Feature coming soon',
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.red,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Colors.red.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.error_outline_rounded,
                                            color: Colors.red,
                                            size: 24,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        const Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'GST Verification is Rejected',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                'Please update the GST again',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],

                            // Verify GST Banner (when company exists but not verified)
                            if (homeState.showAddButton &&
                                companyState.myCompany != null &&
                                (companyState
                                            .myCompany
                                            ?.gstVerificationStatus ==
                                        'none' ||
                                    companyState
                                            .myCompany
                                            ?.gstVerificationStatus ==
                                        null)) ...[
                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    context.push(
                                      '/verification-payment?type=gst&entityId=${companyState.myCompany?.id}&showSkip=false',
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Theme.of(
                                            context,
                                          ).primaryColor.withOpacity(0.1),
                                          Theme.of(
                                            context,
                                          ).primaryColor.withOpacity(0.05),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Theme.of(
                                              context,
                                            ).primaryColor.withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.verified_user,
                                            color: Theme.of(
                                              context,
                                            ).primaryColor,
                                            size: 24,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Verify GST',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              const Text(
                                                'Verify GST to start creating projects',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],

                            // if (homeState.showAddButton &&
                            //     companyState.myCompany != null) ...[
                            //   Padding(
                            //     padding: const EdgeInsets.symmetric(
                            //       horizontal: 16.0,
                            //     ),
                            //     child: ProfileStatusCard(
                            //       title: 'GST Verification',
                            //       subtitle: 'Please wait 24 hrs to Complete',
                            //       buttonText: 'Pending',
                            //       onButtonTap: () {},
                            //       imagePath: 'assets/images/gst_inreview.svg',
                            //       isSvg: true,
                            //     ),
                            //   ),
                            //   Padding(
                            //     padding: const EdgeInsets.symmetric(
                            //       horizontal: 16.0,
                            //     ),
                            //     child: ProfileStatusCard(
                            //       title: 'You GST Verified Sucessfully ',
                            //       subtitle: 'Add your Company Details',
                            //       buttonText: 'Successful',
                            //       onButtonTap: () {},
                            //       imagePath: 'assets/images/gst_verified.svg',
                            //       isSvg: true,
                            //     ),
                            //   ),
                            // ],
                            if (homeState.showAddButton &&
                                companyState.myCompany == null) ...[
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //     horizontal: 16.0,
                              //   ),
                              //   child: ProfileStatusCard(
                              //     title: 'GST Verification',
                              //     subtitle: 'Please wait 24 hrs to Complete',
                              //     buttonText: 'Pending',
                              //     onButtonTap: () {},
                              //     imagePath: 'assets/images/gst_inreview.svg',
                              //     isSvg: true,
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //     horizontal: 16.0,
                              //   ),
                              //   child: ProfileStatusCard(
                              //     title: 'You GST Verified Sucessfully ',
                              //     subtitle: 'Add your Company Details',
                              //     buttonText: 'Successful',
                              //     onButtonTap: () {},
                              //     imagePath: 'assets/images/gst_verified.svg',
                              //     isSvg: true,
                              //   ),
                              // ),
                              AdSliderWidget(
                                title: 'Want to create a Project!',
                                caption:
                                    'First Create a company by Verifying GST',
                                onCreateRequest: () {
                                  context.push(GstVerificationScreen.routeName);
                                },
                                createButtonText: 'Create Company',
                                showExploreDetailsButton: false,
                                backgroundImagePath:
                                    'assets/images/create_company_banner.svg',
                              ),
                            ],
                          ],
                        );
                      },
                    ),

                    if (homeState.showAddButton) const Divider(),
                    Column(
                      children: [
                        if (homeState.showAddButton) ...[
                          () {
                            final role =
                                state.userProfile?.role?.toLowerCase() ??
                                serviceLocator<AppCacheService>()
                                    .getRole()
                                    ?.toLowerCase();

                            return Column(
                              children: [
                                if (role == 'admin' || role == 'seller')
                                  Divider(
                                    height: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                if (role == 'admin')
                                  ProfileMenuItem(
                                    icon: Icons.admin_panel_settings_outlined,
                                    title: 'Admin Dashboard',
                                    onTap: () {
                                      context.push(
                                        AdminDashboardScreen.routeName,
                                      );
                                    },
                                  ),
                                if (role == 'seller')
                                  ProfileMenuItem(
                                    icon: Icons.dashboard_outlined,
                                    title: 'Seller Dashboard',
                                    onTap: () {
                                      context.push(
                                        '${AdminDashboardScreen.routeName}?isSeller=true',
                                      );
                                    },
                                  ),
                                if (role == 'admin' || role == 'seller')
                                  Divider(
                                    height: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                              ],
                            );
                          }(),
                        ],

                        if (homeState.showAddButton)
                          ProfileMenuItem(
                            icon: Icons.dashboard_outlined,
                            title: 'My Dashboard',
                            onTap: () {
                              context.push(MyDashboardScreen.routeName);
                            },
                          ),
                        ProfileMenuItem(
                          icon: Icons.star_outline,
                          title: 'Rate Us',
                          onTap: () async {
                            Uri url;
                            if (Platform.isAndroid) {
                              // Android - Play Store
                              url = Uri.parse(
                                'https://play.google.com/store/apps/details?id=com.placeofsalesrealestate',
                              );
                            } else if (Platform.isIOS) {
                              // iOS - App Store (replace XXXXXXXXXX with your actual App Store ID)
                              url = Uri.parse(
                                'https://apps.apple.com/app/idXXXXXXXXXX?action=write-review',
                              );
                            } else {
                              // Fallback to Play Store
                              url = Uri.parse(
                                'https://play.google.com/store/apps/details?id=com.placeofsalesrealestate',
                              );
                            }

                            if (await canLaunchUrl(url)) {
                              await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                        ),
                        ProfileMenuItem(
                          icon: Icons.phone_outlined,
                          title: 'Contact us',
                          onTap: () async {
                            final Uri url = Uri.parse(
                              'https://avontra.in/index.php/contact-us/',
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                        ),
                        ProfileMenuItem(
                          icon: Icons.info_outline,
                          title: 'Terms and Conditions',
                          onTap: () async {
                            final Uri url = Uri.parse(
                              'https://propertifyapp.com/terms-and-conditions/',
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                        ),
                        ProfileMenuItem(
                          icon: Icons.privacy_tip_outlined,
                          title: 'Privacy Policy',
                          onTap: () async {
                            final Uri url = Uri.parse(
                              'https://propertifyapp.com/our-features-one/',
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                        ),
                        ProfileMenuItem(
                          icon: Icons.person_add_outlined,
                          title: 'Invite Friends',
                          onTap: () {
                            Share.share(
                              'Check out Propertify! https://play.google.com/store/apps/details?id=com.placeofsalesrealestate',
                              subject: 'Join me on Propertify',
                            );
                          },
                        ),

                        // Sign Out Button
                        if (homeState.showAddButton)
                          GestureDetector(
                            onTap: () {
                              _showSignOutDialog(context);
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: const Text(
                                'Sign Out',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 32),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Powered by',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            SvgPicture.asset(
                              'assets/images/soho_logo.svg',
                              height: 32,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showImagePicker(BuildContext context) async {
    final File? image = await ImagePickerUtil.showImageSourceBottomSheet(
      context,
    );
    if (image != null) {
      context.read<ProfileBloc>().add(
        ProfileEvent.uploadProfileImage(imagePath: image.path),
      );
    }
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                logout(context: context);
                // Add sign out logic here
                // context.read<AuthBloc>().add(const AuthEvent.logout());
              },
              child: const Text(
                'Sign Out',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
