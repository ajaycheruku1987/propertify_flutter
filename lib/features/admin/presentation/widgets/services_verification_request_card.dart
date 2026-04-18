import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../services/models/services_response_model.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';

class ServicesVerificationRequestCard extends StatelessWidget {
  final ServicesResponseModel service;
  final Function(String) onStatusUpdate;

  const ServicesVerificationRequestCard({
    super.key,
    required this.service,
    required this.onStatusUpdate,
  });

  @override
  Widget build(BuildContext context) {
    // Priority: Aadhar Image > First Service Image > Placeholder
    final imageUrl = (service.aadharCardImageUrl?.isNotEmpty ?? false)
        ? service.aadharCardImageUrl!
        : (service.imageUrls?.isNotEmpty ?? false)
        ? service.imageUrls!.first
        : '';

    String formattedDate = '';
    if (service.createdAt != null) {
      try {
        final date = DateTime.parse(service.createdAt!);
        formattedDate = DateFormat('MMM d').format(date);
      } catch (e) {
        formattedDate = '';
      }
    }

    final title = service.agentName ?? 'Ayana Homestay';
    final category = (service.category?.isNotEmpty ?? false)
        ? service.category!.join(', ')
        : 'Expert';
    final ownerName = (service.owner != null)
        ? '${service.owner!.firstName ?? ''} ${service.owner!.lastName ?? ''}'
              .trim()
        : 'Anonymous';
    if (ownerName.isEmpty) 'Anonymous';

    // Status logic: if isVerified is true, show 'verifyed' badge.
    final status = service.isVerified == true ? 'verifyed' : 'pending';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => context.push('/view-service', extra: service.id),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                      imageUrl.isNotEmpty &&
                          !imageUrl.contains('images.unsplash.com')
                      ? CachedNetworkImage(
                          imageUrl: imageUrl,
                          width: 85,
                          height: 85,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: 85,
                            height: 85,
                            color: Colors.grey.shade100,
                            child: const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const LogoPlaceholder(width: 85, height: 85),
                        )
                      : const LogoPlaceholder(width: 85, height: 85),
                ),
                const SizedBox(width: 12),
                // Middle & Right combined
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Date
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A1A1A),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            formattedDate,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      // Category
                      Text(
                        category,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6C5CE7),
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      // Owner Info
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 14,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              ownerName,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Action Row
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            // Document Button
                            _buildActionButton(
                              icon: Icons.assignment_ind_outlined,
                              label: 'Aadhaar',
                              backgroundColor: const Color(0xFFEFECFF),
                              textColor: const Color(0xFF6C5CE7),
                              onTap: () {
                                if (service.aadharCardImageUrl?.isNotEmpty ??
                                    false) {
                                  _showImageDialog(
                                    context,
                                    service.aadharCardImageUrl!,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Aadhaar image not available',
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            const SizedBox(width: 8),
                            // Status Badge
                            if (status == 'verified' ||
                                status == 'verifyed' ||
                                status == 'approved')
                              _buildStatusBadge(
                                icon: Icons.verified_user,
                                label: 'Verifyed',
                                backgroundColor: const Color(0xFFE7F9F0),
                                textColor: const Color(0xFF27AE60),
                              )
                            else if (status == 'rejected')
                              _buildStatusBadge(
                                icon: Icons.cancel,
                                label: 'Rejected',
                                backgroundColor: const Color(0xFFFFECEC),
                                textColor: const Color(0xFFEB5757),
                              )
                            else
                              _buildStatusBadge(
                                icon: Icons.hourglass_empty,
                                label: 'Pending',
                                backgroundColor: const Color(0xFFFFF7E6),
                                textColor: const Color(0xFFD48806),
                              ),
                            const SizedBox(width: 12),
                            // Admin Actions
                            if (status != 'verifyed' &&
                                status != 'verified' &&
                                status != 'approved') ...[
                              _buildCircleIconButton(
                                icon: Icons.check,
                                color: Colors.green,
                                onTap: () => onStatusUpdate('approved'),
                                tooltip: 'Approve',
                              ),
                              const SizedBox(width: 10),
                            ],
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
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: InteractiveViewer(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                  errorWidget: (context, url, error) =>
                      const LogoPlaceholder(width: 200, height: 200),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    String? tooltip,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: textColor),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
