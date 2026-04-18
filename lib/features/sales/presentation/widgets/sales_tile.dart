import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:propertify/utils/string_extensions.dart';
import '../../models/sales_model.dart';
import '../../../../utils/common_widgets/logo_placeholder.dart';

class SalesTile extends StatelessWidget {
  final SaleRecord sale;
  final VoidCallback? onTap;

  const SalesTile({Key? key, required this.sale, this.onTap}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Image with Type Label
            Stack(
              children: [
                // Property Image
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: sale.imageUrls != null && sale.imageUrls!.isNotEmpty
                      ? Image.network(
                          sale.imageUrls!.first,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const LogoPlaceholder(
                              height: 180,
                              width: double.infinity,
                            );
                          },
                        )
                      : const LogoPlaceholder(
                          height: 180,
                          width: double.infinity,
                        ),
                ),
                // Property Type Label
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      (sale.propertyType ?? 'Property').toTitleCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Property Details
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Property Title and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          (sale.projectName ?? '').toTitleCase(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        sale.minPrice != null && sale.maxPrice != null
                            ? '${formatPrice(sale.minPrice)} - ${formatPrice(sale.maxPrice)}'
                            : (sale.minPrice != null
                                  ? formatPrice(sale.minPrice)
                                  : ''),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Sale Specification
                  if (sale.saleSpecification != null &&
                      sale.saleSpecification!.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            sale.saleSpecification!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],

                  // Location
                  const Divider(height: 1, thickness: 1),
                  const SizedBox(height: 12),

                  // Property Features (Row 1)
                  Row(
                    children: [
                      _buildFeature(
                        Icons.home_work_outlined,
                        _formatFeature(
                          sale.noOfUnits,
                          _getUnitsLabel(sale.propertyType),
                        ),
                      ),
                      const SizedBox(width: 16),
                      _buildFeature(
                        Icons.square_foot,
                        '${sale.area ?? 0} ${sale.areaUnit ?? "SqFt"}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Possession Date (Row 2) - "Below plots, acres"
                  _buildFeature(
                    (sale.propertyType?.toLowerCase().contains('openplot') ??
                            false)
                        ? Icons.rocket_launch_outlined
                        : Icons.handshake_outlined,
                    (sale.propertyType?.toLowerCase().contains('openplot') ??
                            false)
                        ? 'Launched Date: ${sale.createdAt != null ? DateFormat('dd MMM yyyy').format(DateTime.parse(sale.createdAt!).toLocal()) : 'N/A'}'
                        : 'Possession by: ${sale.possessionDate != null ? DateFormat('dd MMM yyyy').format(DateTime.parse(sale.possessionDate.toString()).toLocal()) : 'Ready to Move'}',
                  ),
                  const SizedBox(height: 8),
                  _buildFeature(
                    Icons.location_on_outlined,
                    (sale.city ?? '').toTitleCase(),
                  ),

                  // const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  String formatPrice(num? price) {
    if (price == null || price == 0) {
      return '₹0';
    }

    double amount = price.toDouble();

    // Convert to Crores (1 Cr = 10,000,000)
    if (amount >= 10000000) {
      double crores = amount / 10000000;
      return '₹${crores.toStringAsFixed(crores % 1 == 0 ? 0 : 1)}Cr';
    }
    // Convert to Lakhs (1 Lakh = 100,000)
    else if (amount >= 100000) {
      double lakhs = amount / 100000;
      return '₹${lakhs.toStringAsFixed(lakhs % 1 == 0 ? 0 : 1)}L';
    }
    // Convert to Thousands (1K = 1,000)
    else if (amount >= 1000) {
      double thousands = amount / 1000;
      return '₹${thousands.toStringAsFixed(thousands % 1 == 0 ? 0 : 1)}K';
    }
    // Display as is for smaller amounts
    else {
      return '₹${amount.toStringAsFixed(0)}';
    }
  }

  String _formatFeature(int? value, String unit) {
    if (value == null) {
      return '0 $unit'; // Default fallback
    }
    return '$value $unit';
  }

  String _getUnitsLabel(String? propertyType) {
    final type = propertyType?.toLowerCase().trim() ?? '';
    if (type.contains('apartment')) {
      return 'Flats';
    } else if (type.contains('villa')) {
      return 'Villas';
    } else if (type.contains('plot')) {
      return 'Plots';
    }
    return 'Units';
  }
}
