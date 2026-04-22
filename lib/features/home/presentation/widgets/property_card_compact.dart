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
  final bool isFavorite;
  final bool isLiked;
  final bool isFeatured;
  final bool canEdit;
  final bool canDelete;
  final int likeCount;
  final int commentCount;
  final int viewCount;
  final VoidCallback onFavoritePressed;
  final VoidCallback onCardPressed;
  final VoidCallback onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;

  const PropertyCardCompact({
    super.key,
    required this.imageUrls,
    required this.title,
    required this.location,
    this.price,
    this.listingType,
    this.isFavorite = false,
    this.isLiked = false,
    this.isFeatured = false,
    this.canEdit = false,
    this.canDelete = false,
    this.likeCount = 0,
    this.commentCount = 0,
    this.viewCount = 0,
    required this.onFavoritePressed,
    required this.onCardPressed,
    required this.onLikePressed,
    required this.onCommentPressed,
    required this.onSharePressed,
    this.onEditPressed,
    this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
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
            _buildImageSection(context),

            // Content Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                      if (canEdit || canDelete)
                        SizedBox(
                          height: 24,
                          width: 24,
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
                              size: 16,
                            ),
                            onSelected: (value) {
                              if (value == 'edit' && onEditPressed != null) {
                                onEditPressed!();
                              } else if (value == 'delete' &&
                                  onDeletePressed != null) {
                                onDeletePressed!();
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                                  if (canEdit)
                                    const PopupMenuItem<String>(
                                      value: 'edit',
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            size: 16,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'Edit',
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (canDelete)
                                    const PopupMenuItem<String>(
                                      value: 'delete',
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.delete,
                                            size: 16,
                                            color: Colors.red,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'Delete',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Location
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: Icon(
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
            _buildActionsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Container(
      height: 120,
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
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const LogoPlaceholder(
                        width: double.infinity,
                        height: 120,
                      );
                    },
                  )
                : const LogoPlaceholder(width: double.infinity, height: 120),
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
                    const Icon(
                      FontAwesomeIcons.star,
                      color: Colors.white,
                      size: 8,
                    ),
                    const SizedBox(width: 3),
                    const Text(
                      'Featured',
                      style: TextStyle(
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
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isFavorite
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: isFavorite ? Colors.red : Colors.grey.shade600,
                  size: 14,
                ),
              ),
            ),
          ),
          //write positioned code for share button
          // Share Button
          Positioned(
            top: 42,
            right: 8,
            child: GestureDetector(
              onTap: onSharePressed,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
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
                  listingType!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget _buildActionsSection(BuildContext context) {
    final isLoggedIn = context.read<HomeBloc>().state.showAddButton;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
                CustomToast.showErrorToast(msg: 'Please login to like posts');
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

          // Share Button
          // GestureDetector(
          //   onTap: onSharePressed,
          //   child: Icon(
          //     FontAwesomeIcons.shareNodes,
          //     size: 14,
          //     color: Colors.grey.shade600,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required int count,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey.shade600),
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
