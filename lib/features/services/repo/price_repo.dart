import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/material_price_model.dart';

class PriceRepo {
  static const String _storageKey = 'manual_material_prices';

  Future<void> saveManualPrices(List<Map<String, dynamic>> prices) async {
    final prefs = await SharedPreferences.getInstance();
    // Get existing prices to calculate trends
    final String? existingData = prefs.getString(_storageKey);
    List<dynamic> existingList = existingData != null ? jsonDecode(existingData) : [];

    final List<Map<String, dynamic>> updatedList = [];

    for (var newPriceData in prices) {
      final String name = newPriceData['name'];
      
      // Fix: Split by '/' to ignore numbers in units like '/1k' or '/50kg'
      String cleanNewPrice = newPriceData['price'].toString().split('/')[0];
      final double newPriceValue = double.tryParse(cleanNewPrice.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
      
      // Find old data to calculate trend
      dynamic oldData;
      try {
        oldData = existingList.firstWhere((item) => item['name'] == name);
      } catch (_) {
        // Fallback: If no manual data exists, find the mock price to use as baseline
        final mock = _getMockPrices().firstWhere((m) => m.name == name, orElse: () => _getMockPrices().first);
        oldData = {
          'price': mock.price,
          'history': mock.history.map((h) => {'date': h.date.toIso8601String(), 'price': h.price}).toList(),
        };
      }

      double trendPercent = 0.0;
      bool? isUp;
      
      /* Temporarily disabled trend calculation
      if (oldData != null) {
        String cleanOldPrice = oldData['price'].toString().split('/')[0];
        final double oldPriceValue = double.tryParse(cleanOldPrice.replaceAll(RegExp(r'[^0-9.]'), '')) ?? newPriceValue;
        if (oldPriceValue != 0) {
          trendPercent = ((newPriceValue - oldPriceValue) / oldPriceValue) * 100;
          isUp = newPriceValue > oldPriceValue ? true : (newPriceValue < oldPriceValue ? false : null);
        }
      }
      */

      // Maintain history (keep last 6). If first time, 'oldData' now contains mock history
      List<dynamic> history = oldData != null && oldData['history'] != null ? List.from(oldData['history']) : [];
      
      // Avoid adding duplicate points if saving multiple times in one day for testing
      if (history.isNotEmpty) {
        final lastDate = DateTime.parse(history.last['date']);
        final now = DateTime.now();
        if (lastDate.year == now.year && lastDate.month == now.month && lastDate.day == now.day) {
          history.removeLast(); // Update today's point instead of adding a new one
        }
      }

      history.add({
        'date': DateTime.now().toIso8601String(),
        'price': newPriceValue,
      });
      if (history.length > 6) history.removeAt(0);

      updatedList.add({
        'name': name,
        'price': newPriceData['price'], // e.g. "₹70,000/t"
        'trend': "", // Temporarily disabled: "${trendPercent >= 0 ? '+' : ''}${trendPercent.toStringAsFixed(1)}%"
        'isUp': null, // Temporarily disabled: isUp,
        'history': history,
      });
    }

    await prefs.setString(_storageKey, jsonEncode(updatedList));
  }

  Future<List<MaterialPrice>> getLatestMaterialPrices() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? data = prefs.getString(_storageKey);
      
      if (data != null) {
        final List<dynamic> decoded = jsonDecode(data);
        return decoded.map((item) => MaterialPrice.fromJson(item)).toList();
      }
      
      // Return default mock data if no manual prices are set yet
      return _getMockPrices();
    } catch (e) {
      print('Error fetching manual prices: $e');
      return _getMockPrices();
    }
  }

  List<MaterialPrice> _getMockPrices() {
    return [
      MaterialPrice(
        name: 'Steel (TMT)',
        price: '₹68,500/t',
        trend: '',
        isUp: null,
        icon: Icons.architecture,
      ),
      MaterialPrice(
        name: 'Cement',
        price: '₹385/bag',
        trend: '',
        isUp: null,
        icon: Icons.layers,
      ),
      MaterialPrice(
        name: 'Sand',
        price: '₹1,250/t',
        trend: '',
        isUp: null,
        icon: Icons.grain,
      ),
      MaterialPrice(
        name: 'Bricks',
        price: '₹8,200/1k',
        trend: '',
        isUp: null,
        icon: Icons.grid_view,
      ),
      MaterialPrice(
        name: 'Wood (Teak)',
        price: '₹3,400/cft',
        trend: '',
        isUp: null,
        icon: Icons.forest,
      ),
      MaterialPrice(
        name: 'Aggregate',
        price: '₹1,180/t',
        trend: '',
        isUp: null,
        icon: Icons.foundation,
      ),
    ];
  }
}
