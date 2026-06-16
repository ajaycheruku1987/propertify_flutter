import 'package:flutter/material.dart';
import 'package:propertify/core/app_theme.dart';
import 'package:propertify/core/constants/app_categories.dart';
import '../../../create_post/presentation/widgets/address_input.dart';

class RequestsFilter extends StatefulWidget {
  final Function(Map<String, dynamic>)? onApplyFilter;
  final VoidCallback? onResetFilter;
  final Map<String, dynamic>? activeFilter;
  final String? currentAddress;
  final String? currentCity;

  const RequestsFilter({
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
    VoidCallback? onResetFilter,
    Map<String, dynamic>? activeFilter,
    String? currentAddress,
    String? currentCity,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RequestsFilter(
        onApplyFilter: onApplyFilter,
        onResetFilter: onResetFilter,
        activeFilter: activeFilter,
        currentAddress: currentAddress,
        currentCity: currentCity,
      ),
    );
  }

  @override
  State<RequestsFilter> createState() => _RequestsFilterState();
}

class _RequestsFilterState extends State<RequestsFilter> {
  final TextEditingController _addressController = TextEditingController();
  String _selectedCategoryType = 'All';
  String _selectedAddress = '';

  double? _latitude;
  double? _longitude;
  bool _isLocationCustom = false;

  @override
  void initState() {
    super.initState();
    if (widget.activeFilter != null) {
      _isLocationCustom = widget.activeFilter!['isLocationCustom'] ?? false;
      _latitude = widget.activeFilter!['latitude'];
      _longitude = widget.activeFilter!['longitude'];
      _selectedCategoryType = widget.activeFilter!['categoryType'] ?? 'All';
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
      _selectedCategoryType = 'All';
    }
  }

  final List<String> _categoryTypes = AppCategories.requestCategoriesFilter;

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        height: screenHeight * 0.6,
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
                children: [
                  const Text(
                    'Requests Filter',
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

                    // Category Type Section
                    _buildCategoryTypeSection(),
                    const SizedBox(
                      height: 100,
                    ), // Extra space for bottom buttons
                  ],
                ),
              ),
            ),

            // Bottom Buttons
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category Type',
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
          children: _categoryTypes.map((type) {
            final isSelected = _selectedCategoryType == type;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategoryType = type;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.blueColor : Colors.white,
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
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.black87,
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
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isLocationCustom = false;
                  _latitude = null;
                  _longitude = null;
                  _selectedAddress = widget.currentAddress ?? '';
                  _addressController.text = _selectedAddress;
                  _selectedCategoryType = 'All';
                });
                if (widget.onResetFilter != null) {
                  widget.onResetFilter!();
                }
              },
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
            child: GestureDetector(
              onTap: () {
                final filterData = {
                  'address': _selectedAddress.isNotEmpty
                      ? _selectedAddress
                      : _addressController.text,
                  'categoryType': _selectedCategoryType,
                  'isLocationCustom': _isLocationCustom,
                  'latitude': _latitude,
                  'longitude': _longitude,
                };

                if (widget.onApplyFilter != null) {
                  widget.onApplyFilter!(filterData);
                }
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: AppTheme.blueColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Apply Filter',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
