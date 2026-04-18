import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdSliderWidget extends StatelessWidget {
  final VoidCallback? onCreateRequest;
  final VoidCallback? onExploreDetails;
  final String title;
  final String caption;
  final bool showCreateRequestButton;
  final bool showExploreDetailsButton;
  final String createButtonText;
  final String backgroundImagePath; // New parameter

  const AdSliderWidget({
    super.key,
    this.onCreateRequest,
    this.onExploreDetails,
    required this.title,
    required this.caption,
    this.showCreateRequestButton = true,
    this.showExploreDetailsButton = true,
    this.createButtonText = 'Create Request',
    this.backgroundImagePath = 'assets/images/ad_bg.svg', // Default value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Background gradient
            Positioned.fill(
              child: SvgPicture.asset(
                backgroundImagePath, // Use the new parameter here
                fit: BoxFit.cover,
              ),
            ),

            // Content overlay
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    // Left side content
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Title
                          Flexible(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          const SizedBox(height: 4),

                          // Subtitle
                          Flexible(
                            child: Text(
                              caption,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                                height: 1.2,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Action buttons
                          Flexible(
                            child: Row(
                              children: [
                                // Create Request button
                                if (showCreateRequestButton)
                                  ElevatedButton(
                                    onPressed: onCreateRequest,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: const Color(0xFF6B46C1),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      elevation: 0,
                                      minimumSize: const Size(0, 32),
                                    ),
                                    child: Text(
                                      createButtonText,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),

                                if (showCreateRequestButton &&
                                    showExploreDetailsButton)
                                  const SizedBox(width: 8),

                                // Explore Details button
                                if (showExploreDetailsButton)
                                  OutlinedButton(
                                    onPressed: onExploreDetails,
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      side: const BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      minimumSize: const Size(0, 32),
                                    ),
                                    child: const Text(
                                      'Explore Details',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
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
              ),
            ),
            title == 'Home Loan'
                ? Positioned(
                    right: 0,
                    top: 0,
                    child: Image.asset(
                      'assets/images/ad_side_img.png',
                      fit: BoxFit.contain,
                      width: 150,
                      height: 150,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
