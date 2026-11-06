import 'package:flutter/material.dart';
import 'package:propertify/utils/env.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';
import 'full_screen_image_viewer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;
  final String? createdAt;
  final bool isFavourited;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onShare;
  final bool showActionButtons;

  const ImageCarousel({
    Key? key,
    required this.images,
    this.createdAt,
    this.isFavourited = false,
    this.onFavoriteToggle,
    this.onShare,
    this.showActionButtons = false,
  }) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use placeholder if no images provided
    final displayImages = widget.images.isNotEmpty
        ? widget.images
        : ['placeholder'];

    return Column(
      children: [
        // Main image carousel container
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Stack(
              children: [
                // Main image carousel with rounded corners
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemCount: displayImages.length,
                    itemBuilder: (context, index) {
                      if (displayImages[index] == 'placeholder') {
                        return const LogoPlaceholder();
                      }

                      final imageUrl = displayImages[index].contains('https://')
                          ? displayImages[index]
                          : '${env.baseUrl.replaceAll('api', '')}${displayImages[index]}';

                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            // Open full-screen image viewer
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => FullScreenImageViewer(
                                  images: displayImages,
                                  initialIndex: index,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              CachedNetworkImage(
                                imageUrl: imageUrl,
                                fit: BoxFit.cover,
                                memCacheWidth: 800,
                                maxWidthDiskCache: 800,
                                fadeInDuration: const Duration(milliseconds: 300),
                                fadeOutDuration: const Duration(milliseconds: 100),
                                placeholder: (context, url) => Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.grey[100],
                                ),
                                errorWidget: (context, url, error) =>
                                    const LogoPlaceholder(),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.2),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Date badge
                if (widget.createdAt != null)
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.55),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _formatDate(widget.createdAt!),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                // Page indicators
                if (displayImages.length > 1)
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        displayImages.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: _currentIndex == index ? 16 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: _currentIndex == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),

                // Action Button (Favorite Only)
                if (widget.showActionButtons)
                  Positioned(
                    top: 16,
                    right: 16,
                    child: _buildActionButton(
                      icon: widget.isFavourited
                          ? Icons.favorite
                          : Icons.favorite_border,
                      iconColor: widget.isFavourited ? Colors.red : Colors.black87,
                      onTap: widget.onFavoriteToggle,
                    ),
                  ),
              ],
            ),
          ),
        ),

        // Thumbnail row below the image slider with Luxury styling
        if (displayImages.length > 1)
          Container(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: SizedBox(
              height: 56,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: displayImages.length,
                itemBuilder: (context, index) {
                  final isSelected = _currentIndex == index;
                  final imageUrl = displayImages[index].contains('https://')
                      ? displayImages[index]
                      : '${env.baseUrl.replaceAll('api', '')}${displayImages[index]}';

                  return GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: isSelected ? 1.0 : 0.65,
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 76,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF6C5CE7)
                                : Colors.white,
                            width: isSelected ? 2.5 : 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isSelected
                                  ? const Color(0x336C5CE7)
                                  : Colors.black.withOpacity(0.08),
                              blurRadius: isSelected ? 6 : 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            memCacheWidth: 150,
                            maxWidthDiskCache: 200,
                            fadeInDuration: const Duration(milliseconds: 200),
                            placeholder: (context, url) => Container(
                              width: 76,
                              height: 52,
                              color: Colors.grey[100],
                            ),
                            errorWidget: (context, url, error) => const LogoPlaceholder(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return '${date.day} ${months[date.month - 1]} ${date.year}';
    } catch (e) {
      return dateString;
    }
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color iconColor,
    VoidCallback? onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 22,
          ),
        ),
      ),
    );
  }
}
