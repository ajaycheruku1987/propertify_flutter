import 'dart:io';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:propertify/utils/common_widgets/common_textfield.dart';
import 'package:propertify/utils/common_widgets/post_success_screen.dart';
import 'package:propertify/features/create_post/bloc/create_post_bloc.dart';
import 'package:propertify/utils/image_picker_util.dart';
import 'package:propertify/core/content_type.dart';
import 'package:video_compress/video_compress.dart';

import '../../home/presentation/home_screen.dart';
import '../../reels/bloc/reels_bloc.dart';
import '../../reels/models/reel_model.dart';
import 'reel_editor_screen.dart';
import '../../create_post/presentation/widgets/title_input.dart';
import '../../create_post/presentation/widgets/property_type_selector.dart';
import '../../create_post/presentation/widgets/looking_for_selector.dart';
import '../../create_post/presentation/widgets/address_input.dart';
import '../../create_post/presentation/widgets/city_input.dart';
import '../../create_post/presentation/widgets/price_input.dart';
import 'widgets/video_preview_widget.dart';

class CreateReelScreen extends StatefulWidget {
  static const String routeName = '/create-reel';
  const CreateReelScreen({super.key});

  @override
  State<CreateReelScreen> createState() => _CreateReelScreenState();
}

class _CreateReelScreenState extends State<CreateReelScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  bool _promote = false;
  File? _videoFile;
  String? _selectedCategory = 'Real estate'; // Single category selection

  final List<String> _categories = [
    'Real estate',
    'Plots',
    'Building Material',
    'Lawyer',
    'Contractor',
    'Property valuation',
    'Leasing',
    'Villas',
  ];

  double? _selectedLatitude;
  double? _selectedLongitude;
  String? _selectedCity;
  String? _selectedAddress;

  @override
  void dispose() {
    _descriptionController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  Future<void> _pickVideo() async {
    final file = await ImagePickerUtil.pickSingleVideo();
    if (file != null) {
      File processedFile = file;

      // Check if file is distinct from .mp4
      if (!file.path.toLowerCase().endsWith('.mp4')) {
        // Compress/Convert to mp4
        final mediaInfo = await VideoCompress.compressVideo(
          file.path,
          quality: VideoQuality.DefaultQuality, // or specific quality
          deleteOrigin: false, // Keep original
        );

        if (mediaInfo != null && mediaInfo.file != null) {
          processedFile = mediaInfo.file!;
        }
      }

      setState(() => _videoFile = processedFile);
      if (mounted) {
        // await Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => ReelEditorScreen(videoPath: file.path),
        //   ),
        // );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReelsBloc, ReelsState>(
      listener: (context, state) {
        if (state.isSuccess && !state.isLoading) {
          // Navigate to success screen using GoRouter
          // Note: We'll need to get the reel ID from state when available
          final reelId = ''; // TODO: Get from successful reel creation response
          context.go(
            '${PostSuccessScreen.routeName}?title=${Uri.encodeComponent('Reel Posted Successfully!')}&message=${Uri.encodeComponent('Your Reel has been created Successfully\nwould You Like to boost Your Reel')}&contentType=${ContentType.REEL.value}&contentId=$reelId&homeRoute=${Uri.encodeComponent(HomeScreen.routeName)}',
          );
        } else if (state.isError && !state.isLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.notifyStatus?.message ?? 'Failed to create reel',
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<ReelsBloc, ReelsState>(
        builder: (context, state) {
          final isLoading = state.isLoading;

          return BlurryModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black87),
                  onPressed: isLoading ? null : () => Navigator.pop(context),
                ),
                title: const Text(
                  'Create Reel',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                centerTitle: true,
              ),
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Video upload/preview section
                      _videoFile == null
                          ? GestureDetector(
                              onTap: _pickVideo,
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 32,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(
                                    context,
                                  ).primaryColor.withOpacity(0.06),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.video_library_outlined,
                                      size: 56,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Upload Video File',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Maximum 30 sec. Preferred format mp4 or webm (≤5MB)',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : VideoPreviewWidget(
                              videoFile: _videoFile!,
                              onChangeVideo: _pickVideo,
                            ),

                      const SizedBox(height: 16),

                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: Container(
                      //         padding: const EdgeInsets.symmetric(vertical: 12),
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(12),
                      //           border: Border.all(
                      //             color: Theme.of(context).primaryColor,
                      //           ),
                      //         ),
                      //         alignment: Alignment.center,
                      //         child: const Text(
                      //           'Text',
                      //           style: TextStyle(fontWeight: FontWeight.w600),
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 12),
                      //     Expanded(
                      //       child: Container(
                      //         padding: const EdgeInsets.symmetric(vertical: 12),
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(12),
                      //           border: Border.all(color: Colors.black12),
                      //         ),
                      //         alignment: Alignment.center,
                      //         child: const Text(
                      //           'Music',
                      //           style: TextStyle(fontWeight: FontWeight.w600),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 12),

                      CommonTextFormField(
                        label: 'Description',
                        controller: _descriptionController,
                        maxlines: 4,
                        maxLength: 400,
                        hintText: 'Enter your description here',
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        'Category',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _categories.map((category) {
                          final isSelected = _selectedCategory == category;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedCategory = category;
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

                      const SizedBox(height: 16),

                      AddressInput(
                        controller: _addressController,
                        onLocationSelected: (locationData) {
                          final address = locationData['address'] as String;
                          final city = locationData['city'] as String;
                          final village = locationData['village'] as String?;

                          final stateVal = locationData['state'] as String;
                          final latitude = double.parse(
                            locationData['lat'] as String,
                          );
                          final longitude = double.parse(
                            locationData['long'] as String,
                          );

                          // Store locally for reel creation
                          _selectedAddress = address;
                          _addressController.text = address;
                          _selectedCity = "$village, $city";
                          _cityController.text = "$village, $city";
                          _stateController.text = stateVal;
                          _selectedLatitude = latitude;
                          _selectedLongitude = longitude;
                        },
                      ),
                      const SizedBox(height: 16),
                      CommonTextFormField(
                        label: 'City',
                        controller: _cityController,
                        readOnly: true,
                        isRequired: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please choose address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CommonTextFormField(
                        label: 'State',
                        controller: _stateController,
                        readOnly: true,
                        isRequired: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please choose address';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      Row(
                        children: [
                          const Expanded(
                            child: Text('Promote this post as an ads'),
                          ),
                          Switch(
                            value: _promote,
                            onChanged: (v) => setState(() => _promote = v),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: CommonCustomButton(
                          buttonLabel: 'Posts',
                          isEnable: !isLoading,
                          onTap: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              // Validate video file
                              if (_videoFile == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please select a video'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }

                              // Validate category selection
                              if (_selectedCategory == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please select a category'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }

                              // Call createReel event
                              context.read<ReelsBloc>().add(
                                ReelsEvent.createReel(
                                  videoFile: _videoFile!,
                                  description:
                                      _descriptionController.text.trim().isEmpty
                                      ? null
                                      : _descriptionController.text.trim(),
                                  category: _selectedCategory != null
                                      ? [_selectedCategory!]
                                      : null,
                                  address:
                                      (_selectedAddress != null &&
                                          _selectedAddress!.isNotEmpty)
                                      ? _selectedAddress
                                      : (_addressController.text.trim().isEmpty
                                            ? null
                                            : _addressController.text.trim()),
                                  city:
                                      (_selectedCity != null &&
                                          _selectedCity!.isNotEmpty)
                                      ? _selectedCity
                                      : (_cityController.text.trim().isEmpty
                                            ? null
                                            : _cityController.text.trim()),
                                  state: _stateController.text.trim().isEmpty
                                      ? null
                                      : _stateController.text.trim(),
                                  latitude: _selectedLatitude,
                                  longitude: _selectedLongitude,
                                  location:
                                      (_selectedCity != null &&
                                          _selectedCity!.isNotEmpty)
                                      ? _selectedCity
                                      : (_cityController.text.trim().isEmpty
                                            ? null
                                            : _cityController.text.trim()),
                                  isPromoted: _promote,
                                  promotedUntil: _promote
                                      ? DateTime.now()
                                            .add(const Duration(days: 30))
                                            .toIso8601String()
                                      : null,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
