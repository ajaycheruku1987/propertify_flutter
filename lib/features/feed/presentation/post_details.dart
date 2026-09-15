import 'package:propertify/l10n/app_localizations.dart';
import 'package:propertify/utils/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:propertify/features/home/models/feed_posts_response_model.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/core/content_type.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/utils/common_widgets/select_plan_screen.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/features/feed/repo/feed_repo.dart';
import 'package:propertify/core/notification_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'widgets/comments_bottom_sheet.dart';
import '../bloc/feed_bloc.dart';
import 'widgets/image_carousel.dart';
import 'widgets/property_info.dart';
import 'widgets/description_section.dart';
import 'widgets/emi_calculator_widget.dart';
import 'widgets/agent_info.dart';
import 'widgets/similar_properties.dart';
import 'widgets/similar_posts_by_category.dart';
import 'widgets/action_buttons.dart';
import '../../../utils/common_widgets/google_ad_banner.dart';

class PostDetailsScreen extends StatefulWidget {
  static const String routeName = '/post-details';

  final String postId;

  const PostDetailsScreen({super.key, required this.postId});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  String? _fetchedSimilarityPostId;
  String? _notifiedPostId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Clear previous similar posts to ensure we fetch fresh data for this specific post
      context.read<FeedBloc>().add(
        const FeedEvent.resetSimilarPostsByCategory(),
      );

      // Load main post details
      context.read<FeedBloc>().add(
        FeedEvent.getPostDetailsEvent(postId: widget.postId),
      );
      
      // Record property view
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
    final l10n = AppLocalizations.of(context)!;

    final String postTitle = (postDetails.title as String? ?? 'Property').translate(context);
    final String postDescription =
        (postDetails.description as String? ?? 'Check out this property').translate(context);
    String postedBy = 'Propertify User';
    if (postDetails.owner != null) {
      final owner = postDetails.owner!;
      final firstName = owner.firstName?.trim() ?? '';
      final lastName = owner.lastName?.trim() ?? '';
      if (firstName.isNotEmpty || lastName.isNotEmpty) {
        postedBy = '$firstName $lastName'.trim().toTitleCase();
      } else {
        postedBy = (owner.username ?? 'Propertify User').toTitleCase();
      }
    }
    final String imageUrl =
        postDetails.imageUrls != null && postDetails.imageUrls!.isNotEmpty
        ? postDetails.imageUrls!.first
        : '';

    final String shareMessage =
        '''
🏠 $postTitle

📝 Description:
$postDescription

👤 Posted by: $postedBy

${imageUrl.isNotEmpty ? '📷 Image: $imageUrl' : ''}

Check it out on Propertify!

📱 Download the app:
Android: https://play.google.com/store/apps/details?id=com.placeofsalesrealestate
iOS: https://apps.apple.com/in/app/propertify-buy-sell-rent/id6763365054
              '''
            .trim();

