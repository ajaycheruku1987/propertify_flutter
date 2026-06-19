import 'package:flutter/material.dart';
import 'package:propertify/features/create_post/presentation/widgets/address_input.dart';
import 'package:propertify/core/constants/app_categories.dart';
import '../../../../core/app_theme.dart';
import '../../../../utils/common_widgets/common_textfield.dart';
import '../../../../utils/common_widgets/common_custom_button.dart';

class ServicesFilter extends StatefulWidget {
  final Function(Map<String, dynamic>)? onApplyFilter;
  final Function()? onResetFilter;
  final Map<String, dynamic>? activeFilter;
  final String? currentAddress;
  final String? currentCity;

  const ServicesFilter({
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
      builder: (context) => ServicesFilter(
        onApplyFilter: onApplyFilter,
        onResetFilter: onResetFilter,
        activeFilter: activeFilter,
        currentAddress: currentAddress,
        currentCity: currentCity,
      ),
    );
  }

  @override
  State<ServicesFilter> createState() => _ServicesFilterState();
}

class _ServicesFilterState extends State<ServicesFilter> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String _selectedAddress = '';
  String _selectedServiceType = 'All';
  List<String> _selectedCategories = [];
  double _minRating = 1.0;

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
      _searchController.text = widget.activeFilter!['search'] ?? '';
      _selectedServiceType = widget.activeFilter!['serviceType'] ?? 'All';
      _selectedCategories = List<String>.from(widget.activeFilter!['categories'] ?? []);
      if (_selectedCategories.contains('All')) {
        _selectedCategories.clear();
      }
      final minRating = widget.activeFilter!['minRating'];
      if (minRating != null) {
        _minRating = (minRating as num).toDouble();
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
      _selectedServiceType = 'All';
    }
  }

  final List<String> _serviceTypes = const ['All'];

  final List<String> _categories = AppCategories.serviceCategoriesFilter;

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
                    'Services Filter',
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
                          _selectedAddress = address;
                          _addressController.text = address;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // Search
                    // _buildSearchSection(),
                    const SizedBox(height: 20),



                    // Categories
                    _buildCategoriesSection(),
                    const SizedBox(height: 20),

                    // Rating
                    _buildRatingSection(),
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

  Widget _buildAddressInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    hintText: 'Enter location or address',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedAddress = value;
                    });
                  },
                ),
              ),
              Icon(
                Icons.location_on_outlined,
                color: Colors.grey.shade600,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Search Services',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search for services...',
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            prefixIcon: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.blueColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.search, color: AppTheme.blueColor, size: 16),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Service Type',
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
          children: _serviceTypes.map((type) {
            final isSelected = _selectedServiceType == type;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedServiceType = type;
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

  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
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
          children: _categories.map((category) {
            final isSelected =
                _selectedCategories.contains(category) ||
                (category == 'All' && _selectedCategories.isEmpty);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (category == 'All') {
                    _selectedCategories.clear();
                  } else {
                    if (_selectedCategories.contains(category)) {
                      _selectedCategories.remove(category);
                    } else {
                      _selectedCategories.add(category);
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
                  category,
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

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Minimum Rating',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            Row(
              children: List.generate(5, (i) {
                final starValue = i + 1;
                return Icon(
                  starValue <= _minRating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 20,
                );
              }),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppTheme.blueColor,
            inactiveTrackColor: Colors.grey.shade300,
            thumbColor: AppTheme.blueColor,
            overlayColor: AppTheme.blueColor.withOpacity(0.2),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          ),
          child: Slider(
            value: _minRating,
            min: 1.0,
            max: 5.0,
            divisions: 4,
            label: '${_minRating.round()} ★',
            onChanged: (value) {
              setState(() {
                _minRating = value;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1 ★',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              '5 ★',
              style: TextStyle(
                fontSize: 13,
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
                  _selectedAddress = widget.currentAddress ?? '';
                  _addressController.text = _selectedAddress;
                  _selectedServiceType = 'All';
                  _selectedCategories.clear();
                  _minRating = 1.0;
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
                  'address': _selectedAddress,
                  'search': _searchController.text,
                  'serviceType': _selectedServiceType,
                  'categories': _selectedCategories.isEmpty
                      ? ['All']
                      : _selectedCategories,
                  'minRating': _minRating,
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
