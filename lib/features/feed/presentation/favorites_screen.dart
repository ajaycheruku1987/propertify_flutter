import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/feed/bloc/feed_bloc.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/home/models/feed_posts_response_model.dart';
import 'package:propertify/features/home/presentation/widgets/property_card.dart';
import 'package:propertify/features/feed/presentation/post_details.dart';
import 'package:propertify/utils/env.dart';
import 'widgets/comments_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';

class FavoritesScreen extends StatefulWidget {
  static const String routeName = '/favorites';
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FeedBloc>().add(const FeedEvent.getFavourites());
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
          'Favorites',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          if (state.isFavouritesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final items = state.favouritesList;
          if (items.isEmpty) {
            return const Center(child: Text('No favorites yet'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final FeedPostsResponseModel post = items[index];
              final imageUrls = _resolveImages(post.imageUrls);
              final title = post.title ?? 'Untitled';
              final location = post.city ?? '';
              final price = post.price != null ? '₹${post.price}' : null;
              final isFavorite = post.isFavourited ?? true;
              final isLiked = post.isLiked ?? false;
              final isTopAd = post.isPromoted ?? false;
              final isFeatured = post.isPromoted ?? false;
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
                showActions: true,
                commentCount: post.commentsCount ?? 0,
                likeCount: post.likesCount ?? 0,
                viewCount: post.viewsCount ?? 0,
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
                onSharePressed: () {
                  // Prepare share content
                  final String postTitle = post.title ?? 'Property';
                  final String postDescription =
                      post.description ?? 'Check out this property';
                  final String postedBy =
                      post.owner?.username ?? 'Propertify User';
                  final String imageUrl = imageUrls.isNotEmpty
                      ? imageUrls.first
                      : '';

                  // Create formatted message
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
                onCommentPressed: () {
                  if (post.id != null) {
                    CommentsBottomSheet.show(
                      context,
                      post.id!,
                      context.read<HomeBloc>().state.showAddButton,
                    );
                  }
                },
              );
            },
          );
        },
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
