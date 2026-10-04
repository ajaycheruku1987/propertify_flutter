import 'package:propertify/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:propertify/utils/string_extensions.dart';

class PropertyInfo extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final String? category;
  final String? mainCategory;
  final String? listingType;
  final bool canEdit;
  final bool canDelete;
  final bool canReport;
  final bool showCalculator;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onReportPressed;
  final VoidCallback? onCalculatorPressed;

  const PropertyInfo({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    this.category,
    this.mainCategory,
    this.listingType,
    this.canEdit = false,
    this.canDelete = false,
    this.canReport = false,
    this.showCalculator = false,
    this.onEditPressed,
    this.onDeletePressed,
    this.onReportPressed,
    this.onCalculatorPressed,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upper Row: EMI Calculator & Price + Actions Menu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (showCalculator && onCalculatorPressed != null)
                InkWell(
                  onTap: onCalculatorPressed,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calculate_outlined,
                          color: Theme.of(context).primaryColor,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Calculator',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                const SizedBox.shrink(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '₹$price',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).primaryColor,
                      letterSpacing: -0.5,
                    ),
                  ),
                  if (canEdit || canDelete || canReport) ...[
                    const SizedBox(width: 8),
                    PopupMenuButton<String>(
                      color: Colors.white,
                      position: PopupMenuPosition.under,
                      elevation: 8,
                      shadowColor: Colors.black.withValues(alpha: 0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      icon: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.more_horiz,
                          color: Colors.black87,
                          size: 20,
                        ),
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
                                const Icon(Icons.edit_outlined, size: 18, color: Colors.blue),
                                const SizedBox(width: 12),
                                Text(l10n.edit, style: const TextStyle(fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        if (canDelete)
                          PopupMenuItem<String>(
                            value: 'delete',
                            child: Row(
                              children: [
                                const Icon(Icons.delete_outline, size: 18, color: Colors.red),
                                const SizedBox(width: 12),
                                Text(l10n.delete, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        if (canReport)
                          PopupMenuItem<String>(
                            value: 'report',
                            child: Row(
                              children: [
                                const Icon(Icons.report_outlined, size: 18, color: Colors.orange),
                                const SizedBox(width: 12),
                                Text(l10n.report, style: const TextStyle(fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Property Title (Full width)
          Text(
            title.capitalize().translate(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Color(0xFF1A1A1A),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          // Location (Single line)
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.grey[400], size: 16),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location.translate(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
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
