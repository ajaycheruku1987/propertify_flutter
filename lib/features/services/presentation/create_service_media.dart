import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/home/presentation/home_screen.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/features/services/models/create_service_data_model.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:propertify/utils/common_widgets/common_textfield.dart';
import 'package:propertify/utils/common_widgets/post_success_screen.dart';
import 'package:propertify/utils/image_picker_util.dart';
import 'package:propertify/core/content_type.dart';

class CreateServiceMedia extends StatefulWidget {
  static const String routeName = '/create-service-media';
  const CreateServiceMedia({super.key});

  @override
  State<CreateServiceMedia> createState() => _CreateServiceMediaState();
}

class _CreateServiceMediaState extends State<CreateServiceMedia> {
  // Controllers for social media fields
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _twitterController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();

  // List to store selected images
  List<File> _selectedImages = [];

  bool _acceptPolicies = false;

  @override
  void dispose() {
    _facebookController.dispose();
    _instagramController.dispose();
    _twitterController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ServicesBloc, ServicesState>(
      listener: (context, state) {
        final msg = state.notifyStatus?.message ?? '';
        if (msg == 'Service created successfully') {
          // Navigate to success screen using GoRouter
          // Note: We'll need to get the service ID from state when available
          final serviceId =
              ''; // TODO: Get from successful service creation response
          context.go(
            '${PostSuccessScreen.routeName}?title=${Uri.encodeComponent('Service Created Successfully!')}&message=${Uri.encodeComponent('Your Service has been created Successfully\nwould You Like to boost Your Service')}&contentType=${ContentType.SERVICE.value}&contentId=$serviceId&homeRoute=${Uri.encodeComponent('${HomeScreen.routeName}?refresh=true&tab=services')}',
          );
        }
      },
      child: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          final isLoading = state.isLoading;

          return Stack(
            children: [
              Scaffold(
                // backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: const Color(0xFFF5F4FF),
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: isLoading ? null : () => Navigator.pop(context),
                  ),
                  title: const Text(
                    'Create Services Agent',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Social Media Section
                      const Text(
                        'Social Media',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Social Media Icons Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildSocialMediaIcon(
                            icon: Icons.language,
                            label: 'Website',
                            color: Colors.blue,
                          ),
                          _buildSocialMediaIcon(
                            icon: Icons.facebook,
                            label: 'Facebook',
                            color: const Color(0xFF1877F2),
                          ),
                          _buildSocialMediaIcon(
                            icon: Icons.camera_alt,
                            label: 'Instagram',
                            color: const Color(0xFFE4405F),
                          ),
                          _buildSocialMediaIcon(
                            icon: Icons.alternate_email,
                            label: 'Twitter',
                            color: const Color(0xFF1DA1F2),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Facebook URL
                      CommonTextFormField(
                        controller: _facebookController,
                        label: 'Facebook',
                        hintText: 'Enter Facebook profile URL',
                        keyboardType: TextInputType.url,
                      ),
                      const SizedBox(height: 16),

                      // Instagram URL
                      CommonTextFormField(
                        controller: _instagramController,
                        label: 'Instagram',
                        hintText: 'Enter Instagram profile URL',
                        keyboardType: TextInputType.url,
                      ),
                      const SizedBox(height: 16),

                      // Twitter URL
                      CommonTextFormField(
                        controller: _twitterController,
                        label: 'Twitter',
                        hintText: 'Enter Twitter profile URL',
                        keyboardType: TextInputType.url,
                      ),
                      const SizedBox(height: 16),

                      // Website URL
                      CommonTextFormField(
                        controller: _websiteController,
                        label: 'Website',
                        hintText: 'Enter website URL',
                        keyboardType: TextInputType.url,
                      ),
                      const SizedBox(height: 32),

                      // Add Images Section
                      const Text(
                        'Add Images',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Image Upload Section
                      _buildImageUploadSection(),
                      const SizedBox(height: 20),

                      // Policy Acceptance
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _acceptPolicies,
                            onChanged: isLoading
                                ? null
                                : (value) {
                                    setState(() {
                                      _acceptPolicies = value ?? false;
                                    });
                                  },
                            activeColor: Theme.of(context).primaryColor,
                          ),
                          const Expanded(
                            child: Text(
                              'By Creating this post you are accepting our Generated policies',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: CommonCustomButton(
                          isEnable: !isLoading,
                          onTap: () {
                            if (_acceptPolicies) {
                              // Submit images and social links to create service
                              context.read<ServicesBloc>().add(
                                ServicesEvent.updateImagesAndMediaDetails(
                                  createServiceDataModel:
                                      CreateServiceDataModel(
                                        imageFiles: _selectedImages,
                                        facebook: _facebookController.text,
                                        insta: _instagramController.text,
                                        twitter: _twitterController.text,
                                        website: _websiteController.text,
                                      ),
                                ),
                              );
                            } else {
                              CustomToast.showWarningToast(
                                msg: 'Please accept policies before submitting',
                              );
                            }
                          },
                          buttonLabel: 'Submit',
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              // Loading overlay
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
          );
        },
      ),
    );
  }

  Widget _buildSocialMediaIcon({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildImageUploadSection() {
    return Column(
      children: [
        // Upload Area
        if (_selectedImages.isEmpty)
          _buildUploadArea()
        else
          _buildSelectedImages(),
      ],
    );
  }

  Widget _buildUploadArea() {
    return GestureDetector(
      onTap: () => _pickImages(),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Upload Icon
            Image.asset('assets/images/upload_images.png', width: 180),

            Text(
              'Upload images',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 12, color: Color(0xFF666666)),
                children: [
                  TextSpan(text: 'Just tap to Here to '),
                  TextSpan(
                    text: 'Browse',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(text: ' the Gallery to\nUpload image'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedImages() {
    return Column(
      children: [
        // Add more images button
        GestureDetector(
          onTap: () => _pickImages(),
          child: Container(
            width: double.infinity,

            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Upload Icon
                Image.asset('assets/images/upload_images.png', width: 180),
                SizedBox(height: 8),
                Text(
                  'Add more images',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Selected Images Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: _selectedImages.length,
          itemBuilder: (context, index) {
            return _buildImageItem(_selectedImages[index], index);
          },
        ),
      ],
    );
  }

  Widget _buildImageItem(File imageFile, int index) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: FileImage(imageFile),
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
                _selectedImages.removeAt(index);
              });
            },
            child: Container(
              width: 24,
              height: 24,
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
          _selectedImages.addAll(images);
        });
      }
    } catch (e) {
      if (mounted) {
        CustomToast.showErrorToast(msg: 'Error picking images: $e');
      }
    }
  }
}
