import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/feed/bloc/feed_bloc.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/feed/repo/feed_repo.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
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
                    isFeatured: post.isCurrentlyPromoted,
                    commentCount: post.commentsCount ?? 0,
                    likeCount: post.likesCount ?? 0,
                    viewCount: post.viewsCount ?? 0,
                    onFavoritePressed: () {
                      context.read<FeedBloc>().add(
                        FeedEvent.toggleFavorite(propertyId: post.id!),
                      );
                    },
                    onReportPressed: () {
                      if (post.id != null) {
                        _handleReportProperty(context, post.id!);
                      }
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

  void _handleReportProperty(BuildContext context, String propertyId) {
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
}
