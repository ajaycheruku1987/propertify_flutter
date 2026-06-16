import 'package:flutter/material.dart';
import 'package:propertify/features/create_post/presentation/widgets/address_input.dart';
import 'package:propertify/core/constants/app_categories.dart';
import '../../../../core/app_theme.dart';
import '../../../../utils/common_widgets/common_textfield.dart';
import '../../../../utils/common_widgets/common_custom_button.dart';

class FeedsFilter extends StatefulWidget {
  final Function(Map<String, dynamic>)? onApplyFilter;
  final Function()? onResetFilter;
  final Map<String, dynamic>? activeFilter;
  final String? currentAddress;
  final String? currentCity;

  const FeedsFilter({
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
      builder: (context) => FeedsFilter(
        onApplyFilter: onApplyFilter,
        onResetFilter: onResetFilter,
        activeFilter: activeFilter,
        currentAddress: currentAddress,
        currentCity: currentCity,
      ),
    );
  }

  @override
  State<FeedsFilter> createState() => _FeedsFilterState();
}

class _FeedsFilterState extends State<FeedsFilter> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String _selectedLocation = 'Hyderabad';
  String _selectedLookingFor = '';
  List<String> _selectedPropertyTypes = [];
  RangeValues _priceRange = const RangeValues(100000, 50000000);

  double? _latitude;
  double? _longitude;
  bool _isLocationCustom = false;

  final List<String> _propertyTypes = AppCategories.propertyTypeFilterNames;

  final List<String> _lookingForOptions = AppCategories.lookingForFilter;

  @override
  void initState() {
    super.initState();
    if (widget.activeFilter != null) {
      _isLocationCustom = widget.activeFilter!['isLocationCustom'] ?? false;
      _latitude = widget.activeFilter!['latitude'];
      _longitude = widget.activeFilter!['longitude'];
      _searchController.text = widget.activeFilter!['search'] ?? '';
      _selectedLookingFor = widget.activeFilter!['lookingFor'] ?? '';
      _selectedPropertyTypes = List<String>.from(widget.activeFilter!['propertyTypes'] ?? []);
      if (_selectedPropertyTypes.contains('All')) {
        _selectedPropertyTypes.clear();
      }
      final priceRangeMap = widget.activeFilter!['priceRange'] as Map?;
      if (priceRangeMap != null) {
        _priceRange = RangeValues(
          (priceRangeMap['min'] as num).toDouble(),
          (priceRangeMap['max'] as num).toDouble(),
        );
      }
      if (_isLocationCustom) {
        _selectedLocation = widget.activeFilter!['location'] ?? widget.currentCity ?? 'Hyderabad';
        _addressController.text = widget.activeFilter!['addressText'] ?? _selectedLocation;
      } else {
        _selectedLocation = widget.currentCity ?? 'Hyderabad';
        _addressController.text = widget.currentAddress ?? _selectedLocation;
      }
    } else {
      _isLocationCustom = false;
      _selectedLocation = widget.currentCity ?? 'Hyderabad';
      _addressController.text = widget.currentAddress ?? _selectedLocation;
      _selectedLookingFor = 'All';
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
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
                    'Feeds Filter',
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
                    // Location Dropdown
                    // _buildLocationDropdown(),
                    AddressInput(
                      controller: _addressController,
                      onLocationSelected: (locationData) {
                        final address = locationData['address'] as String;
                        final city = locationData['city'] as String;
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
                          _selectedLocation = city;
                          _addressController.text = address;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // Search
                    // _buildSearchSection(),
                    const SizedBox(height: 20),

                    // Property Type
                    _buildPropertyTypeSection(),
                    const SizedBox(height: 20),

                    // Looking For
                    _buildLookingForSection(),
                    const SizedBox(height: 20),

                    // Price Range
                    _buildPriceRangeSection(),
                    const SizedBox(height: 30),
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
            final isSelected =
                _selectedPropertyTypes.contains(type) ||
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
                    fontSize: 12,
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

  Widget _buildLookingForSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Looking For',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: _lookingForOptions.map((option) {
            final isSelected = _selectedLookingFor == option;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedLookingFor = option;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? AppTheme.blueColor : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? AppTheme.blueColor
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPriceRangeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price Range',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppTheme.blueColor,
            inactiveTrackColor: Colors.grey.shade300,
            thumbColor: AppTheme.blueColor,
            overlayColor: AppTheme.blueColor.withOpacity(0.2),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          ),
          child: RangeSlider(
            values: _priceRange,
            min: 100000,
            max: 50000000,
            divisions: 500,
            labels: RangeLabels(
              '₹${_priceRange.start.round()}',
              '₹${_priceRange.end.round()}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _priceRange = values;
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹${_priceRange.start.round()}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              '₹${_priceRange.end.round()}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
          ],
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
                  _searchController.clear();
                  _selectedLocation = widget.currentCity ?? 'Hyderabad';
                  _addressController.text = widget.currentAddress ?? _selectedLocation;
                  _selectedLookingFor = 'All';
                  _selectedPropertyTypes.clear();
                  _priceRange = const RangeValues(100000, 50000000);
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
            flex: 2,
            child: CommonCustomButton(
              buttonLabel: 'Apply',
              onTap: () {
                final filterData = {
                  'location': _selectedLocation,
                  'search': _searchController.text,
                  'propertyTypes': _selectedPropertyTypes.isEmpty
                      ? ['All']
                      : _selectedPropertyTypes,
                  'lookingFor': _selectedLookingFor,
                  'priceRange': {
                    'min': _priceRange.start.round(),
                    'max': _priceRange.end.round(),
                  },
                  'addressText': _addressController.text,
                  'isLocationCustom': _isLocationCustom,
                  'latitude': _latitude,
                  'longitude': _longitude,
                };
                if (widget.onApplyFilter != null) {
                  widget.onApplyFilter!(filterData);
                }
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
