import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:propertify/features/create_post/presentation/widgets/address_input.dart';
import 'package:propertify/features/home/models/feed_posts_response_model.dart';
import 'package:propertify/features/feed/bloc/feed_bloc.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:propertify/utils/common_widgets/common_textfield.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/utils/image_picker_util.dart';
import 'package:propertify/utils/string_extensions.dart';
import 'package:propertify/l10n/app_localizations.dart';
import 'package:propertify/core/constants/app_categories.dart';

class EditFeedScreen extends StatefulWidget {
  static const String routeName = '/edit-feed';
  final FeedPostsResponseModel property;

  const EditFeedScreen({super.key, required this.property});

  @override
  State<EditFeedScreen> createState() => _EditFeedScreenState();
}

class _EditFeedScreenState extends State<EditFeedScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _addressController;
  late final TextEditingController _cityController;
  late final TextEditingController _priceController;
  double? _latitude;
  double? _longitude;

  String _listingType = 'Sell';
  String _propertyType = 'Villas';

  List<String> _existingImages = [];
  List<File> _newImages = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> _listingTypes = AppCategories.lookingFor;
  final List<Map<String, dynamic>> _propertyTypeOptions = AppCategories.propertyType;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.property.title ?? '');
    _descriptionController = TextEditingController(text: widget.property.description ?? '');
    _addressController = TextEditingController(text: widget.property.address ?? '');
    _cityController = TextEditingController(text: widget.property.city ?? '');
    _priceController = TextEditingController(text: widget.property.price?.toString() ?? '');

    _latitude = widget.property.latitude?.toDouble();
    _longitude = widget.property.longitude?.toDouble();

    _listingType = widget.property.listingType ?? 'Sell';
    _propertyType = widget.property.propertyType ?? 'Villas';

    if (widget.property.imageUrls != null) {
      _existingImages = List.from(widget.property.imageUrls!);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<FeedBloc, FeedState>(
      listenWhen: (previous, current) =>
          previous.isLoading != current.isLoading ||
          previous.notifyStatus != current.notifyStatus,
      listener: (context, state) {
        if (state.notifyStatus?.message == 'Property updated successfully') {
          context.pop();
        } else if (state.notifyStatus != null && !state.isLoading) {
           CustomToast.showErrorToast(msg: state.notifyStatus!.message);
        }
      },
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
            title: Text(
              l10n.edit,
              style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
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
                      CommonTextFormField(
                        controller: _titleController,
                        label: '${l10n.title} *',
                        hintText: l10n.enterPropertyTitle,
                        maxLength: 30,
                        isRequired: true,
                        validator: (value) => (value == null || value.isEmpty) ? l10n.titleRequired : null,
                      ),
                      const SizedBox(height: 24),
                      _buildPropertyTypeSelector(l10n),
                      const SizedBox(height: 24),
                      _buildLookingForSelector(l10n),
                      const SizedBox(height: 24),
                      CommonTextFormField(
                        controller: _priceController,
                        label: '${l10n.price} *',
                        hintText: l10n.price,
                        isRequired: true,
                        keyboardType: TextInputType.number,
                        textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                        validator: (value) => (value == null || value.isEmpty) ? l10n.priceRequired : null,
                      ),
                      const SizedBox(height: 24),
                      AddressInput(
                        controller: _addressController,
                        onLocationSelected: (locationData) {
                          _addressController.text = locationData['address'] as String;
                          _cityController.text = '${locationData['village']}, ${locationData['city']}';
                          _latitude = double.tryParse(locationData['lat'] as String);
                          _longitude = double.tryParse(locationData['long'] as String);
                        },
                      ),
                      const SizedBox(height: 16),
                      CommonTextFormField(
                        controller: _cityController,
                        label: l10n.city,
                        isRequired: true,
                        readOnly: true,
                        validator: (v) => (v == null || v.isEmpty) ? l10n.pleaseChooseAddress : null,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        l10n.description,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                        ),
                        child: TextFormField(
                          controller: _descriptionController,
                          maxLines: 8,
                          decoration: InputDecoration(
                            hintText: l10n.writeDescription,
                            hintStyle: const TextStyle(color: Color(0xFF999999), fontSize: 14),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(l10n.addImages, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 16),
                      _buildImagesSection(l10n),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: CommonCustomButton(
                          isEnable: !isLoading,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<FeedBloc>().add(
                                FeedEvent.updateProperty(
                                  propertyId: widget.property.id!,
                                  availableFrom: DateTime.now().toIso8601String(),
                                  totalFloors: 0,
                                  isFeatured: widget.property.isFeatured ?? false,
                                  propertyType: _propertyType,
                                  bathrooms: 0,
                                  price: int.tryParse(_priceController.text) ?? 0,
                                  city: _cityController.text,
                                  floor: 0,
                                  latitude: _latitude ?? 0.0,
                                  propertyAgeYears: 0,
                                  furnishing: 'Unfurnished',
                                  longitude: _longitude ?? 0.0,
                                  address: _addressController.text,
                                  listingType: _listingType,
                                  amenities: '', // Could be handled by parsing list if required, but API expects string
                                  newImages: _newImages,
                                  bedrooms: 0,
                                  title: _titleController.text,
                                  isPromoted: widget.property.isPromoted ?? false,
                                  existingImageUrls: _existingImages,
                                  description: _descriptionController.text,
                                  isVerified: false,
                                  areaSqft: 0.0,
                                ),
                              );
                            }
                          },
                          buttonLabel: l10n.edit,
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
                  child: const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImagesSection(AppLocalizations l10n) {
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
                  Icon(Icons.add_a_photo, size: 40, color: Theme.of(context).primaryColor),
                  const SizedBox(height: 8),
                  Text(l10n.addImages, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600)),
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
                      Icon(Icons.add_a_photo, size: 24, color: Theme.of(context).primaryColor),
                      const SizedBox(width: 8),
                      Text(l10n.addMoreImages, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
                itemCount: _existingImages.length + _newImages.length,
                itemBuilder: (context, index) {
                  if (index < _existingImages.length) {
                    return _buildExistingImageItem(_existingImages[index], index);
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
            image: DecorationImage(image: CachedNetworkImageProvider(imageUrl), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 4, right: 4,
          child: GestureDetector(
            onTap: () => setState(() => _existingImages.removeAt(index)),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
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
          top: 4, right: 4,
          child: GestureDetector(
            onTap: () => setState(() => _newImages.removeAt(index)),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImages() async {
    try {
      final images = await ImagePickerUtil.pickMultipleImages(maxImages: 10, imageQuality: 80);
      if (images.isNotEmpty && mounted) {
        setState(() => _newImages.addAll(images));
      }
    } catch (e) {
      if (mounted) CustomToast.showErrorToast(msg: 'Error picking images: $e');
    }
  }

  Widget _buildLookingForSelector(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.lookingFor,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _listingTypes.map((option) {
            final isSelected = _listingType == option;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _listingType = option;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).primaryColor.withOpacity(0.1)
                      : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Text(
                  option.translate(context),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade700,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPropertyTypeSelector(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${l10n.propertyType} *',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _propertyTypeOptions.map((type) {
            final isSelected = _propertyType == type['name'];
            return GestureDetector(
              onTap: () {
                setState(() {
                  _propertyType = type['name'];
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).primaryColor.withOpacity(0.1)
                      : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Text(
                  (type['name'] as String).translate(context),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
