import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';

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
    context.read<FeedBloc>().add(
      FeedEvent.getFeedsEvent(
        offset: 0,
        latitude: context.read<HomeBloc>().state.currentLat,
        longitude: context.read<HomeBloc>().state.currentLng,
      ),
    );
    context.read<ProfileBloc>().add(const ProfileEvent.loadBannerAds());
    if (widget.onRefresh != null) {
      widget.onRefresh!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        if (state.isLoading && state.feedsList.isEmpty) {
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

        if (state.notifyStatus != null && state.feedsList.isEmpty) {
          return CustomScrollView(
            slivers: [
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
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
          );
        }

        if (state.feedsList.isEmpty) {
          return CustomScrollView(
            slivers: [
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
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
    final bool isOwner = currentUserId != null && currentUserId == feed.owner?.id;

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
      isFeatured: feed.isPromoted ?? false,
      commentCount: feed.commentsCount ?? 0,
      likeCount: feed.likesCount ?? 0,
      viewCount: feed.viewsCount ?? 0,
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
            content: const Text('Are you sure you want to delete this property?'),
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
                child: const Text('Delete', style: TextStyle(color: Colors.red)),
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
        final String postedBy = feed.owner?.username ?? 'Propertify User';
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
    final bool isOwner = currentUserId != null && currentUserId == feed.owner?.id;

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
      isFeatured: feed.isPromoted ?? false,
      commentCount: feed.commentsCount ?? 0,
      likeCount: feed.likesCount ?? 0,
      viewCount: feed.viewsCount ?? 0,
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
            content: const Text('Are you sure you want to delete this property?'),
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
                child: const Text('Delete', style: TextStyle(color: Colors.red)),
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
        final String postedBy = feed.owner?.username ?? 'Propertify User';
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
}
