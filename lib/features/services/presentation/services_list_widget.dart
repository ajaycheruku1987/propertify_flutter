import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/features/services/presentation/view_service.dart';
import 'package:propertify/utils/custom_toast.dart';

import 'widgets/service_card.dart';
import 'dart:async';

class ServicesListWidget extends StatefulWidget {
  const ServicesListWidget({super.key});

  @override
  State<ServicesListWidget> createState() => _ServicesListWidgetState();
}

class _ServicesListWidgetState extends State<ServicesListWidget> {
  ScrollController? _scrollController;

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
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newController = PrimaryScrollController.of(context);
    if (_scrollController != newController) {
      _scrollController?.removeListener(_onScroll);
      _scrollController = newController;
      _scrollController!.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final controller = _scrollController;
    if (controller == null || !controller.hasClients) return;
    if (controller.position.pixels >=
        controller.position.maxScrollExtent - 300) {
      final state = context.read<ServicesBloc>().state;
      if (!state.isLoading && state.hasMoreData) {
        final homeState = context.read<HomeBloc>().state;
        context.read<ServicesBloc>().add(
          ServicesEvent.getServicesEvent(
            skip: state.currentOffset,
            limit: 10,
            latitude: homeState.currentLat,
            longitude: homeState.currentLng,
            radiusKm: 5,
          ),
        );
      }
    }
  }

