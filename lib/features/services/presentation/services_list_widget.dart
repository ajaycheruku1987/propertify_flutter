import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/features/services/presentation/view_service.dart';
import 'package:propertify/utils/custom_toast.dart';

import 'widgets/service_card.dart';

class ServicesListWidget extends StatefulWidget {
  const ServicesListWidget({super.key});

  @override
  State<ServicesListWidget> createState() => _ServicesListWidgetState();
}

class _ServicesListWidgetState extends State<ServicesListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeState = context.read<HomeBloc>().state;
      context.read<ServicesBloc>().add(
        ServicesEvent.getServicesEvent(
          skip: 0,
          limit: 10,
          latitude: homeState.currentLat,
          longitude: homeState.currentLng,
          radiusKm: 5,
        ),
      );
      _scrollController.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Scroll handling for future pagination
  }

  Future<void> _onRefresh() async {
    final homeState = context.read<HomeBloc>().state;
    context.read<ServicesBloc>().add(
      ServicesEvent.getServicesEvent(
        skip: 0,
        limit: 10,
        latitude: homeState.currentLat,
        longitude: homeState.currentLng,
        radiusKm: 5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        final services = state.servicesList;
        final currentUserId = context.read<ProfileBloc>().state.userProfile?.id;

        if (state.isLoading && services.isEmpty) {
          return CustomScrollView(
            slivers: [
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
              ),
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }

        if (!state.isLoading && services.isEmpty) {
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: CustomScrollView(
              slivers: [
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context,
                  ),
                ),
                const SliverFillRemaining(
                  child: Center(child: Text('No services found')),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CustomScrollView(
            slivers: [
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final service = services[index];
                  final imageUrl =
                      (service.imageUrls != null &&
                          service.imageUrls!.isNotEmpty)
                      ? service.imageUrls!.first
                      : 'https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=300&h=200&fit=crop';
                  final categoryLabel =
                      (service.category != null && service.category!.isNotEmpty)
                      ? service.category!.join(', ')
                      : 'General';
                  final ratingValue = double.tryParse(service.rating ?? '');
                  final isOwner = service.owner?.id == currentUserId && currentUserId != null;

                  return ServiceCard(
                    imageUrl: imageUrl,
                    title: service.agentName ?? 'Service',
                    category: categoryLabel,
                    providerName: service.owner?.username ?? 'Unknown Provider',
                    location: service.city ?? 'Unknown Location',
                    rating: ratingValue,
                    ratingCount: service.ratingCount,
                    isTopAd: service.isVerified ?? false,
                    isFavorite: false,
                    canEdit: isOwner,
                    onEdit: isOwner ? () {
                      context.push('/edit-service', extra: service);
                    } : null,
                    canDelete: isOwner,
                    onDelete: isOwner ? () {
                      showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title: const Text('Delete Service'),
                            content: const Text('Are you sure you want to delete this service?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(dialogContext).pop(),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(dialogContext).pop();
                                  context.read<ServicesBloc>().add(
                                    ServicesEvent.deleteServiceEvent(serviceId: service.id ?? ''),
                                  );
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } : null,
                    onCardPressed: () {
                      context.push(
                        ViewServiceScreen.routeName,
                        extra: service.id ?? '',
                      );
                    },
                    onFavoritePressed: () {
                      CustomToast.showSuccessToast(msg: 'Added to favorites');
                    },
                  );
                }, childCount: services.length),
              ),
            ],
          ),
        );
      },
    );
  }
}
