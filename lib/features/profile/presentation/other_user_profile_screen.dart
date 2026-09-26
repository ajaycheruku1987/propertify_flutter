import 'package:flutter/material.dart';
import 'package:propertify/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:propertify/features/feed/presentation/post_details.dart';
import 'package:propertify/features/feed/presentation/widgets/full_screen_image_viewer.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/features/reels/bloc/reels_bloc.dart';
import 'package:propertify/features/reels/presentation/other_user_reels_screen.dart';
import 'package:propertify/features/sales/bloc/sales_bloc.dart';
import 'package:propertify/features/sales/models/sales_model.dart';
import 'package:propertify/features/sales/presentation/sale_view_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../utils/custom_toast.dart';
import '../../../../features/auth/presentation/auth_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/utils/string_extensions.dart';
import '../../company/bloc/company_bloc.dart';
import '../../company/presentation/my_company.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';
import 'package:propertify/features/home/presentation/widgets/banner_ad_widget.dart';
import 'package:propertify/utils/env.dart';

class OtherUserProfileScreen extends StatefulWidget {
  static const String routeName = '/other-user-profile';

  final String userId;
  final int initialTabIndex;

  const OtherUserProfileScreen({
    super.key,
    required this.userId,
    this.initialTabIndex = 0,
  });

  @override
  State<OtherUserProfileScreen> createState() => _OtherUserProfileScreenState();
}

