import 'package:flutter/material.dart';

class VastuTipsScreen extends StatelessWidget {
  static const String routeName = '/vastu-tips';

  const VastuTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: const Text('Vastu Shastra Tips'),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Independent', icon: Icon(Icons.home)),
              Tab(text: 'Apartments', icon: Icon(Icons.apartment)),
              Tab(text: 'Commercial', icon: Icon(Icons.business)),
            ],
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: const TabBarView(
          children: [
            VastuCategoryList(type: 'independent'),
            VastuCategoryList(type: 'apartment'),
            VastuCategoryList(type: 'commercial'),
          ],
        ),
      ),
    );
  }
}

class VastuCategoryList extends StatelessWidget {
  final String type;

  const VastuCategoryList({super.key, required this.type});

  List<Map<String, String>> _getTips() {
    switch (type) {
      case 'independent':
        return [
          {
            'title': 'Main Entrance',
            'description': 'Ideally face North, East, or North-East. Ensure it is the largest door in the house.',
            'color': 'White, Silver or Wood',
            'icon': '🚪',
          },
          {
            'title': 'Kitchen (Agni)',
            'description': 'Place in the South-East corner. If not possible, North-West is an alternative.',
            'color': 'Light Green or Orange',
            'icon': '🍳',
          },
          {
            'title': 'Master Bedroom',
            'description': 'South-West corner is best for the head of the family. It ensures stability and long life.',
            'color': 'Light Yellow or Blue',
            'icon': '🛏️',
          },
          {
            'title': 'Pooja Room',
            'description': 'North-East is the most auspicious direction for prayer and meditation.',
            'color': 'Light Yellow or White',
            'icon': '🙏',
          },
          {
            'title': 'Living Room',
            'description': 'Should ideally face East or North. Welcomes social energy and prosperity.',
            'color': 'White, Cream or Light Blue',
            'icon': '🛋️',
          },
        ];
      case 'apartment':
        return [
          {
            'title': 'Entrance Gate',
            'description': 'Avoid flats with an entrance facing South-West. Prefer North or East facing main doors.',
            'color': 'Light & Bright shades',
            'icon': '🏢',
          },
          {
            'title': 'Kitchen in Apartment',
            'description': 'Ensure the cooking stove is in the South-East. Facing East while cooking is auspicious.',
            'color': 'Light Green',
            'icon': '🍳',
          },
          {
            'title': 'Balconies',
            'description': 'Balconies in the North or East bring in morning sunlight and positive energy.',
            'color': 'Neutral tones',
            'icon': '🌅',
          },
          {
            'title': 'Kids Bedroom',
            'description': 'North-West or West are good directions. Study table should face North or East.',
            'color': 'Light Green or Light Blue',
            'icon': '👶',
          },
          {
            'title': 'Center Space',
            'description': 'The center (Brahmasthan) should be open and free from heavy furniture or walls.',
            'color': 'White or Light Cream',
            'icon': '✨',
          },
        ];
      case 'commercial':
        return [
          {
            'title': 'Office Entrance',
            'description': 'The entrance should ideally be towards the North, North-East, or North-West.',
            'color': 'White or Grey',
            'icon': '🏪',
          },
          {
            'title': 'Owner Seat',
            'description': 'The owner should sit in the South-West corner facing North or East.',
            'color': 'Brown or Wood tones',
            'icon': '🪑',
          },
          {
            'title': 'Cash Counter',
            'description': 'Place the cash box in the North direction for financial growth.',
            'color': 'Cream or Silver',
            'icon': '💰',
          },
          {
            'title': 'Reception Area',
            'description': 'Should be in the North-East or East. Front desk should face North or East.',
            'color': 'Blue or White',
            'icon': '🛎️',
          },
          {
            'title': 'Staff Seating',
            'description': 'Employees should face North or East while working to increase productivity.',
            'color': 'Light Grey or Off-white',
            'icon': '👥',
          },
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final tips = _getTips();
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tips.length,
      itemBuilder: (context, index) {
        final tip = tips[index];
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tip['icon']!,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tip['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        tip['description']!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                          height: 1.4,
                        ),
                      ),
                      if (tip.containsKey('color')) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.palette_outlined, size: 14, color: Colors.orange),
                              const SizedBox(width: 6),
                              Text(
                                'Recommended Color: ${tip['color']}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
