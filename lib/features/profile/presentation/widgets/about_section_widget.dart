import 'package:flutter/material.dart';

class AboutSectionWidget extends StatefulWidget {
  final String aboutText;
  const AboutSectionWidget({super.key, required this.aboutText});

  @override
  State<AboutSectionWidget> createState() => _AboutSectionWidgetState();
}

class _AboutSectionWidgetState extends State<AboutSectionWidget> {
  bool _isExpanded = false;
  bool _isOverflowing = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, size: 18, color: primaryColor),
              const SizedBox(width: 8),
              const Text(
                'About',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (context, constraints) {
              final textPainter = TextPainter(
                text: TextSpan(
                  text: widget.aboutText,
                  style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
                ),
                maxLines: 3,
                textDirection: TextDirection.ltr,
                textScaler: MediaQuery.of(context).textScaler,
              );
              textPainter.layout(maxWidth: constraints.maxWidth);
              _isOverflowing = textPainter.didExceedMaxLines;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.aboutText,
                    maxLines: _isExpanded ? null : 3,
                    overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                  if (_isOverflowing || _isExpanded) ...[
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Text(
                        _isExpanded ? 'Less' : 'More',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
