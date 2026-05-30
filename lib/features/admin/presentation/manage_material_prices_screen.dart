import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/features/services/models/material_price_model.dart';
import 'package:propertify/features/services/repo/price_repo.dart';

class ManageMaterialPricesScreen extends StatefulWidget {
  static const String routeName = '/manage-material-prices';

  const ManageMaterialPricesScreen({super.key});

  @override
  State<ManageMaterialPricesScreen> createState() => _ManageMaterialPricesScreenState();
}

class _ManageMaterialPricesScreenState extends State<ManageMaterialPricesScreen> {
  final PriceRepo _priceRepo = PriceRepo();
  bool _isLoading = true;
  List<MaterialPrice> _materials = [];
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    _loadCurrentPrices();
  }

  Future<void> _loadCurrentPrices() async {
    setState(() => _isLoading = true);
    final prices = await _priceRepo.getLatestMaterialPrices();
    setState(() {
      _materials = prices;
      for (var material in _materials) {
        // Fix: Split by '/' to ignore numbers in units like '/1k' when loading into the text box
        String cleanPrice = material.price.split('/')[0];
        _controllers[material.name] = TextEditingController(
          text: cleanPrice.replaceAll(RegExp(r'[^0-9.]'), ''),
        );
      }
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _savePrices() async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // Prepare data
      final List<Map<String, dynamic>> updatedData = _materials.map((m) {
        final newPriceValue = _controllers[m.name]?.text ?? '0';
        String unit = '';
        if (m.name.contains('Cement')) unit = '/bag';
        else if (m.name.contains('Steel') || m.name.contains('Sand') || m.name.contains('Aggregate')) unit = '/t';
        else if (m.name.contains('Bricks')) unit = '/1k';
        else if (m.name.contains('Wood')) unit = '/cft';

        return {
          'name': m.name,
          'price': '₹$newPriceValue$unit',
        };
      }).toList();

      // Save to local storage using PriceRepo
      await _priceRepo.saveManualPrices(updatedData);

      if (!mounted) return;
      
      // Force refresh the Bloc so the user screen updates immediately
      context.read<ServicesBloc>().add(const ServicesEvent.getMaterialPricesEvent(force: true));

      Navigator.pop(context); // Close loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Prices updated successfully and trends recalculated!')),
      );
      
      // Reload to see the changes (like calculated trends)
      _loadCurrentPrices();
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update prices: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Weekly Material Rates',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: _savePrices,
            child: const Text('SAVE', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: _materials.length,
              itemBuilder: (context, index) {
                final material = _materials[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 12.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                          child: Icon(material.icon, color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                material.name,
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14.sp),
                              ),
                              Text(
                                _getUnitLabel(material.name),
                                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100.w,
                          child: TextField(
                            controller: _controllers[material.name],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixText: '₹ ',
                              isDense: true,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontWeight: FontWeight.bold),
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

  String _getUnitLabel(String name) {
    if (name.contains('Cement')) return 'Per Bag (50kg)';
    if (name.contains('Steel')) return 'Per Ton';
    if (name.contains('Sand')) return 'Per Ton';
    if (name.contains('Bricks')) return 'Per 1000 Units';
    if (name.contains('Wood')) return 'Per Cubic Foot';
    if (name.contains('Aggregate')) return 'Per Ton';
    return 'Unit';
  }
}