    Share.share(shareMessage, subject: postTitle);
  }

  Widget _buildInteractionButton({
    required BuildContext context,
    required FaIconData icon,
    required String label,
    required Color color,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            FaIcon(icon, size: 16, color: color),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleReportProperty(String propertyId) {
    final l10n = AppLocalizations.of(context)!;
    if (!context.read<HomeBloc>().state.showAddButton) {
      CustomToast.showErrorToast(msg: l10n.pleaseLoginToReport);
      context.push(AuthScreen.routeName);
      return;
    }

    final TextEditingController reasonController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    String? selectedReason = l10n.spamMisleading;
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
              title: Row(
                children: [
                  const Icon(
                    Icons.report_problem_rounded,
                    color: Colors.orange,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.reportProperty,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      Text(
                        l10n.whyReporting,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...[
                        l10n.spamMisleading,
                        l10n.incorrectDetailsPrice,
                        l10n.inappropriateContent,
                        l10n.other,
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
                      if (selectedReason == l10n.other) ...[
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: reasonController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: l10n.enterReasonHere,
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
                              return l10n.pleaseEnterReason;
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
                    l10n.cancel,
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
                          if (selectedReason == l10n.other &&
                              !formKey.currentState!.validate()) {
                            return;
                          }

                          final reasonText = selectedReason == l10n.other
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
                                  msg: l10n.postReportedSuccess,
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
                      : Text(
                          l10n.report,
                          style: const TextStyle(
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
    final l10n = AppLocalizations.of(context)!;
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
                color: const Color(0x1A000000),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          l10n.details,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<FeedBloc, FeedState>(
            builder: (context, state) {
              final currentUserId = context
                  .read<ProfileBloc>()
                  .state
                  .userProfile
                  ?.id;
              final isOwner =
                  state.postDetails?.owner?.id != null &&
                  state.postDetails?.owner?.id == currentUserId;

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
                          title: Text(l10n.deleteProperty),
                          content: Text(l10n.deleteConfirm),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(dialogContext),
                              child: Text(l10n.cancel),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(dialogContext);
                                context.read<FeedBloc>().add(
                                  FeedEvent.deleteProperty(
                                    propertyId: widget.postId,
                                  ),
                                );
                              },
                              child: Text(
                                l10n.delete,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (value == 'report') {
                      _handleReportProperty(widget.postId);
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        if (isOwner) ...[
                          PopupMenuItem<String>(
                            value: 'edit',
                            child: Row(
                              children: [
                                const Icon(Icons.edit, size: 18, color: Colors.blue),
                                const SizedBox(width: 8),
                                Text(l10n.edit),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'delete',
                            child: Row(
                              children: [
                                const Icon(Icons.delete, size: 18, color: Colors.red),
                                const SizedBox(width: 8),
                                Text(
                                  l10n.delete,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                        if (!isOwner)
                          PopupMenuItem<String>(
                            value: 'report',
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.report,
                                  size: 18,
                                  color: Colors.orange,
                                ),
                                const SizedBox(width: 8),
                                Text(l10n.report),
                              ],
                            ),
                          ),
                      ],
                ),
              );
            },
          ),
        ],
      ),
      body: BlocListener<FeedBloc, FeedState>(
        listenWhen: (previous, current) {
          // Case 1: Property was deleted
          if (current.notifyStatus?.message == 'Property deleted successfully') {
            return true;
          }
          // Case 2: Post details just loaded or changed
          // We only trigger if the ID changes OR if we haven't fetched similarities for this post yet
          return (previous.postDetails?.id != current.postDetails?.id || 
                 _fetchedSimilarityPostId != current.postDetails?.id) &&
              current.postDetails != null;
        },
        listener: (context, state) {
          if (state.notifyStatus?.message == 'Property deleted successfully') {
            context.pop();
            return;
          }

          final postDetails = state.postDetails;
          if (postDetails != null) {
            // Trigger notification if it's user's own post and we haven't notified for this ID yet
            final currentUserId = context.read<ProfileBloc>().state.userProfile?.id;
            final isOwner = postDetails.owner?.id != null && postDetails.owner?.id == currentUserId;
            
            if (isOwner && _notifiedPostId != postDetails.id) {
              _notifiedPostId = postDetails.id;
              NotificationService().showLocalNotification(
                title: l10n.yourPost,
                body: '${l10n.viewingYourOwnPost}: ${postDetails.title}',
              );
            }

            // When post details are loaded, fetch similar posts and similar posts by category
            if (postDetails.id != null &&
                postDetails.propertyType != null &&
                _fetchedSimilarityPostId != postDetails.id) {
              
              // Mark as fetched to prevent loops
              _fetchedSimilarityPostId = postDetails.id;

              // Fetch similar posts by category
              context.read<FeedBloc>().add(
                FeedEvent.getSimilarPostsByCategoryEvent(
                  propertyType: postDetails.propertyType,
                  listingType: postDetails.listingType,
                  excludePostId: widget.postId,
                  limit: 10,
                ),
              );

              // Fetch similar properties
              context.read<FeedBloc>().add(
                FeedEvent.getSimilarPropertiesEvent(
                  propertyType: postDetails.propertyType,
                  listingType: postDetails.listingType,
                  city: postDetails.city,
                  excludePostId: widget.postId,
                  limit: 6,
                ),
              );
            }
          }
        },
        child: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.postDetails == null) {
              return Center(child: Text(l10n.postNotFound));
            }

            final postDetails = state.postDetails!;
            final currentUserId = context
                .read<ProfileBloc>()
                .state
                .userProfile
                ?.id;
            final isOwner =
                postDetails.owner?.id != null &&
                postDetails.owner?.id == currentUserId;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Carousel Section
                  Stack(
                    children: [
                      SizedBox(
                        height: 380,
                        child: ImageCarousel(
                          images: postDetails.imageUrls ?? [],
                          createdAt: postDetails.createdAt,
                          isFavourited: postDetails.isFavourited ?? false,
                          showActionButtons: true,
                          onFavoriteToggle: () {
                            if (!context.read<HomeBloc>().state.showAddButton) {
                              CustomToast.showErrorToast(
                                msg: l10n.pleaseLoginToFavorite,
                              );
                              context.push(AuthScreen.routeName);
                              return;
                            }
                            if (postDetails.id != null) {
                              context.read<FeedBloc>().add(
                                FeedEvent.toggleFavorite(
                                  propertyId: postDetails.id!,
                                ),
                              );
                            }
                          },
                          onShare: () => _handleShare(postDetails),
                        ),
                      ),
                      // Gradient overlay for better text visibility if needed, or rounded corners
                      Positioned(
                        bottom: -1,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Main Content
                  Container(
                    color: Colors.white,
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
                          category: postDetails.propertyType,
                          listingType: postDetails.listingType,
                        ),

                        _buildPromotionSection(postDetails, l10n),

                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(height: 16),
                        ),

                        // Description Section
                        DescriptionSection(
                          description: postDetails.description ?? '',
                        ),

                        if (!isOwner &&
                            (postDetails.listingType?.toLowerCase() == 'sell' ||
                                postDetails.listingType?.toLowerCase() == 'sale'))
                          EmiCalculatorWidget(
                            propertyPrice: (postDetails.price ?? 0).toDouble(),
                          ),

                        // Agent Info Section
                        AgentInfo(
                          agentName: (() {
                            final owner = postDetails.owner;
                            if (owner == null) return 'Propertify User';
                            final firstName = owner.firstName?.trim() ?? '';
                            final lastName = owner.lastName?.trim() ?? '';
                            if (firstName.isNotEmpty || lastName.isNotEmpty) {
                              return '$firstName $lastName'
                                  .trim()
                                  .toTitleCase();
                            }
                            return (owner.username ?? 'Propertify User')
                                .toTitleCase();
                          }()).translate(context),
                          agentRole: '',
                          agentImage: postDetails.owner?.profileImage ?? '',
                          rating: postDetails.rating?.toString() ?? '-',
                          userId: postDetails.owner?.id,
                          memberSince: postDetails.owner?.memberSince,
                          itemsListed: postDetails.owner?.postsCount,
                          onCallPressed: isOwner
                              ? null
                              : () {
                                  if (!context
                                      .read<HomeBloc>()
                                      .state
                                      .showAddButton) {
                                    context.push(AuthScreen.routeName);
                                    return;
                                  }

                                  String mobile =
                                      postDetails.owner?.phoneNumber ?? '';
                                  if (mobile.isNotEmpty) {
                                    final Uri launchUri =
                                        Uri(scheme: 'tel', path: mobile);
                                    launchUrl(launchUri);
                                  }
                                },
                          onWhatsAppPressed: isOwner
                              ? null
                              : () async {
                                  if (!context
                                      .read<HomeBloc>()
                                      .state
                                      .showAddButton) {
                                    context.push(AuthScreen.routeName);
                                    return;
                                  }
                                  String mobile =
                                      postDetails.owner?.phoneNumber ?? '';
                                  if (mobile.isNotEmpty) {
                                    String cleanMobile =
                                        mobile.replaceAll(RegExp(r'\D'), '');
                                    var whatsappUrl =
                                        "whatsapp://send?phone=$cleanMobile";
                                    var uri = Uri.parse(whatsappUrl);

                                    try {
                                      if (await canLaunchUrl(uri)) {
                                        await launchUrl(uri);
                                      } else {
                                        final webUri = Uri.parse(
                                          'https://wa.me/$cleanMobile',
                                        );
                                        if (!await launchUrl(
                                          webUri,
                                          mode: LaunchMode.externalApplication,
                                        )) {
                                          throw 'Could not launch WhatsApp';
                                        }
                                      }
                                    } catch (e) {
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              l10n.couldNotOpenWhatsapp,
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                  }
                                },
                        ),
                        // Stats/Interaction Row (Luxury Style)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildInteractionButton(
                                context: context,
                                icon: postDetails.isLiked == true
                                    ? FontAwesomeIcons.solidThumbsUp
                                    : FontAwesomeIcons.thumbsUp,
                                label: '${postDetails.likesCount ?? 0}',
                                color: postDetails.isLiked == true
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey.shade700,
                                onTap: () {
                                  if (!context
                                      .read<HomeBloc>()
                                      .state
                                      .showAddButton) {
                                    CustomToast.showErrorToast(
                                      msg: l10n.pleaseLoginToLike,
                                    );
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
                              _buildInteractionButton(
                                context: context,
                                icon: FontAwesomeIcons.comment,
                                label: '${postDetails.commentsCount ?? 0}',
                                color: Colors.grey.shade700,
                                onTap: () {
                                  CommentsBottomSheet.show(
                                    context,
                                    postDetails.id!,
                                    context
                                        .read<HomeBloc>()
                                        .state
                                        .showAddButton,
                                  );
                                },
                              ),
                              _buildInteractionButton(
                                context: context,
                                icon: FontAwesomeIcons.eye,
                                label: '${postDetails.viewsCount ?? 0}',
                                color: Colors.grey.shade700,
                                onTap: null,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 8),

                        context.read<ProfileBloc>().state.userProfile?.id ==
                                    postDetails.owner?.id &&
                                !postDetails.isCurrentlyPromoted
                            ? Center(
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
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
                                ),
                              )
                            : Container(),

                        const SizedBox(height: 24),
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
                          similarProperties: state.similarProperties,
                        ),

                        const SizedBox(height: 16),
                        Center(child: GoogleAdBanner()),

                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: null,
      // Bottom Action Buttons
    );
  }

  Widget _buildPromotionSection(FeedPostsResponseModel postDetails, AppLocalizations l10n) {
    final currentUserId = context.read<ProfileBloc>().state.userProfile?.id;
    final isOwner =
        currentUserId != null && currentUserId == postDetails.owner?.id;
    if (!isOwner) return const SizedBox.shrink();

    if (postDetails.promotedUntil == null ||
        postDetails.promotedUntil!.isEmpty) {
      return const SizedBox.shrink();
    }

    final DateTime? expiryDate = DateTime.tryParse(postDetails.promotedUntil!);
    if (expiryDate == null) return const SizedBox.shrink();

    final now = DateTime.now();
    final difference = expiryDate.difference(now);
    final daysLeft = difference.inDays + 1; // round up to include today
    final isExpired = difference.isNegative;

    final formatter = DateFormat('MMM d, yyyy');
    final formattedDate = formatter.format(expiryDate);

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.15),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.campaign_outlined,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isExpired ? l10n.promotionExpired : l10n.daysLeft(daysLeft),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isExpired
                        ? Colors.red.shade700
                        : Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n.promotedUntil(formattedDate),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
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
