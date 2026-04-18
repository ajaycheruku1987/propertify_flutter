import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/feed/bloc/feed_bloc.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import '../../../home/models/feed_posts_response_model.dart';
import '../../../home/presentation/widgets/property_card_compact.dart';
import '../post_details.dart';
import 'comments_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';

class SimilarPostsByCategory extends StatelessWidget {
  final List<FeedPostsResponseModel> similarPosts;
  final String categoryName;

  const SimilarPostsByCategory({
    Key? key,
    required this.similarPosts,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (similarPosts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            'Similar $categoryName Properties',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 16),

          // Horizontal Grid View
          SizedBox(
            height: 250, // Adjusted height to fit the compact card
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: similarPosts.length,
              itemBuilder: (context, index) {
                final post = similarPosts[index];
                return Container(
                  width: 170, // Width for each card
                  margin: EdgeInsets.only(
                    right: index < similarPosts.length - 1 ? 15 : 0,
                  ),
                  child: PropertyCardCompact(
                    imageUrls:
                        (post.imageUrls != null && post.imageUrls!.isNotEmpty)
                        ? post.imageUrls!
                        : [
                            'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?auto=format&fit=crop&w=800&q=80',
                          ],
                    title: post.title ?? 'Property',
                    location: _resolveLocation(post.city, post.address),
                    price: post.price != null ? '₹${post.price}' : null,
                    isLiked: post.isLiked ?? false,
                    isFavorite: post.isFavourited ?? false,
                    isFeatured: post.isPromoted ?? false,
                    commentCount: post.commentsCount ?? 0,
                    likeCount: post.likesCount ?? 0,
                    viewCount: post.viewsCount ?? 0,
                    onFavoritePressed: () {
                      context.read<FeedBloc>().add(
                        FeedEvent.toggleFavorite(propertyId: post.id!),
                      );
                    },
                    onLikePressed: () {
                      context.read<FeedBloc>().add(
                        FeedEvent.likeProperty(propertyId: post.id!),
                      );
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
                      final String imageUrl =
                          post.imageUrls != null && post.imageUrls!.isNotEmpty
                          ? post.imageUrls!.first
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
                      if (post.id != null) {
                        context.push(
                          '${PostDetailsScreen.routeName}?postId=${post.id}',
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