  Future<void> _onRefresh() async {
    final homeState = context.read<HomeBloc>().state;
    final filterData = homeState.activeServicesFilter;

    List<String>? categoriesList;
    double? latitude = homeState.currentLat;
    double? longitude = homeState.currentLng;
    double radiusKm = 5;

    if (filterData != null) {
      final list = <String>[];
      final String? serviceType = filterData['serviceType'] as String?;
      if (serviceType != null && serviceType != 'All') {
        list.add(serviceType);
      }
      final List? categories = filterData['categories'] as List?;
      if (categories != null) {
        for (final cat in categories) {
          if (cat != 'All' && cat is String) {
            list.add(cat);
          }
        }
      }
      if (list.isNotEmpty) {
        categoriesList = list;
      }
      final isLocationCustom = filterData['isLocationCustom'] == true;
      if (isLocationCustom) {
        latitude = filterData['latitude'] as double?;
        longitude = filterData['longitude'] as double?;
      }
      radiusKm = 15;
    }

    final servicesBloc = context.read<ServicesBloc>();
    final completer = Completer<void>();
    final subscription = servicesBloc.stream.listen((state) {
      if (!state.isLoading) {
        if (!completer.isCompleted) completer.complete();
      }
    });

    final double? minRating = filterData != null
        ? (filterData['minRating'] as num?)?.toDouble()
        : null;

    servicesBloc.add(
      ServicesEvent.getServicesEvent(
        skip: 0,
        limit: 10,
        categoryNames: categoriesList,
        latitude: latitude,
        longitude: longitude,
        radiusKm: radiusKm,
        minRating: minRating,
      ),
    );

    await Future.any([
      completer.future,
      Future.delayed(const Duration(seconds: 5)),
    ]);
    await subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = context.watch<HomeBloc>().state;
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        final services = state.servicesList;
        final currentUserId = context.read<ProfileBloc>().state.userProfile?.id;

        if (state.isLoading && services.isEmpty) {
          return CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
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
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context,
                  ),
                ),
                if (homeState.activeServicesFilter != null)
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _StickyChipHeaderDelegate(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: _buildActiveFilterChips(context, homeState),
                      ),
                      height: 52.0,
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
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
              ),
              if (homeState.activeServicesFilter != null)
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickyChipHeaderDelegate(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _buildActiveFilterChips(context, homeState),
                    ),
                    height: 52.0,
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
                    isTopAd: service.isCurrentlyPromoted,
                    isVerified: service.isVerified ?? false,
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
                    promotedAt: service.promotedAt,
                    promotedUntil: service.promotedUntil,
                    createdAt: service.createdAt,
                  );
                }, childCount: services.length),
              ),
              if (state.isLoading && services.isNotEmpty)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _applyServicesFilter(BuildContext context, Map<String, dynamic> filterData) {
    final serviceType = filterData['serviceType'] as String?;
    final categories = filterData['categories'] as List?;
    final isLocationCustom = filterData['isLocationCustom'] == true;
    final double? minRating = (filterData['minRating'] as num?)?.toDouble();

    final isDefault = (serviceType == 'All' || serviceType == null) &&
        (categories == null || categories.isEmpty || categories.contains('All')) &&
        !isLocationCustom &&
        (minRating == null || minRating <= 1.0);

    if (isDefault) {
      context.read<HomeBloc>().add(const HomeEvent.updateServicesFilter(null));
      context.read<ServicesBloc>().add(
        ServicesEvent.getServicesEvent(
          latitude: context.read<HomeBloc>().state.currentLat,
          longitude: context.read<HomeBloc>().state.currentLng,
          radiusKm: 5,
        ),
      );
    } else {
      context.read<HomeBloc>().add(HomeEvent.updateServicesFilter(filterData));
      
      final List<String> categoriesList = [];
      if (serviceType != null && serviceType != 'All') {
        categoriesList.add(serviceType);
      }
      if (categories != null) {
        for (final cat in categories) {
          if (cat != 'All' && cat is String) {
            categoriesList.add(cat);
          }
        }
      }

      final latitude = isLocationCustom ? filterData['latitude'] as double? : context.read<HomeBloc>().state.currentLat;
      final longitude = isLocationCustom ? filterData['longitude'] as double? : context.read<HomeBloc>().state.currentLng;

      context.read<ServicesBloc>().add(
        ServicesEvent.getServicesEvent(
          categoryNames: categoriesList.isNotEmpty ? categoriesList : null,
          latitude: latitude,
          longitude: longitude,
          radiusKm: 15,
          minRating: minRating,
        ),
      );
    }
  }

  Widget _buildActiveFilterChips(BuildContext context, HomeState state) {
    if (state.activeServicesFilter == null) return const SizedBox.shrink();

    final filter = state.activeServicesFilter!;
    final chips = <Widget>[];

    if (filter['isLocationCustom'] == true && filter['address'] != null) {
      chips.add(
        _buildChip('Location: ${filter['address']}', () {
          final newFilter = Map<String, dynamic>.from(filter);
          newFilter['isLocationCustom'] = false;
          newFilter['address'] = null;
          newFilter['latitude'] = null;
          newFilter['longitude'] = null;
          _applyServicesFilter(context, newFilter);
        }),
      );
    }
    final serviceType = filter['serviceType'] as String?;
    if (serviceType != null && serviceType != 'All' && serviceType.isNotEmpty) {
      chips.add(
        _buildChip('Type: $serviceType', () {
          final newFilter = Map<String, dynamic>.from(filter);
          newFilter['serviceType'] = 'All';
          _applyServicesFilter(context, newFilter);
        }),
      );
    }
    final categories = filter['categories'] as List?;
    if (categories != null && categories.isNotEmpty && !categories.contains('All')) {
      for (final cat in categories) {
        chips.add(
          _buildChip('Category: $cat', () {
            final newFilter = Map<String, dynamic>.from(filter);
            final list = List<String>.from(newFilter['categories'] ?? []);
            list.remove(cat);
            newFilter['categories'] = list;
            _applyServicesFilter(context, newFilter);
          }),
        );
      }
    }

    if (chips.isEmpty) return const SizedBox.shrink();

    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        itemBuilder: (context, index) => chips[index],
      ),
    );
  }

  Widget _buildChip(String label, VoidCallback onRemove) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(Icons.close, size: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _StickyChipHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _StickyChipHeaderDelegate({required this.child, this.height = 52.0});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      height: height,
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant _StickyChipHeaderDelegate oldDelegate) {
    return oldDelegate.child != child || oldDelegate.height != height;
  }
}
