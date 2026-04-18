import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:propertify/utils/screen_config.dart';
import 'package:propertify/utils/string_extensions.dart';
import '../../../../utils/common_widgets/rating_widget.dart';

class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final String providerName;
  final String location;
  final double? rating;
  final int? ratingCount;
  final String? price;
  final bool isFavorite;
  final bool isTopAd;
  final bool canDelete;
  final bool canEdit;
  final VoidCallback onFavoritePressed;
  final VoidCallback onCardPressed;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const ServiceCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.providerName,
    required this.location,
    this.rating,
    this.ratingCount,
    this.price,
    this.isFavorite = false,
    this.isTopAd = false,
    this.canDelete = false,
    this.canEdit = false,
    required this.onFavoritePressed,
    required this.onCardPressed,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image Section
            _buildImageSection(),

            const SizedBox(width: 12),

            // Content Section
            Expanded(child: _buildContentSection(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    final displayImageUrl =
        imageUrl.isNotEmpty && imageUrl != 'https://via.placeholder.com/150'
        ? imageUrl
        : 'https://images.unsplash.com/photo-1581578731548-c64695cc6958?w=800';

    return Container(
      width: ScreenConfig.width * 0.3,
      height: ScreenConfig.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(displayImageUrl),
          onError: (exception, stackTrace) {
            print('Error loading image: $exception');
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Title with Check Mark
        Row(
          children: [
            Expanded(
              child: Text(
                title.toTitleCase(),

                style: const TextStyle(
                  fontSize: 16,

                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isTopAd)
              SvgPicture.asset(
                'assets/icons/verified_icon.svg',
                width: 20,
                height: 20,
              ),
            if (canDelete || canEdit)
              PopupMenuButton<String>(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.more_vert, size: 20),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                position: PopupMenuPosition.under,
                onSelected: (value) {
                  if (value == 'edit' && onEdit != null) {
                    onEdit!();
                  } else if (value == 'delete' && onDelete != null) {
                    onDelete!();
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  if (canEdit)
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit_outlined, size: 20, color: Colors.black54),
                          SizedBox(width: 8),
                          Text('Edit', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  if (canDelete)
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete_outline, size: 20, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Delete', style: TextStyle(color: Colors.red, fontSize: 14)),
                        ],
                      ),
                    ),
                ],
              ),
          ],
        ),

        const SizedBox(height: 4),

        // Category | City
        Text(
          category
              .replaceAll(',', ' | ')
              .split(' | ')
              .map((cat) => cat.trim().toTitleCase())
              .join(' | '),
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(height: 8),

        // Provider Info
        Row(
          children: [
            Icon(Icons.person_outline, size: 14, color: Colors.grey.shade600),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                providerName.toTitleCase(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),

        // Location
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 14,
              color: Colors.grey.shade600,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                location.toTitleCase(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Star Rating
        if (rating != null) _buildStarRating(),
      ],
    );
  }

  Widget _buildStarRating() {
    return Row(
      children: [
        RatingDisplay(rating: rating!, size: 16, activeColor: Colors.amber),
        if (ratingCount != null) ...[
          const SizedBox(width: 4),
          Text(
            "${rating!.toStringAsFixed(1)}(${_formatCount(ratingCount!)})",
            style: const TextStyle(
              // fontSize: 10,
              color: Colors.black,
              // fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}k';
    }
    return count.toString();
  }
}
