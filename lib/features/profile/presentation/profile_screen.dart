import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/core/app_cache_service.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/core/logout.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/company/bloc/company_bloc.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/reels/bloc/reels_bloc.dart';
import '../bloc/profile_bloc.dart';
import '../../../utils/image_picker_util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:propertify/l10n/app_localizations.dart';
import 'widgets/profile_menu_item.dart';
import 'widgets/social_links_widget.dart';
import 'package:propertify/features/profile/presentation/my_dashboard_screen.dart';
import 'package:propertify/features/profile/presentation/edit_profile_screen.dart';
import 'package:propertify/features/profile/presentation/my_banner_ads_screen.dart';
import 'package:propertify/features/profile/presentation/feedback_screen.dart';
import 'package:propertify/features/profile/presentation/deactivate_account_screen.dart';
import 'package:propertify/features/admin/presentation/admin_dashboard_screen.dart';
import 'package:propertify/utils/string_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:propertify/utils/env.dart';

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
    context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());
    context.read<HomeBloc>().add(HomeEvent.checkToken());
    context.read<CompanyBloc>().add(const CompanyEvent.getMyCompany());
    context.read<ProfileBloc>().add(const ProfileEvent.loadMyBannerAds());
  }

  String _resolveImageUrl(String? path) {
    if (path == null || path.isEmpty) return '';
    if (path.startsWith('http://') || path.startsWith('https://')) return path;
    final baseUrl = env.baseUrl.replaceAll('/api', '').replaceAll('api', '');
    if (baseUrl.endsWith('/') && path.startsWith('/')) {
      return baseUrl + path.substring(1);
    }
    if (!baseUrl.endsWith('/') && !path.startsWith('/')) {
      return '$baseUrl/$path';
    }
    return baseUrl + path;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, homeState) {
          return BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, profileState) {
              if (profileState.isLoading && profileState.userProfile == null) {
                return const Center(child: CircularProgressIndicator());
              }

              if (homeState.showAddButton) {
                final userId = profileState.userProfile?.id ??
                    serviceLocator<AppCacheService>().customerAccountId;
                if (userId != null && userId.isNotEmpty) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    final homeBloc = context.read<HomeBloc>();
                    if (homeBloc.state.otherUserPosts == null) {
                      homeBloc.add(HomeEvent.loadOtherUserPosts(
                        userId: userId,
                        limit: 10,
                        offset: 0,
                      ));
                    }
                    final reelsBloc = context.read<ReelsBloc>();
                    if (reelsBloc.state.otherUserReels.isEmpty) {
                      reelsBloc.add(ReelsEvent.loadOtherUserReels(userId: userId));
                    }
                  });
                }
              }

              if (!homeState.showAddButton) {
                // Guest View
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person_outline_rounded,
                          size: 64,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.welcomeToPropertify,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.signInToSync,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () => context.go(AuthScreen.routeName),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(l10n.getStarted),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final profile = profileState.userProfile;
              final bannerAdsCount = profileState.bannerAds?.length ?? 0;
              final postsCount = homeState.otherUserPosts?.length ?? 0;
              final reelsList = (() {
                try {
                  return context.read<ReelsBloc>().state.otherUserReels;
                } catch (_) {
                  return [];
                }
              }());
              final reelsCount = reelsList.length;

              int totalLeads = 0;
              for (var p in (homeState.otherUserPosts ?? [])) {
                totalLeads +=
                    (((p.callCount ?? 0) + (p.whatsappCount ?? 0)) as num)
                        .toInt();
              }
              for (var r in reelsList) {
                totalLeads +=
                    (((r.callCount ?? 0) + (r.whatsappCount ?? 0)) as num)
                        .toInt();
              }
              for (var b in (profileState.bannerAds ?? [])) {
                totalLeads +=
                    (((b.callCount ?? 0) + (b.whatsappCount ?? 0)) as num)
                        .toInt();
              }

              final String? city = profile?.city;
              final String? state = profile?.state;
              final String? country = profile?.country;
              final locationParts = <String>[
                if (city != null && city.trim().isNotEmpty)
                  city.trim().toUpperCase(),
                if (state != null && state.trim().isNotEmpty)
                  state.trim().toUpperCase(),
                if (country != null && country.trim().isNotEmpty)
                  country.trim().toUpperCase(),
              ];

              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    // Header & Profile Picture
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => _showImagePicker(context),
                            child: Stack(
                              children: [
                                ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        _resolveImageUrl(profile?.profilepic),
                                    width: 110,
                                    height: 110,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      width: 110,
                                      height: 110,
                                      color: Colors.grey[300],
                                      child: const Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      width: 110,
                                      height: 110,
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.person,
                                          size: 55, color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                    ),
                                    child: const Icon(Icons.camera_alt,
                                        size: 14, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            () {
                              final firstName =
                                  profile?.firstName?.trim() ?? '';
                              final lastName = profile?.lastName?.trim() ?? '';
                              if (firstName.isNotEmpty ||
                                  lastName.isNotEmpty) {
                                return '$firstName $lastName'
                                    .trim()
                                    .toTitleCase();
                              }
                              return (profile?.username ?? 'Propertify User')
                                  .toTitleCase();
                            }(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _buildInfoChip(label: profile?.username ?? ''),
                              _buildInfoChip(
                                label: profile?.memberSince != null
                                    ? 'Joined ${profile?.memberSince}'
                                    : 'New Member',
                              ),
                              if (locationParts.isNotEmpty)
                                _buildInfoChip(
                                    label: locationParts.join(' | ')),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Owner Action Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildOwnerActionButton(
                                icon: Icons.edit_outlined,
                                label: 'Edit',
                                color: Colors.blue,
                                onTap: () => context.push(
                                  EditProfileScreen.routeName,
                                  extra: profile,
                                ),
                              ),
                              // const SizedBox(width: 6),
                              // _buildOwnerActionButton(
                              //   icon: Icons.campaign_outlined,
                              //   label: 'Banners',
                              //   color: Colors.purple,
                              //   onTap: () => context.push(
                              //     MyBannerAdsScreen.routeName,
                              //   ),
                              // ),
                              const SizedBox(width: 6),
                              _buildOwnerActionButton(
                                icon: Icons.dashboard_outlined,
                                label: 'Dashboard',
                                color: Theme.of(context).primaryColor,
                                onTap: () => context.push(
                                  MyDashboardScreen.routeName,
                                ),
                              ),
                              const SizedBox(width: 6),
                              _buildOwnerActionButton(
                                icon: Icons.share_rounded,
                                label: 'Socials',
                                color: Colors.teal,
                                onTap: () => _showSocialLinksBottomSheet(
                                  context,
                                  profile,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Stats Section
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8F9FE),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.05),
                              ),
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildStatItem('Posts', '$postsCount'),
                                  VerticalDivider(
                                    color: Colors.grey.shade300,
                                    thickness: 1,
                                  ),
                                  _buildStatItem('Reels', '$reelsCount'),
                                  VerticalDivider(
                                    color: Colors.grey.shade300,
                                    thickness: 1,
                                  ),
                                  _buildStatItem('Banners', '$bannerAdsCount'),
                                  VerticalDivider(
                                    color: Colors.grey.shade300,
                                    thickness: 1,
                                  ),
                                  _buildStatItem('Leads', '$totalLeads'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Admin / Role Dashboard Menu Item
                    if (homeState.showAddButton) ...[
                      () {
                        final role = profileState.userProfile?.role?.toLowerCase() ??
                            serviceLocator<AppCacheService>()
                                .getRole()
                                ?.toLowerCase();

                        if (role == 'admin' || role == 'seller' || role == 'marketing') {
                          return Column(
                            children: [
                              if (role == 'admin')
                                ProfileMenuItem(
                                  icon: Icons.admin_panel_settings_outlined,
                                  title: l10n.adminDashboard,
                                  onTap: () {
                                    context.push(AdminDashboardScreen.routeName);
                                  },
                                ),
                              if (role == 'seller')
                                ProfileMenuItem(
                                  icon: Icons.dashboard_outlined,
                                  title: l10n.homeLoansDashboard,
                                  onTap: () {
                                    context.push('${AdminDashboardScreen.routeName}?isSeller=true');
                                  },
                                ),
                              if (role == 'marketing')
                                ProfileMenuItem(
                                  icon: Icons.campaign_outlined,
                                  title: l10n.interiorDesignDashboard,
                                  onTap: () {
                                    context.push('${AdminDashboardScreen.routeName}?isMarketing=true');
                                  },
                                ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      }(),
                    ],

                    // const Divider(),
                    // Menu Items
                    // ProfileMenuItem(
                    //   icon: Icons.dashboard_outlined,
                    //   title: l10n.myDashboard,
                    //   onTap: () => context.push(MyDashboardScreen.routeName),
                    // ),
                    // ProfileMenuItem(
                    //   icon: Icons.person_outline,
                    //   title: l10n.editProfile,
                    //   onTap: () {
                    //     if (profile != null) {
                    //       context.push(
                    //         EditProfileScreen.routeName,
                    //         extra: profile,
                    //       );
                    //     }
                    //   },
                    // ),
                    ProfileMenuItem(
                      icon: Icons.language,
                      title: 'Language / Translation',
                      onTap: () => _showLanguageDialog(context),
                    ),
                    ProfileMenuItem(
                      icon: Icons.feedback_outlined,
                      title: l10n.suggestionsFeedback,
                      onTap: () => context.push(FeedbackScreen.routeName),
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
                          'https://propertify.in/contact-us-two/',
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
                          'https://propertify.in/terms-and-conditions/',
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
                          'https://propertify.in/privacy-policy/',
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
                      icon: Icons.delete_outline_rounded,
                      title: l10n.deleteAccount,
                      textColor: Colors.red,
                      onTap: () =>
                          context.push(DeactivateAccountScreen.routeName),
                    ),
                    _buildFollowUsSection(l10n),
                    GestureDetector(
                      onTap: () => _showSignOutDialog(context, l10n),
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
                    const SizedBox(height: 50),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildInfoChip({required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildOwnerActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 15, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
    );
  }

  void _showSocialLinksBottomSheet(BuildContext context, dynamic profile) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Manage Social Links',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const Divider(),
                  SocialLinksWidget(
                    userProfile: profile,
                    isOwner: true,
                    initiallyExpanded: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(const HomeEvent.setLocale(Locale('en')));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('हिन्दी (Hindi)'),
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(const HomeEvent.setLocale(Locale('hi')));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('తెలుగు (Telugu)'),
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(const HomeEvent.setLocale(Locale('te')));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
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

  Widget _buildFollowUsSection(AppLocalizations l10n) {
    return Column(
      children: [
        const SizedBox(height: 12),
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
              onTap: () => _launchExternalUrl(
                  'https://www.facebook.com/1251613104692490'),
            ),
            const SizedBox(width: 24),
            _socialIcon(
              icon: FontAwesomeIcons.instagram,
              color: const Color(0xFFE4405F),
              onTap: () => _launchExternalUrl(
                  'https://www.instagram.com/propertifyapp?igsh=MTE4d2VydXJxd2x6&utm_source=qr'),
            ),
            const SizedBox(width: 24),
            _socialIcon(
              icon: FontAwesomeIcons.whatsapp,
              color: const Color(0xFF25D366),
              onTap: () => _launchExternalUrl(
                  'https://whatsapp.com/channel/0029Vb7oK1r7oQhUoESENq3n'),
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
}
