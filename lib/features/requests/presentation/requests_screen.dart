import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/core/notify_message.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';

import 'package:propertify/features/home/presentation/home_interior_screen.dart';
import 'package:propertify/features/home/presentation/home_loan_screen.dart';
import 'package:propertify/features/home/presentation/widgets/home_loan_widget.dart';
import 'package:propertify/features/home/presentation/widgets/request_tile_widget.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc/requests_bloc.dart';
import 'create_request_details.dart';
import 'edit_request.dart';
import 'dart:async';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  int _currentSlide = 0;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    // Trigger the initial request to fetch data
    context.read<RequestsBloc>().add(
      RequestsEvent.getRequests(
        skip: 0,
        limit: 10,
        latitude: context.read<HomeBloc>().state.currentLat,
        longitude: context.read<HomeBloc>().state.currentLng,
        radiusKm: 10,
      ),
    );
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
      final state = context.read<RequestsBloc>().state;
      if (!state.isLoading && state.hasMoreData) {
        final homeState = context.read<HomeBloc>().state;
        context.read<RequestsBloc>().add(
          RequestsEvent.getRequests(
            skip: state.currentOffset,
            limit: 10,
            latitude: homeState.currentLat,
            longitude: homeState.currentLng,
            radiusKm: 10,
          ),
        );
      }
    }
  }

  Future<void> _onRefresh() async {
    final homeState = context.read<HomeBloc>().state;
    final filterData = homeState.activeRequestsFilter;

    String? city;
    double? latitude = homeState.currentLat;
    double? longitude = homeState.currentLng;
    double radiusKm = 5;

    if (filterData != null) {
      city = filterData['address'] as String?;

      final isLocationCustom = filterData['isLocationCustom'] == true;
      if (isLocationCustom) {
        latitude = filterData['latitude'] as double?;
        longitude = filterData['longitude'] as double?;
      }
      radiusKm = 15;
    }

    final requestsBloc = context.read<RequestsBloc>();
    final completer = Completer<void>();
    final subscription = requestsBloc.stream.listen((state) {
      if (!state.isLoading) {
        if (!completer.isCompleted) completer.complete();
      }
    });

    requestsBloc.add(
      RequestsEvent.getRequests(
        skip: 0,
        limit: 10,
        city: city,
        latitude: latitude,
        longitude: longitude,
        radiusKm: radiusKm,
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
    return BlocBuilder<RequestsBloc, RequestsState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              if (homeState.activeRequestsFilter != null)
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
                delegate: SliverChildListDelegate([
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.1,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentSlide = index;
                        });
                      },
                    ),
                    items: [
                      if (!Platform.isIOS)
                        AdSliderWidget(
                          title: 'Home Loan',
                          caption: 'Need a home Loan Raise a\nRequest',
                          onCreateRequest: () {
                            context.read<HomeBloc>().state.showAddButton
                                ? context.push(
                                    CreateRequestDetails.routeName,
                                    extra: 'Loan',
                                  )
                                : context.push(AuthScreen.routeName);
                          },
                          onExploreDetails: () {
                            context.push(HomeLoanScreen.routeName);
                          },
                        ),
                      AdSliderWidget(
                        title: 'Interior Design',
                        caption: 'Design your dream home\nRaise a Request',
                        onCreateRequest: () {
                          context.read<HomeBloc>().state.showAddButton
                              ? context.push(
                                  CreateRequestDetails.routeName,
                                  extra: 'Interior Design',
                                )
                              : context.push(AuthScreen.routeName);
                        },
                        onExploreDetails: () {
                          context.push(HomeInteriorScreen.routeName);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (!Platform.isIOS)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(2, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentSlide == index ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentSlide == index
                                ? Colors.deepPurple
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      }),
                    ),
                  const SizedBox(height: 16),
                ]),
              ),
              // Requests List as Sliver
              _buildRequestsListSliver(state),
              if (state.isLoading && state.requestsList.isNotEmpty)
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

  Widget _buildRequestsListSliver(RequestsState state) {
    if (state.isLoading && state.requestsList.isEmpty) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.notifyStatus != null &&
        state.notifyStatus!.type == NotifyType.error) {
      return SliverFillRemaining(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            state.notifyStatus!.message ?? 'Failed to load requests',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    final homeState = context.read<HomeBloc>().state;
    final activeFilter = homeState.activeRequestsFilter;
    final selectedCategoryType = activeFilter?['categoryType'] as String?;

    final filteredList = state.requestsList.where((request) {
      if (request.category == 'Loan' ||
          request.category == 'Interior Design') {
        return false;
      }
      if (selectedCategoryType != null &&
          selectedCategoryType != 'All' &&
          selectedCategoryType.isNotEmpty) {
        return request.category?.toLowerCase() == selectedCategoryType.toLowerCase();
      }
      return true;
    }).toList();

    if (filteredList.isEmpty) {
      return SliverFillRemaining(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              state.requestsList.isEmpty
                  ? 'No requests available. Be the first to create one!'
                  : 'No requests available for category: $selectedCategoryType',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final request = filteredList[index];
        return RequestTileWidget(
          title: request.title ?? request.category ?? 'Unknown Request',
          ownerName: () {
            final owner = request.owner;
            if (owner == null) return 'Unknown Provider';
            final firstName = owner.firstName?.trim() ?? '';
            final lastName = owner.lastName?.trim() ?? '';
            if (firstName.isNotEmpty || lastName.isNotEmpty) {
              return '$firstName $lastName'.trim();
            }
            return owner.username ?? 'Unknown Provider';
          }(),
          budget: request.budget?.toString() ?? 'Unknown Budget',
          location: '${request.city ?? ''}',
          description: request.description ?? 'Unknown Description',
          type: request.category ?? 'General',
          createdAt: request.createdAt ?? 'Unknown Date',
          onEditPressed:
              request.owner?.id ==
                  context.read<ProfileBloc>().state.userProfile?.id
              ? () {
                  // Navigate to edit screen
                  context.push(EditRequest.routeName, extra: request);
                }
              : null,
          onDeletePressed:
              request.owner?.id ==
                  context.read<ProfileBloc>().state.userProfile?.id
              ? () {
                  // Show confirmation dialog before deleting
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Delete Request'),
                        content: const Text(
                          'Are you sure you want to delete this request?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              context.read<RequestsBloc>().add(
                                RequestsEvent.deleteRequest(
                                  requestId: request.id!,
                                ),
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
                }
              : null,

          onCallPressed: () {
            debugPrint('Calling ${request.phoneNumber}');
            if (!context.read<HomeBloc>().state.showAddButton) {
              context.push(AuthScreen.routeName);
              return;
            }
            if (request.phoneNumber != null) {
              launchUrl(Uri(scheme: 'tel', path: request.phoneNumber!));
            }
          },
          onWhatsAppPressed: () {
            debugPrint('WhatsApp to ${request.phoneNumber}');
            if (!context.read<HomeBloc>().state.showAddButton) {
              context.push(AuthScreen.routeName);
              return;
            }
            if (request.phoneNumber != null) {
              launchUrl(
                Uri(scheme: 'https', host: 'wa.me', path: request.phoneNumber!),
              );
            }
          },
          onTap: () {
            debugPrint('Tapped on request ${request.id}');
          },
        );
      }, childCount: filteredList.length),
    );
  }

  void _applyRequestsFilter(BuildContext context, Map<String, dynamic> filterData) {
    final categoryType = filterData['categoryType'] as String?;
    final isLocationCustom = filterData['isLocationCustom'] == true;

    final isDefault = (categoryType == 'All' || categoryType == null) && !isLocationCustom;

    if (isDefault) {
      context.read<HomeBloc>().add(const HomeEvent.updateRequestsFilter(null));
      context.read<RequestsBloc>().add(
        RequestsEvent.getRequests(
          latitude: context.read<HomeBloc>().state.currentLat,
          longitude: context.read<HomeBloc>().state.currentLng,
          radiusKm: 5,
        ),
      );
    } else {
      context.read<HomeBloc>().add(HomeEvent.updateRequestsFilter(filterData));

      final latitude = isLocationCustom ? filterData['latitude'] as double? : context.read<HomeBloc>().state.currentLat;
      final longitude = isLocationCustom ? filterData['longitude'] as double? : context.read<HomeBloc>().state.currentLng;

      context.read<RequestsBloc>().add(
        RequestsEvent.getRequests(
          city: filterData['address'] as String?,
          latitude: latitude,
          longitude: longitude,
          radiusKm: 15,
        ),
      );
    }
  }

  Widget _buildActiveFilterChips(BuildContext context, HomeState state) {
    if (state.activeRequestsFilter == null) return const SizedBox.shrink();

    final filter = state.activeRequestsFilter!;
    final chips = <Widget>[];

    if (filter['isLocationCustom'] == true && filter['address'] != null) {
      chips.add(
        _buildChip('Location: ${filter['address']}', () {
          final newFilter = Map<String, dynamic>.from(filter);
          newFilter['isLocationCustom'] = false;
          newFilter['address'] = null;
          newFilter['latitude'] = null;
          newFilter['longitude'] = null;
          _applyRequestsFilter(context, newFilter);
        }),
      );
    }
    final categoryType = filter['categoryType'] as String?;
    if (categoryType != null && categoryType != 'All' && categoryType.isNotEmpty) {
      chips.add(
        _buildChip('Category: $categoryType', () {
          final newFilter = Map<String, dynamic>.from(filter);
          newFilter['categoryType'] = 'All';
          _applyRequestsFilter(context, newFilter);
        }),
      );
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
