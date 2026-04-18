import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/feed/bloc/feed_bloc.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/home/models/feed_posts_response_model.dart';
import 'package:propertify/features/home/presentation/widgets/property_card.dart';
import 'package:propertify/features/feed/presentation/post_details.dart';
import 'package:propertify/utils/env.dart';
import 'package:propertify/features/feed/presentation/widgets/comments_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';

class MyPostsScreen extends StatefulWidget {
  static const String routeName = '/my-posts';

  const MyPostsScreen({super.key});

  @override
  State<MyPostsScreen> createState() => _MyPostsScreenState();
}

class _MyPostsScreenState extends State<MyPostsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isFetchingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<FeedBloc>().add(
      const FeedEvent.getMyProperties(offset: 0, limit: 10),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      final feedBloc = context.read<FeedBloc>();
      final state = feedBloc.state;
      if (!_isFetchingMore &&
          !state.isPostLoading &&
          state.hasMoreMyProperties) {
        setState(() {
          _isFetchingMore = true;
        });
        feedBloc.add(
          FeedEvent.getMyProperties(
            offset: state.myPropertiesOffset,
            limit: 10,
          ),
        );
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'My Posts',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<FeedBloc, FeedState>(
        listener: (context, state) {
          if (!state.isPostLoading && _isFetchingMore) {
            setState(() {
              _isFetchingMore = false;
            });
          }
        },
        child: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            if (state.isPostLoading && state.myPropertiesList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            final items = state.myPropertiesList;
            if (items.isEmpty) {
              return const Center(
                child: Text(
                  'No posts yet',
                  style: TextStyle(color: Colors.black54),
                ),
              );
            }

            return ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: items.length + (state.hasMoreMyProperties ? 1 : 0),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                if (index == items.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final FeedPostsResponseModel post = items[index];
                final List<String> imageUrls = _resolveImages(post.imageUrls);
                final String title = post.title ?? 'Untitled';
                final String location = post.city ?? '';
                final String? price = post.price != null
                    ? '₹${post.price}'
                    : null;
                final bool isFavorite = post.isFavourited ?? false;
                final bool isLiked = post.isLiked ?? false;
                final bool isTopAd = post.isPromoted ?? false;
                final bool isFeatured = post.isPromoted ?? false;

                return PropertyCard(
                  imageUrls: imageUrls,
                  title: title,
                  location: location,
                  rating: post.rating?.toDouble(),
                  price: price,
                  isFavorite: isFavorite,
                  isLiked: isLiked,
                  isTopAd: isTopAd,
                  isFeatured: isFeatured,
                  commentCount: post.commentsCount ?? 0,
                  likeCount: post.likesCount ?? 0,
                  viewCount: post.viewsCount ?? 0,
                  showActions: true,
                  canEdit: true,
                  canDelete: true,
                  onEditPressed: () {
                    context.push('/edit-feed', extra: post);
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
                              if (post.id != null) {
                                context.read<FeedBloc>().add(
                                  FeedEvent.deleteProperty(propertyId: post.id!),
                                );
                              }
                            },
                            child: const Text('Delete', style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    );
                  },
                  onFavoritePressed: () {
                    if (post.id != null) {
                      context.read<FeedBloc>().add(
                        FeedEvent.toggleFavorite(propertyId: post.id!),
                      );
                    }
                  },
                  onCardPressed: () {
                    if (post.id != null) {
                      context.push(
                        '${PostDetailsScreen.routeName}?postId=${post.id}',
                      );
                    }
                  },
                  onCommentPressed: () {
                    if (post.id != null) {
                      CommentsBottomSheet.show(
                        context,
                        post.id!,
                        context.read<HomeBloc>().state.showAddButton,
                      );
                    }
                  },
                  onSharePressed: () {
                    final String postTitle = post.title ?? 'Property';
                    final String postDescription =
                        post.description ?? 'Check out this property';
                    final String postedBy =
                        post.owner?.username ?? 'Propertify User';
                    final String imageUrl = imageUrls.isNotEmpty
                        ? imageUrls.first
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
                  onLikePressed: () {
                    if (post.id != null) {
                      context.read<FeedBloc>().add(
                        FeedEvent.likeProperty(propertyId: post.id!),
                      );
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  List<String> _resolveImages(List<String>? urls) {
    if (urls == null || urls.isEmpty) {
      return [
        'https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=400&h=300&fit=crop',
      ];
    }
    return urls.map((url) {
      return url.startsWith('http')
          ? url
          : '${env.baseUrl.replaceAll('api', '')}$url';
    }).toList();
  }
}
