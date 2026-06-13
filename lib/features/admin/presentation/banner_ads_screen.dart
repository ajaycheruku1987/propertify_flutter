import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:propertify/features/admin/models/post_ad_model.dart';
import 'package:propertify/features/admin/models/projects_admin_view_model.dart';
import 'package:propertify/features/home/models/feed_posts_response_model.dart';
import 'package:propertify/features/reels/models/reel_response_model.dart';
import 'package:propertify/features/services/models/services_response_model.dart';

import '../../../core/notify_message.dart';
import '../../../utils/custom_toast.dart';
import '../bloc/admin_bloc.dart';
import '../../profile/models/banner_ad_model.dart';
import 'widgets/banner_ad_card.dart';

class BannerAdsScreen extends StatefulWidget {
  static const String routeName = '/banner-ads-screen';
  const BannerAdsScreen({super.key});

  @override
  State<BannerAdsScreen> createState() => _BannerAdsScreenState();
}

class _BannerAdsScreenState extends State<BannerAdsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _loadTabContent(0);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _loadTabContent(_tabController.index);
      }
    });
    _scrollController.addListener(_onScroll);
  }

  void _loadTabContent(int index) {
    final adminBloc = context.read<AdminBloc>();
    switch (index) {
      case 0:
        adminBloc.add(const AdminEvent.getBannerAds(page: 1));
        break;
      case 1:
        adminBloc.add(const AdminEvent.getAdminProperties(page: 1));
        break;
      case 2:
        adminBloc.add(const AdminEvent.getServices(page: 1));
        break;
      case 3:
        adminBloc.add(const AdminEvent.getAdminReels(page: 1));
        break;
      case 4:
        adminBloc.add(const AdminEvent.getProjects(page: 1));
        break;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final state = context.read<AdminBloc>().state;
      if (state.isLoading) return;

      final adminBloc = context.read<AdminBloc>();
      switch (_tabController.index) {
        case 0:
          if (state.hasMoreBannerAds) {
            adminBloc.add(AdminEvent.getBannerAds(page: state.currentBannerAdsPage + 1));
          }
          break;
        case 1:
          if (state.hasMoreProperties) {
            adminBloc.add(AdminEvent.getAdminProperties(page: state.currentPropertiesPage + 1));
          }
          break;
        case 2:
          if (state.hasMoreServices) {
            adminBloc.add(AdminEvent.getServices(page: state.currentServicesPage + 1));
          }
          break;
        case 3:
          if (state.hasMoreAdminReels) {
            adminBloc.add(AdminEvent.getAdminReels(page: state.currentAdminReelsPage + 1));
          }
          break;
        case 4:
          if (state.hasMoreProjects) {
            adminBloc.add(AdminEvent.getProjects(page: state.currentProjectsPage + 1));
          }
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {
        if (state.notifyStatus != null) {
          if (state.notifyStatus!.type == NotifyType.error) {
            CustomToast.showErrorToast(msg: state.notifyStatus?.message);
          } else {
            CustomToast.showSuccessToast(msg: state.notifyStatus?.message);
          }
        }
      },
      builder: (context, state) {
        return BlurryModalProgressHUD(
          inAsyncCall: state.isLoading &&
              ((_tabController.index == 0 && state.bannerAds == null) ||
                  (_tabController.index == 1 && state.properties == null) ||
                  (_tabController.index == 2 && state.services == null) ||
                  (_tabController.index == 3 && state.adminReels == null) ||
                  (_tabController.index == 4 && state.projects == null)),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  _buildHeader(context),
                  _buildTabBar(),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildBannerAdsList(state.bannerAds ?? []),
                        _buildPropertiesList(state.properties ?? []),
                        _buildServicesList(state.services ?? []),
                        _buildReelsList(state.adminReels ?? []),
                        _buildProjectsList(state.projects ?? []),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Theme.of(context).primaryColor,
      tabs: const [
        Tab(text: 'Banners'),
        Tab(text: 'Feeds'),
        Tab(text: 'Services'),
        Tab(text: 'Reels'),
        Tab(text: 'Projects'),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.1),
            Theme.of(context).primaryColor.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
              color: Colors.black87,
            ),
            const Expanded(
              child: Text(
                'Boosted Content',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerAdsList(List<BannerAdModel> ads) {
    if (ads.isEmpty) return _buildEmptyState('No banner ads found');
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: ads.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: BannerAdCard(
            bannerAd: ads[index],
            onDelete: () => _handleDeleteBannerAd(ads[index].id ?? ''),
          ),
        );
      },
    );
  }

  Widget _buildPropertiesList(List<FeedPostsResponseModel> properties) {
    final boostedProperties = properties.where((p) => p.isCurrentlyPromoted).toList();
    if (boostedProperties.isEmpty) return _buildEmptyState('No boosted feeds found');
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: boostedProperties.length,
      itemBuilder: (context, index) {
        final property = boostedProperties[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: _buildBoostedCard(
            title: property.title ?? 'Property Feed',
            image: property.imageUrls?.isNotEmpty == true ? property.imageUrls!.first : null,
            owner: property.owner?.username ?? 'User',
            isPaid: property.isCurrentlyPromoted,
            startDate: property.createdAt,
            endDate: property.promotedUntil,
            onDelete: () {
               context.read<AdminBloc>().add(AdminEvent.deleteAdminProperty(propertyId: property.id ?? ''));
            },
          ),
        );
      },
    );
  }

  Widget _buildServicesList(List<ServicesResponseModel> services) {
    final boostedServices = services.where((s) => s.isCurrentlyPromoted).toList();
    if (boostedServices.isEmpty) return _buildEmptyState('No boosted services found');
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: boostedServices.length,
      itemBuilder: (context, index) {
        final service = boostedServices[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: _buildBoostedCard(
            title: service.agentName ?? 'Service',
            image: service.imageUrls?.isNotEmpty == true ? service.imageUrls!.first : null,
            owner: service.owner?.username ?? 'User',
            isPaid: true,
            startDate: service.createdAt,
            endDate: service.promotedUntil,
            onDelete: () {
              context.read<AdminBloc>().add(AdminEvent.deleteService(serviceId: service.id ?? ''));
            },
          ),
        );
      },
    );
  }

  Widget _buildReelsList(List<ReelResponseModel> reels) {
    final boostedReels = reels.where((r) => r.isCurrentlyPromoted).toList();
    if (boostedReels.isEmpty) return _buildEmptyState('No boosted reels found');
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: boostedReels.length,
      itemBuilder: (context, index) {
        final reel = boostedReels[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: _buildBoostedCard(
            title: reel.description ?? 'Reel',
            image: null, // Reels typically don't have thumbnail URLs in this model
            owner: reel.owner?.username ?? 'User',
            isPaid: true,
            startDate: reel.createdAt,
            endDate: reel.promotedUntil,
            onDelete: () {
              context.read<AdminBloc>().add(AdminEvent.deleteAdminReel(reelId: reel.id ?? ''));
            },
          ),
        );
      },
    );
  }

  Widget _buildProjectsList(List<ProjectsAdminViewModel> projects) {
    final boostedProjects = projects.where((p) => p.isCurrentlyPromoted).toList();
    if (boostedProjects.isEmpty) return _buildEmptyState('No boosted projects found');
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: boostedProjects.length,
      itemBuilder: (context, index) {
        final project = boostedProjects[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: _buildBoostedCard(
            title: project.projectName ?? 'Project',
            image: project.imageUrls?.isNotEmpty == true ? project.imageUrls!.first : null,
            owner: project.owner?.username ?? 'User',
            isPaid: project.isCurrentlyPromoted,
            startDate: project.createdAt,
            endDate: project.promotedUntil,
            onDelete: () {
              context.read<AdminBloc>().add(AdminEvent.deleteProject(projectId: project.id ?? ''));
            },
          ),
        );
      },
    );
  }

  Widget _buildBoostedCard({
    required String title,
    String? image,
    required String owner,
    required bool isPaid,
    required VoidCallback onDelete,
    String? startDate,
    String? endDate,
  }) {
    final DateTime? start = startDate != null ? DateTime.tryParse(startDate) : null;
    final DateTime? end = endDate != null ? DateTime.tryParse(endDate) : null;
    final formatter = DateFormat('MMM d, yyyy');

    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            if (image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              )
            else
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Owner: $owner',
                          style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  if (start != null || end != null) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 12, color: Colors.blue),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '${start != null ? "Start: ${formatter.format(start)}" : ""} ${end != null ? "Expires: ${formatter.format(end)}" : ""}'
                                .trim(),
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isPaid ? Colors.green.shade50 : Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      isPaid ? 'PAID' : 'UNPAID',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isPaid ? Colors.green.shade700 : Colors.orange.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: onDelete,
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.campaign_outlined, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _handleDeleteBannerAd(String bannerAdId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Banner Ad'),
        content: const Text('Are you sure you want to delete this banner ad?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<AdminBloc>().add(
                AdminEvent.deleteBannerAd(bannerAdId: bannerAdId),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
