import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/auth/presentation/auth_screen.dart';
import 'package:propertify/features/home/presentation/banner_ad_detail_view.dart';
import 'package:propertify/features/profile/models/banner_ad_model.dart';
import 'package:propertify/utils/contact_tracker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../utils/env.dart';
import '../../../../utils/string_extensions.dart';

class BannerAdWidget extends StatefulWidget {
  final BannerAdModel bannerAd;

  const BannerAdWidget({super.key, required this.bannerAd});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bannerAd = widget.bannerAd;
    final imageUrls = bannerAd.imageUrls ?? [];
    final title = (bannerAd.description ?? 'Featured Property').capitalize();

    return InkWell(
      onTap: () => context.push(BannerAdDetailView.routeName, extra: bannerAd),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Image Section (Single Image or PageView for Multiple Images)
              if (imageUrls.length <= 1)
                CachedNetworkImage(
                  imageUrl: _resolveSingleImage(
                    imageUrls.isNotEmpty ? imageUrls.first : null,
                  ),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: 50,
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
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: Colors.grey.shade200,
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
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

              // Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                    stops: const [0.6, 1.0],
                  ),
                ),
              ),

              // Top Ads Badge & Image Counter
              Positioned(
                top: 12,
                left: 12,
                right: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade900.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'AD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (imageUrls.length > 1)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
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
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Multiple Image Indicator Dots
              if (imageUrls.length > 1)
                Positioned(
                  top: 48,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageUrls.asMap().entries.map((entry) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: _currentImageIndex == entry.key ? 12.0 : 6.0,
                        height: 6.0,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: _currentImageIndex == entry.key
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                        ),
                      );
                    }).toList(),
                  ),
                ),

              // Text Content & Contact Icons
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Call Button
                    _buildContactIcon(
                      icon: Icons.phone_outlined,
                      onTap: () {
                        final isLoggedIn =
                            context.read<HomeBloc>().state.showAddButton;
                        if (!isLoggedIn) {
                          context.push(AuthScreen.routeName);
                          return;
                        }
                        if (bannerAd.id != null && bannerAd.id!.isNotEmpty) {
                          ContactTracker.trackBannerContact(
                            bannerId: bannerAd.id!,
                            interactionType: 'call',
                          );
                        }
                        final phone = bannerAd.owner?.phoneNumber;
                        if (phone != null && phone.isNotEmpty) {
                          launchUrl(Uri.parse('tel:$phone'));
                        }
                      },
                    ),
                    const SizedBox(width: 8),
                    // WhatsApp Button
                    _buildContactIcon(
                      icon: FontAwesomeIcons.whatsapp,
                      isFontAwesome: true,
                      onTap: () async {
                        final isLoggedIn =
                            context.read<HomeBloc>().state.showAddButton;
                        if (!isLoggedIn) {
                          context.push(AuthScreen.routeName);
                          return;
                        }
                        if (bannerAd.id != null && bannerAd.id!.isNotEmpty) {
                          ContactTracker.trackBannerContact(
                            bannerId: bannerAd.id!,
                            interactionType: 'whatsapp',
                          );
                        }
                        final phone = bannerAd.owner?.phoneNumber;
                        if (phone != null && phone.isNotEmpty) {
                          final cleanPhone =
                              phone.replaceAll(RegExp(r'\D'), '');
                          final url = Uri.parse('https://wa.me/$cleanPhone');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactIcon({
    required dynamic icon,
    bool isFontAwesome = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        child: isFontAwesome
            ? FaIcon(icon as FaIconData?, size: 16, color: const Color(0xFF25D366))
            : Icon(icon as IconData?, size: 16, color: const Color(0xFF6C5CE7)),
      ),
    );
  }

  String _resolveSingleImage(String? url) {
    if (url == null || url.isEmpty) {
      return 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=800&q=80';
    }
    if (url.startsWith('http')) return url;
    String baseUrl = env.baseUrl.replaceAll('/api', '').replaceAll('api', '');
    if (baseUrl.endsWith('/') && url.startsWith('/')) {
      return baseUrl + url.substring(1);
    }
    if (!baseUrl.endsWith('/') && !url.startsWith('/')) {
      return '$baseUrl/$url';
    }
    return baseUrl + url;
  }
}
