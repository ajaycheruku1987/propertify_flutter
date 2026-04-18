import 'dart:io';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/core/notify_message.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/home/presentation/home_screen.dart';

import '../../sales/bloc/sales_bloc.dart';
import '../../sales/models/create_sales_data_model.dart';
import '../../../utils/image_picker_util.dart';
import '../../../utils/custom_toast.dart';
import '../../../utils/common_widgets/common_custom_button.dart';
import '../../../utils/common_widgets/post_success_screen.dart';
import '../../../core/content_type.dart';

class SalesProjectImagesDescriptionScreen extends StatefulWidget {
  const SalesProjectImagesDescriptionScreen({super.key});

  static const String routeName = '/sales/create/media';

  @override
  State<SalesProjectImagesDescriptionScreen> createState() =>
      _SalesProjectImagesDescriptionScreenState();
}

class _SalesProjectImagesDescriptionScreenState
    extends State<SalesProjectImagesDescriptionScreen> {
  final List<File> _selectedImages = [];
  File? _brochureFile;
  bool _acceptPolicies = false;

  @override
  void initState() {
    super.initState();
    final draft = context.read<SalesBloc>().state.createSalesDataModel;
    if (draft != null) {
      if (draft.imageFiles != null && draft.imageFiles!.isNotEmpty) {
        _selectedImages.addAll(draft.imageFiles!);
      }
      _brochureFile = draft.brochure;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SalesBloc, SalesState>(
      listener: (context, state) {
        if (state.notifyStatus?.type == NotifyType.success) {
          // Navigate to success screen using GoRouter
          // Note: We'll need to get the sale ID from state when available
          final saleId = ''; // TODO: Get from successful sale creation response
          context.go(
            '${PostSuccessScreen.routeName}?title=${Uri.encodeComponent('Listed Successfully!')}&message=${Uri.encodeComponent('Your Product has been listed Successfully\nwould You Like to boost Your Listing')}&contentType=${ContentType.SALES.value}&contentId=$saleId&homeRoute=${Uri.encodeComponent(HomeScreen.routeName)}',
          );
        } else if (state.notifyStatus?.type == NotifyType.error) {
          CustomToast.showErrorToast(msg: state.notifyStatus?.message ?? '');
        }
      },
      child: BlocBuilder<SalesBloc, SalesState>(
        builder: (context, state) {
          return BlurryModalProgressHUD(
            inAsyncCall: state.isLoading,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xFFF5F4FF),
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                title: const Text(
                  'Create Sales Project',
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
                    const Text(
                      'Add Images',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),

                    _buildImageUploadSection(),
                    const SizedBox(height: 24),

                    const Text(
                      'Brochure (Optional)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildBrochureUploadSection(),
                    const SizedBox(height: 24),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _acceptPolicies,
                          onChanged: (value) {
                            setState(() {
                              _acceptPolicies = value ?? false;
                            });
                          },
                          activeColor: Theme.of(context).primaryColor,
                        ),
                        const Expanded(
                          child: Text(
                            'By Creating this post you are accepting our Generated policies',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: CommonCustomButton(
                        onTap: _onSubmit,
                        buttonLabel: 'Submit',
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

  Widget _buildImageUploadSection() {
    return Column(
      children: [
        if (_selectedImages.isEmpty)
          _buildUploadArea()
        else
          _buildSelectedImages(),
      ],
    );
  }

  Widget _buildBrochureUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_brochureFile == null)
          GestureDetector(
            onTap: _pickBrochure,
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.picture_as_pdf, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    'Upload brochure image',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
            ),
            child: Row(
              children: [
                const Icon(Icons.insert_drive_file, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _brochureFile!.path.split('/').last,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: _pickBrochure,
                  child: const Text('Replace'),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => setState(() => _brochureFile = null),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildUploadArea() {
    return GestureDetector(
      onTap: _pickImages,
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
                style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
                children: [
                  const TextSpan(text: 'Just tap to Here to '),
                  TextSpan(
                    text: 'Browse',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextSpan(text: ' the Gallery to\nUpload image'),
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
        GestureDetector(
          onTap: _pickImages,
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
                Image.asset('assets/images/upload_images.png', width: 180),
                const SizedBox(height: 8),
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

  Future<void> _pickBrochure() async {
    try {
      final file = await ImagePickerUtil.pickSingleImage(imageQuality: 90);
      if (file != null && mounted) {
        setState(() {
          _brochureFile = file;
        });
      }
    } catch (e) {
      if (mounted) {
        CustomToast.showErrorToast(msg: 'Error picking brochure: $e');
      }
    }
  }

  void _onSubmit() {
    try {
      if (!_acceptPolicies) {
        CustomToast.showWarningToast(
          msg: 'Please accept policies before submitting',
        );
        return;
      }

      final bloc = context.read<SalesBloc>();
      final draft =
          bloc.state.createSalesDataModel ?? const CreateSalesDataModel();

      // Store media + brochure to draft
      bloc.add(
        SalesEvent.updateSalesMedia(
          createSalesDataModel: draft.copyWith(
            imageFiles: _selectedImages,
            brochure: _brochureFile,
          ),
        ),
      );

      // Trigger create with existing details from draft
      bloc.add(
        SalesEvent.createSalesProject(
          propertyType: draft.propertyType ?? '',
          projectName: draft.projectName ?? '',
          rera: draft.rera,
          area: draft.area ?? 0,
          areaUnit: draft.areaUnit ?? '',
          noOfUnits: draft.noOfUnits,
          noOfFloors: draft.noOfFloors,
          description: draft.description,
          specifications: draft.specifications,
          address: draft.address,
          city: draft.city,
          state: draft.state,
          location: draft.location,
          latitude: draft.latitude,
          longitude: draft.longitude,
          publicFacilities: draft.publicFacilities,
          saleSpecification: draft.saleSpecification,
          images: null,
          brochure: _brochureFile ?? draft.brochure,
        ),
      );
    } catch (e) {
      if (mounted) {
        CustomToast.showErrorToast(msg: 'Error submitting sales project: $e');
      }
    }
  }
}
