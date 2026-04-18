import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/services/bloc/services_bloc.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/utils/image_picker_util.dart';
import 'package:propertify/core/notify_message.dart';

class AadharVerificationScreen extends StatefulWidget {
  static const String routeName = '/aadhar-verification';
  final String serviceId;

  const AadharVerificationScreen({super.key, required this.serviceId});

  @override
  State<AadharVerificationScreen> createState() =>
      _AadharVerificationScreenState();
}

class _AadharVerificationScreenState extends State<AadharVerificationScreen> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final file = await ImagePickerUtil.showImageSourceBottomSheet(context);
    if (file != null) {
      setState(() {
        _selectedImage = file;
      });
    }
  }

  void _onSubmit() {
    if (_selectedImage == null) {
      CustomToast.showErrorToast(msg: 'Please select an image first');
      return;
    }

    context.read<ServicesBloc>().add(
      ServicesEvent.uploadAadharEvent(
        serviceId: widget.serviceId,
        aadharFile: _selectedImage!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Aadhaar Card Verification',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<ServicesBloc, ServicesState>(
        listener: (context, state) {
          if (state.notifyStatus != null) {
            if (state.isAadharUploadSuccess) {
              CustomToast.showSuccessToast(
                msg: state.notifyStatus!.message,
              ).then((value) {
                context.read<ServicesBloc>().add(
                  ServicesEvent.getServiceDetailsEvent(
                    serviceId: widget.serviceId,
                  ),
                );
                // Navigate to verification payment screen
                context.pushReplacement(
                  '/verification-payment?type=aadhaar&entityId=${widget.serviceId}&showSkip=false',
                );
              });
              // Refresh details and navigate to payment
            } else if (state.notifyStatus!.type == NotifyType.error) {
              CustomToast.showErrorToast(msg: state.notifyStatus!.message);
            }
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: double.infinity,
                    height: 220,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3EFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_selectedImage != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              _selectedImage!,
                              height: 120,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          )
                        else
                          Image.asset(
                            'assets/images/aadhar_placeholder.png', // Assuming a placeholder exists or I'll just use icon if not
                            height: 100,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.badge_outlined,
                                  size: 80,
                                  color: Colors.indigo,
                                ),
                          ),
                        const SizedBox(height: 20),
                        const Text(
                          'Upload Aadhar / Pan card Here',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6C5CE7),
                          ),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            children: [
                              TextSpan(text: 'Just tap to Here to '),
                              TextSpan(
                                text: 'Browse',
                                style: TextStyle(
                                  color: Color(0xFF6C5CE7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: ' the Gallery to Upload\nimage'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: CommonCustomButton(
                    onTap: _onSubmit,
                    buttonLabel: 'Submit',
                    isEnable: !state.isAadharUploading,
                    buttonColor: const Color(0xFF6C5CE7),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
