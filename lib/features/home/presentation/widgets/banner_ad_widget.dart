import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/home/presentation/banner_ad_detail_view.dart';
import 'package:propertify/features/profile/models/banner_ad_model.dart';
import '../../../../utils/env.dart';
import '../../../../utils/string_extensions.dart';

class BannerAdWidget extends StatelessWidget {
  final BannerAdModel bannerAd;

  const BannerAdWidget({super.key, required this.bannerAd});

  @override
  Widget build(BuildContext context) {
    final imageUrl = _resolveImage(bannerAd.imageUrls);
    final title = (bannerAd.description ?? 'Featured Property').capitalize();

    return InkWell(
      onTap: () => context.push(BannerAdDetailView.routeName, extra: bannerAd),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  stops: const [0.6, 1.0],
                ),
              ),
            ),

            // Top Ads Badge
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Top Ads',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Text Content
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
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
          ],
        ),
      ),
    );
  }

  String _resolveImage(List<String>? urls) {
    final String? first = urls != null && urls.isNotEmpty ? urls.first : null;
    if (first == null || first.isEmpty) {
      return 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=800&q=80';
    }
    return first.startsWith('http')
        ? first
        : '${env.baseUrl.replaceAll('api', '')}$first';
  }
}
