import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:propertify/features/feed/presentation/post_details.dart';
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

class OtherUserProfileScreen extends StatefulWidget {
  static const String routeName = '/other-user-profile';

  final String userId;

  const OtherUserProfileScreen({super.key, required this.userId});

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
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);

    // Load other user's profile
    context.read<ProfileBloc>().add(
      ProfileEvent.loadOtherUserProfile(userId: widget.userId),
    );

    // Load user's company
    context.read<CompanyBloc>().add(
      CompanyEvent.getUserCompany(userId: widget.userId),
    );

    // Load posts, services, and reels
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
          if (state.isLoadingOtherProfile) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.otherUserProfile == null) {
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

          final profile = state.otherUserProfile!;

          return Column(
            children: [
              // Profile Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Profile Picture
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                        image: profile.profilepic?.isNotEmpty ?? false
                            ? DecorationImage(
                                image: CachedNetworkImageProvider(
                                  profile.profilepic!,
                                ),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: profile.profilepic?.isEmpty ?? true
                          ? Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.grey[600],
                            )
                          : null,
                    ),
                    const SizedBox(height: 16),
                    // Name
                    Text(
                      (profile.username ?? 'User').toTitleCase(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // View Company Button
                    BlocBuilder<CompanyBloc, CompanyState>(
                      builder: (context, companyState) {
                        if (companyState.userCompany != null) {
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
                              const SizedBox(height: 8),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),

                    // Phone Number
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
                    Tab(text: 'Services'),
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
                    _buildServicesTab(),
                    // _buildSalesTab(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.otherUserProfile != null) {
            return _buildBottomActionButtons(
              state.otherUserProfile!.phoneNumber,
            );
          }
          return const SizedBox.shrink();
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
                  if (reel.isPromoted ?? false)
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
                      Icon(
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

    final homeState = context.read<HomeBloc>().state;
    if (!homeState.showAddButton) {
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

    final homeState = context.read<HomeBloc>().state;
    if (!homeState.showAddButton) {
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
}
