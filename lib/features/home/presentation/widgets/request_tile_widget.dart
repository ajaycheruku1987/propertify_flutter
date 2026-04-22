import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:propertify/utils/string_extensions.dart';

class RequestTileWidget extends StatefulWidget {
  final String title;
  final String ownerName;
  final String location;
  final String description;
  final String type; // 'Buy' or 'Rent'
  final String budget;
  final String? createdAt;
  final VoidCallback? onCallPressed;
  final VoidCallback? onWhatsAppPressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onTap;

  const RequestTileWidget({
    super.key,
    required this.title,
    required this.ownerName,
    required this.location,
    required this.description,
    required this.budget,
    required this.type,
    this.onCallPressed,
    this.onWhatsAppPressed,
    this.onEditPressed,
    this.onDeletePressed,
    this.onTap,
    this.createdAt,
  });

  @override
  State<RequestTileWidget> createState() => _RequestTileWidgetState();
}

class _RequestTileWidgetState extends State<RequestTileWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Property Icon/Avatar
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/request_tile_icon.svg',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(height: 4),
                  // Type
                  Text(widget.type, style: const TextStyle(fontSize: 12)),
                ],
              ),

              const SizedBox(width: 12),

              // Property Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      widget.title.toTitleCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Owner Name
                    Row(
                      children: [
                        const Icon(Icons.person, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          widget.ownerName.toTitleCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    // Location
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.location.toTitleCase(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    // Description with expand/collapse
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.description,
                              size: 14,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                widget.description.capitalize(),
                                maxLines: _isExpanded ? null : 2,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                overflow: _isExpanded
                                    ? TextOverflow.visible
                                    : TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        // More/Less button
                        if (widget.description.length > 60)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, left: 18),
                              child: Text(
                                _isExpanded ? 'less' : 'more',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // Action Buttons Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Type Badge (Buy/Rent)
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 12,
                  //     vertical: 4,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: type == 'Buy'
                  //         ? Colors.green.withOpacity(0.1)
                  //         : Colors.blue.withOpacity(0.1),
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: Text(
                  //     type,
                  //     style: TextStyle(
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w500,
                  //       color: type == 'Buy' ? Colors.green : Colors.blue,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.createdAt != null
                            ? DateFormat('dd MMM').format(
                          DateTime.parse(widget.createdAt!),
                        )
                            : '',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Call Button
                      InkWell(
                        onTap: widget.onCallPressed,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Icon(
                            Icons.phone_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 18,
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      // WhatsApp Button
                      InkWell(
                        onTap: widget.onWhatsAppPressed,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Theme.of(context).primaryColor,
                            size: 18,
                          ),
                        ),
                      ),

                      // More Options (Edit/Delete) - Only if at least one is provided
                      if (widget.onEditPressed != null ||
                          widget.onDeletePressed != null) ...[
                        const SizedBox(width: 4),
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: PopupMenuButton<String>(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.black87,
                              size: 16,
                            ),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                            position: PopupMenuPosition.under,
                            onSelected: (value) {
                              if (value == 'edit') {
                                widget.onEditPressed?.call();
                              } else if (value == 'delete') {
                                widget.onDeletePressed?.call();
                              }
                            },
                            itemBuilder: (BuildContext context) => [
                              if (widget.onEditPressed != null)
                                const PopupMenuItem<String>(
                                  value: 'edit',
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        size: 16,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Edit',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              if (widget.onDeletePressed != null)
                                const PopupMenuItem<String>(
                                  value: 'delete',
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 16,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Delete',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.payments_outlined,
                        size: 14,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.budget.toCompactPrice(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
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

extension PriceFormatter on String {
  String toCompactPrice() {
    final value = double.tryParse(this) ?? 0;
    if (value >= 10000000) {
      return '${(value / 10000000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')} Cr';
    } else if (value >= 100000) {
      return '${(value / 100000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')} L';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')} K';
    } else {
      return value.toString().replaceAll(RegExp(r'\.0$'), '');
    }
  }
}
