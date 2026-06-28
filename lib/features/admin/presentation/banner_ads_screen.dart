import 'package:propertify/utils/string_extensions.dart';
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
    if (ads.isEmpty) return _buildEmptyState('No boosted banners found');
    
    final activeAds = ads.where((ad) => ad.isCurrentlyActive).toList();
    final expiredAds = ads.where((ad) => !ad.isCurrentlyActive).toList();

    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      children: [
        if (activeAds.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.only(bottom: 12, left: 4),
            child: Text(
              'Active Banners',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          ...activeAds.map((ad) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: BannerAdCard(
              bannerAd: ad,
              onDelete: () => _handleDeleteBannerAd(ad.id ?? ''),
            ),
          )),
        ],
        if (expiredAds.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 12, left: 4),
            child: Text(
              'Expired Banners',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          ...expiredAds.map((ad) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: BannerAdCard(
              bannerAd: ad,
              onDelete: () => _handleDeleteBannerAd(ad.id ?? ''),
            ),
          )),
        ],
      ],
    );
  }

  Widget _buildPropertiesList(List<FeedPostsResponseModel> properties) {
    final allBoosted = properties.where((p) => p.isPromoted == true).toList();
    if (allBoosted.isEmpty) return _buildEmptyState('No boosted feeds found');

    final activeItems = allBoosted.where((p) => p.isCurrentlyPromoted).toList();
    final expiredItems = allBoosted.where((p) => !p.isCurrentlyPromoted).toList();

    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      children: [
        if (activeItems.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.only(bottom: 12, left: 4),
            child: Text(
              'Active Feeds',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          ...activeItems.map((property) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _buildBoostedCard(
              title: property.title ?? 'Property Feed',
              image: property.imageUrls?.isNotEmpty == true ? property.imageUrls!.first : null,
              owner: () {
                final owner = property.owner;
                if (owner == null) return 'Propertify User';
                final firstName = owner.firstName?.trim() ?? '';
                final lastName = owner.lastName?.trim() ?? '';
                if (firstName.isNotEmpty || lastName.isNotEmpty) {
                  return '$firstName $lastName'.trim().toTitleCase();
                }
                return (owner.username ?? 'Propertify User').toTitleCase();
              }(),
              isPaid: property.isPromoted ?? false,
              startDate: property.createdAt,
              endDate: property.promotedUntil,
              isExpired: false,
              onDelete: () {
                _showDeleteConfirmation(
                  title: 'Delete Feed Post',
                  content: 'Are you sure you want to delete this boosted feed post?',
                  onConfirm: () => context.read<AdminBloc>().add(AdminEvent.deleteAdminProperty(propertyId: property.id ?? '')),
                );
              },
            ),
          )),
        ],
        if (expiredItems.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 12, left: 4),
            child: Text(
              'Expired Feeds',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          ...expiredItems.map((property) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _buildBoostedCard(
              title: property.title ?? 'Property Feed',
              image: property.imageUrls?.isNotEmpty == true ? property.imageUrls!.first : null,
              owner: () {
                final owner = property.owner;
                if (owner == null) return 'Propertify User';
                final firstName = owner.firstName?.trim() ?? '';
                final lastName = owner.lastName?.trim() ?? '';
                if (firstName.isNotEmpty || lastName.isNotEmpty) {
                  return '$firstName $lastName'.trim().toTitleCase();
                }
                return (owner.username ?? 'Propertify User').toTitleCase();
              }(),
              isPaid: property.isPromoted ?? false,
              startDate: property.createdAt,
              endDate: property.promotedUntil,
              isExpired: true,
              onDelete: () {
                _showDeleteConfirmation(
                  title: 'Delete Feed Post',
                  content: 'Are you sure you want to delete this boosted feed post?',
                  onConfirm: () => context.read<AdminBloc>().add(AdminEvent.deleteAdminProperty(propertyId: property.id ?? '')),
                );
              },
            ),
          )),
        ],
      ],
    );
  }

  Widget _buildServicesList(List<ServicesResponseModel> services) {
    final allBoosted = services.where((s) => s.isPromoted == true).toList();
    if (allBoosted.isEmpty) return _buildEmptyState('No boosted services found');

    final activeItems = allBoosted.where((s) => s.isCurrentlyPromoted).toList();
    final expiredItems = allBoosted.where((s) => !s.isCurrentlyPromoted).toList();

    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      children: [
        if (activeItems.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.only(bottom: 12, left: 4),
            child: Text(
              'Active Services',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          ...activeItems.map((service) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _buildBoostedCard(
              title: service.agentName ?? 'Service',
              image: service.imageUrls?.isNotEmpty == true ? service.imageUrls!.first : null,
              owner: () {
                final owner = service.owner;
                if (owner == null) return 'Propertify User';
                final firstName = owner.firstName?.trim() ?? '';
                final lastName = owner.lastName?.trim() ?? '';
                if (firstName.isNotEmpty || lastName.isNotEmpty) {
                  return '$firstName $lastName'.trim().toTitleCase();
                }
                return (owner.username ?? 'Propertify User').toTitleCase();
              }(),
              isPaid: service.isPromoted ?? false,
              startDate: service.createdAt,
              endDate: service.promotedUntil,
              isExpired: false,
              onDelete: () {
                _showDeleteConfirmation(
                  title: 'Delete Service',
                  content: 'Are you sure you want to delete this boosted service?',
                  onConfirm: () => context.read<AdminBloc>().add(AdminEvent.deleteService(serviceId: service.id ?? '')),
                );
              },
            ),
          )),
        ],
        if (expiredItems.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 12, left: 4),
            child: Text(
              'Expired Services',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          ...expiredItems.map((service) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _buildBoostedCard(
              title: service.agentName ?? 'Service',
              image: service.imageUrls?.isNotEmpty == true ? service.imageUrls!.first : null,
              owner: () {
                final owner = service.owner;
                if (owner == null) return 'Propertify User';
                final firstName = owner.firstName?.trim() ?? '';
                final lastName = owner.lastName?.trim() ?? '';
                if (firstName.isNotEmpty || lastName.isNotEmpty) {
                  return '$firstName $lastName'.trim().toTitleCase();
                }
                return (owner.username ?? 'Propertify User').toTitleCase();
              }(),
              isPaid: service.isPromoted ?? false,
              startDate: service.createdAt,
              endDate: service.promotedUntil,
              isExpired: true,
              onDelete: () {
                _showDeleteConfirmation(
                  title: 'Delete Service',
                  content: 'Are you sure you want to delete this boosted service?',
                  onConfirm: () => context.read<AdminBloc>().add(AdminEvent.deleteService(serviceId: service.id ?? '')),
                );
              },
            ),
          )),
        ],
      ],
    );
  }

  Widget _buildReelsList(List<ReelResponseModel> reels) {
    final allBoosted = reels.where((r) => r.isPromoted == true).toList();
    if (allBoosted.isEmpty) return _buildEmptyState('No boosted reels found');

    final activeItems = allBoosted.where((r) => r.isCurrentlyPromoted).toList();
    final expiredItems = allBoosted.where((r) => !r.isCurrentlyPromoted).toList();

    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      children: [
        if (activeItems.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.only(bottom: 12, left: 4),
            child: Text(
              'Active Reels',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          ...activeItems.map((reel) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _buildBoostedCard(
              title: reel.description ?? 'Reel',
              image: null,
              owner: () {
                final owner = reel.owner;
                if (owner == null) return 'Propertify User';
                final firstName = owner.firstName?.trim() ?? '';
                final lastName = owner.lastName?.trim() ?? '';
                if (firstName.isNotEmpty || lastName.isNotEmpty) {
                  return '$firstName $lastName'.trim().toTitleCase();
                }
                return (owner.username ?? 'Propertify User').toTitleCase();
              }(),
              isPaid: reel.isPromoted ?? false,
              startDate: reel.createdAt,
              endDate: reel.promotedUntil,
              isExpired: false,
              onDelete: () {
                _showDeleteConfirmation(
                  title: 'Delete Reel',
                  content: 'Are you sure you want to delete this boosted reel?',
                  onConfirm: () => context.read<AdminBloc>().add(AdminEvent.deleteAdminReel(reelId: reel.id ?? '')),
                );
              },
            ),
          )),
        ],
        if (expiredItems.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 12, left: 4),
            child: Text(
              'Expired Reels',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          ...expiredItems.map((reel) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _buildBoostedCard(
              title: reel.description ?? 'Reel',
              image: null,
              owner: () {
                final owner = reel.owner;
                if (owner == null) return 'Propertify User';
                final firstName = owner.firstName?.trim() ?? '';
                final lastName = owner.lastName?.trim() ?? '';
                if (firstName.isNotEmpty || lastName.isNotEmpty) {
                  return '$firstName $lastName'.trim().toTitleCase();
                }
                return (owner.username ?? 'Propertify User').toTitleCase();
              }(),
              isPaid: reel.isPromoted ?? false,
              startDate: reel.createdAt,
              endDate: reel.promotedUntil,
              isExpired: true,
              onDelete: () {
                _showDeleteConfirmation(
                  title: 'Delete Reel',
                  content: 'Are you sure you want to delete this boosted reel?',
                  onConfirm: () => context.read<AdminBloc>().add(AdminEvent.deleteAdminReel(reelId: reel.id ?? '')),
                );
              },
            ),
          )),
        ],
      ],
    );
  }

  Widget _buildProjectsList(List<ProjectsAdminViewModel> projects) {
    final allBoosted = projects.where((p) => p.isPromoted == true).toList();
    if (allBoosted.isEmpty) return _buildEmptyState('No boosted projects found');

    final activeItems = allBoosted.where((p) => p.isCurrentlyPromoted).toList();
    final expiredItems = allBoosted.where((p) => !p.isCurrentlyPromoted).toList();

    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      children: [
        if (activeItems.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.only(bottom: 12, left: 4),
            child: Text(
              'Active Projects',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          ...activeItems.map((project) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _buildBoostedCard(
              title: project.projectName ?? 'Project',
              image: project.imageUrls?.isNotEmpty == true ? project.imageUrls!.first : null,
              owner: () {
                final owner = project.owner;
                if (owner == null) return 'Propertify User';
                final firstName = owner.firstName?.trim() ?? '';
                final lastName = owner.lastName?.trim() ?? '';
                if (firstName.isNotEmpty || lastName.isNotEmpty) {
                  return '$firstName $lastName'.trim().toTitleCase();
                }
                return (owner.username ?? 'Propertify User').toTitleCase();
              }(),
              isPaid: project.isPromoted ?? false,
              startDate: project.createdAt,
              endDate: project.promotedUntil,
              isExpired: false,
              onDelete: () {
                _showDeleteConfirmation(
                  title: 'Delete Project',
                  content: 'Are you sure you want to delete this boosted project?',
                  onConfirm: () => context.read<AdminBloc>().add(AdminEvent.deleteProject(projectId: project.id ?? '')),
                );
              },
            ),
          )),
        ],
        if (expiredItems.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 12, left: 4),
            child: Text(
              'Expired Projects',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          ...expiredItems.map((project) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _buildBoostedCard(
              title: project.projectName ?? 'Project',
              image: project.imageUrls?.isNotEmpty == true ? project.imageUrls!.first : null,
              owner: () {
                final owner = project.owner;
                if (owner == null) return 'Propertify User';
                final firstName = owner.firstName?.trim() ?? '';
                final lastName = owner.lastName?.trim() ?? '';
                if (firstName.isNotEmpty || lastName.isNotEmpty) {
                  return '$firstName $lastName'.trim().toTitleCase();
                }
                return (owner.username ?? 'Propertify User').toTitleCase();
              }(),
              isPaid: project.isPromoted ?? false,
              startDate: project.createdAt,
              endDate: project.promotedUntil,
              isExpired: true,
              onDelete: () {
                _showDeleteConfirmation(
                  title: 'Delete Project',
                  content: 'Are you sure you want to delete this boosted project?',
                  onConfirm: () => context.read<AdminBloc>().add(AdminEvent.deleteProject(projectId: project.id ?? '')),
                );
              },
            ),
          )),
        ],
      ],
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
    bool isExpired = false,
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
                        Icon(Icons.calendar_today, size: 12, color: isExpired ? Colors.red : Colors.blue),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '${start != null ? "Start: ${formatter.format(start)}" : ""} ${end != null ? "Expires: ${formatter.format(end)}" : ""}'
                                .trim(),
                            style: TextStyle(
                              color: isExpired ? Colors.red : Colors.blue,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    children: [
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
                      if (isExpired) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'EXPIRED',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ],
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
    _showDeleteConfirmation(
      title: 'Delete Banner Ad',
      content: 'Are you sure you want to delete this banner ad?',
      onConfirm: () => context.read<AdminBloc>().add(AdminEvent.deleteBannerAd(bannerAdId: bannerAdId)),
    );
  }

  void _showDeleteConfirmation({
    required String title,
    required String content,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
