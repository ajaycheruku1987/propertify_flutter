import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/create_post/presentation/widgets/address_input.dart';
import 'package:propertify/features/services/models/create_service_data_model.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:propertify/utils/common_widgets/common_textfield.dart';
import 'package:propertify/features/services/presentation/create_service_media.dart';
import 'package:propertify/utils/custom_toast.dart';

class CreateServiceDetails extends StatefulWidget {
  static const String routeName = '/create-service-details';

  const CreateServiceDetails({super.key});

  @override
  State<CreateServiceDetails> createState() => _CreateServiceDetailsState();
}

class _CreateServiceDetailsState extends State<CreateServiceDetails> {
  // Controllers for all form fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _experienceYearsController =
      TextEditingController();
  final TextEditingController _providerController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();

  double? _latitude;
  double? _longitude;

  // Selected categories and service type
  final List<String> _selectedCategories = [];
  String? _selectedServiceType;

  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Categories list
  final List<String> _categories = [
    'Real estate',
    'Plots',
    'Building Material Supply',
    'Advocate',
    'Construction Contractor',
    'Property valuation',
    'Leasing',
    'Villas',
  ];

  // Service types
  final List<String> _serviceTypes = ['Individual', 'Business', 'Professional'];

  @override
  void dispose() {
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
          'Create Service Agent',
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Agent Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),

              // Service Title
              CommonTextFormField(
                controller: _titleController,
                label: 'Agent / Shop Name',
                hintText: 'Enter service title',
                isRequired: true,
                maxLength: 30,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter service title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Description
              CommonTextFormField(
                controller: _descriptionController,
                label: 'Description',
                hintText: 'Enter service description',
                maxlines: 4,
                isRequired: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Category Section
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              // Category Selection
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _categories.map((category) {
                  final isSelected = _selectedCategories.contains(category);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedCategories.remove(category);
                        } else {
                          _selectedCategories.add(category);
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Address Input
              AddressInput(
                controller: _addressController,
                onLocationSelected: (locationData) {
                  final address = locationData['address'] as String;
                  final city = locationData['city'] as String;
                  final village = locationData['village'] as String;
                  final state = locationData['state'] as String;
                  final latitude = double.parse(locationData['lat'] as String);
                  final longitude = double.parse(
                    locationData['long'] as String,
                  );
                  _addressController.text = address;
                  _cityController.text = '$village, $city';
                  _stateController.text = state;
                  _latitude = latitude;
                  _longitude = longitude;
                },
              ),

              const SizedBox(height: 20),
              CommonTextFormField(
                controller: _cityController,
                label: 'City',
                // hintText: 'Enter city',
                isRequired: true,
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please choose address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CommonTextFormField(
                controller: _stateController,
                label: 'State',
                // hintText: 'Enter state',
                readOnly: true,
                isRequired: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please choose address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CommonTextFormField(
                controller: _pinCodeController,
                label: 'Pin Code',
                hintText: 'Enter pin code',
                isRequired: true,
                maxLength: 6,
                keyboardType: TextInputType.number,
                textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter pin code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Next Button
              SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: CommonCustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate() &&
                          _selectedCategories.isNotEmpty) {
                        // Navigate to next page (media page)
                        // This will be handled by the parent flow widget
                        final createServiceDataModel = CreateServiceDataModel(
                          agentShopName: _titleController.text,
                          description: _descriptionController.text,
                          categories: _selectedCategories,
                          address: _addressController.text,
                          city: _cityController.text,
                          state: _stateController.text,
                          pincode: _pinCodeController.text,
                          latitude: _latitude ?? 0.0,
                          longitude: _longitude ?? 0.0,
                        );
                        // Persist base details in bloc before moving to media
                        context.read<ServicesBloc>().add(
                          ServicesEvent.updateAgentDetails(
                            createServiceDataModel: createServiceDataModel,
                          ),
                        );
                        context.push(CreateServiceMedia.routeName);
                      } else if (_selectedCategories.isEmpty) {
                        CustomToast.showErrorToast(
                          msg: 'Please select at least one category',
                        );
                      }
                    },
                    buttonLabel: 'Next',
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
