import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:propertify/features/home/presentation/banner_ad_detail_view.dart';

import '../../../profile/models/banner_ad_model.dart';
import '../../../../utils/string_extensions.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';

class BannerAdCard extends StatelessWidget {
  final BannerAdModel bannerAd;
  final VoidCallback onDelete;

  const BannerAdCard({
    super.key,
    required this.bannerAd,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl = bannerAd.imageUrls?.isNotEmpty == true
        ? bannerAd.imageUrls!.first
        : null;

    // Parse dates
    final startDate = bannerAd.createdAt != null
        ? DateTime.tryParse(bannerAd.createdAt!) ?? DateTime.now()
        : DateTime.now();
    final endDate = bannerAd.expiresAt != null
        ? DateTime.tryParse(bannerAd.expiresAt!) ??
              DateTime.now().add(const Duration(days: 15))
        : DateTime.now().add(const Duration(days: 15));

    // Calculate days remaining
    final daysRemaining = endDate.difference(DateTime.now()).inDays;
    final daysRemainingText = daysRemaining > 0
        ? daysRemaining.toString()
        : '0';

    // Format dates
    final startDateFormatted = DateFormat('MMM d').format(startDate);
    final endDateFormatted = DateFormat('MMM d').format(endDate);

    // Get owner name
    final ownerName = bannerAd.owner?.username != null
        ? bannerAd.owner!.username
        : 'Property Owner';

    return InkWell(
      onTap: () => context.push(BannerAdDetailView.routeName, extra: bannerAd),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const LogoPlaceholder(width: 100, height: 100),
                      )
                    : const LogoPlaceholder(width: 100, height: 100),
              ),
              const SizedBox(width: 12),
              // Content Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      (bannerAd.description ?? 'Realest related ads')
                          .toTitleCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // Owner with icon
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 16,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            (ownerName ?? '').toTitleCase(),
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Dates
                    Text(
                      'Start Date $startDateFormatted End Date $endDateFormatted',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Paid/Unpaid Status
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: bannerAd.isPaid == true
                            ? Colors.green.shade50
                            : Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        bannerAd.isPaid == true ? 'PAID' : 'UNPAID',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: bannerAd.isPaid == true
                              ? Colors.green.shade700
                              : Colors.orange.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Right Section - Duration Badge
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          daysRemainingText,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'days',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Delete Icon
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      size: 20,
                      color: Colors.red.shade400,
                    ),
                    onPressed: onDelete,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    tooltip: 'Delete',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
