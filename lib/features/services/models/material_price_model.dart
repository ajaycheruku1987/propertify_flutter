import 'package:flutter/material.dart';

class PricePoint {
  final DateTime date;
  final double price;

  PricePoint(this.date, this.price);
}

class MaterialPrice {
  final String name;
  final String price;
  final String trend;
  final bool? isUp;
  final IconData icon;
  final List<PricePoint> history;

  MaterialPrice({
    required this.name,
    required this.price,
    required this.trend,
    this.isUp,
    required this.icon,
    List<PricePoint>? history,
  }) : history = (history != null && history.isNotEmpty)
            ? history
            : _generateMockHistory(price, name);

  factory MaterialPrice.fromJson(Map<String, dynamic> json) {
    return MaterialPrice(
      name: json['name'] ?? '',
      price: json['price'] ?? '',
      trend: json['trend'] ?? '',
      isUp: json['isUp'],
      icon: _getIconForMaterial(json['name'] ?? ''),
      history: (json['history'] as List?)?.map((e) => PricePoint(
        DateTime.parse(e['date'] as String),
        (e['price'] as num).toDouble(),
      )).toList(),
    );
  }

  static IconData _getIconForMaterial(String name) {
    name = name.toLowerCase();
    if (name.contains('steel')) return Icons.architecture;
    if (name.contains('cement')) return Icons.layers;
    if (name.contains('sand')) return Icons.grain;
    if (name.contains('brick')) return Icons.grid_view;
    if (name.contains('wood') || name.contains('teak')) return Icons.forest;
    if (name.contains('aggregate') || name.contains('metal')) return Icons.foundation;
    return Icons.category;
  }

  static List<PricePoint> _generateMockHistory(String priceStr, String name) {
    final numericPart = priceStr.replaceAll(RegExp(r'[^0-9.]'), '');
    final basePrice = double.tryParse(numericPart) ?? 100.0;
    
    final List<PricePoint> history = [];
    final now = DateTime.now();
    
    // Use the name to create a unique seed so every material has a different chart shape
    final seed = name.hashCode;
    
    for (int i = 5; i >= 0; i--) {
      // Significantly different patterns for each material to make trends distinct
      double variance;
      final n = name.toLowerCase();
      if (n.contains('steel')) {
        variance = (i * 0.015) - 0.04; // Steady rise
      } else if (n.contains('cement')) {
        variance = (i % 2 == 0 ? 0.02 : -0.01); // Fluctuating
      } else if (n.contains('sand')) {
        variance = - (i * 0.01); // Steady fall
      } else {
        variance = (((seed + i) % 5) - 2) * 0.03; // Random-ish
      }
      
      history.add(PricePoint(
        now.subtract(Duration(days: i * 30)), 
        basePrice * (1 + variance),
      ));
    }
    return history;
  }
}
