import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/admin/models/admin_companies_response_model.dart';
import 'package:propertify/features/admin/bloc/admin_bloc.dart';
import 'package:propertify/features/company/presentation/my_company.dart';
import 'package:propertify/utils/string_extensions.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';

class AdminCompanyCard extends StatelessWidget {
  final AdminCompanyModel company;

  const AdminCompanyCard({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String formattedDate = '';

    if (company.createdAt != null) {
      try {
        final date = DateTime.parse(company.createdAt!);
        formattedDate = DateFormat('MMM d, yyyy').format(date);
      } catch (e) {
        formattedDate = '';
      }
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () =>
            context.push(MyCompanyScreen.routeName, extra: company.owner?.id),
        borderRadius: BorderRadius.circular(12),
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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Company Image
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        image:
                            company.imageUrl != null &&
                                company.imageUrl!.isNotEmpty
                            ? DecorationImage(
                                image: CachedNetworkImageProvider(
                                  company.imageUrl!,
                                ),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child:
                          company.imageUrl == null || company.imageUrl!.isEmpty
                          ? const LogoPlaceholder(logoWidth: 30, logoHeight: 30)
                          : null,
                    ),
                    const SizedBox(width: 16),
                    // Company Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (company.companyName ?? 'Unknown Company')
                                .toTitleCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            (company.category ?? '').toTitleCase(),
                            style: TextStyle(
                              fontSize: 14,
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          if (company.gstNumber != null &&
                              company.gstNumber != 'no')
                            Text(
                              'GST: ${company.gstNumber}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                        ],
                      ),
                    ),
                    // Delete Button
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _showDeleteDialog(context),
                    ),
                  ],
                ),
                const Divider(height: 24),
                // Owner Info
                Row(
                  children: [
                    ClipOval(
                      child: company.owner?.profilepic?.isNotEmpty ?? false
                          ? CachedNetworkImage(
                              imageUrl: company.owner!.profilepic!,
                              width: 24,
                              height: 24,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                width: 24,
                                height: 24,
                                color: Colors.grey.shade200,
                                child: const Icon(Icons.person, size: 12),
                              ),
                              errorWidget: (context, url, error) =>
                                  const LogoPlaceholder(
                                    logoWidth: 12,
                                    logoHeight: 12,
                                  ),
                            )
                          : const LogoPlaceholder(
                              width: 24,
                              height: 24,
                              logoWidth: 12,
                              logoHeight: 12,
                            ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        (company.owner?.username ?? 'Unknown Owner')
                            .toTitleCase(),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (formattedDate.isNotEmpty)
                      Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                // Contact
                const SizedBox(height: 4),
                // Address
                if (company.address != null)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          company.address!.toTitleCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Company'),
        content: const Text(
          'Are you sure you want to delete this company? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              if (company.id != null) {
                context.read<AdminBloc>().add(
                  AdminEvent.deleteCompany(companyId: company.id!),
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
