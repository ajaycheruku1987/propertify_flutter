import 'package:flutter/material.dart';

class QualityGuideScreen extends StatefulWidget {
  static const String routeName = '/quality-guide';

  const QualityGuideScreen({super.key});

  @override
  State<QualityGuideScreen> createState() => _QualityGuideScreenState();
}

class _QualityGuideScreenState extends State<QualityGuideScreen> {
  final List<Map<String, dynamic>> checkList = [
    {
      'category': 'Cement',
      'icon': Icons.layers,
      'points': [
        'Check for the ISI mark and grade (OPC 43/53 or PPC) on the bag.',
        'Ensure cement is not older than 3 months from the date of manufacture.',
        'It should feel cool when you thrust your hand into the bag.',
        'Color should be uniform greenish-gray.',
        'There should be no hard lumps present.'
      ]
    },
    {
      'category': 'Steel (TMT)',
      'icon': Icons.architecture,
      'points': [
        'Look for the brand name and grade (e.g., Fe500D) embossed on every meter of the rod.',
        'Check for rust; minor surface rust is okay, but deep pitting or scaling is a red flag.',
        'The rod should be able to bend 180 degrees without showing any cracks.',
        'Ensure the diameter is consistent across the length.'
      ]
    },
    {
      'category': 'Bricks',
      'icon': Icons.grid_view,
      'points': [
        'They should have a uniform copper-red color and sharp edges.',
        'A metallic ringing sound should be heard when two bricks are struck together.',
        'They should not break when dropped flat from a height of 1 meter.',
        'Water absorption should not exceed 20% of its dry weight.'
      ]
    },
    {
      'category': 'Paints',
      'icon': Icons.format_paint,
      'points': [
        'Choose between Distemper, Emulsion, or Texture based on surface and budget.',
        'Check for VOC (Volatile Organic Compounds) levels; lower is better for health.',
        'Ensure the paint has good "hide" or opacity to cover the surface in fewer coats.',
        'Verify shelf life; usually 2-3 years from the date of manufacture.',
        'Look for anti-fungal and washable properties for interior emulsions.'
      ]
    },
    {
      'category': 'Wood',
      'icon': Icons.door_front_door,
      'points': [
        'Identify the type: Teak (high durability), Sal (hardwood), or Plywood (commercial).',
        'Check for moisture content; seasoned wood should have 10-12% moisture.',
        'Ensure there are no knots, holes, or cracks on the surface.',
        'Grain pattern should be uniform and aesthetic for visible areas.',
        'Weight: Generally, heavier wood indicates better density and strength.'
      ]
    },
    {
      'category': 'Tiles',
      'icon': Icons.grid_on,
      'points': [
        'Vitrified vs Ceramic: Vitrified is more durable and stain-resistant for floors.',
        'Check for "squareness": Place two tiles back-to-back to see if they match perfectly.',
        'Tap the tile: A dull sound might indicate a hidden crack or poor density.',
        'Verify the batch number on boxes to ensure uniform color and pattern.',
        'Scratch resistance: Test with a hard object to check glaze quality.'
      ]
    },
    {
      'category': 'Taps & Faucets',
      'icon': Icons.water_drop,
      'points': [
        'Material: Brass with Chrome plating is the standard for longevity.',
        'Operation: The handle should move smoothly without any grinding noise.',
        'Check the "Aerator": High-quality aerators ensure a soft, splash-free flow.',
        'Weight: Heavier brass fittings generally last longer than lighter alloy ones.',
        'Check for ceramic disc cartridges for drip-free performance.'
      ]
    },
    {
      'category': 'Pipes & Fittings',
      'icon': Icons.plumbing,
      'points': [
        'CPVC for hot/cold water, UPVC for cold water, and PVC for drainage.',
        'Check for ISI marks and pressure rating (e.g., SDR 11) on the pipe.',
        'Joints: Ensure fittings match the pipe brand for better solvent welding.',
        'Wall thickness: Should be uniform throughout the circumference.',
        'UV resistance: Essential for pipes exposed to direct sunlight.'
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Material Quality Guide'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: checkList.length,
        itemBuilder: (context, index) {
          final item = checkList[index];
          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              leading: Icon(item['icon'], color: Theme.of(context).primaryColor),
              title: Text(
                item['category'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onExpansionChanged: (expanded) {
                if (expanded) {
                  // Ensure the item scrolls into view when expanded
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Scrollable.ensureVisible(
                      context,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                }
              },
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                Column(
                  children: (item['points'] as List<String>)
                      .map((point) => Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.verified, size: 18, color: Colors.green[600]),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    point,
                                    style: const TextStyle(height: 1.4, fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
