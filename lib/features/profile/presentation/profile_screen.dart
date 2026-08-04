import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:propertify/l10n/app_localizations.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_menu_item.dart';
import 'package:propertify/features/feed/presentation/widgets/full_screen_image_viewer.dart';
import 'package:propertify/features/profile/presentation/my_dashboard_screen.dart';
import 'package:propertify/features/profile/presentation/feedback_screen.dart';
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
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
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
                            onViewImage: () {
                              if (state.userProfile?.profilepic != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FullScreenImageViewer(
                                      images: [state.userProfile!.profilepic!],
                                      initialIndex: 0,
                                    ),
                                  ),
                                );
                              }
                            },
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
                                  Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3),
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
                                Text(
                                  l10n.welcomeToPropertify,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  l10n.signInToSync,
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
                                      foregroundColor:
                                          Theme.of(context).primaryColor,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: Text(
                                      l10n.getStarted,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                    // Menu Items
                    if (homeState.showAddButton) const Divider(),

                    BlocBuilder<CompanyBloc, CompanyState>(
                      builder: (context, companyState) {
                        return Column(
                          children: [
                            // My Company button (show if company exists and is verified)
                            if (homeState.showAddButton &&
                                companyState.myCompany != null &&
                                companyState.myCompany?.gstVerificationStatus ==
                                    'approved')
                              CommonCustomButton(
                                onTap: () {
                                  if (state.userProfile?.id != null) {
                                    context.push(
                                      MyCompanyScreen.routeName,
                                      extra: state.userProfile!.id,
                                    );
                                  }
                                },
                                buttonLabel: l10n.myCompany,
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          Icons.av_timer_rounded,
                                          color: Colors.orange,
                                          size: 24,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              l10n.verificationInProgress,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              l10n.usuallyTakes24Hours,
                                              style: const TextStyle(
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
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: const Icon(
                                            Icons.error_outline_rounded,
                                            color: Colors.red,
                                            size: 24,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                l10n.gstRejected,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                l10n.pleaseUpdateGst,
                                                style: const TextStyle(
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
                                          Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.1),
                                          Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.05),
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
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Icon(
                                            Icons.verified_user,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 24,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                l10n.verifyGst,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                l10n.verifyGstToCreate,
                                                style: const TextStyle(
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

                            if (homeState.showAddButton &&
                                companyState.myCompany == null) ...[
                              AdSliderWidget(
                                title: l10n.wantToCreateProject,
                                caption: l10n.createCompanyByGst,
                                onCreateRequest: () {
                                  context.push(GstVerificationScreen.routeName);
                                },
                                createButtonText: l10n.createCompany,
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
                            final role = state.userProfile?.role?.toLowerCase() ??
                                serviceLocator<AppCacheService>()
                                    .getRole()
                                    ?.toLowerCase();

                            return Column(
                              children: [
                                if (role == 'admin' || role == 'seller' || role == 'marketing')
                                  Divider(
                                    height: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                if (role == 'admin')
                                  ProfileMenuItem(
                                    icon: Icons.admin_panel_settings_outlined,
                                    title: l10n.adminDashboard,
                                    onTap: () {
                                      context.push(
                                        AdminDashboardScreen.routeName,
                                      );
                                    },
                                  ),
                                if (role == 'seller')
                                  ProfileMenuItem(
                                    icon: Icons.dashboard_outlined,
                                    title: l10n.homeLoansDashboard,
                                    onTap: () {
                                      context.push(
                                        '${AdminDashboardScreen.routeName}?isSeller=true',
                                      );
                                    },
                                  ),
                                if (role == 'marketing')
                                  ProfileMenuItem(
                                    icon: Icons.campaign_outlined,
                                    title: l10n.interiorDesignDashboard,
                                    onTap: () {
                                      context.push(
                                        '${AdminDashboardScreen.routeName}?isMarketing=true',
                                      );
                                    },
                                  ),
                                if (role == 'admin' || role == 'seller' || role == 'marketing')
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
                            title: l10n.myDashboard,
                            onTap: () {
                              context.push(MyDashboardScreen.routeName);
                            },
                          ),
                        ProfileMenuItem(
                          icon: Icons.feedback_outlined,
                          title: l10n.suggestionsFeedback,
                          onTap: () {
                            context.push(FeedbackScreen.routeName);
                          },
                        ),
                        ProfileMenuItem(
                          icon: Icons.star_outline,
                          title: l10n.rateUs,
                          onTap: () async {
                            final Uri url = Platform.isAndroid
                                ? Uri.parse(
                                    'https://play.google.com/store/apps/details?id=com.placeofsalesrealestate',
                                  )
                                : Uri.parse(
                                    'https://apps.apple.com/in/app/propertify-buy-sell-rent/id6763365054?action=write-review',
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
                          icon: Icons.phone_outlined,
                          title: l10n.contactUs,
                          onTap: () async {
                            final Uri url = Uri.parse(
                              'https://propertifyapp.com/contact-us-two/',
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
                          title: l10n.termsConditions,
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
                          title: l10n.privacyPolicy,
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
                          title: l10n.inviteFriends,
                          onTap: () {
                            try {
                              final isAndroid = Platform.isAndroid;
                              final String appLink = isAndroid
                                  ? 'https://play.google.com/store/apps/details?id=com.placeofsalesrealestate'
                                  : 'https://apps.apple.com/in/app/propertify-buy-sell-rent/id6763365054';
                              Share.share(
                                'Check out Propertify! $appLink',
                                subject: 'Join me on Propertify',
                              );
                            } catch (e) {
                              debugPrint('Error sharing: $e');
                              // Fallback share if Platform check fails (e.g. Web)
                              Share.share(
                                'Check out Propertify! https://play.google.com/store/apps/details?id=com.placeofsalesrealestate',
                                subject: 'Join me on Propertify',
                              );
                            }
                          },
                        ),
                        _buildFollowUsSection(l10n),

                        if (homeState.showAddButton)
                          GestureDetector(
                            onTap: () {
                              _showSignOutDialog(context, l10n);
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                l10n.signOut,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 16),
                        SafeArea(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    l10n.madeWith,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red.shade400,
                                    size: 14,
                                  ),
                                  Text(
                                    l10n.inIndia,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'v7.0.39',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade400,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
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

  Widget _buildFollowUsSection(AppLocalizations l10n) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          l10n.followUs,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialIcon(
              icon: FontAwesomeIcons.facebook,

              color: const Color(0xFF1877F2),
              onTap: () => _launchExternalUrl('https://www.facebook.com/1251613104692490'),
            ),
            const SizedBox(width: 24),
            _socialIcon(
              icon: FontAwesomeIcons.instagram,
              color: const Color(0xFFE4405F),
              onTap: () => _launchExternalUrl('https://www.instagram.com/propertifyapp?igsh=MTE4d2VydXJxd2x6&utm_source=qr'),
            ),
            const SizedBox(width: 24),
            _socialIcon(
              icon: FontAwesomeIcons.whatsapp,
              color: const Color(0xFF25D366),
              onTap: () => _launchExternalUrl('https://whatsapp.com/channel/0029Vb7oK1r7oQhUoESENq3n'),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _socialIcon({
    required dynamic icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.1),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: FaIcon(icon, color: color, size: 22),
      ),
    );
  }

  Future<void> _launchExternalUrl(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Error launching social URL: $e');
    }
  }

  void _showImagePicker(BuildContext context) async {
    final file = await ImagePickerUtil.showImageSourceBottomSheet(context);
    if (file != null && context.mounted) {
      context
          .read<ProfileBloc>()
          .add(ProfileEvent.uploadProfileImage(imagePath: file.path));
    }
  }

  void _showSignOutDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(l10n.signOut),
          content: Text(l10n.signOutConfirm),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () {
                logout(context: context);
              },
              child: Text(
                l10n.signOut,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
