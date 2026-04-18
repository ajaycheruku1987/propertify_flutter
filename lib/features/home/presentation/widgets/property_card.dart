import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/utils/custom_toast.dart';
import '../../../../utils/string_extensions.dart';
import '../../../../core/app_theme.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';

class PropertyCard extends StatefulWidget {
  final List<String> imageUrls;
  final String title;
  final String location;
  final double? rating;
  final String? price;
  final bool isFavorite;
  final bool isLiked;
  final bool isTopAd;
  final bool isFeatured;
  final bool showActions;
  final bool canEdit;
  final bool canDelete;
  final int likeCount;
  final int commentCount;
  final int viewCount;
  final VoidCallback onFavoritePressed;
  final VoidCallback onCardPressed;
  final VoidCallback onSharePressed;
  final VoidCallback onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;

  const PropertyCard({
    super.key,
    required this.imageUrls,
    required this.title,
    required this.location,
    this.rating,
    this.price,
    this.isFavorite = false,
    this.isLiked = false,
    this.isTopAd = false,
    this.isFeatured = false,
    this.showActions = false,
    this.canEdit = false,
    this.canDelete = false,
    this.likeCount = 0,
    this.commentCount = 0,
    this.viewCount = 0,
    required this.onFavoritePressed,
    required this.onCardPressed,
    required this.onSharePressed,
    required this.onLikePressed,
    required this.onCommentPressed,
    this.onEditPressed,
    this.onDeletePressed,
  });

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onCardPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            _buildImageSection(context),

            // Content Section
            _buildContentSection(),

            // Actions Section
            if (widget.showActions)
              _buildActionsSection(
                context: context,
                onSharePressed: widget.onSharePressed,
                onCommentPressed: widget.onCommentPressed,
                onLikePressed: widget.onLikePressed,
                isLiked: widget.isLiked,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    final hasMultipleImages = widget.imageUrls.length > 1;

    return Container(
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          // Carousel or Single Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: widget.imageUrls.isEmpty
                ? const LogoPlaceholder(width: double.infinity)
                : Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          viewportFraction: 1.0,
                          enableInfiniteScroll: hasMultipleImages,
                          autoPlay: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentImageIndex = index;
                            });
                          },
                        ),
                        items: widget.imageUrls.map((url) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Image.network(
                                url,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  return const LogoPlaceholder(
                                    width: double.infinity,
                                  );
                                },
                              );
                            },
                          );
                        }).toList(),
                      ),
                      // Dots Indicator
                      if (hasMultipleImages)
                        Positioned(
                          bottom: 12,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: widget.imageUrls.asMap().entries.map((
                              entry,
                            ) {
                              return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(
                                    _currentImageIndex == entry.key ? 0.9 : 0.4,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
          ),

          // Top Ad Badge
          if (widget.isTopAd)
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Top Ads',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

          // Featured Badge
          if (widget.isFeatured)
            Positioned(
              top: widget.isTopAd ? 44 : 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
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
                    const Icon(Icons.star, color: Colors.white, size: 12),
                    const SizedBox(width: 4),
                    const Text(
                      'Featured',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Favorite Button
          if (context.read<HomeBloc>().state.showAddButton)
            Positioned(
              top: 12,
              right: 12,
              child: GestureDetector(
                onTap: widget.onFavoritePressed,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: widget.isFavorite
                        ? Colors.red
                        : Colors.grey.shade600,
                    size: 20,
                  ),
                ),
              ),
            ),

          // Rating Badge (for top ads)
          if (widget.rating != null && widget.isTopAd)
            Positioned(
              bottom: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      widget.rating!.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContentSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title.toTitleCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              if (widget.price != null)
                Text(
                  widget.price!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.blueColor,
                  ),
                ),
              if (widget.canEdit || widget.canDelete)
                PopupMenuButton<String>(
                  color: Colors.white,
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
                    if (value == 'edit' && widget.onEditPressed != null) {
                      widget.onEditPressed!();
                    } else if (value == 'delete' && widget.onDeletePressed != null) {
                      widget.onDeletePressed!();
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    if (widget.canEdit)
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
                    if (widget.canDelete)
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
                  size: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  widget.location.toTitleCase(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionsSection({
    required BuildContext context,
    bool showLike = true,
    bool isLiked = false,
    bool showComment = true,
    required VoidCallback onLikePressed,
    required VoidCallback onCommentPressed,
    required VoidCallback onSharePressed,
  }) {
    final isLoggedIn = context.read<HomeBloc>().state.showAddButton;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: Row(
        children: [
          if (showLike)
            _buildActionButton(
              icon: isLiked
                  ? FontAwesomeIcons.solidThumbsUp
                  : FontAwesomeIcons.thumbsUp,
              label: 'Like',
              count: widget.likeCount,
              onPressed: () {
                if (isLoggedIn) {
                  onLikePressed();
                } else {
                  CustomToast.showErrorToast(msg: 'Please login to like posts');
                }
              },
            ),
          const SizedBox(width: 24),
          if (showComment)
            _buildActionButton(
              icon: FontAwesomeIcons.comment,
              label: 'Comment',
              count: widget.commentCount,
              onPressed: () {
                onCommentPressed();
              },
            ),
          const SizedBox(width: 24),
          if (showComment)
            _buildActionButton(
              icon: FontAwesomeIcons.eye,
              count: widget.viewCount,
              label: 'View',
              onPressed: () {
                onCommentPressed();
              },
            ),

          const Spacer(),
          _buildActionButton(
            icon: FontAwesomeIcons.shareNodes,
            label: 'Share',
            onPressed: () {
              onSharePressed();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    int? count,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey.shade600),
          if (count != null) ...[
            const SizedBox(width: 6),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
