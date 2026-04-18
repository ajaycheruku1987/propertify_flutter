import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

/// A static, non-interactive map widget that displays a location marker
/// and opens the device's maps app when tapped.
class StaticLocationMapView extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String? locationName;

  const StaticLocationMapView({
    super.key,
    required this.latitude,
    required this.longitude,
    this.locationName,
  });

  @override
  Widget build(BuildContext context) {
    final position = LatLng(latitude, longitude);

    return GestureDetector(
      onTap: () => _openMaps(latitude, longitude),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              // Flutter Map with interaction disabled
              AbsorbPointer(
                absorbing: true, // Disables all map interactions
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: position,
                    initialZoom: 15.0,
                    interactionOptions: const InteractionOptions(
                      flags: InteractiveFlag.none, // Disable all interactions
                    ),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.placeofsalesrealestate',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: position,
                          width: 50,
                          height: 50,
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Overlay with tap hint
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.touch_app,
                        color: Color(0xFF6C5CE7),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          locationName ?? 'Tap to open in Maps',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF6C5CE7),
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Opens the location in the device's maps app
  Future<void> _openMaps(double lat, double lng) async {
    // Try different map URLs in order of preference
    final urls = [
      // Google Maps (most common)
      'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
      // Apple Maps (iOS)
      'https://maps.apple.com/?ll=$lat,$lng',
      // Generic geo: URI (fallback)
      'geo:$lat,$lng',
    ];

    for (final urlString in urls) {
      final uri = Uri.parse(urlString);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        return;
      }
    }

    // If none of the URLs work, show an error
    debugPrint('Could not open maps for location: $lat, $lng');
  }
}
