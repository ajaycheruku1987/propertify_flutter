import 'package:flutter/material.dart';

class SafetyDisclaimerHelper {
  static void showSafetyDisclaimer({
    required BuildContext context,
    required String actionType, // 'Call' or 'WhatsApp'
    required VoidCallback onContinue,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.orange,
                  size: 26,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Safety Disclaimer',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please exercise caution when contacting unknown users, property owners, brokers, or advertisers through Propertify.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildBulletPoint(
                    title: 'Verify Before Paying:',
                    description:
                        'Never transfer advance payments, booking fees, deposits, or other money before personally visiting the property, verifying the other party\'s identity, and confirming the terms of the transaction.',
                  ),
                  const SizedBox(height: 10),
                  _buildBulletPoint(
                    title: 'Verify Property Details:',
                    description:
                        'Independently verify ownership, authorization to sell or rent, property documents, approvals, pricing, and other important details before making any commitment.',
                  ),
                  const SizedBox(height: 10),
                  _buildBulletPoint(
                    title: 'Protect Personal Information:',
                    description:
                        'Never share OTPs, passwords, banking credentials, or other sensitive information with unknown persons. Be cautious when sharing identity documents or personal details.',
                  ),
                  const SizedBox(height: 10),
                  _buildBulletPoint(
                    title: 'Beware of Fraud:',
                    description:
                        'Watch out for fake listings, misleading information, impersonation, unrealistic offers, and requests for urgent or unusual payments.',
                  ),
                  const SizedBox(height: 10),
                  _buildBulletPoint(
                    title: 'Report Suspicious Activity:',
                    description:
                        'If you encounter a suspicious listing, user, or transaction request, report it to Propertify immediately.',
                  ),
                  const SizedBox(height: 10),
                  _buildBulletPoint(
                    title: 'Platform Disclaimer:',
                    description:
                        'Propertify facilitates connections between users. Unless explicitly stated otherwise, Propertify does not independently guarantee the accuracy of listings, user identities, property ownership, legal documents, or transactions between users.',
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'By proceeding, you acknowledge these safety precautions and agree to exercise due diligence before contacting or transacting with another user.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Stay alert. Verify first. Pay safely.',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(dialogContext);
                onContinue();
              },
              child: Text('Continue to $actionType'),
            ),
          ],
        );
      },
    );
  }

  static Widget _buildBulletPoint({
    required String title,
    required String description,
  }) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black87,
          height: 1.4,
        ),
        children: [
          TextSpan(
            text: '• $title ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: description),
        ],
      ),
    );
  }
}
