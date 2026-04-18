import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:propertify/core/content_type.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:propertify/utils/common_widgets/select_plan_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import '../bloc/services_bloc.dart';
import '../models/services_response_model.dart';
import '../../feed/presentation/widgets/image_carousel.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';

import 'write_review_screen.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/services/presentation/aadhar_verification_screen.dart';
import 'package:propertify/utils/string_extensions.dart';
import '../../feed/presentation/widgets/agent_info.dart';
import 'widgets/service_reviews_widget.dart';

class ViewServiceScreen extends StatefulWidget {
  static const String routeName = '/view-service';

  final String serviceId;

  const ViewServiceScreen({super.key, required this.serviceId});

  @override
  State<ViewServiceScreen> createState() => _ViewServiceScreenState();
}

class _ViewServiceScreenState extends State<ViewServiceScreen> {
  bool _isDescriptionExpanded = false;
  double _userRating = 0.0;

  @override
  void initState() {
    super.initState();
    // Load service details when screen initializes
    context.read<ServicesBloc>().add(
      ServicesEvent.getServiceDetailsEvent(serviceId: widget.serviceId),
    );
    // Load service reviews
    context.read<ServicesBloc>().add(
      ServicesEvent.getServiceReviewsEvent(
        serviceId: widget.serviceId,
        skip: 0,
        limit: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesBloc, ServicesState>(
      listenWhen: (previous, current) =>
          previous.notifyStatus != current.notifyStatus &&
          current.notifyStatus != null,
      listener: (context, state) {
        if (state.notifyStatus?.message == 'Service deleted successfully') {
          context.pop(); // the underlying List screen will already be updated
        }
      },
      builder: (context, state) {
        final service = state.serviceDetails;
        if (state.isLoading || service == null) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final currentUserId = context.read<ProfileBloc>().state.userProfile?.id;
        final isOwner =
            currentUserId != null && currentUserId == service.userId;

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
                icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                  icon: const Icon(Icons.share, color: Colors.black),
                  onPressed: () {
                    // Prepare share content
                    final String serviceTitle =
                        service.agentName ?? 'Professional Service';
                    final String serviceDescription =
                        service.description ??
                        'Check out this professional service';
                    final String categories =
                        (service.category != null &&
                            service.category!.isNotEmpty)
                        ? service.category!.join(', ')
                        : 'Expert';
                    final String location =
                        '${service.city ?? ""}, ${service.state ?? ""}'.trim();
                    final String imageUrl =
                        (service.imageUrls != null &&
                            service.imageUrls!.isNotEmpty)
                        ? service.imageUrls!.first
                        : '';

                    final String shareMessage =
                        '''
🏠 $serviceTitle

🏷️ Category: $categories
📍 Location: $location

📝 Description:
$serviceDescription

${imageUrl.isNotEmpty ? '📷 Image: $imageUrl' : ''}

Check it out on Propertify!

📱 Download the app: https://play.google.com/store/apps/details?id=com.placeofsalesrealestate
'''
                            .trim();

                    Share.share(shareMessage, subject: serviceTitle);
                  },
                ),
              ),
              if (isOwner)
                PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.more_vert, color: Colors.black),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  position: PopupMenuPosition.under,
                  onSelected: (value) {
                    if (value == 'edit') {
                      context.push('/edit-service', extra: service);
                    } else if (value == 'delete') {
                      showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title: const Text('Delete Service'),
                            content: const Text(
                              'Are you sure you want to delete this service?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(dialogContext).pop(),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(dialogContext).pop();
                                  context.read<ServicesBloc>().add(
                                    ServicesEvent.deleteServiceEvent(
                                      serviceId: service.id ?? '',
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'edit',
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit_outlined,
                                size: 20,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 8),
                              Text('Edit', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_outline,
                                size: 20,
                                color: Colors.red,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Carousel Section
                SizedBox(
                  height: 340,
                  child: ImageCarousel(
                    images: service.imageUrls ?? [],
                    createdAt: service.createdAt,
                  ),
                ),

                // Content
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Service Provider Info Section
                      _buildServiceProviderInfo(service),

                      // const SizedBox(height: 12),

                      // Verification Banner
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, profileState) {
                          final isOwner =
                              profileState.userProfile?.id == service.userId;
                          final isVerified = service.isVerified ?? false;
                          final isGSTVerified =
                              service.aadharVerificationStatus ?? '';

                          if (isOwner &&
                              !isVerified &&
                              service.aadharCardImageUrl == null) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.push(
                                      AadharVerificationScreen.routeName,
                                      extra: service.id ?? '',
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Image.asset(
                                      'assets/images/verify_service_banner.png',
                                      width: double.infinity,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],
                            );
                          } else if (isOwner &&
                              !isVerified &&
                              isGSTVerified == 'none') {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.push(
                                      '/verification-payment?type=aadhaar&entityId=${service.id}&showSkip=false',
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Theme.of(
                                              context,
                                            ).primaryColor.withOpacity(0.1),
                                            Theme.of(
                                              context,
                                            ).primaryColor.withOpacity(0.05),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: Theme.of(
                                                context,
                                              ).primaryColor.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Icon(
                                              Icons.payment,
                                              color: Theme.of(
                                                context,
                                              ).primaryColor,
                                              size: 24,
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Complete Verification',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                const Text(
                                                  'Pay now to proceed with verification',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Theme.of(
                                              context,
                                            ).primaryColor,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),

                      // Description Section
                      _buildDescriptionSection(service),

                      const SizedBox(height: 12),

                      // Address Section
                      _buildAddressSection(service),

                      const SizedBox(height: 12),

                      // Social Media Section
                      _buildSocialMediaSection(service),

                      const SizedBox(height: 12),

                      // Agent Info Section
                      AgentInfo(
                        agentName:
                            service.owner?.username ??
                            '${service.owner?.firstName ?? ""} ${service.owner?.lastName ?? ""}'
                                .trim(),
                        agentRole: '',
                        agentImage: service.owner?.profilepic ?? '',
                        rating: service.rating?.toString() ?? '-',
                        userId: service.owner?.id,
                      ),

                      const SizedBox(height: 12),

                      // Reviews Section
                      ServiceReviewsWidget(
                        reviews: state.serviceReviews,
                        serviceId: widget.serviceId,
                      ),

                      const SizedBox(height: 12),

                      // Rating Section
                      if (context.read<HomeBloc>().state.showAddButton)
                        state.serviceDetails?.myReview != null
                            ? _buildMyReviewSection(
                                state.serviceDetails!.myReview!,
                              )
                            : _buildRatingSection(),

                      const SizedBox(height: 12),

                      // Boost Now Button (only for owner)
                      _buildBoostButton(service),

                      const SizedBox(height: 80), // Space for bottom buttons
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: _buildBottomActionButtons(service),
          ),
        );
      },
    );
  }

  Widget _buildServiceProviderInfo(ServicesResponseModel service) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  (service.agentName ?? 'Service Name').toTitleCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (service.isVerified ?? false)
                SvgPicture.asset(
                  'assets/icons/verified_icon.svg',
                  width: 20,
                  height: 20,
                ),
            ],
          ),

          const SizedBox(height: 4),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (service.category != null && service.category!.isNotEmpty)
                    ? service.category!
                          .map((cat) => cat.toTitleCase())
                          .join(' | ')
                    : 'General',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(service) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            (service.description ?? 'No description available')
                .toString()
                .capitalize(),
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
              height: 1.5,
            ),
            maxLines: _isDescriptionExpanded ? null : 3,
            overflow: _isDescriptionExpanded ? null : TextOverflow.ellipsis,
          ),

          const SizedBox(height: 8),

          GestureDetector(
            onTap: () {
              setState(() {
                _isDescriptionExpanded = !_isDescriptionExpanded;
              });
            },
            child: Text(
              _isDescriptionExpanded ? 'Read less' : 'Read more',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6C5CE7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSection(ServicesResponseModel service) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Address',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            '${service.address ?? ''}',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaSection(ServicesResponseModel service) {
    final hasFacebook =
        service.socialFacebook != null && service.socialFacebook!.isNotEmpty;
    final hasInstagram =
        service.socialInstagram != null && service.socialInstagram!.isNotEmpty;
    final hasLinkedin =
        service.socialLinkedin != null && service.socialLinkedin!.isNotEmpty;

    if (!hasFacebook && !hasInstagram && !hasLinkedin) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Social Media',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              if (hasFacebook)
                _buildSocialMediaButton(
                  icon: FontAwesomeIcons.facebook,
                  label: 'Facebook',
                  color: Theme.of(context).primaryColor,
                  link: service.socialFacebook ?? '',
                ),
              if (hasFacebook && (hasInstagram || hasLinkedin))
                const SizedBox(width: 16),
              if (hasInstagram)
                _buildSocialMediaButton(
                  icon: FontAwesomeIcons.instagram,
                  label: 'Instagram',
                  color: Theme.of(context).primaryColor,
                  link: service.socialInstagram ?? '',
                ),
              if (hasInstagram && hasLinkedin) const SizedBox(width: 16),
              if (hasLinkedin)
                _buildSocialMediaButton(
                  icon: FontAwesomeIcons.linkedin,
                  label: 'LinkedIn',
                  color: Theme.of(context).primaryColor,
                  link: service.socialLinkedin ?? '',
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaButton({
    required IconData icon,
    required String label,
    required Color color,
    // required VoidCallback onTap,
    required String link,
  }) {
    return GestureDetector(
      onTap: () async {
        try {
          final uri = Uri.tryParse(link);
          if (uri != null && await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            CustomToast.showErrorToast(msg: 'Could not launch the link');
          }
        } catch (_) {
          CustomToast.showErrorToast(msg: 'Could not launch the link');
        }
      },
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            FittedBox(
              child: Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rate Now',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Tell us Your Experience',
                style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
              ),

              const SizedBox(height: 16),

              // Star Rating (tappable, navigates to write review)
              GestureDetector(
                onTap: () {
                  context.push(
                    WriteReviewScreen.routeName,
                    extra: widget.serviceId,
                  );
                },
                child: AnimatedRatingStars(
                  initialRating: _userRating,
                  minRating: 0.0,
                  maxRating: 5.0,
                  filledColor: Colors.orange,
                  emptyColor: Colors.grey[300]!,
                  customFilledIcon: Icons.star,
                  customHalfFilledIcon: Icons.star_half,
                  customEmptyIcon: Icons.star_border,
                  starSize: 32.0,
                  displayRatingValue: false,
                  interactiveTooltips: false,
                  readOnly: true,
                  onChanged: (_) {},
                ),
              ),
            ],
          ),
          CommonCustomButton(
            onTap: () {
              context.push(
                WriteReviewScreen.routeName,
                extra: widget.serviceId,
              );
            },

            buttonChild: Text(
              'Rate now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyReviewSection(MyReview myReview) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Review',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              TextButton(
                onPressed: () {
                  context.push(
                    WriteReviewScreen.routeName,
                    extra: MyReview(
                      id: myReview.id,
                      serviceId: widget.serviceId,
                      rating: myReview.rating,
                      review: myReview.review,
                    ),
                  );
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6C5CE7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedRatingStars(
                  initialRating: (myReview.rating ?? 0).toDouble(),
                  minRating: 0.0,
                  maxRating: 5.0,
                  filledColor: Colors.orange,
                  emptyColor: Colors.grey[300]!,
                  customFilledIcon: Icons.star,
                  customHalfFilledIcon: Icons.star_half,
                  customEmptyIcon: Icons.star_border,
                  starSize: 22.0,
                  displayRatingValue: false,
                  interactiveTooltips: false,
                  readOnly: true,
                  onChanged: (_) {},
                ),
                const SizedBox(height: 8),
                Text(
                  myReview.review?.trim().isNotEmpty == true
                      ? myReview.review!
                      : 'No review text provided',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoostButton(ServicesResponseModel service) {
    return context.read<ProfileBloc>().state.userProfile?.id == service.userId
        ? Center(
            child: GestureDetector(
              onTap: () {
                // Navigate to SelectPlanScreen when boost is tapped
                final serviceId = service.id ?? '';
                context.push(
                  '${SelectPlanScreen.routeName}?contentType=${ContentType.SERVICE.value}&contentId=$serviceId',
                );
              },
              child: SvgPicture.asset('assets/images/boost_post.svg'),
            ),
          )
        : Container();
  }

  Widget _buildBottomActionButtons(ServicesResponseModel service) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Row(
        children: [
          // Call Button
          Expanded(
            child: GestureDetector(
              onTap: () => _makePhoneCall(service.phoneNumber ?? ''),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Call',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // WhatsApp Button
          Expanded(
            child: GestureDetector(
              onTap: () => _openWhatsApp(service.phoneNumber ?? ''),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF25D366),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Whatsapp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    if (!mounted) return;
    if (!context.read<HomeBloc>().state.showAddButton) {
      context.push(AuthScreen.routeName);
      return;
    }
    if (phoneNumber.isEmpty) {
      CustomToast.showErrorToast(msg: 'Phone number not available');
      return;
    }
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        CustomToast.showErrorToast(msg: 'Could not launch dialer');
      }
    } catch (e) {
      CustomToast.showErrorToast(msg: 'Error launching dialer');
    }
  }

  Future<void> _openWhatsApp(String phoneNumber) async {
    if (!mounted) return;
    if (!context.read<HomeBloc>().state.showAddButton) {
      context.push(AuthScreen.routeName);
      return;
    }
    if (phoneNumber.isEmpty) {
      CustomToast.showErrorToast(msg: 'Phone number not available');
      return;
    }

    // Remove any non-numeric characters from phone number
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    final whatsappUrl = "https://wa.me/$cleanPhone";
    final Uri launchUri = Uri.parse(whatsappUrl);

    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri, mode: LaunchMode.externalApplication);
      } else {
        CustomToast.showErrorToast(msg: 'Could not launch WhatsApp');
      }
    } catch (e) {
      CustomToast.showErrorToast(msg: 'Error launching WhatsApp');
    }
  }
}
