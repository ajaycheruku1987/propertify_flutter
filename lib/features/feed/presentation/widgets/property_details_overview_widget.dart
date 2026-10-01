import 'package:flutter/material.dart';
import 'package:propertify/core/constants/app_categories.dart';
import 'package:propertify/features/home/models/feed_posts_response_model.dart';
import 'package:propertify/utils/string_extensions.dart';

class PropertyDetailsOverviewWidget extends StatelessWidget {
  final FeedPostsResponseModel postDetails;

  const PropertyDetailsOverviewWidget({
    super.key,
    required this.postDetails,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    final listingTypeStr = postDetails.listingType != null && postDetails.listingType!.isNotEmpty
        ? (postDetails.listingType!.toLowerCase() == 'sell' ? 'For Sale' : 'For ${postDetails.listingType}')
        : '';

    final subCategoryStr = postDetails.propertyType ?? postDetails.subCategory ?? '';

    final resolvedMainCat = (postDetails.mainCategory != null && postDetails.mainCategory!.isNotEmpty)
        ? postDetails.mainCategory
        : (() {
            if (subCategoryStr.isEmpty) return null;
            for (final entry in AppCategories.propertyCategoryHierarchy.entries) {
              if (entry.value.any((item) => item.toLowerCase() == subCategoryStr.toLowerCase())) {
                return entry.key;
              }
            }
            return null;
          })();

    final hasCarpetArea = (postDetails.carpetArea != null &&
            postDetails.carpetArea!.isNotEmpty) ||
        (postDetails.plotArea != null && postDetails.plotArea!.isNotEmpty);
    final hasStatus = postDetails.propertyStatus != null &&
        postDetails.propertyStatus!.isNotEmpty;
    final isNegotiable = postDetails.isNegotiable ?? false;
    final hasDeposit = postDetails.securityDeposit != null &&
        postDetails.securityDeposit!.isNotEmpty;
    final hasContactPref = (postDetails.contactViaPhone ?? false) ||
        (postDetails.contactViaWhatsApp ?? false);

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
                      Icons.info_outline_rounded,
                      color: primaryColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Property Overview',
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

          // Grid of Details
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

              // 2. Main Category
              if (resolvedMainCat != null && resolvedMainCat.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.apartment_rounded,
                  label: 'Category',
                  value: resolvedMainCat.translate(context),
                ),

              // 3. Property Sub-Type
              if (subCategoryStr.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.home_work_outlined,
                  label: 'Property Type',
                  value: subCategoryStr.translate(context),
                ),

              // 4. Carpet Area / Area
              if (hasCarpetArea)
                (() {
                  final hasCarp = postDetails.carpetArea != null &&
                      postDetails.carpetArea!.isNotEmpty;
                  final areaStr = hasCarp ? postDetails.carpetArea! : postDetails.plotArea!;
                  final unitStr = hasCarp
                      ? (postDetails.carpetAreaUnit ?? "Sq.Ft")
                      : (postDetails.areaUnit ?? "Sq.Yds");

                  String ratePerUnit = '';
                  if (postDetails.price != null) {
                    final double? areaNum = double.tryParse(
                      areaStr.replaceAll(RegExp(r'[^0-9.]'), ''),
                    );
                    if (areaNum != null && areaNum > 0) {
                      final double rate = postDetails.price! / areaNum;
                      ratePerUnit = '₹${rate.toStringAsFixed(0)} / $unitStr';
                    }
                  }
                  return _buildSpecTile(
                    context,
                    icon: Icons.square_foot_rounded,
                    label: postDetails.mainCategory == 'Industrial' ? 'Area' : 'Carpet Area',
                    value: '$areaStr $unitStr',
                    subtitle: ratePerUnit.isNotEmpty ? ratePerUnit : null,
                  );
                })(),

              // 5. Property Status
              if (hasStatus)
                _buildSpecTile(
                  context,
                  icon: Icons.real_estate_agent_outlined,
                  label: 'Property Status',
                  value: postDetails.propertyStatus!,
                ),

              // 6. Security Deposit (Rent/Lease)
              if (hasDeposit)
                _buildSpecTile(
                  context,
                  icon: Icons.account_balance_wallet_outlined,
                  label: 'Security Deposit',
                  value: postDetails.securityDeposit!.startsWith('₹')
                      ? postDetails.securityDeposit!
                      : '₹${postDetails.securityDeposit}',
                ),

              // 7. Facing
              if (postDetails.facing != null && postDetails.facing!.isNotEmpty)
                _buildSpecTile(
                  context,
                  icon: Icons.compass_calibration_rounded,
                  label: 'Facing',
                  value: postDetails.facing!,
                ),
            ],
          ),

          // Feature Badges (Negotiable & Contact Preferences)
          if (isNegotiable || hasContactPref) ...[
            const SizedBox(height: 14),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
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
                if (subtitle != null && subtitle.isNotEmpty) ...[
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
