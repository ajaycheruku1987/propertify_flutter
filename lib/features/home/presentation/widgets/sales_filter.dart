import 'package:flutter/material.dart';
import 'package:propertify/features/create_post/presentation/widgets/address_input.dart';
import 'package:propertify/core/constants/app_categories.dart';
import '../../../../core/app_theme.dart';
import '../../../../utils/common_widgets/common_custom_button.dart';

class SalesFilter extends StatefulWidget {
  final Function(Map<String, dynamic>)? onApplyFilter;
  final Function()? onResetFilter;
  final Map<String, dynamic>? activeFilter;
  final String? currentAddress;
  final String? currentCity;

  const SalesFilter({
    super.key,
    this.onApplyFilter,
    this.onResetFilter,
    this.activeFilter,
    this.currentAddress,
    this.currentCity,
  });

  static void show(
    BuildContext context, {
    Function(Map<String, dynamic>)? onApplyFilter,
    Function()? onResetFilter,
    Map<String, dynamic>? activeFilter,
    String? currentAddress,
    String? currentCity,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SalesFilter(
        onApplyFilter: onApplyFilter,
        onResetFilter: onResetFilter,
        activeFilter: activeFilter,
        currentAddress: currentAddress,
        currentCity: currentCity,
      ),
    );
  }

  @override
  State<SalesFilter> createState() => _SalesFilterState();
}

class _SalesFilterState extends State<SalesFilter> {
  final TextEditingController _addressController = TextEditingController();
  bool _isLocationCustom = false;
  double? _latitude;
  double? _longitude;
  String _selectedAddress = '';

  List<String> _selectedPropertyTypes = [];

  final List<String> _propertyTypes = AppCategories.propertyTypeFilterNames;

  @override
  void initState() {
    super.initState();
    if (widget.activeFilter != null) {
      _isLocationCustom = widget.activeFilter!['isLocationCustom'] ?? false;
      _latitude = widget.activeFilter!['latitude'] as double?;
      _longitude = widget.activeFilter!['longitude'] as double?;
      _selectedPropertyTypes =
          List<String>.from(widget.activeFilter!['propertyTypes'] ?? []);
      if (_selectedPropertyTypes.contains('All')) {
        _selectedPropertyTypes.clear();
      }
      if (_isLocationCustom) {
        _selectedAddress = widget.activeFilter!['address'] ?? '';
      } else {
        _selectedAddress = widget.currentAddress ?? '';
      }
      _addressController.text = _selectedAddress;
    } else {
      _isLocationCustom = false;
      _selectedAddress = widget.currentAddress ?? '';
      _addressController.text = _selectedAddress;
    }
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.55,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Projects Filter',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // Content - Scrollable
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Address Input
                  AddressInput(
                    controller: _addressController,
                    onLocationSelected: (locationData) {
                      final address = locationData['address'] as String;
                      final latitude = double.parse(
                        locationData['lat'] as String,
                      );
                      final longitude = double.parse(
                        locationData['long'] as String,
                      );

                      setState(() {
                        _isLocationCustom = true;
                        _latitude = latitude;
                        _longitude = longitude;
                        _selectedAddress = address;
                        _addressController.text = address;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Property Type
                  _buildPropertyTypeSection(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          // Bottom buttons
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildPropertyTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Property Type',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _propertyTypes.map((type) {
            final isSelected = _selectedPropertyTypes.contains(type) ||
                (type == 'All' && _selectedPropertyTypes.isEmpty);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (type == 'All') {
                    _selectedPropertyTypes.clear();
                  } else {
                    if (_selectedPropertyTypes.contains(type)) {
                      _selectedPropertyTypes.remove(type);
                    } else {
                      _selectedPropertyTypes.add(type);
                    }
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.blueColor : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.blueColor
                        : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _resetFilters,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Center(
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: CommonCustomButton(
              buttonLabel: 'Apply Filter',
              onTap: _applyFilters,
            ),
          ),
        ],
      ),
    );
  }

  void _resetFilters() {
    setState(() {
      _isLocationCustom = false;
      _latitude = null;
      _longitude = null;
      _selectedAddress = widget.currentAddress ?? '';
      _addressController.text = _selectedAddress;
      _selectedPropertyTypes = [];
    });

    if (widget.onResetFilter != null) {
      widget.onResetFilter!();
    }

    Navigator.pop(context);
  }

  void _applyFilters() {
    final filterData = {
      'address': _selectedAddress,
      'propertyTypes': _selectedPropertyTypes.isEmpty
          ? ['All']
          : _selectedPropertyTypes,
      'isLocationCustom': _isLocationCustom,
      'latitude': _latitude,
      'longitude': _longitude,
    };

    if (widget.onApplyFilter != null) {
      widget.onApplyFilter!(filterData);
    }

    Navigator.pop(context);
  }
}
