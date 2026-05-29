import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/feed/bloc/feed_bloc.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/home/models/feed_posts_response_model.dart';
import 'package:propertify/features/home/presentation/widgets/property_card.dart';
import 'package:propertify/features/feed/presentation/post_details.dart';
import 'package:propertify/features/feed/repo/feed_repo.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
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
                onReportPressed: () {
                  if (post.id != null) {
                    _handleReportProperty(post.id!);
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
}
