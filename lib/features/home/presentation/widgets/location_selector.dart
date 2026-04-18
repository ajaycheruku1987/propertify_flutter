import 'package:flutter/material.dart';
import '../../../../core/app_theme.dart';

class LocationSelector extends StatelessWidget {
  final String location;
  final VoidCallback? onLocationPressed;

  const LocationSelector({
    super.key,
    required this.location,
    this.onLocationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLocationPressed,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Location',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on, color: AppTheme.blueColor, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
