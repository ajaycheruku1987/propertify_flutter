import 'package:propertify/utils/string_extensions.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

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

  int _lastBannerPage = 0;
  int _lastPropertyPage = 0;
  int _lastServicePage = 0;
  int _lastReelPage = 0;
  int _lastProjectPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _loadTabContent(0);
    _tabController.addListener(() {
      _loadTabContent(_tabController.index);
    });
  }

  void _loadTabContent(int index) {
    _lastBannerPage = 0;
    _lastPropertyPage = 0;
    _lastServicePage = 0;
    _lastReelPage = 0;
    _lastProjectPage = 0;

    final adminBloc = context.read<AdminBloc>();
    switch (index) {
      case 0:
        adminBloc.add(const AdminEvent.getBannerAds(page: 1, limit: 100));
        break;
      case 1:
        adminBloc.add(const AdminEvent.getAdminProperties(page: 1, limit: 100));
        break;
      case 2:
        adminBloc.add(const AdminEvent.getServices(page: 1, limit: 100));
        break;
      case 3:
        adminBloc.add(const AdminEvent.getAdminReels(page: 1, limit: 100));
        break;
      case 4:
        adminBloc.add(const AdminEvent.getProjects(page: 1, limit: 100));
        break;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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

        // Automatically fetch subsequent pages in the background up to the backend limit (100 per page)
        if (!state.isLoading) {
          final adminBloc = context.read<AdminBloc>();
          switch (_tabController.index) {
            case 0:
              if (state.hasMoreBannerAds && state.currentBannerAdsPage > _lastBannerPage) {
                _lastBannerPage = state.currentBannerAdsPage;
                adminBloc.add(AdminEvent.getBannerAds(page: state.currentBannerAdsPage + 1, limit: 100));
              }
              break;
            case 1:
              if (state.hasMoreProperties && state.currentPropertiesPage > _lastPropertyPage) {
                _lastPropertyPage = state.currentPropertiesPage;
                adminBloc.add(AdminEvent.getAdminProperties(page: state.currentPropertiesPage + 1, limit: 100));
              }
              break;
            case 2:
              if (state.hasMoreServices && state.currentServicesPage > _lastServicePage) {
                _lastServicePage = state.currentServicesPage;
                adminBloc.add(AdminEvent.getServices(page: state.currentServicesPage + 1, limit: 100));
              }
              break;
            case 3:
              if (state.hasMoreAdminReels && state.currentAdminReelsPage > _lastReelPage) {
                _lastReelPage = state.currentAdminReelsPage;
                adminBloc.add(AdminEvent.getAdminReels(page: state.currentAdminReelsPage + 1, limit: 100));
              }
              break;
            case 4:
              if (state.hasMoreProjects && state.currentProjectsPage > _lastProjectPage) {
                _lastProjectPage = state.currentProjectsPage;
                adminBloc.add(AdminEvent.getProjects(page: state.currentProjectsPage + 1, limit: 100));
              }
              break;
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
                        _buildPropertiesList(state),
                        _buildServicesList(state),
                        _buildReelsList(state),
                        _buildProjectsList(state),
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

  Widget _buildSubTabSection({
    required List<Widget> activeChildren,
    required List<Widget> expiredChildren,
    required String activeEmptyMsg,
    required String expiredEmptyMsg,
  }) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.grey.shade50,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: TabBar(
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(text: 'Active'),
                Tab(text: 'Expired'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Active Tab
                activeChildren.isEmpty
                    ? _buildEmptyState(activeEmptyMsg)
                    : ListView(
                        padding: const EdgeInsets.all(16),
                        children: activeChildren,
                      ),
                // Expired Tab
                expiredChildren.isEmpty
                    ? _buildEmptyState(expiredEmptyMsg)
                    : ListView(
                        padding: const EdgeInsets.all(16),
                        children: expiredChildren,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerAdsList(List<BannerAdModel> ads) {
    final activeAds = ads.where((ad) => ad.isCurrentlyActive).toList();
    final expiredAds = ads.where((ad) => !ad.isCurrentlyActive).toList();

    final activeCards = activeAds.map((ad) => Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: BannerAdCard(
        bannerAd: ad,
        onDelete: () => _handleDeleteBannerAd(ad.id ?? ''),
      ),
    )).toList();

    final expiredCards = expiredAds.map((ad) => Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: BannerAdCard(
        bannerAd: ad,
        onDelete: () => _handleDeleteBannerAd(ad.id ?? ''),
      ),
    )).toList();

    return _buildSubTabSection(
      activeChildren: activeCards,
      expiredChildren: expiredCards,
      activeEmptyMsg: 'No active boosted banners found',
      expiredEmptyMsg: 'No expired boosted banners found',
    );
  }

  Widget _buildPropertiesList(AdminState state) {
    final properties = state.properties ?? [];
    final allBoosted = properties.where((p) => p.isPromoted == true || p.promotedUntil != null || p.promotedAt != null).toList();

    final activeItems = allBoosted.where((p) => p.isCurrentlyPromoted).toList();
    final expiredItems = allBoosted.where((p) => !p.isCurrentlyPromoted).toList();

    final activeCards = activeItems.map((property) => Padding(
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
    )).toList();

    final expiredCards = expiredItems.map((property) => Padding(
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
    )).toList();

    return _buildSubTabSection(
      activeChildren: activeCards,
      expiredChildren: expiredCards,
      activeEmptyMsg: 'No active boosted feeds found',
      expiredEmptyMsg: 'No expired boosted feeds found',
    );
  }

  Widget _buildServicesList(AdminState state) {
    final services = state.services ?? [];
    final allBoosted = services.where((s) => s.isPromoted == true || s.promotedUntil != null || s.promotedAt != null).toList();

    final activeItems = allBoosted.where((s) => s.isCurrentlyPromoted).toList();
    final expiredItems = allBoosted.where((s) => !s.isCurrentlyPromoted).toList();

    final activeCards = activeItems.map((service) => Padding(
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
    )).toList();

    final expiredCards = expiredItems.map((service) => Padding(
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
    )).toList();

    return _buildSubTabSection(
      activeChildren: activeCards,
      expiredChildren: expiredCards,
      activeEmptyMsg: 'No active boosted services found',
      expiredEmptyMsg: 'No expired boosted services found',
    );
  }

  Widget _buildReelsList(AdminState state) {
    final reels = state.adminReels ?? [];
    final allBoosted = reels.where((r) => r.isPromoted == true || r.promotedUntil != null).toList();

    final activeItems = allBoosted.where((r) => r.isCurrentlyPromoted).toList();
    final expiredItems = allBoosted.where((r) => !r.isCurrentlyPromoted).toList();

    final activeCards = activeItems.map((reel) => Padding(
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
    )).toList();

    final expiredCards = expiredItems.map((reel) => Padding(
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
    )).toList();

    return _buildSubTabSection(
      activeChildren: activeCards,
      expiredChildren: expiredCards,
      activeEmptyMsg: 'No active boosted reels found',
      expiredEmptyMsg: 'No expired boosted reels found',
    );
  }

  Widget _buildProjectsList(AdminState state) {
    final projects = state.projects ?? [];
    final allBoosted = projects.where((p) => p.isPromoted == true || p.promotedUntil != null).toList();

    final activeItems = allBoosted.where((p) => p.isCurrentlyPromoted).toList();
    final expiredItems = allBoosted.where((p) => !p.isCurrentlyPromoted).toList();

    final activeCards = activeItems.map((project) => Padding(
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
    )).toList();

    final expiredCards = expiredItems.map((project) => Padding(
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
    )).toList();

    return _buildSubTabSection(
      activeChildren: activeCards,
      expiredChildren: expiredCards,
      activeEmptyMsg: 'No active boosted projects found',
      expiredEmptyMsg: 'No expired boosted projects found',
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
    // Drop in confirmation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
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
            child: const Text('Delete', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
