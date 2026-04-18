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
import 'package:url_launcher/url_launcher.dart';
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
          Container(
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
              onPressed: () {
                // Handle share functionality
              },
            ),
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
                        if (isOwner)
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
                                }
                              },
                              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
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

                        // const SizedBox(height: 14),

                        // Description Section
                        DescriptionSection(
                          description: postDetails.description ?? '',
                        ),

                        const SizedBox(height: 24),

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

                        // Call and WhatsApp Buttons
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
