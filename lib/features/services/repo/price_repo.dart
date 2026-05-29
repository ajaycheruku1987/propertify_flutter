import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../../core/key_properties.dart';
import '../models/material_price_model.dart';

class PriceRepo {
  // Use API key from KeyProperties
  static const String _apiKey = KeyProperties.geminiApiKey;

  Future<List<MaterialPrice>> getLatestMaterialPrices() async {
    try {
      if (_apiKey.isEmpty || _apiKey == 'YOUR_GEMINI_API_KEY') {
        // Return mock data if API key is not set to avoid errors
        return _getMockPrices();
      }

      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: _apiKey,
      );

      const prompt = '''
        Fetch the current average market prices and 6-month price history for construction materials in India:
        1. Steel (TMT) per ton
        2. Cement per bag
        3. Sand per ton
        4. Bricks per 1000 units
        5. Wood (Teak) per cubic foot
        6. Aggregate (Blue Metal) per ton
        
        Return the data ONLY as a valid JSON array of objects. 
        Each object must have:
        - "name": String
        - "price": String (current price with unit)
        - "trend": String (e.g., "+2.1%")
        - "isUp": Boolean (true if price went up compared to last month)
        - "history": Array of 6 objects, each with "date" (ISO format, e.g., "2024-05-01") and "price" (Numeric value only)
        
        Do not include any markdown formatting. Just the raw JSON array.
      ''';

      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      
      final String? text = response.text;
      if (text == null) return _getMockPrices();

      // Clean the response in case Gemini includes markdown blocks
      final cleanedText = text.replaceAll('```json', '').replaceAll('```', '').trim();
      
      final List<dynamic> decoded = jsonDecode(cleanedText);
      return decoded.map((item) => MaterialPrice.fromJson(item)).toList();
    } catch (e) {
      print('Error fetching AI prices: $e');
      return _getMockPrices();
    }
  }

  List<MaterialPrice> _getMockPrices() {
    // These varied trends ensure the UI looks dynamic even without the API key
    return [
      MaterialPrice(
        name: 'Steel (TMT)',
        price: '₹68,500/t',
        trend: '+2.4%',
        isUp: true,
        icon: Icons.architecture,
      ),
      MaterialPrice(
        name: 'Cement',
        price: '₹385/bag',
        trend: '-1.2%',
        isUp: false,
        icon: Icons.layers,
      ),
      MaterialPrice(
        name: 'Sand',
        price: '₹1,250/t',
        trend: '+5.1%',
        isUp: true,
        icon: Icons.grain,
      ),
      MaterialPrice(
        name: 'Bricks',
        price: '₹8,200/1k',
        trend: '-0.8%',
        isUp: false,
        icon: Icons.grid_view,
      ),
      MaterialPrice(
        name: 'Wood (Teak)',
        price: '₹3,400/cft',
        trend: '+0.5%',
        isUp: true,
        icon: Icons.forest,
      ),
      MaterialPrice(
        name: 'Aggregate',
        price: '₹1,180/t',
        trend: '0%',
        isUp: null,
        icon: Icons.foundation,
      ),
    ];
  }
}
