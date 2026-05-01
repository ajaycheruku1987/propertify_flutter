import 'package:flutter/material.dart';
import 'package:propertify/core/app_theme.dart';

class QualityGuideScreen extends StatelessWidget {
  static const String routeName = '/quality-guide';

  const QualityGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> checkList = [
      {
        'category': 'Cement',
        'points': [
          'Check for the ISI mark on the bag.',
          'Ensure cement is not older than 3 months from the date of manufacture.',
          'It should feel cool when you thrust your hand into the bag.',
          'There should be no hard lumps present.'
        ]
      },
      {
        'category': 'Steel (TMT)',
        'points': [
          'Look for the brand name and grade (e.g., Fe500D) embossed on the rod.',
          'Check for rust; minor surface rust is okay, but deep pitting is not.',
          'The rod should be able to bend 180 degrees without cracks.'
        ]
      },
      {
        'category': 'Bricks',
        'points': [
          'They should have a uniform copper-red color.',
          'A metallic ringing sound should be heard when two bricks are struck.',
          'They should not break when dropped from a height of 1 meter.'
        ]
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Quality Guide'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: checkList.length,
        itemBuilder: (context, index) {
          final item = checkList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ExpansionTile(
              title: Text(
                item['category'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: (item['points'] as List<String>)
                        .map((point) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.check_circle_outline, size: 20, color: Theme.of(context).primaryColor),
                                  const SizedBox(width: 8),
                                  Expanded(child: Text(point)),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
