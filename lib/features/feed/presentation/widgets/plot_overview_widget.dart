import 'package:flutter/material.dart';
import 'package:propertify/features/home/models/feed_posts_response_model.dart';
import 'package:propertify/utils/string_extensions.dart';

class PlotOverviewWidget extends StatelessWidget {
  final FeedPostsResponseModel postDetails;

  const PlotOverviewWidget({
    super.key,
    required this.postDetails,
  });

  @override
  Widget build(BuildContext context) {
    final isPlotOrLand = postDetails.mainCategory == 'Land & Plots' ||
        postDetails.propertyType == 'Open Plot' ||
        postDetails.propertyType == 'Agriculture Land' ||
        postDetails.propertyType == 'Open Plots' ||
        postDetails.propertyType == 'Residential Plot' ||
        postDetails.propertyType == 'Commercial Plot' ||
        postDetails.propertyType == 'Agricultural Land' ||
        postDetails.propertyType == 'Farm Land';

    if (!isPlotOrLand) {
      return const SizedBox.shrink();
    }

    final primaryColor = Theme.of(context).primaryColor;

    final listingTypeStr = postDetails.listingType != null && postDetails.listingType!.isNotEmpty
        ? (postDetails.listingType!.toLowerCase() == 'sell' ? 'For Sale' : 'For ${postDetails.listingType}')
        : '';

    final subCategoryStr = postDetails.propertyType ?? postDetails.subCategory ?? '';

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
              // 1. Listing Type
              if (listingTypeStr.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.sell_outlined,
                  label: 'Listing Type',
                  value: listingTypeStr.translate(context),
                  valueColor: listingTypeStr.contains('Rent') ? Colors.orange : Colors.green.shade700,
                ),

              // 2. Plot Sub-Type
              if (subCategoryStr.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.category_outlined,
                  label: 'Plot Type',
                  value: subCategoryStr.translate(context),
                ),

              // 3. Plot Area
              if (postDetails.plotArea != null && postDetails.plotArea!.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.square_foot_rounded,
                  label: 'Plot Area',
                  value: '${postDetails.plotArea} ${postDetails.areaUnit ?? "Sq.Yds"}',
                  subtitle: ratePerUnitStr.isNotEmpty ? ratePerUnitStr : null,
                ),

              // 4. Facing
              if (postDetails.facing != null && postDetails.facing!.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.explore_outlined,
                  label: 'Plot Facing',
                  value: postDetails.facing!,
                ),

              // 5. Road Size
              if (postDetails.roadWidth != null && postDetails.roadWidth!.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.add_road_rounded,
                  label: 'Road Width',
                  value: postDetails.roadWidth!.toLowerCase().contains('ft')
                      ? postDetails.roadWidth!
                      : '${postDetails.roadWidth} Ft Road',
                ),

              // 6. Approval Status
              if (postDetails.approvalStatus != null &&
                  postDetails.approvalStatus!.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.verified_user_outlined,
                  label: 'Approval Status',
                  value: postDetails.approvalStatus!,
                ),

              // 7. Dimensions
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
          (() {
            final isNegotiable = postDetails.isNegotiable ?? false;
            final hasContactPref = (postDetails.contactViaPhone ?? false) ||
                (postDetails.contactViaWhatsApp ?? false);
            final hasFeatures = (postDetails.isCornerPlot ?? false) ||
                (postDetails.isGatedCommunity ?? false) ||
                isNegotiable ||
                hasContactPref;

            if (!hasFeatures) return const SizedBox.shrink();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    if (isNegotiable)
                      _buildFeatureBadge(
                        context,
                        icon: Icons.handshake_outlined,
                        label: 'Price Negotiable',
                        color: Colors.green.shade700,
                      ),
                    if (postDetails.contactViaPhone ?? false)
                      _buildFeatureBadge(
                        context,
                        icon: Icons.phone_in_talk_outlined,
                        label: 'Call Preferred',
                        color: primaryColor,
                      ),
                    if (postDetails.contactViaWhatsApp ?? false)
                      _buildFeatureBadge(
                        context,
                        icon: Icons.chat_outlined,
                        label: 'WhatsApp Preferred',
                        color: const Color(0xFF25D366),
                      ),
                  ],
                ),
              ],
            );
          })(),
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
    Color? valueColor,
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
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: valueColor ?? Colors.black87,
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
