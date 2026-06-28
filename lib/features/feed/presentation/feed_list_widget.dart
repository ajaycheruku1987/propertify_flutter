import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/feed/repo/feed_repo.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import '../../home/presentation/widgets/banner_ad_widget.dart';
import '../../profile/presentation/create_banner_ad.dart';

import '../../home/presentation/widgets/property_card.dart';
import '../../home/presentation/widgets/property_card_compact.dart';
import '../bloc/feed_bloc.dart';
import 'post_details.dart';
import 'widgets/comments_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:async';

class FeedListWidget extends StatefulWidget {
  final VoidCallback? onRefresh;

  const FeedListWidget({super.key, this.onRefresh});

  @override
  State<FeedListWidget> createState() => _FeedListWidgetState();
}

class _FeedListWidgetState extends State<FeedListWidget> {
  ScrollController? _scrollController;
  int _currentBannerIndex = 0;
  bool _isGridView = true; // Track grid/list view mode

  @override
  void initState() {
    super.initState();
    // Load initial feeds
    context.read<FeedBloc>().add(
      FeedEvent.getFeedsEvent(
        latitude: context.read<HomeBloc>().state.currentLat,
        longitude: context.read<HomeBloc>().state.currentLng,
      ),
    );
    // Load Banner Ads
    context.read<ProfileBloc>().add(const ProfileEvent.loadBannerAds());
  }

