import 'package:flutter/material.dart';
import 'package:propertify/core/app_theme.dart';

class CostEstimatorScreen extends StatefulWidget {
  static const String routeName = '/cost-estimator';

  const CostEstimatorScreen({super.key});

  @override
  State<CostEstimatorScreen> createState() => _CostEstimatorScreenState();
}

class _CostEstimatorScreenState extends State<CostEstimatorScreen> {
  final TextEditingController _areaController = TextEditingController();
  String _selectedQuality = 'Standard';
  double _estimatedCost = 0;

  void _calculateCost() {
    double area = double.tryParse(_areaController.text) ?? 0;
    double rate = 0;

    switch (_selectedQuality) {
      case 'Standard':
        rate = 1800;
        break;
      case 'Premium':
        rate = 2200;
        break;
      case 'Luxury':
        rate = 3000;
        break;
    }

    setState(() {
      _estimatedCost = area * rate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Construction Cost Estimator'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _areaController,
              decoration: const InputDecoration(
                labelText: 'Total Area (sq. ft.)',
                border: OutlineInputBorder(),
                hintText: 'e.g. 1500',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const Text('Construction Quality', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _selectedQuality,
              isExpanded: true,
              items: ['Standard', 'Premium', 'Luxury'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedQuality = value!;
                });
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _calculateCost,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Calculate Estimate', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 32),
            if (_estimatedCost > 0)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.2)),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Estimated Construction Cost',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₹${_estimatedCost.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '*Approximate cost including material & labor.',
                      style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
