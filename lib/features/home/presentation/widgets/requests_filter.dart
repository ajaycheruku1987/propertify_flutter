import 'package:flutter/material.dart';
import 'package:propertify/core/app_theme.dart';
import '../../../create_post/presentation/widgets/address_input.dart';

class RequestsFilter extends StatefulWidget {
  final Function(Map<String, dynamic>)? onApplyFilter;
  final VoidCallback? onResetFilter;

  const RequestsFilter({super.key, this.onApplyFilter, this.onResetFilter});

  static void show(
    BuildContext context, {
    Function(Map<String, dynamic>)? onApplyFilter,
    VoidCallback? onResetFilter,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RequestsFilter(
        onApplyFilter: onApplyFilter,
        onResetFilter: onResetFilter,
      ),
    );
  }

  @override
  State<RequestsFilter> createState() => _RequestsFilterState();
}

class _RequestsFilterState extends State<RequestsFilter> {
  final TextEditingController _addressController = TextEditingController();
  String _selectedCategoryType = 'All';
  RangeValues _priceRange = const RangeValues(10, 800);
  String _selectedAddress = '';

  final List<String> _categoryTypes = [
    'All',
    'Buy',
    'Rent',
    'PG',
    'Commercial',
  ];

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
                        final city = locationData['city'] as String;
                        final latitude = double.parse(
                          locationData['lat'] as String,
                        );
                        final longitude = double.parse(
                          locationData['long'] as String,
                        );

                        setState(() {
                          _selectedAddress = address;
                          _addressController.text =
                              address; // Update the controller to show the address in UI
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // Category Type Section
                    _buildCategoryTypeSection(),
                    const SizedBox(height: 24),

                    // Price Range Section
                    _buildPriceRangeSection(),
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

  Widget _buildPriceRangeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price Range (in Lakhs)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹${_priceRange.start.round()} L',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    '₹${_priceRange.end.round()} L',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              RangeSlider(
                values: _priceRange,
                min: 10,
                max: 800,
                divisions: 79,
                activeColor: AppTheme.blueColor,
                inactiveColor: Colors.grey.shade300,
                onChanged: (RangeValues values) {
                  setState(() {
                    _priceRange = values;
                  });
                },
              ),
            ],
          ),
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
                  _addressController.clear();
                  _selectedAddress = '';
                  _selectedCategoryType = 'All';
                  _priceRange = const RangeValues(10, 800);
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
                  'priceRange': _priceRange,
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
