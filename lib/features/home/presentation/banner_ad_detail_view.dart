import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:propertify/core/app_cache_service.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/features/profile/models/banner_ad_model.dart';
import 'package:propertify/features/profile/presentation/other_user_profile_screen.dart';
import 'package:propertify/features/feed/presentation/widgets/full_screen_image_viewer.dart';
import 'package:propertify/utils/contact_tracker.dart';
import 'package:propertify/utils/env.dart';
import 'package:propertify/utils/safety_disclaimer_helper.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:propertify/utils/string_extensions.dart';
import 'package:propertify/utils/extensions/date_time_extensions.dart';
import 'package:propertify/l10n/app_localizations.dart';

class BannerAdDetailView extends StatefulWidget {
  static const String routeName = '/banner-ad-detail';
  final BannerAdModel bannerAd;

  const BannerAdDetailView({super.key, required this.bannerAd});

  @override
  State<BannerAdDetailView> createState() => _BannerAdDetailViewState();
}

class _BannerAdDetailViewState extends State<BannerAdDetailView> {
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    final ownerId = widget.bannerAd.owner?.id ?? widget.bannerAd.userId;
    if (ownerId != null && ownerId.isNotEmpty) {
      context.read<ProfileBloc>().add(
        ProfileEvent.loadOtherUserProfile(userId: ownerId),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bannerAd = widget.bannerAd;
    final imageUrls = bannerAd.imageUrls ?? [];
    final l10n = AppLocalizations.of(context)!;
    final Map<String, dynamic> adJson = bannerAd.toJson();

    // Calculate campaign info
    final startDate = bannerAd.createdAt != null
        ? DateTime.tryParse(bannerAd.createdAt!) ?? DateTime.now()
        : DateTime.now();
    final endDate = bannerAd.expiresAt.parsePromotionExpiryDate() ??
        DateTime.now().add(const Duration(days: 15));

    final isExpired = bannerAd.expiresAt.isPromotionExpired();
    final daysRemaining = bannerAd.expiresAt.promotionDaysRemaining();
    final statusText = isExpired
        ? l10n.promotionExpired
        : l10n.daysLeft(daysRemaining);
    final startDateStr = DateFormat('dd MMM yyyy').format(startDate);
    final endDateStr = DateFormat('dd MMM yyyy').format(endDate);

    // Safely access dynamic fields
    final String? adAddress = bannerAd.address ?? adJson['address'] as String?;

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
            onPressed: () => context.pop(),
          ),
        ),
        title: Text(
          l10n.featured,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          final role =
              profileState.userProfile?.role ??
              serviceLocator<AppCacheService>().getRole();
          final isAdmin = role?.toLowerCase() == 'admin';
          final currentUserId = profileState.userProfile?.id;
          final ownerId = bannerAd.owner?.id ?? bannerAd.userId;
          final isOwner =
              currentUserId != null &&
              (currentUserId == bannerAd.userId ||
                  currentUserId == bannerAd.owner?.id);

          final ownerName = _getOwnerName(profileState.userProfile, profileState.otherUserProfile, isOwner);
          final ownerAvatar = _getOwnerAvatar(profileState.userProfile, profileState.otherUserProfile, isOwner);
          final ownerPhone = _getOwnerPhone(profileState.otherUserProfile);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Large Image Section (Supports Single & Multiple Images with Full-Screen Pinch-to-Zoom View)
                GestureDetector(
                  onTap: () {
                    if (imageUrls.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenImageViewer(
                            images: imageUrls,
                            initialIndex: _currentImageIndex,
                          ),
                        ),
                      );
                    }
                  },
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        if (imageUrls.length <= 1)
                          Hero(
                            tag: bannerAd.id ?? 'banner',
                            child: CachedNetworkImage(
                              imageUrl: _resolveSingleImage(
                                imageUrls.isNotEmpty ? imageUrls.first : null,
                              ),
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                height: 300,
                                width: double.infinity,
                                color: Colors.grey.shade200,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: 300,
                                width: double.infinity,
                                color: Colors.grey.shade200,
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.grey,
                                  size: 50,
                                ),
                              ),
                            ),
                          )
                        else
                          PageView.builder(
                            itemCount: imageUrls.length,
                            onPageChanged: (index) {
                              setState(() {
                                _currentImageIndex = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return CachedNetworkImage(
                                imageUrl: _resolveSingleImage(imageUrls[index]),
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  height: 300,
                                  width: double.infinity,
                                  color: Colors.grey.shade200,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  height: 300,
                                  width: double.infinity,
                                  color: Colors.grey.shade200,
                                  child: const Icon(
                                    Icons.broken_image,
                                    color: Colors.grey,
                                    size: 50,
                                  ),
                                ),
                              );
                            },
                          ),

                        // Zoom/Fullscreen hint icon
                        Positioned(
                          bottom: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.fullscreen,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),

                        // Image counter badge & dots if multiple images
                        if (imageUrls.length > 1) ...[
                          Positioned(
                            top: 12,
                            right: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${_currentImageIndex + 1}/${imageUrls.length}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imageUrls.asMap().entries.map((entry) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: _currentImageIndex == entry.key ? 16.0 : 8.0,
                                  height: 8.0,
                                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: _currentImageIndex == entry.key
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.5),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.description,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        (bannerAd.description ?? '').translate(context),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),

                      if (adAddress != null && adAddress.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Text(
                          l10n.address,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                adAddress.translate(context),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],

                      if (isAdmin || isOwner) ...[
                        const SizedBox(height: 24),

                        // Campaign Status Section
                        const Text(
                          'Ad Status',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              _buildStatusRow(
                                Icons.timer_outlined,
                                'Remaining',
                                statusText,
                                color: !isExpired
                                    ? Colors.blue
                                    : Colors.red,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Divider(),
                              ),
                              _buildStatusRow(
                                Icons.calendar_today_outlined,
                                'Start Date',
                                startDateStr,
                              ),
                              const SizedBox(height: 12),
                              _buildStatusRow(
                                Icons.calendar_month_outlined,
                                'End Date',
                                endDateStr,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Divider(),
                              ),
                              _buildStatusRow(
                                Icons.phone_in_talk_outlined,
                                'Calls Received',
                                '${bannerAd.callCount ?? 0}',
                                color: Colors.green.shade700,
                              ),
                              const SizedBox(height: 12),
                              _buildStatusRow(
                                FontAwesomeIcons.whatsapp,
                                'WhatsApp Leads',
                                '${bannerAd.whatsappCount ?? 0}',
                                color: const Color(0xFF25D366),
                              ),
                            ],
                          ),
                        ),
                      ],

                      const SizedBox(height: 32),

                      // Owner Details
                      Text(
                        l10n.postedBy,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: ownerAvatar,
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                radius: 25,
                                backgroundImage: imageProvider,
                              ),
                              placeholder: (context, url) => CircleAvatar(
                                radius: 25,
                                backgroundColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                                child: const CircularProgressIndicator(
                                    strokeWidth: 2),
                              ),
                              errorWidget: (context, url, error) =>
                                  CircleAvatar(
                                radius: 25,
                                backgroundColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                                child: Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ownerName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (ownerId != null && ownerId.isNotEmpty)
                                    GestureDetector(
                                      onTap: () {
                                        context.push(
                                          OtherUserProfileScreen.routeName,
                                          extra: {
                                            'userId': ownerId,
                                            'initialTabIndex': 2,
                                          },
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          l10n.viewProfile,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w600,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Call Icon
                            _buildCircleIcon(
                              context,
                              Icons.phone_outlined,
                              Theme.of(context).primaryColor.withOpacity(0.1),
                              Theme.of(context).primaryColor,
                              () => _handleContact(context, ownerPhone, isCall: true),
                            ),
                            const SizedBox(width: 8),
                            // WhatsApp Icon
                            _buildCircleIcon(
                              context,
                              FontAwesomeIcons.whatsapp,
                              const Color(0xFF25D366).withOpacity(0.1),
                              const Color(0xFF25D366),
                              () => _handleContact(context, ownerPhone, isCall: false),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCircleIcon(
    BuildContext context,
    dynamic iconData,
    Color bgColor,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: iconData is IconData
            ? Icon(iconData, color: iconColor, size: 18)
            : FaIcon(iconData as FaIconData, color: iconColor, size: 18),
      ),
    );
  }

  String _getOwnerName(dynamic currentUserProfile, dynamic otherUserProfile, bool isOwner) {
    if (!isOwner && otherUserProfile != null) {
      final String firstName = (otherUserProfile.firstName?.toString() ?? '').trim();
      final String lastName = (otherUserProfile.lastName?.toString() ?? '').trim();
      if (firstName.isNotEmpty || lastName.isNotEmpty) {
        return '$firstName $lastName'.trim().toTitleCase();
      }
      final String username = (otherUserProfile.username?.toString() ?? '').trim();
      if (username.isNotEmpty) {
        return username.toTitleCase();
      }
    }
    if (!isOwner && widget.bannerAd.owner != null) {
      final owner = widget.bannerAd.owner!;
      final String firstName = (owner.firstName?.toString() ?? '').trim();
      final String lastName = (owner.lastName?.toString() ?? '').trim();
      if (firstName.isNotEmpty || lastName.isNotEmpty) {
        return '$firstName $lastName'.trim().toTitleCase();
      }
      final String username = (owner.username?.toString() ?? '').trim();
      if (username.isNotEmpty) {
        return username.toTitleCase();
      }
    }
    if (isOwner && currentUserProfile != null) {
      final String firstName = (currentUserProfile.firstName?.toString() ?? '').trim();
      final String lastName = (currentUserProfile.lastName?.toString() ?? '').trim();
      if (firstName.isNotEmpty || lastName.isNotEmpty) {
        return '$firstName $lastName'.trim().toTitleCase();
      }
      final String username = (currentUserProfile.username?.toString() ?? '').trim();
      if (username.isNotEmpty) {
        return username.toTitleCase();
      }
    }
    final owner = widget.bannerAd.owner;
    if (owner != null) {
      final String firstName = (owner.firstName?.toString() ?? '').trim();
      final String lastName = (owner.lastName?.toString() ?? '').trim();
      if (firstName.isNotEmpty || lastName.isNotEmpty) {
        return '$firstName $lastName'.trim().toTitleCase();
      }
      final String username = (owner.username?.toString() ?? '').trim();
      if (username.isNotEmpty) {
        return username.toTitleCase();
      }
    }
    if (currentUserProfile != null) {
      final String firstName = (currentUserProfile.firstName?.toString() ?? '').trim();
      final String lastName = (currentUserProfile.lastName?.toString() ?? '').trim();
      if (firstName.isNotEmpty || lastName.isNotEmpty) {
        return '$firstName $lastName'.trim().toTitleCase();
      }
      final String username = (currentUserProfile.username?.toString() ?? 'Propertify User').trim();
      return username.toTitleCase();
    }
    return 'Propertify User';
  }

  String _getOwnerAvatar(dynamic currentUserProfile, dynamic otherUserProfile, bool isOwner) {
    if (!isOwner && otherUserProfile?.profilepic != null && otherUserProfile!.profilepic!.isNotEmpty) {
      return _resolveAvatar(otherUserProfile.profilepic!);
    }
    if (!isOwner && widget.bannerAd.owner?.profileImage != null && widget.bannerAd.owner!.profileImage!.isNotEmpty) {
      return _resolveAvatar(widget.bannerAd.owner!.profileImage!);
    }
    if (isOwner && currentUserProfile?.profilepic != null && currentUserProfile!.profilepic!.isNotEmpty) {
      return _resolveAvatar(currentUserProfile.profilepic!);
    }
    final ownerAvatar = widget.bannerAd.owner?.profileImage;
    if (ownerAvatar != null && ownerAvatar.isNotEmpty) {
      return _resolveAvatar(ownerAvatar);
    }
    if (otherUserProfile?.profilepic != null && otherUserProfile!.profilepic!.isNotEmpty) {
      return _resolveAvatar(otherUserProfile.profilepic!);
    }
    if (currentUserProfile?.profilepic != null && currentUserProfile!.profilepic!.isNotEmpty) {
      return _resolveAvatar(currentUserProfile.profilepic!);
    }
    return '';
  }

  String _getOwnerPhone(dynamic otherUserProfile) {
    if (otherUserProfile?.phoneNumber != null && otherUserProfile!.phoneNumber!.isNotEmpty) {
      return otherUserProfile.phoneNumber!;
    }
    return widget.bannerAd.owner?.phoneNumber ?? '';
  }

  Widget _buildStatusRow(
    dynamic icon,
    String label,
    String value, {
    Color? color,
  }) {
    return Row(
      children: [
        icon is IconData
            ? Icon(icon, size: 20, color: color ?? Colors.black54)
            : FaIcon(icon as FaIconData, size: 20, color: color ?? Colors.black54),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color ?? Colors.black87,
          ),
        ),
      ],
    );
  }

  String _resolveSingleImage(String? path) {
    if (path == null || path.isEmpty) {
      return 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=800&q=80';
    }
    if (path.startsWith('http')) return path;
    String baseUrl = env.baseUrl.replaceAll('/api', '').replaceAll('api', '');
    if (baseUrl.endsWith('/') && path.startsWith('/')) {
      return baseUrl + path.substring(1);
    }
    if (!baseUrl.endsWith('/') && !path.startsWith('/')) {
      return '$baseUrl/$path';
    }
    return baseUrl + path;
  }

  String _resolveAvatar(String path) {
    if (path.isEmpty) return '';
    if (path.startsWith('http')) return path;
    String baseUrl = env.baseUrl.replaceAll('/api', '').replaceAll('api', '');
    if (baseUrl.endsWith('/') && path.startsWith('/')) {
      return baseUrl + path.substring(1);
    }
    if (!baseUrl.endsWith('/') && !path.startsWith('/')) {
      return '$baseUrl/$path';
    }
    return baseUrl + path;
  }

  void _handleContact(
    BuildContext context,
    String? phoneNumber, {
    required bool isCall,
  }) {
    final isLoggedIn = context.read<HomeBloc>().state.showAddButton;
    if (!isLoggedIn) {
      context.push(AuthScreen.routeName);
      return;
    }

    if (phoneNumber == null || phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Phone number not available')),
      );
      return;
    }

    if (isCall) {
      SafetyDisclaimerHelper.showSafetyDisclaimer(
        context: context,
        actionType: 'Call',
        onContinue: () {
          if (widget.bannerAd.id != null && widget.bannerAd.id!.isNotEmpty) {
            ContactTracker.trackBannerContact(
              bannerId: widget.bannerAd.id!,
              interactionType: 'call',
            );
          }
          _makePhoneCall(phoneNumber);
        },
      );
    } else {
      SafetyDisclaimerHelper.showSafetyDisclaimer(
        context: context,
        actionType: 'WhatsApp',
        onContinue: () {
          if (widget.bannerAd.id != null && widget.bannerAd.id!.isNotEmpty) {
            ContactTracker.trackBannerContact(
              bannerId: widget.bannerAd.id!,
              interactionType: 'whatsapp',
            );
          }
          _openWhatsApp(phoneNumber);
        },
      );
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _openWhatsApp(String phoneNumber) async {
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'\D'), '');
    final whatsappUrl = "whatsapp://send?phone=$cleanPhone";
    final uri = Uri.parse(whatsappUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      final webUri = Uri.parse('https://wa.me/$cleanPhone');
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    }
  }
}
