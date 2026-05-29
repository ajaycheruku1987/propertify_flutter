import 'package:flutter/material.dart';

class CostEstimatorScreen extends StatefulWidget {
  static const String routeName = '/cost-estimator';

  const CostEstimatorScreen({super.key});

  @override
  State<CostEstimatorScreen> createState() => _CostEstimatorScreenState();
}

class _CostEstimatorScreenState extends State<CostEstimatorScreen> {
  final TextEditingController _areaController = TextEditingController();
  String _selectedQuality = 'Standard';
  int _selectedFloors = 1;
  double _estimatedCost = 0;
  List<MaterialEstimate> _detailedEstimates = [];

  void _calculateCost() {
    if (_areaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the build-up area to calculate.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    double baseArea = double.tryParse(_areaController.text) ?? 0;
    if (baseArea <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid build-up area greater than 0.'),
          backgroundColor: Colors.orange,
        ),
      );
      setState(() {
        _estimatedCost = 0;
        _detailedEstimates = [];
      });
      return;
    }

    // Total area calculation based on number of floors
    double totalArea = baseArea * _selectedFloors;

    double rate = 0;
    // Thumb rules per sq ft
    double cementBags = 0.45 * totalArea;
    double steelKg = 4.0 * totalArea;
    double bricks = 23 * totalArea;
    double sandCuFt = 1.8 * totalArea;
    double aggregateCuFt = 1.35 * totalArea;
    double paintLiters = 0.18 * totalArea;
    double flooringSqFt = 1.0 * totalArea;
    double electricalCost;
    double plumbingCost;
    double woodworkCost;

    switch (_selectedQuality) {
      case 'Standard':
        rate = 1800;
        electricalCost = totalArea * 120;
        plumbingCost = totalArea * 100;
        woodworkCost = totalArea * 150;
        break;
      case 'Premium':
        rate = 2200;
        cementBags = 0.5 * totalArea;
        steelKg = 4.5 * totalArea;
        electricalCost = totalArea * 180;
        plumbingCost = totalArea * 150;
        woodworkCost = totalArea * 250;
        break;
      case 'Luxury':
        rate = 3000;
        cementBags = 0.55 * totalArea;
        steelKg = 5.0 * totalArea;
        electricalCost = totalArea * 300;
        plumbingCost = totalArea * 250;
        woodworkCost = totalArea * 450;
        break;
      default:
        rate = 1800;
        electricalCost = totalArea * 120;
        plumbingCost = totalArea * 100;
        woodworkCost = totalArea * 150;
    }

    setState(() {
      _estimatedCost = totalArea * rate;
      _detailedEstimates = [
        MaterialEstimate('Bricks', bricks, 'Pcs', Icons.grid_view),
        MaterialEstimate('Steel', steelKg, 'Kg', Icons.architecture),
        MaterialEstimate('Cement', cementBags, 'Bags', Icons.layers),
        MaterialEstimate('Sand', sandCuFt, 'Cu.ft', Icons.grain),
        MaterialEstimate('Aggregate', aggregateCuFt, 'Cu.ft', Icons.landscape),
        MaterialEstimate('Paint & Colors', paintLiters, 'Liters', Icons.format_paint),
        MaterialEstimate('Flooring Area', flooringSqFt, 'Sq.ft', Icons.grid_on),
        MaterialEstimate('Power Fitting', electricalCost, 'Est. ₹', Icons.electrical_services),
        MaterialEstimate('Plumbing', plumbingCost, 'Est. ₹', Icons.plumbing),
        MaterialEstimate('Woodwork', woodworkCost, 'Est. ₹', Icons.door_front_door),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Construction Cost Estimator'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Project Details',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _areaController,
                      decoration: InputDecoration(
                        labelText: 'Area per floor (sq. ft.)',
                        hintText: 'e.g. 1500',
                        prefixIcon: const Icon(Icons.square_foot),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    const Text('Number of Floors', style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    _buildFloorSelector(),
                    const SizedBox(height: 16),
                    const Text('Construction Quality', style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
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
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _calculateCost,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          'Calculate Estimate',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (_estimatedCost > 0) ...[
              _buildTotalCostCard(),
              const SizedBox(height: 24),
              const Text(
                'Requirement Breakdown',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _buildDetailedGrid(),
              const SizedBox(height: 24),
              _buildDisclaimer(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFloorSelector() {
    return Row(
      children: [1, 2, 3, 4].map((floor) {
        bool isSelected = _selectedFloors == floor;
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedFloors = floor;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? Theme.of(context).primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected ? Theme.of(context).primaryColor : Colors.grey.shade300,
                ),
              ),
              child: Text(
                floor == 1 ? 'G' : 'G+${floor - 1}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTotalCostCard() {
    double baseArea = double.tryParse(_areaController.text) ?? 0;
    double totalArea = baseArea * _selectedFloors;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColor.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Estimated Total Cost',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            '₹${_estimatedCost.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Total Area: ${totalArea.toStringAsFixed(0)} sq. ft. (${_selectedFloors == 1 ? "Ground Floor" : "G+${_selectedFloors - 1} Floors"})',
            style: const TextStyle(fontSize: 12, color: Colors.white60),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5,
      ),
      itemCount: _detailedEstimates.length,
      itemBuilder: (context, index) {
        final item = _detailedEstimates[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(item.icon, size: 20, color: Theme.of(context).primaryColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.name,
                      style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '${item.quantity.toStringAsFixed(0)} ${item.unit}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDisclaimer() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.shade100),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.orange.shade800, size: 20),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Disclaimer: These are approximate estimates based on standard thumb rules. Actual quantities may vary based on design and local conditions.',
              style: TextStyle(fontSize: 11, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

class MaterialEstimate {
  final String name;
  final double quantity;
  final String unit;
  final IconData icon;

  MaterialEstimate(this.name, this.quantity, this.unit, this.icon);
}
