import 'package:flutter/material.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/requests/bloc/requests_bloc.dart';

import '../../../utils/common_widgets/common_textfield.dart';
import '../../../utils/common_widgets/common_custom_button.dart';
import '../../create_post/presentation/widgets/address_input.dart';
import 'widgets/request_category_selector.dart';

class CreateRequestDetails extends StatefulWidget {
  static const String routeName = '/create-request-details';

  final String? categoryType;

  const CreateRequestDetails({super.key, this.categoryType});

  @override
  State<CreateRequestDetails> createState() => _CreateRequestDetailsState();
}

class _CreateRequestDetailsState extends State<CreateRequestDetails> {
  // Controllers for form fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _state = '';
  String _city = '';

  // Selected values
  String? _selectedRequestCategory;
  // bool _acceptPolicies = false;

  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Request categories
  final List<Map<String, dynamic>> _requestCategories = [
    {'name': 'Buy', 'icon': Icons.home_outlined},
    {'name': 'Rent', 'icon': Icons.apartment_outlined},
  ];

  final List<Map<String, dynamic>> _loanAndInteriorCategories = [
    {'name': 'Loan', 'icon': Icons.home_outlined},
    {'name': 'Interior Design', 'icon': Icons.apartment_outlined},
  ];

  @override
  initState() {
    super.initState();
    if (widget.categoryType != null) {
      _selectedRequestCategory = widget.categoryType;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _budgetController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F4FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Create a Request',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Field
              CommonTextFormField(
                controller: _titleController,
                label: 'Title',
                hintText: 'Enter request title',
                isRequired: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Request Category Section
              RequestCategorySelector(
                categories: widget.categoryType != null
                    ? _loanAndInteriorCategories
                    : _requestCategories,

                selectedPropertyType: _selectedRequestCategory,
                onPropertyTypeChanged: (propertyType) {
                  setState(() {
                    _selectedRequestCategory = propertyType;
                  });
                },
              ),
              const SizedBox(height: 24),

              // Address Input
              AddressInput(
                controller: _addressController,
                onLocationSelected: (locationData) {
                  // Handle location selection if needed
                  final address = locationData['address'] as String;
                  final state = locationData['state'] as String;
                  final city = locationData['city'] as String;
                  final latitude = double.parse(locationData['lat'] as String);
                  final longitude = double.parse(
                    locationData['long'] as String,
                  );
                  setState(() {
                    _addressController.text = address;
                    _state = state;
                    _city = city;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Description Field
              CommonTextFormField(
                controller: _descriptionController,
                label: 'Description',
                hintText: 'Enter request description',
                keyboardType: TextInputType.multiline,
                maxlines: 4,
                isRequired: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Budget Price Field
              CommonTextFormField(
                controller: _budgetController,
                label: 'Budget Price',
                hintText: 'Enter your budget price',
                keyboardType: TextInputType.number,
                isRequired: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter budget price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: CommonCustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate() &&
                        _selectedRequestCategory != null &&
                        _addressController.text.isNotEmpty &&
                        _descriptionController.text.isNotEmpty &&
                        _budgetController.text.isNotEmpty &&
                        _titleController.text.isNotEmpty) {
                      // Handle form submission
                      _submitRequest();
                    } else {
                      // Show validation errors
                      _showValidationError();
                    }
                  },
                  buttonLabel: 'Next',
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    String? label,
    String? value,
    required List<String> items,
    required String hintText,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
        ],
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: Text(
                hintText,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
              ),
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              items: items.map((String item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  void _submitRequest() async {
    // Validate the form
    if (_formKey.currentState!.validate() &&
        _selectedRequestCategory != null &&
        _addressController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _budgetController.text.isNotEmpty &&
        _titleController.text.isNotEmpty) {
      // Handle form submission
      context.read<RequestsBloc>().add(
        RequestsEvent.createRequest(
          title: _titleController.text,
          category: _selectedRequestCategory!,
          state: _state,
          city: _city,
          address: _addressController.text,
          budget: int.parse(_budgetController.text),
          description: _descriptionController.text,
          termsAgreed: true,
          latitude: context.read<HomeBloc>().state.currentLat,
          longitude: context.read<HomeBloc>().state.currentLng,
        ),
      );
    }

    // Navigate back or to next screen
    Navigator.pop(context);
  }

  void _showValidationError() {
    String errorMessage = '';

    if (_titleController.text.isEmpty) {
      errorMessage = 'Please enter a title';
    } else if (_selectedRequestCategory == null) {
      errorMessage = 'Please select a request category';
    } else if (_addressController.text.isEmpty) {
      errorMessage = 'Please enter an address';
    } else if (_descriptionController.text.isEmpty) {
      errorMessage = 'Please enter a description';
    } else if (_budgetController.text.isEmpty) {
      errorMessage = 'Please enter a budget price';
    }

    if (errorMessage.isNotEmpty) {
      CustomToast.showErrorToast(msg: errorMessage);
    }
  }
}
