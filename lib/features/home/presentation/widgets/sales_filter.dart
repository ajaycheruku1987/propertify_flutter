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
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _isLocationCustom = false;

  @override
  void initState() {
    super.initState();
    if (widget.activeFilter != null) {
      _isLocationCustom = widget.activeFilter!['isLocationCustom'] ?? false;
      _searchController.text = widget.activeFilter!['search'] ?? '';
      _selectedPropertyTypes = List<String>.from(widget.activeFilter!['propertyTypes'] ?? []);
      _selectedAmenities = List<String>.from(widget.activeFilter!['amenities'] ?? []);
      final priceMap = widget.activeFilter!['priceRange'] as Map?;
      if (priceMap != null) {
        _priceRange = RangeValues(
          (priceMap['min'] as num).toDouble(),
          (priceMap['max'] as num).toDouble(),
        );
      }
      final areaMap = widget.activeFilter!['areaRange'] as Map?;
      if (areaMap != null) {
        _areaRange = RangeValues(
          (areaMap['min'] as num).toDouble(),
          (areaMap['max'] as num).toDouble(),
        );
      }
      _selectedBedrooms = widget.activeFilter!['bedrooms'] ?? 'Any';
      _selectedBathrooms = widget.activeFilter!['bathrooms'] ?? 'Any';
      if (_isLocationCustom) {
        _selectedLocation = widget.activeFilter!['location'] ?? widget.currentCity ?? 'Hyderabad';
        _addressController.text = widget.activeFilter!['address'] ?? _selectedLocation;
      } else {
        _selectedLocation = widget.currentCity ?? 'Hyderabad';
        _addressController.text = widget.currentAddress ?? _selectedLocation;
      }
    } else {
      _isLocationCustom = false;
      _selectedLocation = widget.currentCity ?? 'Hyderabad';
      _addressController.text = widget.currentAddress ?? _selectedLocation;
    }
  }

  String _selectedLocation = 'Hyderabad';
  List<String> _selectedPropertyTypes = [];
  List<String> _selectedAmenities = [];
  RangeValues _priceRange = const RangeValues(10, 1000);
  RangeValues _areaRange = const RangeValues(500, 5000);
  String _selectedBedrooms = 'Any';
  String _selectedBathrooms = 'Any';

  final List<String> _locations = [
    'Hyderabad',
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Chennai',
    'Kolkata',
    'Pune',
    'Ahmedabad',
  ];

  final List<String> _propertyTypes = AppCategories.propertyTypeFilterNames;

  final List<String> _amenities = [
    'Parking',
    'Swimming Pool',
    'Gym',
    'Garden',
    'Security',
    'Power Backup',
    'Elevator',
    'Club House',
  ];

  final List<String> _bedroomOptions = ['Any', '1', '2', '3', '4', '5+'];
  final List<String> _bathroomOptions = ['Any', '1', '2', '3', '4+'];

  @override
  void dispose() {
    _searchController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.7,
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
                  'Sales Filter',
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
                  // Location
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

                  // Price Range
                  _buildPriceRangeSection(),
                  const SizedBox(height: 20),

                  // Area Range
                  _buildAreaRangeSection(),
                  const SizedBox(height: 20),

                  // Bedrooms
                  _buildBedroomsSection(),
                  const SizedBox(height: 20),

                  // Bathrooms
                  _buildBathroomsSection(),
                  const SizedBox(height: 20),

                  // Amenities
                  _buildAmenitiesSection(),
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

  Widget _buildSearchSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Search',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search properties...',
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Container(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppTheme.blueColor),
              ),
            ),
          ),
        ),
      ],
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
            final isSelected = _selectedPropertyTypes.contains(type);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (type == 'All') {
                    _selectedPropertyTypes.clear();
                    _selectedPropertyTypes.add('All');
                  } else {
                    _selectedPropertyTypes.remove('All');
                    if (isSelected) {
                      _selectedPropertyTypes.remove(type);
                    } else {
                      _selectedPropertyTypes.add(type);
                    }
                    if (_selectedPropertyTypes.isEmpty) {
                      _selectedPropertyTypes.add('All');
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
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
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
          'Price Range (Lakhs)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹${_priceRange.start.round()}L',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            Text(
              '₹${_priceRange.end.round()}L',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        RangeSlider(
          values: _priceRange,
          min: 10,
          max: 1000,
          divisions: 99,
          activeColor: AppTheme.blueColor,
          onChanged: (values) {
            setState(() {
              _priceRange = values;
            });
          },
        ),
      ],
    );
  }

  Widget _buildAreaRangeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Area Range (Sq Ft)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_areaRange.start.round()} sq ft',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            Text(
              '${_areaRange.end.round()} sq ft',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        RangeSlider(
          values: _areaRange,
          min: 500,
          max: 5000,
          divisions: 45,
          activeColor: AppTheme.blueColor,
          onChanged: (values) {
            setState(() {
              _areaRange = values;
            });
          },
        ),
      ],
    );
  }

  Widget _buildBedroomsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bedrooms',
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
          children: _bedroomOptions.map((option) {
            final isSelected = _selectedBedrooms == option;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedBedrooms = option;
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
                  option,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBathroomsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bathrooms',
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
          children: _bathroomOptions.map((option) {
            final isSelected = _selectedBathrooms == option;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedBathrooms = option;
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
                  option,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAmenitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Amenities',
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
          children: _amenities.map((amenity) {
            final isSelected = _selectedAmenities.contains(amenity);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedAmenities.remove(amenity);
                  } else {
                    _selectedAmenities.add(amenity);
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
                  amenity,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
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
      _searchController.clear();
      _selectedLocation = widget.currentCity ?? 'Hyderabad';
      _addressController.text = widget.currentAddress ?? _selectedLocation;
      _selectedPropertyTypes = [];
      _selectedAmenities = [];
      _priceRange = const RangeValues(10, 1000);
      _areaRange = const RangeValues(500, 5000);
      _selectedBedrooms = 'Any';
      _selectedBathrooms = 'Any';
    });

    if (widget.onResetFilter != null) {
      widget.onResetFilter!();
    }

    Navigator.pop(context);
  }

  void _applyFilters() {
    final filterData = {
      'search': _searchController.text,
      'location': _selectedLocation,
      'address': _addressController.text,
      'propertyTypes': _selectedPropertyTypes,
      'amenities': _selectedAmenities,
      'priceRange': {'min': _priceRange.start, 'max': _priceRange.end},
      'areaRange': {'min': _areaRange.start, 'max': _areaRange.end},
      'bedrooms': _selectedBedrooms,
      'bathrooms': _selectedBathrooms,
      'isLocationCustom': _isLocationCustom,
    };

    if (widget.onApplyFilter != null) {
      widget.onApplyFilter!(filterData);
    }

    Navigator.pop(context);
  }
}
