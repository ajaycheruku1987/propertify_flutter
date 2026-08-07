import 'package:propertify/l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/utils/string_extensions.dart';
import '../../../../core/app_theme.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';

/// Compact version of PropertyCard optimized for grid view
class PropertyCardCompact extends StatelessWidget {
  final List<String> imageUrls;
  final String title;
  final String location;
  final String? price;
  final String? listingType;
  final String? propertyType;
  final bool isFavorite;
  final bool isLiked;
  final bool isFeatured;
  final bool isTopAd;
  final String? promotedAt;
  final String? promotedUntil;
  final String? createdAt;
  final int likeCount;
  final int commentCount;
  final int viewCount;
  final VoidCallback onFavoritePressed;
  final VoidCallback onCardPressed;
  final VoidCallback onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;

  const PropertyCardCompact({
    super.key,
    required this.imageUrls,
    required this.title,
    required this.location,
    this.price,
    this.listingType,
    this.propertyType,
    this.isFavorite = false,
    this.isLiked = false,
    this.isFeatured = false,
    this.isTopAd = false,
    this.promotedAt,
    this.promotedUntil,
    this.createdAt,
    this.likeCount = 0,
    this.commentCount = 0,
    this.viewCount = 0,
    required this.onFavoritePressed,
    required this.onCardPressed,
    required this.onLikePressed,
    required this.onCommentPressed,
    required this.onSharePressed,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onCardPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            _buildImageSection(context, l10n),

            // Content Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title.toTitleCase(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Property Type Label
                  if (propertyType != null && propertyType!.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppTheme.blueColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        propertyType!.translate(context),
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.blueColor,
                        ),
                      ),
                    ),

                  // Location
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: FaIcon(
                          FontAwesomeIcons.locationDot,
                          size: 10,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          location.toTitleCase(),
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  // Price
                  if (price != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      price!,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.blueColor,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Actions Section - Compact
            _buildActionsSection(context, l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildPromotionDates(AppLocalizations l10n) {
    final DateTime? start = promotedAt != null
        ? DateTime.tryParse(promotedAt!)
        : (createdAt != null ? DateTime.tryParse(createdAt!) : null);
    final DateTime? end = promotedUntil != null
        ? DateTime.tryParse(promotedUntil!)
        : null;
    final formatter = DateFormat('MMM d, yyyy');

    if (start == null && end == null) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.calendar_today, size: 10, color: Colors.blue.shade700),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              '${start != null ? "${l10n.started}: ${formatter.format(start)}" : ""} ${end != null ? " ${l10n.expires}: ${formatter.format(end)}" : ""}'
                  .trim(),
              style: TextStyle(
                color: Colors.blue.shade700,
                fontSize: 9,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context, AppLocalizations l10n) {
    return Container(
      height: 110,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Stack(
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: imageUrls.isNotEmpty
                ? Image.network(
                    imageUrls.first,
                    width: double.infinity,
                    height: 110,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const LogoPlaceholder(
                        width: double.infinity,
                        height: 110,
                      );
                    },
                  )
                : const LogoPlaceholder(width: double.infinity, height: 110),
          ),

          // Featured Badge
          if (isFeatured)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.star,
                      color: Colors.white,
                      size: 8,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      l10n.featured,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Favorite Button
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: onFavoritePressed,
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: FaIcon(
                  isFavorite
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: isFavorite ? Colors.red : Colors.grey.shade600,
                  size: 14,
                ),
              ),
            ),
          ),
          // Share Button
          Positioned(
            top: 42,
            right: 8,
            child: GestureDetector(
              onTap: onSharePressed,
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: FaIcon(
                  FontAwesomeIcons.share,
                  color: Colors.grey.shade600,
                  size: 14,
                ),
              ),
            ),
          ),
          //code for lookingFor
          if (listingType != null && listingType!.isNotEmpty)
            Positioned(
              bottom: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  listingType!.translate(context),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActionsSection(BuildContext context, AppLocalizations l10n) {
    final isLoggedIn = context.read<HomeBloc>().state.showAddButton;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Like Button
          _buildActionButton(
            icon: isLiked
                ? FontAwesomeIcons.solidThumbsUp
                : FontAwesomeIcons.thumbsUp,
            count: likeCount,
            onPressed: () {
              if (isLoggedIn) {
                onLikePressed();
              } else {
                CustomToast.showErrorToast(msg: l10n.pleaseLoginToLikePosts);
              }
            },
          ),

          // Comment Button
          _buildActionButton(
            icon: FontAwesomeIcons.comment,
            count: commentCount,
            onPressed: onCommentPressed,
          ),

          // Views
          _buildActionButton(
            icon: FontAwesomeIcons.eye,
            count: viewCount,
            onPressed: () {}, // View count is read-only
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required FaIconData icon,
    required int count,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, size: 16, color: Colors.grey.shade600),
          const SizedBox(width: 4),
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
