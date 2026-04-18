import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../sales/models/sales_model.dart';
import '../../../sales/presentation/sale_view_screen.dart';
import '../../models/projects_admin_view_model.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';

class ProjectCard extends StatelessWidget {
  final ProjectsAdminViewModel project;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = project.imageUrls?.isNotEmpty == true
        ? project.imageUrls!.first
        : null;

    String formattedDate = '';
    if (project.createdAt != null) {
      try {
        final date = DateTime.parse(project.createdAt!);
        formattedDate = DateFormat('MMM d').format(date);
      } catch (e) {
        formattedDate = '';
      }
    }

    final category = project.propertyType ?? 'Apartments';
    final ownerName = project.owner?.username ?? 'Khaja Mohammed';

    return GestureDetector(
      onTap: () {
        final projectId = project.id;
        if (projectId != null) {
          // Create a minimal SaleRecord with only the ID
          final minimalSale = SaleRecord(id: projectId);
          context.push(SaleViewScreen.routeName, extra: minimalSale);
        }
      },
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
                      project.projectName ?? 'Ayana Homestay',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    // Category
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Owner
                    Text(
                      ownerName,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Right Section - Date and Actions
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Date
                  if (formattedDate.isNotEmpty)
                    Text(
                      formattedDate,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  const SizedBox(height: 12),
                  // Action Icons
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Edit Icon
                      GestureDetector(
                        onTap: () {
                          // Prevent parent gesture detector from firing
                          onEdit();
                        },
                        child: IconButton(
                          icon: Icon(
                            Icons.edit_outlined,
                            size: 20,
                            color: Colors.grey.shade700,
                          ),
                          onPressed: onEdit,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          tooltip: 'Edit',
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Delete Icon
                      GestureDetector(
                        onTap: () {
                          // Prevent parent gesture detector from firing
                          onDelete();
                        },
                        child: IconButton(
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
                      ),
                    ],
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
