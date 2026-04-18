import 'package:flutter/material.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/requests/bloc/requests_bloc.dart';
import 'package:propertify/features/requests/models/request_response_model.dart';

import '../../../utils/common_widgets/common_textfield.dart';
import '../../../utils/common_widgets/common_custom_button.dart';
import '../../create_post/presentation/widgets/address_input.dart';
import 'widgets/request_category_selector.dart';

class EditRequest extends StatefulWidget {
  static const String routeName = '/edit-request';

  final RequestResponseModel request;

  const EditRequest({super.key, required this.request});

  @override
  State<EditRequest> createState() => _EditRequestState();
}

class _EditRequestState extends State<EditRequest> {
  // Controllers for form fields
  late TextEditingController _titleController;
  late TextEditingController _budgetController;
  late TextEditingController _addressController;
  late TextEditingController _descriptionController;
  late String _state;
  late String _city;

  // Selected values
  String? _selectedRequestCategory;

  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Request categories
  final List<Map<String, dynamic>> _requestCategories = [
    {'name': 'Buy', 'icon': Icons.home_outlined},
    {'name': 'Rent', 'icon': Icons.apartment_outlined},
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.request.title);
    _budgetController =
        TextEditingController(text: widget.request.budget?.toInt().toString());
    _addressController = TextEditingController(text: widget.request.address);
    _descriptionController =
        TextEditingController(text: widget.request.description);
    _state = widget.request.state ?? '';
    _city = widget.request.city ?? '';
    _selectedRequestCategory = widget.request.category;
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
          'Edit Request',
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
                categories: _requestCategories,
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

              // Save Button
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
                      _updateRequest();
                    } else {
                      _showValidationError();
                    }
                  },
                  buttonLabel: 'Update Request',
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _updateRequest() {
    context.read<RequestsBloc>().add(
      RequestsEvent.updateRequest(
        requestId: widget.request.id!,
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

    Navigator.pop(context);
    CustomToast.showSuccessToast(msg: 'Updating request...');
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
