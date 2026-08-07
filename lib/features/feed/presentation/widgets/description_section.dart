import 'package:propertify/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:propertify/utils/string_extensions.dart';

class DescriptionSection extends StatefulWidget {
  final String description;

  const DescriptionSection({Key? key, required this.description})
    : super(key: key);

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const int maxLines = 3;
    final bool isLongText = widget.description.length > 150;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            l10n.description,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 12),

          // Description Text
          AnimatedCrossFade(
            firstChild: Text(
              widget.description.translate(context),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
            secondChild: Text(
              widget.description.translate(context),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),

          // Read More/Less Button
          if (isLongText)
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _isExpanded ? l10n.less : l10n.more,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6C5CE7),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
