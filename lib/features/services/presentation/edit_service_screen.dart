import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:propertify/features/create_post/presentation/widgets/address_input.dart';
import 'package:propertify/features/services/models/create_service_data_model.dart';
import 'package:propertify/features/services/models/services_response_model.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:propertify/utils/common_widgets/common_textfield.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/utils/image_picker_util.dart';

class EditServiceScreen extends StatefulWidget {
  static const String routeName = '/edit-service';
  final ServicesResponseModel service;

  const EditServiceScreen({super.key, required this.service});

  @override
  State<EditServiceScreen> createState() => _EditServiceScreenState();
}

class _EditServiceScreenState extends State<EditServiceScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _addressController;
  late final TextEditingController _cityController;
  late final TextEditingController _stateController;
  late final TextEditingController _pinCodeController;

  late final TextEditingController _facebookController;
  late final TextEditingController _instagramController;
  late final TextEditingController _twitterController;

  double? _latitude;
  double? _longitude;

  List<String> _selectedCategories = [];

  List<String> _existingImages = [];
  List<File> _newImages = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.service.agentName ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.service.description ?? '',
    );
    _addressController = TextEditingController(
      text: widget.service.address ?? '',
    );
    _cityController = TextEditingController(text: widget.service.city ?? '');
    _stateController = TextEditingController(text: widget.service.state ?? '');
    _pinCodeController = TextEditingController(
      text: widget.service.pincode ?? '',
    );

    _facebookController = TextEditingController(
      text: widget.service.socialFacebook ?? '',
    );
    _instagramController = TextEditingController(
      text: widget.service.socialInstagram ?? '',
    );
    _twitterController = TextEditingController(
      text: widget.service.socialLinkedin ?? '',
    );

    _latitude = double.tryParse(widget.service.latitude ?? '');
    _longitude = double.tryParse(widget.service.longitude ?? '');

    if (widget.service.category != null) {
      _selectedCategories = List.from(widget.service.category!);
    }

    if (widget.service.imageUrls != null) {
      _existingImages = List.from(widget.service.imageUrls!);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _pinCodeController.dispose();
    _facebookController.dispose();
    _instagramController.dispose();
    _twitterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServicesBloc, ServicesState>(
      listenWhen: (previous, current) =>
          previous.isLoading != current.isLoading ||
          previous.notifyStatus != current.notifyStatus,
      listener: (context, state) {
        if (state.notifyStatus?.message == 'Service updated successfully') {
          context.pop();
        }
      },
      child: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          final isLoading = state.isLoading;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFF5F4FF),
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: isLoading ? null : () => Navigator.pop(context),
              ),
              title: const Text(
                'Edit Service',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                Form(
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

                        const Text(
                          'Category',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),

                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: _categories.map((category) {
                            final isSelected = _selectedCategories.contains(
                              category,
                            );
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
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),

                        AddressInput(
                          controller: _addressController,
                          onLocationSelected: (locationData) {
                            final address = locationData['address'] as String;
                            final city = locationData['city'] as String;
                            final village = locationData['village'] as String;
                            final state = locationData['state'] as String;
                            final latitude = double.parse(
                              locationData['lat'] as String,
                            );
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
                          isRequired: true,
                          readOnly: true,
                          validator: (v) => (v == null || v.isEmpty)
                              ? 'Please choose address'
                              : null,
                        ),
                        const SizedBox(height: 20),

                        CommonTextFormField(
                          controller: _stateController,
                          label: 'State',
                          isRequired: true,
                          readOnly: true,
                          validator: (v) => (v == null || v.isEmpty)
                              ? 'Please choose address'
                              : null,
                        ),
                        const SizedBox(height: 20),

                        CommonTextFormField(
                          controller: _pinCodeController,
                          label: 'Pin Code',
                          hintText: 'Enter pin code',
                          isRequired: true,
                          maxLength: 6,
                          keyboardType: TextInputType.number,
                          textInputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (v) => (v == null || v.isEmpty)
                              ? 'Please enter pin code'
                              : null,
                        ),
                        const SizedBox(height: 32),

                        const Text(
                          'Social Media',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),

                        CommonTextFormField(
                          controller: _facebookController,
                          label: 'Facebook',
                          hintText: 'Facebook URL',
                        ),
                        const SizedBox(height: 16),
                        CommonTextFormField(
                          controller: _instagramController,
                          label: 'Instagram',
                          hintText: 'Instagram URL',
                        ),
                        const SizedBox(height: 16),
                        CommonTextFormField(
                          controller: _twitterController,
                          label: 'LinkedIn',
                          hintText: 'LinkedIn URL',
                        ),
                        const SizedBox(height: 32),

                        const Text(
                          'Media Gallery',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildImagesSection(),
                        const SizedBox(height: 32),

                        SizedBox(
                          width: double.infinity,
                          child: CommonCustomButton(
                            isEnable: !isLoading,
                            onTap: () {
                              if (_formKey.currentState!.validate() &&
                                  _selectedCategories.isNotEmpty) {
                                final updateServiceDataModel =
                                    CreateServiceDataModel(
                                      agentShopName: _titleController.text,
                                      description: _descriptionController.text,
                                      categories: _selectedCategories,
                                      address: _addressController.text,
                                      city: _cityController.text,
                                      state: _stateController.text,
                                      pincode: _pinCodeController.text,
                                      latitude: _latitude ?? 0.0,
                                      longitude: _longitude ?? 0.0,
                                      phoneNumber:
                                          widget.service.phoneNumber ??
                                          '9700232668',
                                      email:
                                          widget.service.email ??
                                          'xyz@mail.cim',
                                      imageFiles: _newImages,
                                      facebook: _facebookController.text,
                                      insta: _instagramController.text,
                                      twitter: _twitterController.text,
                                    );

                                context.read<ServicesBloc>().add(
                                  ServicesEvent.updateServiceEvent(
                                    serviceId: widget.service.id!,
                                    updateServiceDataModel:
                                        updateServiceDataModel,
                                    existingImageUrls: _existingImages,
                                  ),
                                );
                              } else if (_selectedCategories.isEmpty) {
                                CustomToast.showErrorToast(
                                  msg: 'Please select at least one category',
                                );
                              }
                            },
                            buttonLabel: 'Update Service',
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
                if (isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildImagesSection() {
    return Column(
      children: [
        if (_existingImages.isEmpty && _newImages.isEmpty)
          GestureDetector(
            onTap: _pickImages,
            child: Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_a_photo,
                    size: 40,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add Images',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          Column(
            children: [
              GestureDetector(
                onTap: _pickImages,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        size: 24,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Add more images',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _existingImages.length + _newImages.length,
                itemBuilder: (context, index) {
                  if (index < _existingImages.length) {
                    return _buildExistingImageItem(
                      _existingImages[index],
                      index,
                    );
                  } else {
                    final newIndex = index - _existingImages.length;
                    return _buildNewImageItem(_newImages[newIndex], newIndex);
                  }
                },
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildExistingImageItem(String imageUrl, int index) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _existingImages.removeAt(index);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNewImageItem(File file, int index) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: FileImage(file), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _newImages.removeAt(index);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImages() async {
    try {
      final images = await ImagePickerUtil.pickMultipleImages(
        maxImages: 10,
        imageQuality: 80,
      );
      if (images.isNotEmpty && mounted) {
        setState(() {
          _newImages.addAll(images);
        });
      }
    } catch (e) {
      if (mounted) CustomToast.showErrorToast(msg: 'Error picking images: $e');
    }
  }
}
