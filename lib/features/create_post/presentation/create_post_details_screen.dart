import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc/create_post_bloc.dart';
import '../../../utils/image_picker_util.dart';
import '../../../core/service_locator.dart';
import '../repo/create_post_repository.dart';
import '../../../core/api_request/api_request.dart';
import '../../../core/app_cache_service.dart';
import '../../../utils/custom_toast.dart';

class CreatePostImagesDescriptionScreen extends StatefulWidget {
  static const String routeName = '/create-post-details';
  const CreatePostImagesDescriptionScreen({super.key});

  @override
  State<CreatePostImagesDescriptionScreen> createState() =>
      _CreatePostImagesDescriptionScreenState();
}

class _CreatePostImagesDescriptionScreenState
    extends State<CreatePostImagesDescriptionScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  bool _acceptTerms = false;

  @override
  void initState() {
    super.initState();
    final state = context.read<CreatePostBloc>().state;
    _descriptionController.text = state.description;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add Images',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: BlocConsumer<CreatePostBloc, CreatePostState>(
        listener: (context, state) {
          // Success navigation is handled in create_post_screen.dart
          // This listener can be used for other state handling if needed
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Upload Section
                _buildImageUploadSection(context, state),
                const SizedBox(height: 32),

                // Description Section
                _buildDescriptionSection(context, state),
                const SizedBox(height: 32),

                // Error Message
                if (state.errorMessage != null)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      border: Border.all(color: Colors.red.shade200),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.red.shade600,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            state.errorMessage!,
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                // Terms and Conditions
                _buildTermsSection(),
                const SizedBox(height: 32),

                // Post Button
                _buildPostButton(context, state),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageUploadSection(BuildContext context, CreatePostState state) {
    return Column(
      children: [
        // Upload Area
        if (state.selectedImages.isEmpty)
          _buildUploadArea(context)
        else
          _buildSelectedImages(context, state),
      ],
    );
  }

  Widget _buildUploadArea(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickImages(context),
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
            Image.asset('assets/images/upload_images.png', width: 120),

            const Text(
              'Upload images',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF8B5CF6),
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(fontSize: 12, color: Color(0xFF666666)),
                children: [
                  TextSpan(text: 'Just tap to Here to '),
                  TextSpan(
                    text: 'Browse',
                    style: TextStyle(
                      color: Color(0xFF8B5CF6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(text: ' the Gallery to\nUpload image'),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedImages(BuildContext context, CreatePostState state) {
    return Column(
      children: [
        // Add more images button
        GestureDetector(
          onTap: () => _pickImages(context),
          child: Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Upload Icon
                Image.asset('assets/images/upload_images.png', width: 120),
                SizedBox(height: 8),
                Text(
                  'Add more images +',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8B5CF6),
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
          itemCount: state.selectedImages.length,
          itemBuilder: (context, index) {
            return _buildImageItem(context, state.selectedImages[index], index);
          },
        ),
      ],
    );
  }

  Widget _buildImageItem(BuildContext context, File imageFile, int index) {
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
              context.read<CreatePostBloc>().add(
                CreatePostEvent.removeImage(index: index),
              );
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

  Widget _buildDescriptionSection(BuildContext context, CreatePostState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
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
          child: TextField(
            controller: _descriptionController,
            maxLines: 8,
            decoration: const InputDecoration(
              hintText: 'Write a description for your property...',
              hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 14),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            onChanged: (value) {
              context.read<CreatePostBloc>().add(
                CreatePostEvent.descriptionChanged(description: value),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTermsSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: _acceptTerms,
          onChanged: (value) {
            setState(() {
              _acceptTerms = value ?? false;
            });
          },
          activeColor: const Color(0xFF8B5CF6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              'By Creating this post you are accepting our Generated policies',
              style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPostButton(BuildContext context, CreatePostState state) {
    final isEnabled = state.selectedImages.isNotEmpty && _acceptTerms;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isEnabled && !state.isLoading
            ? () {
                context.read<CreatePostBloc>().add(
                  CreatePostEvent.createPost(
                    description: _descriptionController.text,
                  ),
                );
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled
              ? const Color(0xFF8B5CF6)
              : const Color(0xFFE0E0E0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: state.isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                'Post',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isEnabled ? Colors.white : const Color(0xFF999999),
                ),
              ),
      ),
    );
  }

  Future<void> _pickImages(BuildContext context) async {
    try {
      final images = await ImagePickerUtil.pickMultipleImages(
        maxImages: 10,
        imageQuality: 80,
      );

      if (images.isNotEmpty && context.mounted) {
        context.read<CreatePostBloc>().add(
          CreatePostEvent.addImages(images: images),
        );
      }
    } catch (e) {
      if (context.mounted) {
        CustomToast.showErrorToast(msg: 'Error picking images: $e');
      }
    }
  }
}
