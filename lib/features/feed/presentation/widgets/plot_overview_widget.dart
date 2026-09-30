import 'package:flutter/material.dart';
import 'package:propertify/features/home/models/feed_posts_response_model.dart';

class PlotOverviewWidget extends StatelessWidget {
  final FeedPostsResponseModel postDetails;

  const PlotOverviewWidget({
    super.key,
    required this.postDetails,
  });

  @override
  Widget build(BuildContext context) {
    // Check if this post is an open plot / land or has plot parameters
    final isPlotCategory = postDetails.propertyType == 'Open Plot' ||
        postDetails.propertyType == 'Agriculture Land' ||
        postDetails.propertyType == 'Open Plots';

    final hasPlotData = (postDetails.plotArea != null && postDetails.plotArea!.isNotEmpty) ||
        (postDetails.facing != null && postDetails.facing!.isNotEmpty) ||
        (postDetails.roadWidth != null && postDetails.roadWidth!.isNotEmpty) ||
        (postDetails.approvalStatus != null && postDetails.approvalStatus!.isNotEmpty) ||
        (postDetails.dimensions != null && postDetails.dimensions!.isNotEmpty) ||
        (postDetails.isCornerPlot ?? false) ||
        (postDetails.isGatedCommunity ?? false);

    if (!hasPlotData) {
      return const SizedBox.shrink();
    }

    final primaryColor = Theme.of(context).primaryColor;

    // Calculate Rate Per Unit if price and area exist
    String ratePerUnitStr = '';
    if (postDetails.price != null &&
        postDetails.plotArea != null &&
        postDetails.plotArea!.isNotEmpty) {
      final double? areaNum = double.tryParse(
        postDetails.plotArea!.replaceAll(RegExp(r'[^0-9.]'), ''),
      );
      if (areaNum != null && areaNum > 0) {
        final double rate = postDetails.price! / areaNum;
        ratePerUnitStr = '₹${rate.toStringAsFixed(0)} / ${postDetails.areaUnit ?? "Sq.Yd"}';
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FE),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: primaryColor.withValues(alpha: 0.12),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.landscape_rounded,
                      color: primaryColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Plot Specifications',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
              if (postDetails.postedBy != null && postDetails.postedBy!.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'By ${postDetails.postedBy}',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),

          // Grid of Plot Spec Tiles
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              // 1. Plot Area
              if (postDetails.plotArea != null && postDetails.plotArea!.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.square_foot_rounded,
                  label: 'Plot Area',
                  value: '${postDetails.plotArea} ${postDetails.areaUnit ?? "Sq.Yds"}',
                  subtitle: ratePerUnitStr.isNotEmpty ? ratePerUnitStr : null,
                ),

              // 2. Facing
              if (postDetails.facing != null && postDetails.facing!.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.explore_outlined,
                  label: 'Plot Facing',
                  value: postDetails.facing!,
                ),

              // 3. Road Size
              if (postDetails.roadWidth != null && postDetails.roadWidth!.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.add_road_rounded,
                  label: 'Road Width',
                  value: postDetails.roadWidth!.toLowerCase().contains('ft')
                      ? postDetails.roadWidth!
                      : '${postDetails.roadWidth} Ft Road',
                ),

              // 4. Approval Status
              if (postDetails.approvalStatus != null &&
                  postDetails.approvalStatus!.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.verified_user_outlined,
                  label: 'Approval Status',
                  value: postDetails.approvalStatus!,
                ),

              // 5. Dimensions
              if (postDetails.dimensions != null && postDetails.dimensions!.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.straighten_rounded,
                  label: 'Dimensions',
                  value: postDetails.dimensions!,
                ),
            ],
          ),

          // Highlights / Badges
          if ((postDetails.isCornerPlot ?? false) ||
              (postDetails.isGatedCommunity ?? false)) ...[
            const SizedBox(height: 14),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (postDetails.isCornerPlot ?? false)
                  _buildFeatureBadge(
                    context,
                    icon: Icons.turn_right_rounded,
                    label: 'Corner Plot',
                    color: Colors.amber.shade800,
                  ),
                if (postDetails.isGatedCommunity ?? false)
                  _buildFeatureBadge(
                    context,
                    icon: Icons.fence_rounded,
                    label: 'Gated Layout / Boundary Wall',
                    color: Colors.green.shade700,
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSpecTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    String? subtitle,
  }) {
    return Container(
      width: (MediaQuery.of(context).size.width - 76) / 2,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureBadge(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
