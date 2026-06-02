import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/core/content_type.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/utils/common_widgets/select_plan_screen.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/features/feed/repo/feed_repo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'widgets/comments_bottom_sheet.dart';
import '../bloc/feed_bloc.dart';
import 'widgets/image_carousel.dart';
import 'widgets/property_info.dart';
import 'widgets/description_section.dart';
import 'widgets/agent_info.dart';
import 'widgets/similar_properties.dart';
import 'widgets/similar_posts_by_category.dart';
import 'widgets/action_buttons.dart';

class PostDetailsScreen extends StatefulWidget {
  static const String routeName = '/post-details';

  final String postId;

  const PostDetailsScreen({Key? key, required this.postId}) : super(key: key);

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Reset similar posts by category on screen load
      context.read<FeedBloc>().add(
        const FeedEvent.resetSimilarPostsByCategory(),
      );

      // Load post details when screen initializes
      context.read<FeedBloc>().add(
        FeedEvent.getPostDetailsEvent(postId: widget.postId),
      );
      // Record property view for analytics/tracking
      if (context.read<HomeBloc>().state.showAddButton) {
        context.read<FeedBloc>().add(
          FeedEvent.recordPropertyView(propertyId: widget.postId),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleShare(dynamic postDetails) {
    if (postDetails == null) return;

    final String postTitle = postDetails.title ?? 'Property';
    final String postDescription =
        postDetails.description ?? 'Check out this property';
    final String postedBy = postDetails.owner?.username ?? 'Propertify User';
    final String imageUrl =
        postDetails.imageUrls != null && postDetails.imageUrls!.isNotEmpty
            ? postDetails.imageUrls!.first
            : '';

    final String shareMessage = '''
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
  }

  Widget _buildInteractionItem({
    required IconData icon,
    required String label,
    required Color color,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<FeedBloc, FeedState>(
            builder: (context, state) {
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.shareNodes,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () => _handleShare(state.postDetails),
                ),
              );
            },
          ),
          context.read<HomeBloc>().state.showAddButton
              ? BlocBuilder<FeedBloc, FeedState>(
                  builder: (context, state) {
                    final currentUserId =
                        context.read<ProfileBloc>().state.userProfile?.id;
                    final isOwner = state.postDetails?.owner?.id != null &&
                        state.postDetails?.owner?.id == currentUserId;

                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            right: 8,
                            top: 8,
                            bottom: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(
                              (state.postDetails?.isFavourited ?? false)
                                  ? FontAwesomeIcons.solidHeart
                                  : FontAwesomeIcons.heart,
                              color: (state.postDetails?.isFavourited ?? false)
                                  ? Colors.red
                                  : Colors.black,
                              size: 20,
                            ),
                            onPressed: () {
                              if (state.postDetails?.id != null) {
                                context.read<FeedBloc>().add(
                                  FeedEvent.toggleFavorite(
                                    propertyId: state.postDetails!.id!,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 8,
                            top: 8,
                            bottom: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: PopupMenuButton<String>(
                            color: Colors.white,
                            padding: EdgeInsets.zero,
                            position: PopupMenuPosition.under,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.black87,
                              size: 20,
                            ),
                            onSelected: (value) {
                              if (value == 'edit') {
                                context.push('/edit-feed', extra: state.postDetails!);
                              } else if (value == 'delete') {
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
                                            FeedEvent.deleteProperty(propertyId: widget.postId),
                                          );
                                        },
                                        child: const Text('Delete', style: TextStyle(color: Colors.red)),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (value == 'report') {
                                _handleReportProperty(widget.postId);
                              }
                            },
                            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                              if (isOwner) ...[
                                const PopupMenuItem<String>(
                                  value: 'edit',
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit, size: 18, color: Colors.blue),
                                      SizedBox(width: 8),
                                      Text('Edit'),
                                    ],
                                  ),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'delete',
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete, size: 18, color: Colors.red),
                                      SizedBox(width: 8),
                                      Text('Delete', style: TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                ),
                              ],
                              if (!isOwner)
                                const PopupMenuItem<String>(
                                  value: 'report',
                                  child: Row(
                                    children: [
                                      Icon(Icons.report, size: 18, color: Colors.orange),
                                      SizedBox(width: 8),
                                      Text('Report'),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )
              : Container(),
        ],
      ),
      body: BlocListener<FeedBloc, FeedState>(
        listener: (context, state) {
          if (state.notifyStatus?.message == 'Property deleted successfully') {
            context.pop();
            return;
          }

          // When post details are loaded, fetch similar posts by category
          if (state.postDetails != null &&
              state.postDetails?.propertyType != null &&
              state.similarPostsByCategory.isEmpty) {
            context.read<FeedBloc>().add(
              FeedEvent.getSimilarPostsByCategoryEvent(
                propertyType: state.postDetails!.propertyType,
                excludePostId: widget.postId,
                limit: 10,
              ),
            );
          }
        },
        child: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.postDetails == null) {
              return const Center(child: Text('Post not found'));
            }

            final postDetails = state.postDetails!;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Carousel Section
                  SizedBox(
                    height: 340,
                    child: ImageCarousel(
                      images: postDetails.imageUrls ?? [],
                      createdAt: postDetails.createdAt,
                    ),
                  ),

                  // Content
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Property Info Section
                        PropertyInfo(
                          title: postDetails.title ?? '',
                          location: _resolveLocation(
                            postDetails.city,
                            postDetails.address,
                          ),
                          price: postDetails.price?.toString() ?? '',
                        ),

                        // Description Section
                        DescriptionSection(
                          description: postDetails.description ?? '',
                        ),

                        const SizedBox(height: 16),

                        // Agent Info Section
                        AgentInfo(
                          agentName: postDetails.owner?.username != null
                              ? '${postDetails.owner!.username!}'
                              : '-',
                          agentRole: '',
                          agentImage: postDetails.owner?.profileImage ?? '',
                          rating: postDetails.rating?.toString() ?? '-',
                          userId: postDetails.owner?.id,
                        ),

                        const SizedBox(height: 16),

                        context.read<ProfileBloc>().state.userProfile?.id ==
                                    postDetails.owner?.id &&
                                postDetails.isPromoted == false
                            ? Center(
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigate to SelectPlanScreen when boost post is tapped
                                    final postId = postDetails.id ?? '';
                                    context.push(
                                      '${SelectPlanScreen.routeName}?contentType=${ContentType.FEED.value}&contentId=$postId',
                                    );
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/boost_post.svg',
                                  ),
                                ),
                              )
                            : Container(),

                        const SizedBox(height: 4),
                        // Interaction Buttons (Like, Comment, Views)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.grey.shade200),
                                bottom: BorderSide(color: Colors.grey.shade200),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildInteractionItem(
                                  icon: postDetails.isLiked == true
                                      ? FontAwesomeIcons.solidThumbsUp
                                      : FontAwesomeIcons.thumbsUp,
                                  label: '${postDetails.likesCount ?? 0} Likes',
                                  color: postDetails.isLiked == true
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey.shade700,
                                  onTap: () {
                                    if (!context.read<HomeBloc>().state.showAddButton) {
                                      CustomToast.showErrorToast(msg: 'Please login to like');
                                      context.push(AuthScreen.routeName);
                                      return;
                                    }
                                    context.read<FeedBloc>().add(
                                      FeedEvent.likeProperty(
                                        propertyId: postDetails.id!,
                                      ),
                                    );
                                  },
                                ),
                                Container(
                                  height: 20,
                                  width: 1,
                                  color: Colors.grey.shade300,
                                ),
                                _buildInteractionItem(
                                  icon: FontAwesomeIcons.comment,
                                  label: '${postDetails.commentsCount ?? 0} Comments',
                                  color: Colors.grey.shade700,
                                  onTap: () {
                                    CommentsBottomSheet.show(
                                      context,
                                      postDetails.id!,
                                      context.read<HomeBloc>().state.showAddButton,
                                    );
                                  },
                                ),
                                Container(
                                  height: 20,
                                  width: 1,
                                  color: Colors.grey.shade300,
                                ),
                                _buildInteractionItem(
                                  icon: FontAwesomeIcons.eye,
                                  label: '${postDetails.viewsCount ?? 0} Views',
                                  color: Colors.grey.shade700,
                                  onTap: null, // View only
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Call and WhatsApp Buttons
                        const SizedBox(height: 16),

                        // Similar Posts by Category Section
                        if (state.similarPostsByCategory.isNotEmpty)
                          Column(
                            children: [
                              SimilarPostsByCategory(
                                similarPosts: state.similarPostsByCategory,
                                categoryName:
                                    postDetails.propertyType ?? 'Related',
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),

                        // Similar Properties Section
                        SimilarProperties(
                          similarProperties: state.similarProperties ?? [],
                        ),

                        const SizedBox(height: 100), // Space for bottom buttons
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: SafeArea(child: _buildContactButtons()),
      // Bottom Action Buttons
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

  Widget _buildContactButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle call functionality

                if (!context.read<HomeBloc>().state.showAddButton) {
                  context.push(AuthScreen.routeName);
                  return;
                }

                String mobile =
                    context
                        .read<FeedBloc>()
                        .state
                        .postDetails
                        ?.owner
                        ?.phoneNumber ??
                    '';
                if (mobile.isNotEmpty) {
                  final Uri launchUri = Uri(scheme: 'tel', path: mobile);
                  launchUrl(launchUri);
                }
              },
              icon: const Icon(
                FontAwesomeIcons.phone,
                color: Colors.white,
                size: 20,
              ),
              label: const Text('Call'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C5CE7),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () async {
                // Handle WhatsApp functionality
                if (!context.read<HomeBloc>().state.showAddButton) {
                  context.push(AuthScreen.routeName);
                  return;
                }
                String mobile =
                    context
                        .read<FeedBloc>()
                        .state
                        .postDetails
                        ?.owner
                        ?.phoneNumber ??
                    '';
                if (mobile.isNotEmpty) {
                  String cleanMobile = mobile.replaceAll(RegExp(r'\D'), '');
                  var whatsappUrl = "whatsapp://send?phone=$cleanMobile";
                  var uri = Uri.parse(whatsappUrl);

                  try {
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      // Fallback to web
                      final webUri = Uri.parse('https://wa.me/$cleanMobile');
                      if (!await launchUrl(
                        webUri,
                        mode: LaunchMode.externalApplication,
                      )) {
                        throw 'Could not launch WhatsApp';
                      }
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Could not open WhatsApp'),
                        ),
                      );
                    }
                  }
                }
              },
              icon: const Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.white,
                size: 20,
              ),
              label: const Text('WhatsApp'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF25D366),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
