import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:propertify/core/notify_message.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/features/admin/bloc/admin_bloc.dart';
import 'package:propertify/features/services/models/services_response_model.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/features/services/presentation/widgets/service_card.dart';
import 'package:propertify/features/services/presentation/view_service.dart';
import 'package:propertify/core/app_cache_service.dart';
import 'package:propertify/core/service_locator.dart';

class AllServicesListAdminView extends StatefulWidget {
  static const String routeName = '/admin-services-list';

  const AllServicesListAdminView({super.key});

  @override
  State<AllServicesListAdminView> createState() =>
      _AllServicesListAdminViewState();
}

class _AllServicesListAdminViewState extends State<AllServicesListAdminView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<AdminBloc>().add(const AdminEvent.getServices());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final state = context.read<AdminBloc>().state;
      if (!state.isLoading && state.hasMoreServices) {
        context.read<AdminBloc>().add(
          AdminEvent.getServices(
            page: state.currentServicesPage + 1,
            limit: 30,
          ),
        );
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
          inAsyncCall: state.isLoading && state.services == null,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  _buildHeader(context),
                  Expanded(
                    child: state.services == null || state.services!.isEmpty
                        ? _buildEmptyState()
                        : _buildServicesList(state.services!),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
                'Professional Services',
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

  Widget _buildServicesList(List<ServicesResponseModel> services) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<AdminBloc>().add(const AdminEvent.getServices());
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          final currentUserId = profileState.userProfile?.id;
          final role = serviceLocator<AppCacheService>()
              .getRole()
              ?.toLowerCase();
          final isAdmin = role == 'admin';

          return ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount:
                services.length +
                (context.read<AdminBloc>().state.hasMoreServices ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == services.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              final service = services[index];
              final isOwner =
                  currentUserId != null && currentUserId == service.userId;

              return ServiceCard(
                imageUrl: (service.imageUrls?.isNotEmpty ?? false)
                    ? service.imageUrls![0]
                    : 'https://images.unsplash.com/photo-1581578731548-c64695cc6958?w=800',
                title: service.agentName ?? 'Unknown Agent',
                category: (service.category?.isNotEmpty ?? false)
                    ? service.category!.join(', ')
                    : 'Expert',
                providerName: service.owner?.username ?? 'Anonymous',
                location: '${service.city ?? "N/A"}, ${service.state ?? ""}',
                rating: double.tryParse(service.rating ?? '0'),
                canDelete: isAdmin || isOwner,
                onFavoritePressed: () {},
                onCardPressed: () {
                  context.push(
                    ViewServiceScreen.routeName,
                    extra: service.id ?? '',
                  );
                },
                onDelete: () {
                  _showDeleteDialog(context, service.id ?? '');
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.engineering_outlined,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No services found',
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

  void _showDeleteDialog(BuildContext context, String serviceId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Service'),
        content: const Text('Are you sure you want to delete this service?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<AdminBloc>().add(
                AdminEvent.deleteService(serviceId: serviceId),
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
