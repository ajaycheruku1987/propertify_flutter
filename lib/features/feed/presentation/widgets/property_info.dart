import 'package:propertify/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:propertify/utils/string_extensions.dart';

class PropertyInfo extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final bool canEdit;
  final bool canDelete;
  final bool canReport;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onReportPressed;

  const PropertyInfo({
    Key? key,
    required this.title,
    required this.location,
    required this.price,
    this.canEdit = false,
    this.canDelete = false,
    this.canReport = false,
    this.onEditPressed,
    this.onDeletePressed,
    this.onReportPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title.translate(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '₹$price',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6C5CE7),
                    ),
                  ),
                  if (canEdit || canDelete || canReport)
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
                        if (value == 'edit' && onEditPressed != null) {
                          onEditPressed!();
                        } else if (value == 'delete' && onDeletePressed != null) {
                          onDeletePressed!();
                        } else if (value == 'report' && onReportPressed != null) {
                          onReportPressed!();
                        }
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        if (canEdit)
                          PopupMenuItem<String>(
                            value: 'edit',
                            child: Row(
                              children: [
                                const Icon(Icons.edit, size: 18, color: Colors.blue),
                                const SizedBox(width: 8),
                                Text(l10n.edit),
                              ],
                            ),
                          ),
                        if (canDelete)
                          PopupMenuItem<String>(
                            value: 'delete',
                            child: Row(
                              children: [
                                const Icon(Icons.delete, size: 18, color: Colors.red),
                                const SizedBox(width: 8),
                                Text(l10n.delete, style: const TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),
                        if (canReport)
                          PopupMenuItem<String>(
                            value: 'report',
                            child: Row(
                              children: [
                                const Icon(Icons.report, size: 18, color: Colors.orange),
                                const SizedBox(width: 8),
                                Text(l10n.report),
                              ],
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Location with icon
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.grey[600], size: 16),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location.translate(context),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
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
}