  void _handleReportProperty(String propertyId) {
    if (!context.read<HomeBloc>().state.showAddButton) {
      CustomToast.showErrorToast(msg: 'please login to report');
      context.push(AuthScreen.routeName);
      return;
    }

    final TextEditingController reasonController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    String? selectedReason = 'Spam or Misleading';
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Row(
                children: [
                  Icon(
                    Icons.report_problem_rounded,
                    color: Colors.orange,
                    size: 28,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Report Property',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              content: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Why are you reporting this property?',
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      const SizedBox(height: 12),
                      ...[
                        'Spam or Misleading',
                        'Incorrect details/Price',
                        'Inappropriate content',
                        'Other',
                      ].map((reason) {
                        return RadioListTile<String>(
                          title: Text(
                            reason,
                            style: const TextStyle(fontSize: 14),
                          ),
                          value: reason,
                          groupValue: selectedReason,
                          activeColor: Theme.of(context).primaryColor,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          onChanged: (val) {
                            setState(() {
                              selectedReason = val;
                            });
                          },
                        );
                      }),
                      if (selectedReason == 'Other') ...[
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: reasonController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Enter reason here...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a reason';
                            }
                            return null;
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isLoading
                      ? null
                      : () => Navigator.pop(dialogContext),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (selectedReason == 'Other' &&
                              !formKey.currentState!.validate()) {
                            return;
                          }

                          final reasonText = selectedReason == 'Other'
                              ? reasonController.text.trim()
                              : selectedReason!;

                          setState(() {
                            isLoading = true;
                          });

                          final repo = FeedRepo();
                          final res = await repo.reportProperty(
                            propertyId: propertyId,
                            reason: reasonText,
                          );

                          if (context.mounted) {
                            Navigator.pop(dialogContext);
                            res.fold(
                              (failure) {
                                CustomToast.showErrorToast(
                                  msg: failure.message,
                                );
                              },
                              (success) {
                                CustomToast.showSuccessToast(
                                  msg:
                                      'Post reported, we will investigate further',
                                );
                              },
                            );
                          }
                        },
                  child: isLoading
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Report',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Attach scroll listener to the PrimaryScrollController provided by NestedScrollView
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
      final feedState = context.read<FeedBloc>().state;
      if (!feedState.isLoading && feedState.hasMoreData) {
        context.read<FeedBloc>().add(
          FeedEvent.getFeedsEvent(
            limit: 10,
            offset: feedState.currentOffset,
            latitude: context.read<HomeBloc>().state.currentLat,
            longitude: context.read<HomeBloc>().state.currentLng,
          ),
        );
      }
    }
  }

  Future<void> _onRefresh() async {
    final homeState = context.read<HomeBloc>().state;
    final filterData = homeState.activeFeedsFilter;

    String? city;
    String? listingType;
    String? propertyType;
    double? minPrice;
    double? maxPrice;
    double? latitude = homeState.currentLat;
    double? longitude = homeState.currentLng;

    if (filterData != null) {
      city = filterData['location'] as String?;
      final lookingFor = filterData['lookingFor'] as String?;
      listingType = lookingFor == 'Sales'
          ? 'Sell'
          : (lookingFor == 'All' || lookingFor == '')
              ? null
              : lookingFor;

      final propertyTypes = filterData['propertyTypes'] as List?;
      propertyType = propertyTypes != null &&
              propertyTypes.isNotEmpty &&
              !propertyTypes.contains('All')
          ? propertyTypes.first as String?
          : null;

      minPrice = (filterData['priceRange'] as Map?)?['min']?.toDouble();
      maxPrice = (filterData['priceRange'] as Map?)?['max']?.toDouble();

      final isLocationCustom = filterData['isLocationCustom'] == true;
      if (isLocationCustom) {
        latitude = filterData['latitude'] as double?;
        longitude = filterData['longitude'] as double?;
      }
    }

    final feedBloc = context.read<FeedBloc>();
    final completer = Completer<void>();
    final subscription = feedBloc.stream.listen((state) {
      if (!state.isLoading) {
        if (!completer.isCompleted) completer.complete();
      }
    });

    feedBloc.add(
      FeedEvent.getFeedsEvent(
        offset: 0,
        city: city,
        listingType: listingType,
        propertyType: propertyType,
        minPrice: minPrice,
        maxPrice: maxPrice,
        latitude: latitude,
        longitude: longitude,
      ),
    );
    context.read<ProfileBloc>().add(const ProfileEvent.loadBannerAds());
    if (widget.onRefresh != null) {
      widget.onRefresh!();
    }

    await Future.any([
      completer.future,
      Future.delayed(const Duration(seconds: 5)),
    ]);
    await subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = context.watch<HomeBloc>().state;
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        if (state.isLoading && state.feedsList.isEmpty) {
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

        if (state.notifyStatus != null && state.feedsList.isEmpty) {
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
                if (homeState.activeFeedsFilter != null)
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
                SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.circleExclamation,
                          size: 60,
                          color: Colors.red.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.notifyStatus!.message,
                          style: const TextStyle(fontSize: 16, color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<FeedBloc>().add(
                              const FeedEvent.getFeedsEvent(),
                            );
                            context.read<ProfileBloc>().add(
                              const ProfileEvent.loadBannerAds(),
                            );
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        if (state.feedsList.isEmpty) {
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
                if (homeState.activeFeedsFilter != null)
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
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.house,
                          size: 60,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No properties found',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
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
              if (homeState.activeFeedsFilter != null)
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
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // Banner Ads Section
                    _buildBannerAds(context),

                    // Feeds Section Header with Grid/List Toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'New Listing',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.list,
                                size: 20,
                                color: !_isGridView
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isGridView = false;
                                });
                              },
                              tooltip: 'List View',
                            ),
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.borderAll,
                                size: 20,
                                color: _isGridView
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isGridView = true;
                                });
                              },
                              tooltip: 'Grid View',
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ]),
                ),
              ),
              // Grid or List View
              if (_isGridView)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.79,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final feed = state.feedsList[index];
                      return _buildPropertyCardCompact(feed);
                    }, childCount: state.feedsList.length),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final feed = state.feedsList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _buildPropertyCard(feed),
                      );
                    }, childCount: state.feedsList.length),
                  ),
                ),
              // Loading indicator
              if (state.isLoading && state.feedsList.isNotEmpty)
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

  Widget _buildPropertyCardCompact(dynamic feed) {
    final currentUserId = context.read<ProfileBloc>().state.userProfile?.id;
    final bool isOwner =
        currentUserId != null && currentUserId == feed.owner?.id;

    return PropertyCardCompact(
      imageUrls: (feed.imageUrls != null && feed.imageUrls!.isNotEmpty)
          ? feed.imageUrls!
          : [
              'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?auto=format&fit=crop&w=800&q=80',
            ],
      title: feed.title ?? 'Property',
      location: _resolveLocation(feed.city, feed.address),
      price: feed.price != null ? '₹${feed.price}' : null,
      isLiked: feed.isLiked ?? false,
      isFavorite: feed.isFavourited ?? false,
      isFeatured: feed.isCurrentlyPromoted,
      isTopAd: feed.isCurrentlyPromoted,
      promotedAt: feed.promotedAt,
      promotedUntil: feed.promotedUntil,
      createdAt: feed.createdAt,
      commentCount: feed.commentsCount ?? 0,
      likeCount: feed.likesCount ?? 0,
      viewCount: feed.viewsCount ?? 0,
      listingType: feed.listingType,
      canEdit: isOwner,
      canDelete: isOwner,
      onEditPressed: () {
        context.push('/edit-feed', extra: feed);
      },
      onDeletePressed: () {
        showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('Delete Property'),
            content: const Text(
              'Are you sure you want to delete this property?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                  context.read<FeedBloc>().add(
                    FeedEvent.deleteProperty(propertyId: feed.id!),
                  );
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
      onFavoritePressed: () {
        context.read<FeedBloc>().add(
          FeedEvent.toggleFavorite(propertyId: feed.id!),
        );
      },
      onReportPressed: () {
        if (feed.id != null) {
          _handleReportProperty(feed.id!);
        }
      },
      onLikePressed: () {
        context.read<FeedBloc>().add(
          FeedEvent.likeProperty(propertyId: feed.id!),
        );
      },
      onCommentPressed: () {
        if (feed.id != null) {
          CommentsBottomSheet.show(
            context,
            feed.id!,
            context.read<HomeBloc>().state.showAddButton,
          );
        }
      },
      onSharePressed: () {
        final String postTitle = feed.title ?? 'Property';
        final String postDescription =
            feed.description ?? 'Check out this property';
        final String postedBy = () {
          final owner = feed.owner;
          if (owner == null) return 'Propertify User';
          final firstName = owner.firstName?.trim() ?? '';
          final lastName = owner.lastName?.trim() ?? '';
          if (firstName.isNotEmpty || lastName.isNotEmpty) {
            return '$firstName $lastName'.trim();
          }
          return owner.username ?? 'Propertify User';
        }();
        final String imageUrl =
            feed.imageUrls != null && feed.imageUrls!.isNotEmpty
            ? feed.imageUrls!.first
            : '';

        final String shareMessage =
            '''
🏠 $postTitle

📝 Description:
$postDescription

👤 Posted by: $postedBy

${imageUrl.isNotEmpty ? '📷 Image: $imageUrl' : ''}

Check it out on Propertify!

📱 Download the app: https://play.google.com/store/apps/details?id=com.placeofsalesrealestate
                  '''
                .trim();

        Share.share(shareMessage, subject: postTitle);
      },
      onCardPressed: () {
        if (feed.id != null) {
          context.push('${PostDetailsScreen.routeName}?postId=${feed.id}');
        }
      },
    );
  }

  Widget _buildPropertyCard(dynamic feed) {
    final currentUserId = context.read<ProfileBloc>().state.userProfile?.id;
    final bool isOwner =
        currentUserId != null && currentUserId == feed.owner?.id;

    return PropertyCard(
      imageUrls: (feed.imageUrls != null && feed.imageUrls!.isNotEmpty)
          ? feed.imageUrls!
          : [
              'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?auto=format&fit=crop&w=800&q=80',
            ],
      title: feed.title ?? 'Property',
      location: _resolveLocation(feed.city, feed.address),
      price: feed.price != null ? '₹${feed.price}' : null,
      rating: feed.rating?.toDouble(),
      showActions: true,
      isLiked: feed.isLiked ?? false,
      isFavorite: feed.isFavourited ?? false,
      isFeatured: feed.isCurrentlyPromoted,
      isTopAd: feed.isCurrentlyPromoted,
      promotedAt: feed.promotedAt,
      promotedUntil: feed.promotedUntil,
      createdAt: feed.createdAt,
      commentCount: feed.commentsCount ?? 0,
      likeCount: feed.likesCount ?? 0,
      viewCount: feed.viewsCount ?? 0,
      listingType: feed.listingType,
      canEdit: isOwner,
      canDelete: isOwner,
      onEditPressed: () {
        context.push('/edit-feed', extra: feed);
      },
      onDeletePressed: () {
        showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('Delete Property'),
            content: const Text(
              'Are you sure you want to delete this property?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                  context.read<FeedBloc>().add(
                    FeedEvent.deleteProperty(propertyId: feed.id!),
                  );
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
      onFavoritePressed: () {
        context.read<FeedBloc>().add(
          FeedEvent.toggleFavorite(propertyId: feed.id!),
        );
      },
      onReportPressed: () {
        if (feed.id != null) {
          _handleReportProperty(feed.id!);
        }
      },
      onLikePressed: () {
        context.read<FeedBloc>().add(
          FeedEvent.likeProperty(propertyId: feed.id!),
        );
      },
      onCommentPressed: () {
        if (feed.id != null) {
          CommentsBottomSheet.show(
            context,
            feed.id!,
            context.read<HomeBloc>().state.showAddButton,
          );
        }
      },
      onSharePressed: () {
        final String postTitle = feed.title ?? 'Property';
        final String postDescription =
            feed.description ?? 'Check out this property';
        final String postedBy = () {
          final owner = feed.owner;
          if (owner == null) return 'Propertify User';
          final firstName = owner.firstName?.trim() ?? '';
          final lastName = owner.lastName?.trim() ?? '';
          if (firstName.isNotEmpty || lastName.isNotEmpty) {
            return '$firstName $lastName'.trim();
          }
          return owner.username ?? 'Propertify User';
        }();
        final String imageUrl =
            feed.imageUrls != null && feed.imageUrls!.isNotEmpty
            ? feed.imageUrls!.first
            : '';

        final String shareMessage =
            '''
🏠 $postTitle

📝 Description:
$postDescription

👤 Posted by: $postedBy

${imageUrl.isNotEmpty ? '📷 Image: $imageUrl' : ''}

Check it out on Propertify!

📱 Download the app: https://play.google.com/store/apps/details?id=com.placeofsalesrealestate
                  '''
                .trim();

        Share.share(shareMessage, subject: postTitle);
      },
      onCardPressed: () {
        if (feed.id != null) {
          context.push('${PostDetailsScreen.routeName}?postId=${feed.id}');
        }
      },
    );
  }

  Widget _buildBannerAds(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state.bannerAds == null) {
          return const SizedBox.shrink();
        }

        if (state.bannerAds!.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: InkWell(
              onTap: () => context.push(CreateBannerAdScreen.routeName),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8B5CF6), Color(0xFFC084FC)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8B5CF6).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -20,
                      bottom: -30,
                      child: Icon(
                        Icons.rocket_launch,
                        size: 150,
                        color: Colors.white.withOpacity(0.15),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_business_outlined,
                            size: 48,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Boost Your Property',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Create Banner Ad',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final ads = state.bannerAds!;

        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1.0,
                autoPlay: true,
                enableInfiniteScroll: ads.length > 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentBannerIndex = index;
                  });
                },
              ),
              items: ads.map((ad) {
                return BannerAdWidget(bannerAd: ad);
              }).toList(),
            ),
            const SizedBox(height: 8),
            // Dots
            if (ads.length > 1)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ads.asMap().entries.map((entry) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF8B5CF6).withOpacity(
                        _currentBannerIndex == entry.key ? 0.9 : 0.4,
                      ),
                    ),
                  );
                }).toList(),
              ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }

  String _resolveLocation(String? city, String? address) {
    if (city == null || city.isEmpty) return '';

    // Check if city starts with comma (meaning village/area is missing)
    if (city.trim().startsWith(',')) {
      final cleanedCity = city.trim().substring(1).trim();

      String state = '';
      if (address != null && address.isNotEmpty) {
        final parts = address.split(',');
        // "in the addresss last to 3 text is state" -> 3rd component from the end
        if (parts.length >= 3) {
          state = parts[parts.length - 3].trim();
        }
      }

      if (state.isNotEmpty) {
        return '$cleanedCity, $state';
      }
      return cleanedCity;
    }

    return city;
  }

  void _applyFeedsFilter(BuildContext context, Map<String, dynamic> filterData) {
    final propertyTypes = filterData['propertyTypes'] as List?;
    final lookingFor = filterData['lookingFor'] as String?;
    final priceRange = filterData['priceRange'] as Map?;
    final isLocationCustom = filterData['isLocationCustom'] == true;

    final isDefault =
        (lookingFor == 'All' || lookingFor == '') &&
        (propertyTypes == null ||
            propertyTypes.isEmpty ||
            propertyTypes.contains('All')) &&
        (priceRange == null ||
            (priceRange['min'] == 100000 && priceRange['max'] == 50000000)) &&
        !isLocationCustom;

    if (isDefault) {
      context.read<HomeBloc>().add(const HomeEvent.updateFeedsFilter(null));
      context.read<FeedBloc>().add(
        FeedEvent.getFeedsEvent(
          latitude: context.read<HomeBloc>().state.currentLat,
          longitude: context.read<HomeBloc>().state.currentLng,
        ),
      );
    } else {
      context.read<HomeBloc>().add(HomeEvent.updateFeedsFilter(filterData));

      final mappedLookingFor = lookingFor == 'Sales'
          ? 'Sell'
          : (lookingFor == 'All' || lookingFor == '')
          ? null
          : lookingFor;

      final propertyType =
          propertyTypes != null &&
              propertyTypes.isNotEmpty &&
              !propertyTypes.contains('All')
          ? propertyTypes.first as String?
          : null;

      final latitude = isLocationCustom
          ? filterData['latitude'] as double?
          : context.read<HomeBloc>().state.currentLat;
      final longitude = isLocationCustom
          ? filterData['longitude'] as double?
          : context.read<HomeBloc>().state.currentLng;

      context.read<FeedBloc>().add(
        FeedEvent.getFeedsEvent(
          city: filterData['location'] as String?,
          listingType: mappedLookingFor,
          propertyType: propertyType,
          minPrice: (filterData['priceRange'] as Map?)?['min']?.toDouble(),
          maxPrice: (filterData['priceRange'] as Map?)?['max']?.toDouble(),
          latitude: latitude,
          longitude: longitude,
        ),
      );
    }
  }

  Widget _buildActiveFilterChips(BuildContext context, HomeState state) {
    if (state.activeFeedsFilter == null) return const SizedBox.shrink();

    final filter = state.activeFeedsFilter!;
    final chips = <Widget>[];

    if (filter['isLocationCustom'] == true && filter['location'] != null) {
      chips.add(
        _buildChip('Location: ${filter['location']}', () {
          final newFilter = Map<String, dynamic>.from(filter);
          newFilter['isLocationCustom'] = false;
          newFilter['location'] = null;
          newFilter['addressText'] = null;
          newFilter['latitude'] = null;
          newFilter['longitude'] = null;
          _applyFeedsFilter(context, newFilter);
        }),
      );
    }
    final lookingFor = filter['lookingFor'] as String?;
    if (lookingFor != null && lookingFor != 'All' && lookingFor.isNotEmpty) {
      chips.add(
        _buildChip('Looking For: $lookingFor', () {
          final newFilter = Map<String, dynamic>.from(filter);
          newFilter['lookingFor'] = 'All';
          _applyFeedsFilter(context, newFilter);
        }),
      );
    }
    final propertyTypes = filter['propertyTypes'] as List?;
    if (propertyTypes != null &&
        propertyTypes.isNotEmpty &&
        !propertyTypes.contains('All')) {
      for (final type in propertyTypes) {
        chips.add(
          _buildChip('Type: $type', () {
            final newFilter = Map<String, dynamic>.from(filter);
            final list = List<String>.from(newFilter['propertyTypes'] ?? []);
            list.remove(type);
            newFilter['propertyTypes'] = list;
            _applyFeedsFilter(context, newFilter);
          }),
        );
      }
    }
    final priceRange = filter['priceRange'] as Map?;
    if (priceRange != null &&
        (priceRange['min'] != 100000 || priceRange['max'] != 50000000)) {
      chips.add(
        _buildChip(
          'Price: ₹${(priceRange['min'] as num).round()} - ₹${(priceRange['max'] as num).round()}',
          () {
            final newFilter = Map<String, dynamic>.from(filter);
            newFilter['priceRange'] = {'min': 100000, 'max': 50000000};
            _applyFeedsFilter(context, newFilter);
          },
        ),
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
