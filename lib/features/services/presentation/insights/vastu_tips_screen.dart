import 'package:flutter/material.dart';
import 'package:propertify/core/app_theme.dart';

class VastuTipsScreen extends StatelessWidget {
  static const String routeName = '/vastu-tips';

  const VastuTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> vastuTips = [
      {
        'title': 'Main Entrance',
        'description': 'The main door should ideally face North, East, or North-East for positive energy flow.',
        'icon': '🚪',
      },
      {
        'title': 'Kitchen Location',
        'description': 'The Southeast corner of the house is the best place for the kitchen (Agni corner).',
        'icon': '🍳',
      },
      {
        'title': 'Master Bedroom',
        'description': 'The Southwest corner is recommended for the master bedroom to ensure stability and prosperity.',
        'icon': '🛏️',
      },
      {
        'title': 'Pooja Room',
        'description': 'North-East is the most auspicious direction for a prayer or meditation room.',
        'icon': '🙏',
      },
      {
        'title': 'Living Room',
        'description': 'The living room should ideally face East or North to welcome social energy.',
        'icon': '🛋️',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vastu for Home'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: vastuTips.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final tip = vastuTips[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tip['icon']!,
                    style: const TextStyle(fontSize: 32),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tip['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          tip['description']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
