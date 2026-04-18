import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/features/company/bloc/company_bloc.dart';
import 'package:propertify/features/create_post/presentation/widgets/address_input.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:propertify/utils/image_picker_util.dart';
import 'package:propertify/utils/common_widgets/common_textfield.dart';
import 'package:propertify/utils/common_widgets/common_dropdown.dart';
import 'package:propertify/utils/custom_toast.dart';

import 'package:propertify/features/company/presentation/widgets/gst_success_view.dart';

class CreateCompanyScreen extends StatefulWidget {
  static const String routeName = '/create-company';

  const CreateCompanyScreen({super.key});

  @override
  State<CreateCompanyScreen> createState() => _CreateCompanyScreenState();
}

class _CreateCompanyScreenState extends State<CreateCompanyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showSuccess = false;

  // Controllers for form fields
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _aboutCompanyController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _twitterController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  // Screen-level state variables
  String? _selectedCategory;
  String? _village;
  String _city = '';
  String _state = '';
  double? _latitude;
  double? _longitude;

  final List<String> _categories = [
    'Apartment',
    'Villas',
    'House',
    'Commercial',
    'Land',
    'Industrial',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _aboutCompanyController.dispose();
    _websiteController.dispose();
    _facebookController.dispose();
    _instagramController.dispose();
    _twitterController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  void _onCreatePressed() {
    if (_formKey.currentState!.validate()) {
      // Update BLoC state with all form data
      final bloc = context.read<CompanyBloc>();

      // Update company name
      bloc.add(
        CompanyEvent.companyNameChanged(
          companyName: _companyNameController.text,
        ),
      );

      // Update category
      if (_selectedCategory != null) {
        bloc.add(CompanyEvent.categoryChanged(category: _selectedCategory!));
      }

      // Update about company
      bloc.add(
        CompanyEvent.aboutCompanyChanged(
          aboutCompany: _aboutCompanyController.text,
        ),
      );

      // Update address if available
      if (_addressController.text.isNotEmpty &&
          _latitude != null &&
          _longitude != null) {
        bloc.add(
          CompanyEvent.addressChanged(
            address: _addressController.text,
            city: _cityController.text,
            state: _stateController.text,
            latitude: _latitude!,
            longitude: _longitude!,
          ),
        );
      }

      // Update social media URLs
      if (_websiteController.text.isNotEmpty) {
        bloc.add(
          CompanyEvent.socialMediaUrlChanged(
            platform: 'Website',
            url: _websiteController.text,
          ),
        );
      }
      if (_facebookController.text.isNotEmpty) {
        bloc.add(
          CompanyEvent.socialMediaUrlChanged(
            platform: 'Facebook',
            url: _facebookController.text,
          ),
        );
      }
      if (_instagramController.text.isNotEmpty) {
        bloc.add(
          CompanyEvent.socialMediaUrlChanged(
            platform: 'Instagram',
            url: _instagramController.text,
          ),
        );
      }
      if (_twitterController.text.isNotEmpty) {
        bloc.add(
          CompanyEvent.socialMediaUrlChanged(
            platform: 'Twitter',
            url: _twitterController.text,
          ),
        );
      }

      // Dispatch Create Company event
      bloc.add(const CompanyEvent.createCompany());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Create company',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CompanyBloc, CompanyState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            CustomToast.showErrorToast(msg: state.errorMessage!);
          }
          if (state.createCompanyResponse != null) {
            setState(() {
              _showSuccess = true;
            });
          }
        },
        builder: (context, state) {
          if (_showSuccess) {
            return const GstSuccessView();
          }
          return SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Upload Widget
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          final File? image =
                              await ImagePickerUtil.pickSingleImage();
                          if (image != null && context.mounted) {
                            context.read<CompanyBloc>().add(
                              CompanyEvent.imageChanged(
                                image: XFile(image.path),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF6C5CE7).withOpacity(0.3),
                            ),
                          ),
                          child: ClipOval(
                            child: state.selectedImage != null
                                ? Image.file(
                                    File(state.selectedImage!.path),
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  )
                                : const Center(
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Color(0xFF6C5CE7),
                                      size: 32,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Company Name Section
                    CommonTextFormField(
                      controller: _companyNameController,
                      label: 'Company Name',
                      hintText: 'Enter company name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Company name is required';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 24),

                    // Category Section
                    CommonDropdownFormField<String>(
                      label: 'Category',
                      hintText: 'Select category',
                      value: _selectedCategory,
                      items: _categories.map((category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Category is required';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 24),

                    // About Company Section
                    CommonTextFormField(
                      controller: _aboutCompanyController,
                      label: 'About company (optional)',
                      hintText: 'Enter company description',
                      maxlines: 5,
                    ),

                    const SizedBox(height: 24),

                    // Address Section
                    AddressInput(
                      controller: _addressController,
                      onLocationSelected: (locationData) {
                        setState(() {
                          _addressController.text =
                              locationData['address'] as String;
                          _city = locationData['city'] as String? ?? '';
                          _state = locationData['state'] as String? ?? '';
                          _village = locationData['village'] as String? ?? '';
                          _latitude = double.parse(
                            locationData['lat'] as String,
                          );
                          _longitude = double.parse(
                            locationData['long'] as String,
                          );

                          // Update city and state controllers
                          _cityController.text = '$_village, $_city';
                          _stateController.text = _state;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    // Village/City and State Row
                    Row(
                      children: [
                        // Village/City Field (disabled)
                        Expanded(
                          child: CommonTextFormField(
                            controller: _cityController,
                            label: 'Village, City',

                            readOnly: true,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // State Field (disabled)
                        Expanded(
                          child: CommonTextFormField(
                            controller: _stateController,
                            label: 'State',

                            readOnly: true,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Social Media Section Header
                    const Text(
                      'Social Media (optional)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Website URL
                    CommonTextFormField(
                      controller: _websiteController,
                      label: 'Website',
                      hintText: 'Enter website URL',
                      keyboardType: TextInputType.url,
                    ),

                    const SizedBox(height: 16),

                    // Facebook URL
                    CommonTextFormField(
                      controller: _facebookController,
                      label: 'Facebook',
                      hintText: 'Enter Facebook URL',
                      keyboardType: TextInputType.url,
                    ),

                    const SizedBox(height: 16),

                    // Instagram URL
                    CommonTextFormField(
                      controller: _instagramController,
                      label: 'Instagram',
                      hintText: 'Enter Instagram URL',
                      keyboardType: TextInputType.url,
                    ),

                    const SizedBox(height: 30),

                    // Twitter URL
                    CommonTextFormField(
                      controller: _twitterController,
                      label: 'Twitter',
                      hintText: 'Enter Twitter URL',
                      keyboardType: TextInputType.url,
                    ),

                    const SizedBox(height: 40),

                    // Next Button
                    SizedBox(
                      width: double.infinity,
                      child: CommonCustomButton(
                        onTap: _onCreatePressed,
                        buttonLabel: 'Create',
                        isEnable: !state.isLoading,
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