class _OtherUserProfileScreenState extends State<OtherUserProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _postsScrollController = ScrollController();
  final ScrollController _servicesScrollController = ScrollController();
  final ScrollController _salesScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialTabIndex.clamp(0, 2),
    );

    // Ensure current user profile is up to date
    context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());

    // Load other user's profile
    context.read<ProfileBloc>().add(
      ProfileEvent.loadOtherUserProfile(userId: widget.userId),
    );

    // Load user's company
    context.read<CompanyBloc>().add(
      CompanyEvent.getUserCompany(userId: widget.userId),
    );

    // Load posts, services, reels, and banner ads
    _loadInitialData();

    // Setup scroll listeners for lazy loading
    _postsScrollController.addListener(_onPostsScroll);
    _servicesScrollController.addListener(_onServicesScroll);
    _salesScrollController.addListener(_onSalesScroll);
  }

  void _loadInitialData() {
    // Load posts (first 10)
    context.read<HomeBloc>().add(
      HomeEvent.loadOtherUserPosts(userId: widget.userId, limit: 10, offset: 0),
    );

    // Load services (first 20)
    context.read<ServicesBloc>().add(
      ServicesEvent.loadOtherUserServices(
        userId: widget.userId,
        skip: 0,
        limit: 20,
      ),
    );

    // Load reels (all)
    context.read<ReelsBloc>().add(
      ReelsEvent.loadOtherUserReels(userId: widget.userId),
    );

    // Load banner ads
    context.read<ProfileBloc>().add(const ProfileEvent.loadBannerAds());

    // Load sales projects (first page)
    // context.read<SalesBloc>().add(
    //   SalesEvent.getSalesProjectsByUserId(
    //     userId: widget.userId,
    //     page: 1,
    //     pageSize: 10,
    //   ),
    // );
  }

  void _onPostsScroll() {
    if (_postsScrollController.position.pixels >=
        _postsScrollController.position.maxScrollExtent * 0.9) {
      final homeState = context.read<HomeBloc>().state;
      if (!homeState.isLoadingOtherUserPosts &&
          homeState.hasMoreOtherUserPosts) {
        final currentCount = homeState.otherUserPosts?.length ?? 0;
        context.read<HomeBloc>().add(
          HomeEvent.loadOtherUserPosts(
            userId: widget.userId,
            limit: 10,
            offset: currentCount,
          ),
        );
      }
    }
  }

  void _onServicesScroll() {
    if (_servicesScrollController.position.pixels >=
        _servicesScrollController.position.maxScrollExtent * 0.9) {
      final servicesState = context.read<ServicesBloc>().state;
      if (!servicesState.isLoadingOtherUserServices &&
          servicesState.hasMoreOtherUserServices) {
        final currentCount = servicesState.otherUserServices.length;
        context.read<ServicesBloc>().add(
          ServicesEvent.loadOtherUserServices(
            userId: widget.userId,
            skip: currentCount,
            limit: 20,
          ),
        );
      }
    }
  }

  void _onSalesScroll() {
    if (_salesScrollController.position.pixels >=
        _salesScrollController.position.maxScrollExtent * 0.9) {
      final salesState = context.read<SalesBloc>().state;
      if (!salesState.isLoading && salesState.hasMoreData) {
        final currentPage = (salesState.userSalesProjects?.meta?.page ?? 0) + 1;
        context.read<SalesBloc>().add(
          SalesEvent.getSalesProjectsByUserId(
            userId: widget.userId,
            page: currentPage,
            pageSize: 10,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _postsScrollController.dispose();
    _servicesScrollController.dispose();
    _salesScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          final currentUserProfile = state.userProfile;
          final isSelf = currentUserProfile != null &&
              ((currentUserProfile.id != null &&
                      currentUserProfile.id == widget.userId) ||
                  (currentUserProfile.username != null &&
                      currentUserProfile.username!.toLowerCase() ==
                          widget.userId.toLowerCase()));

          final profile = isSelf ? currentUserProfile : state.otherUserProfile;

          if (profile == null) {
            if (state.isLoadingOtherProfile || (isSelf && state.isLoading)) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_off_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Profile not found',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              // Profile Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Profile Picture
                    GestureDetector(
                      onTap: () {
                        if (profile.profilepic?.isNotEmpty ?? false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenImageViewer(
                                images: [_resolveImageUrl(profile.profilepic!)],
                                initialIndex: 0,
                              ),
                            ),
                          );
                        }
                      },
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: _resolveImageUrl(profile.profilepic),
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: 120,
                            height: 120,
                            color: Colors.grey[300],
                            child: const Center(
                                child: CircularProgressIndicator()),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 120,
                            height: 120,
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Name
                    Text(
                      () {
                        final firstName = profile.firstName?.trim() ?? '';
                        final lastName = profile.lastName?.trim() ?? '';
                        if (firstName.isNotEmpty || lastName.isNotEmpty) {
                          return '$firstName $lastName'.trim().toTitleCase();
                        }
                        return (profile.username ?? 'Propertify User')
                            .toTitleCase();
                      }(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // View Company Button
                    /*
                    BlocBuilder<CompanyBloc, CompanyState>(
                      builder: (context, companyState) {
                        final company = companyState.userCompany;
                        if (company != null &&
                            company.gstVerificationStatus == 'approved') {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.push(
                                    MyCompanyScreen.routeName,
                                    extra: widget.userId,
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.business,
                                        size: 18,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'View Company',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    */

                    // User ID and Member Since
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildInfoChip(
                          icon: Icons.person_outline,
                          label: profile.username ?? '',
                        ),
                        const SizedBox(width: 8),
                        _buildInfoChip(
                          icon: Icons.calendar_today_outlined,
                          label: profile.memberSince != null
                              ? 'Joined ${profile.memberSince}'
                              : 'New Member',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Call & WhatsApp Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildContactButton(
                          icon: Icons.phone_in_talk_rounded,
                          label: 'Call',
                          color: Theme.of(context).primaryColor,
                          onTap: () => _makePhoneCall(profile.phoneNumber ?? ''),
                        ),
                        const SizedBox(width: 16),
                        _buildContactButton(
                          icon: FontAwesomeIcons.whatsapp,
                          label: 'WhatsApp',
                          color: const Color(0xFF25D366),
                          onTap: () => _openWhatsApp(profile.phoneNumber ?? ''),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Stats Section
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, homeState) {
                        return BlocBuilder<ReelsBloc, ReelsState>(
                          builder: (context, reelsState) {
                            return BlocBuilder<ProfileBloc, ProfileState>(
                              builder: (context, profileState) {
                                final bannerAdsCount = (profileState.bannerAds ?? [])
                                    .where((ad) =>
                                        ad.userId == widget.userId ||
                                        ad.owner?.id == widget.userId)
                                    .length;
                                return Container(
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
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildStatItem(
                                          label: 'Posts',
                                          value:
                                              '${homeState.otherUserPosts?.length ?? 0}',
                                        ),
                                        VerticalDivider(
                                          color: Colors.grey.shade300,
                                          thickness: 1,
                                          indent: 4,
                                          endIndent: 4,
                                        ),
                                        _buildStatItem(
                                          label: 'Reels',
                                          value:
                                              '${reelsState.otherUserReels.length}',
                                        ),
                                        VerticalDivider(
                                          color: Colors.grey.shade300,
                                          thickness: 1,
                                          indent: 4,
                                          endIndent: 4,
                                        ),
                                        _buildStatItem(
                                          label: 'Banner Ads',
                                          value: '$bannerAdsCount',
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Tab Bar
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                ),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.grey[600],
                  indicatorColor: Theme.of(context).primaryColor,
                  labelStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
                    Tab(text: 'Posts'),
                    Tab(text: 'Reels'),
                    Tab(text: 'Banner Ads'),
                    // Tab(text: 'Services'),
                    // Tab(text: 'Projects/Sales'),
                  ],
                ),
              ),

              // Tab Views
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildPostsTab(),
                    _buildReelsTab(),
                    _buildBannerAdsTab(),
                    // _buildServicesTab(),
                    // _buildSalesTab(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPostsTab() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoadingOtherUserPosts &&
            (state.otherUserPosts?.isEmpty ?? true)) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.otherUserPosts?.isEmpty ?? true) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home_outlined, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No posts yet',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          );
        }

        return GridView.builder(
          controller: _postsScrollController,
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount:
              state.otherUserPosts!.length +
              (state.hasMoreOtherUserPosts ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == state.otherUserPosts!.length) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            }

            final post = state.otherUserPosts![index];
            return GestureDetector(
              onTap: () {
                context.push(
                  '${PostDetailsScreen.routeName}?postId=${post.id}',
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: post.imageUrls?.isNotEmpty ?? false
                    ? CachedNetworkImage(
                        imageUrl: post.imageUrls!.first,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const LogoPlaceholder(),
                      )
                    : const LogoPlaceholder(),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildReelsTab() {
    return BlocBuilder<ReelsBloc, ReelsState>(
      builder: (context, state) {
        if (state.isLoadingOtherUserReels) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.otherUserReels.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.video_library_outlined,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'No reels yet',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemCount: state.otherUserReels.length,
          itemBuilder: (context, index) {
            final reel = state.otherUserReels[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtherUserReelsScreen(
                      reels: state.otherUserReels,
                      initialIndex: index,
                    ),
                  ),
                );
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.play_circle_outline, size: 48),
                  ),
                  // Promoted Star Indicator
                  if (reel.isCurrentlyPromoted)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.star,
                          color: Color(0xFFFFD700),
                          size: 16,
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.visibility,
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${reel.viewsCount ?? 0}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBannerAdsTab() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state.isLoading && (state.bannerAds == null)) {
          return const Center(child: CircularProgressIndicator());
        }

        final userBannerAds = (state.bannerAds ?? []).where((ad) {
          return ad.userId == widget.userId || ad.owner?.id == widget.userId;
        }).toList();

        if (userBannerAds.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.campaign_outlined,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'No banner ads yet',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: userBannerAds.length,
          itemBuilder: (context, index) {
            final bannerAd = userBannerAds[index];
            return Container(
              height: 180,
              margin: const EdgeInsets.only(bottom: 12),
              child: BannerAdWidget(bannerAd: bannerAd),
            );
          },
        );
      },
    );
  }

  Widget _buildServicesTab() {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        if (state.isLoadingOtherUserServices &&
            state.otherUserServices.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.otherUserServices.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.work_outline, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No services yet',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          );
        }

        return GridView.builder(
          controller: _servicesScrollController,
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount:
              state.otherUserServices.length +
              (state.hasMoreOtherUserServices ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == state.otherUserServices.length) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            }

            final service = state.otherUserServices[index];
            return GestureDetector(
              onTap: () {
                context.push('/view-service', extra: service.id);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: service.imageUrls?.isNotEmpty ?? false
                    ? CachedNetworkImage(
                        imageUrl: service.imageUrls!.first,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const LogoPlaceholder(),
                      )
                    : const LogoPlaceholder(),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSalesTab() {
    return BlocBuilder<SalesBloc, SalesState>(
      builder: (context, state) {
        final salesProjects = state.userSalesProjects?.salerecords ?? [];

        if (state.isLoading && salesProjects.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (salesProjects.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.business_outlined,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'No projects/sales yet',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          );
        }

        return GridView.builder(
          controller: _salesScrollController,
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: salesProjects.length + (state.hasMoreData ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == salesProjects.length) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            }

            final sale = salesProjects[index];
            return GestureDetector(
              onTap: () {
                // Create a minimal SaleRecord with only the ID
                final minimalSale = SaleRecord(id: sale.id);
                context.push(SaleViewScreen.routeName, extra: minimalSale);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: sale.imageUrls?.isNotEmpty ?? false
                    ? CachedNetworkImage(
                        imageUrl: sale.imageUrls!.first,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const LogoPlaceholder(),
                      )
                    : const LogoPlaceholder(),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBottomActionButtons(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Call Button
            Expanded(
              child: GestureDetector(
                onTap: () => _makePhoneCall(phoneNumber),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Call',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // WhatsApp Button
            Expanded(
              child: GestureDetector(
                onTap: () => _openWhatsApp(phoneNumber),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF25D366),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Whatsapp',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    if (!mounted) return;

    final l10n = AppLocalizations.of(context)!;
    final homeState = context.read<HomeBloc>().state;
    if (!homeState.showAddButton) {
      CustomToast.showErrorToast(msg: l10n.pleaseLoginToReport);
      context.push(AuthScreen.routeName);
      return;
    }

    if (phoneNumber.isEmpty) {
      CustomToast.showErrorToast(msg: 'Phone number not available');
      return;
    }
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        CustomToast.showErrorToast(msg: 'Could not launch dialer');
      }
    } catch (e) {
      CustomToast.showErrorToast(msg: 'Error launching dialer');
    }
  }

  Future<void> _openWhatsApp(String phoneNumber) async {
    if (!mounted) return;

    final l10n = AppLocalizations.of(context)!;
    final homeState = context.read<HomeBloc>().state;
    if (!homeState.showAddButton) {
      CustomToast.showErrorToast(msg: l10n.pleaseLoginToReport);
      context.push(AuthScreen.routeName);
      return;
    }

    if (phoneNumber.isEmpty) {
      CustomToast.showErrorToast(msg: 'Phone number not available');
      return;
    }

    // Remove any non-numeric characters from phone number
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    final whatsappUrl = "https://wa.me/$cleanPhone";
    final Uri launchUri = Uri.parse(whatsappUrl);

    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri, mode: LaunchMode.externalApplication);
      } else {
        CustomToast.showErrorToast(msg: 'Could not launch WhatsApp');
      }
    } catch (e) {
      CustomToast.showErrorToast(msg: 'Error launching WhatsApp');
    }
  }

  Widget _buildInfoChip({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.grey.shade600),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton({
    required dynamic icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            icon is IconData
                ? Icon(icon, color: Colors.white, size: 18)
                : FaIcon(icon as FaIconData, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem({required String label, required String value}) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLinks(dynamic company) {
    final hasFacebook =
        company.facebookUrl != null && company.facebookUrl!.isNotEmpty;
    final hasInstagram =
        company.instagramUrl != null && company.instagramUrl!.isNotEmpty;
    final hasWebsite =
        company.websiteUrl != null && company.websiteUrl!.isNotEmpty;

    if (!hasFacebook && !hasInstagram && !hasWebsite) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (hasFacebook)
            _socialIcon(
              icon: FontAwesomeIcons.facebook,
              color: const Color(0xFF1877F2),
              onTap: () => _launchSocialUrl(company.facebookUrl!),
            ),
          if (hasInstagram)
            _socialIcon(
              icon: FontAwesomeIcons.instagram,
              color: const Color(0xFFE4405F),
              onTap: () => _launchSocialUrl(company.instagramUrl!),
            ),
          if (hasWebsite)
            _socialIcon(
              icon: FontAwesomeIcons.globe,
              color: Colors.blueGrey,
              onTap: () => _launchSocialUrl(company.websiteUrl!),
            ),
        ],
      ),
    );
  }

  Widget _socialIcon({
    required dynamic icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.1),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: FaIcon(icon, color: color, size: 20),
        ),
      ),
    );
  }

  Future<void> _launchSocialUrl(String url) async {
    final Uri uri = Uri.parse(url.startsWith('http') ? url : 'https://$url');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        CustomToast.showErrorToast(msg: 'Could not launch URL');
      }
    } catch (e) {
      CustomToast.showErrorToast(msg: 'Error launching URL');
    }
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
}
