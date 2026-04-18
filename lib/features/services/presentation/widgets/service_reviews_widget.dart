import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/services/models/service_reviews_response_model.dart';
import 'package:propertify/utils/common_widgets/rating_widget.dart';
import 'package:propertify/features/services/presentation/service_reviews_screen.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';

class ServiceReviewsWidget extends StatelessWidget {
  final List<ServiceReviewsResponseModel> reviews;
  final String serviceId;

  const ServiceReviewsWidget({
    super.key,
    required this.reviews,
    required this.serviceId,
  });

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reviews (${reviews.length})',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.push(
                    ServiceReviewsScreen.routeName,
                    extra: serviceId,
                  );
                },
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6C5CE7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reviews.length > 10 ? 10 : reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: _buildReviewItem(
                    context: context,
                    name: review.user?.username ?? 'Anonymous',
                    rating: review.rating ?? 0,
                    reviewText: review.review ?? '',
                    profileImage: review.user?.profilepic ?? '',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem({
    required BuildContext context,
    required String name,
    required int rating,
    required String reviewText,
    required String profileImage,
  }) {
    return Container(
      width: 280,
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: ClipOval(
              child: profileImage.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: profileImage,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      errorWidget: (context, url, error) =>
                          const LogoPlaceholder(logoWidth: 20, logoHeight: 20),
                    )
                  : const LogoPlaceholder(logoWidth: 20, logoHeight: 20),
            ),
          ),
          const SizedBox(width: 12),
          // Review Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Star Rating
                    RatingDisplay(
                      rating: rating.toDouble(),
                      size: 16,
                      activeColor: Colors.orange,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Text(
                    reviewText,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF666666),
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
