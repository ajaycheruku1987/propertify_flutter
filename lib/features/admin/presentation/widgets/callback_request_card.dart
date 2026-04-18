import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../sales/models/sales_model.dart';
import '../../../sales/presentation/sale_view_screen.dart';
import '../../models/callback_request_model.dart';

class CallbackRequestCard extends StatelessWidget {
  final CallbackRequestModel callbackRequest;
  final VoidCallback onDelete;

  const CallbackRequestCard({
    super.key,
    required this.callbackRequest,
    required this.onDelete,
  });

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (!await launchUrl(launchUri)) {
      throw Exception('Could not launch $launchUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final title =
        callbackRequest.projectName ??
        callbackRequest.salesProjectId ??
        'Guest User';
    final category =
        callbackRequest.status ??
        'Pending'; // Use status instead of category/propertyType

    String requestDateFormatted = '';
    if (callbackRequest.createdAt != null) {
      try {
        final date = DateTime.parse(callbackRequest.createdAt!);
        requestDateFormatted = DateFormat('d MMM yyyy').format(date);
      } catch (e) {
        requestDateFormatted = '';
      }
    }

    final requesterName = callbackRequest.name ?? 'Guest User';
    final phoneNumber = callbackRequest.phoneNumber ?? 'No Phone';
    // final email = callbackRequest.email ?? 'No Email';
    // final isContacted = callbackRequest.status == 'contacted';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Top Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          final projectId = callbackRequest.salesProjectId;
                          if (projectId != null) {
                            // Create a minimal SaleRecord with only the ID
                            final minimalSale = SaleRecord(id: projectId);
                            context.push(
                              SaleViewScreen.routeName,
                              extra: minimalSale,
                            );
                          }
                        },
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        category, // Using status/category as placeholder
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7C4DFF), // Purple color
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Request on $requestDateFormatted',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline),
                  color: Colors.black54,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  iconSize: 24,
                ),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 1),

          // Bottom Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Center(
                    child: Icon(Icons.person_outline, color: Colors.black),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        requesterName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      InkWell(
                        onTap: () => _makePhoneCall(phoneNumber),
                        child: Text(
                          phoneNumber,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF7C4DFF), // Purple color
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
