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
        return _SafetyDisclaimerDialog(
          actionType: actionType,
          onContinue: onContinue,
        );
      },
    );
  }
}

class _SafetyDisclaimerDialog extends StatefulWidget {
  final String actionType;
  final VoidCallback onContinue;

  const _SafetyDisclaimerDialog({
    required this.actionType,
    required this.onContinue,
  });

  @override
  State<_SafetyDisclaimerDialog> createState() =>
      _SafetyDisclaimerDialogState();
}

class _SafetyDisclaimerDialogState extends State<_SafetyDisclaimerDialog> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
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
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Please exercise caution when contacting unknown users, property owners, or advertisers through Propertify. Never transfer advance payments before personally visiting the property.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 10),
              if (_isExpanded) ...[
                _buildBulletPoint(
                  title: 'Verify Before Paying:',
                  description:
                      'Never transfer advance payments, booking fees, deposits, or other money before personally visiting the property, verifying identity, and confirming terms.',
                ),
                const SizedBox(height: 10),
                _buildBulletPoint(
                  title: 'Verify Property Details:',
                  description:
                      'Independently verify ownership, documents, approvals, and pricing before making any commitment.',
                ),
                const SizedBox(height: 10),
                _buildBulletPoint(
                  title: 'Protect Personal Info:',
                  description:
                      'Never share OTPs, passwords, banking credentials, or sensitive documents with unknown persons.',
                ),
                const SizedBox(height: 10),
                _buildBulletPoint(
                  title: 'Beware of Fraud:',
                  description:
                      'Watch out for fake listings, impersonation, unrealistic offers, and urgent payment requests.',
                ),
                const SizedBox(height: 10),
                _buildBulletPoint(
                  title: 'Report Suspicious Activity:',
                  description:
                      'Report suspicious listings or transaction requests to Propertify immediately.',
                ),
                const SizedBox(height: 12),
              ],
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    _isExpanded ? 'Show Less ▲' : 'Read More ▼',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
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
            Navigator.pop(context);
            widget.onContinue();
          },
          child: Text('Continue to ${widget.actionType}'),
        ),
      ],
    );
  }

  Widget _buildBulletPoint({
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
