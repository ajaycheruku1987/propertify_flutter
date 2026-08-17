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
import 'package:propertify/utils/env.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:propertify/utils/string_extensions.dart';
import 'package:propertify/l10n/app_localizations.dart';

class BannerAdDetailView extends StatelessWidget {
  static const String routeName = '/banner-ad-detail';
  final BannerAdModel bannerAd;

  const BannerAdDetailView({super.key, required this.bannerAd});

  @override
  Widget build(BuildContext context) {
    final imageUrl = _resolveImage(bannerAd.imageUrls);
    final l10n = AppLocalizations.of(context)!;
    final Map<String, dynamic> adJson = bannerAd.toJson();

    // Calculate campaign info
    final startDate = bannerAd.createdAt != null
        ? DateTime.tryParse(bannerAd.createdAt!) ?? DateTime.now()
        : DateTime.now();
    final endDate = bannerAd.expiresAt != null
        ? DateTime.tryParse(bannerAd.expiresAt!) ??
              DateTime.now().add(const Duration(days: 15))
        : DateTime.now().add(const Duration(days: 15));

    final daysRemaining = endDate.difference(DateTime.now()).inDays;
    final statusText = daysRemaining > 0
        ? '${l10n.daysLeft(daysRemaining)}'
        : l10n.promotionExpired;
    final startDateStr = DateFormat('dd MMM yyyy').format(startDate);
    final endDateStr = DateFormat('dd MMM yyyy').format(endDate);

    // Safely access dynamic fields not yet in Freezed model
    final String? adAddress = adJson['address'] as String?;

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
          final isOwner =
              currentUserId != null &&
              (currentUserId == bannerAd.userId ||
                  currentUserId == bannerAd.owner?.id);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Large Image
                Hero(
                  tag: bannerAd.id ?? 'banner',
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.broken_image,
                          color: Colors.grey, size: 50),
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
                                color: daysRemaining > 0
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
                            ],
                          ),
                        ),
                      ],

                      const SizedBox(height: 32),

                      // Owner Details (Agent Info Style)
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
                              imageUrl: bannerAd.owner?.profileImage != null &&
                                      bannerAd.owner!.profileImage!.isNotEmpty
                                  ? _resolveAvatar(bannerAd.owner!.profileImage!)
                                  : '',
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
                                    _getOwnerName(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (bannerAd.owner?.id != null)
                                    GestureDetector(
                                      onTap: () {
                                        context.push(
                                          OtherUserProfileScreen.routeName,
                                          extra: bannerAd.owner!.id,
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
                              () => _handleContact(context, bannerAd.owner?.phoneNumber, isCall: true),
                            ),
                            const SizedBox(width: 8),
                            // WhatsApp Icon
                            _buildCircleIcon(
                              context,
                              FontAwesomeIcons.whatsapp,
                              const Color(0xFF25D366).withOpacity(0.1),
                              const Color(0xFF25D366),
                              () => _handleContact(context, bannerAd.owner?.phoneNumber, isCall: false),
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

  String _getOwnerName() {
    final owner = bannerAd.owner;
    if (owner == null) return 'Propertify User';
    final firstName = owner.firstName?.trim() ?? '';
    final lastName = owner.lastName?.trim() ?? '';
    if (firstName.isNotEmpty || lastName.isNotEmpty) {
      return '$firstName $lastName'.trim().toTitleCase();
    }
    return (owner.username ?? 'Propertify User').toTitleCase();
  }

  Widget _buildStatusRow(
    IconData icon,
    String label,
    String value, {
    Color? color,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: color ?? Colors.black54),
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

  String _resolveImage(List<String>? urls) {
    final String? first = urls != null && urls.isNotEmpty ? urls.first : null;
    if (first == null || first.isEmpty) {
      return 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=800&q=80';
    }
    if (first.startsWith('http')) return first;
    String baseUrl = env.baseUrl.replaceAll('/api', '').replaceAll('api', '');
    if (baseUrl.endsWith('/') && first.startsWith('/')) {
      return baseUrl + first.substring(1);
    }
    if (!baseUrl.endsWith('/') && !first.startsWith('/')) {
      return '$baseUrl/$first';
    }
    return baseUrl + first;
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
      _makePhoneCall(phoneNumber);
    } else {
      _openWhatsApp(phoneNumber);
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
