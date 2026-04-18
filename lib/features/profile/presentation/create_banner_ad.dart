import 'dart:io';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/core/content_type.dart';
import 'package:propertify/features/profile/models/banner_ad_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../core/services/razorpay_service.dart';
import '../../../utils/image_picker_util.dart';
import '../../../utils/custom_toast.dart';
import '../bloc/profile_bloc.dart';
import '../models/create_banner_ad_model.dart';

class CreateBannerAdScreen extends StatefulWidget {
  static const String routeName = '/create-banner-ad';

  const CreateBannerAdScreen({super.key});

  @override
  State<CreateBannerAdScreen> createState() => _CreateBannerAdScreenState();
}

class _CreateBannerAdScreenState extends State<CreateBannerAdScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final List<File> _selectedImages = [];
  String? _selectedPlanId;
  bool _termsAccepted = false;
  late RazorpayService _razorpayService;
  bool _isProcessingPayment = false;

  // Store order details for payment confirmation
  String? _currentOrderId;
  double? _currentAmount;

  final List<Map<String, dynamic>> _plans = [
    {
      'id': 'fortnightly',
      'title': 'Fortnightly',
      'days': '15',
      'price': '250',
      'displayDays': '15 Days',
    },
    {
      'id': 'monthly',
      'title': 'Monthly',
      'days': '30',
      'price': '500',
      'displayDays': '30 Days',
    },
  ];

  @override
  void initState() {
    super.initState();
    _razorpayService = RazorpayService();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _razorpayService.dispose();
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
          'Create Banner Ads',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: BlurryModalProgressHUD(
          inAsyncCall: _isProcessingPayment,
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listenWhen: (previous, current) {
              return previous.notifyStatus != current.notifyStatus ||
                  previous.createdBannerAd != current.createdBannerAd;
            },
            listener: (context, state) {
              // Handle banner creation success -> Start Payment
              if (state.createdBannerAd != null &&
                  state.notifyStatus?.message ==
                      'Banner ad created. Please complete payment.') {
                _initiatePayment(state.createdBannerAd!);
                return;
              }

              if (state.notifyStatus != null) {
                // Handle success/error messages
                if (state.notifyStatus!.message.contains('successfully')) {
                  CustomToast.showSuccessToast(
                    msg: state.notifyStatus!.message,
                  );
                  // Only pop if it's the final success message (not intermediate)
                  if (state.notifyStatus!.message.contains(
                    'Promoted Successfully',
                  )) {
                    Navigator.pop(context);
                  }
                } else if (state.notifyStatus!.message.contains(
                  'Please complete payment',
                )) {
                  // Ignore as we handle this above
                } else {
                  CustomToast.showErrorToast(msg: state.notifyStatus!.message);
                  setState(() {
                    _isProcessingPayment = false;
                  });
                }
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Add Photo Section
                    const Text(
                      'Add Photo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildImageUploadSection(),
                    const SizedBox(height: 24),

                    // Description Section
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildDescriptionSection(),
                    const SizedBox(height: 24),

                    // Select Plan Section
                    const Text(
                      'Select plan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildPlanSelection(),
                    const SizedBox(height: 24),

                    // Terms and Conditions
                    _buildTermsSection(),
                    const SizedBox(height: 32),

                    // Post Button
                    _buildPostButton(state),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildImageUploadSection() {
    return GestureDetector(
      onTap: _pickImages,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 40),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
        ),
        child: _selectedImages.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/upload_images.png', width: 120),
                  const SizedBox(height: 12),
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
                ],
              )
            : _buildSelectedImages(),
      ),
    );
  }

  Widget _buildSelectedImages() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: _selectedImages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: FileImage(_selectedImages[index]),
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
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: _pickImages,
            icon: const Icon(Icons.add, color: Color(0xFF8B5CF6)),
            label: const Text(
              'Add more images',
              style: TextStyle(
                color: Color(0xFF8B5CF6),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
      child: TextField(
        controller: _descriptionController,
        maxLines: 5,
        maxLength: 400,
        decoration: const InputDecoration(
          hintText: 'Dummy Text',
          hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 14),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
          counterStyle: TextStyle(fontSize: 12, color: Color(0xFF999999)),
        ),
      ),
    );
  }

  Widget _buildPlanSelection() {
    return Row(
      children: [
        Expanded(child: _buildPlanCard(_plans[0])),
        const SizedBox(width: 16),
        Expanded(child: _buildPlanCard(_plans[1])),
      ],
    );
  }

  Widget _buildPlanCard(Map<String, dynamic> plan) {
    final isSelected = _selectedPlanId == plan['id'];
    const primaryColor = Color(0xFF8B5CF6);

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlanId = plan['id'];
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEADFFC) : Colors.white,
          border: Border.all(
            color: isSelected ? primaryColor : const Color(0xFFE0E0E0),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              plan['title'],
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              plan['days'],
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: primaryColor,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Days',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '₹${plan['price']}/-',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Only',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: _termsAccepted,
          onChanged: (value) {
            setState(() {
              _termsAccepted = value ?? false;
            });
          },
          activeColor: const Color(0xFF8B5CF6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              'By Creating this post you are accepting our Ads Promotion Disclaimer',
              style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPostButton(ProfileState state) {
    final isEnabled =
        _selectedImages.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _selectedPlanId != null &&
        _termsAccepted;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isEnabled && !state.isLoading && !_isProcessingPayment
            ? _handlePost
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
        child: state.isLoading || _isProcessingPayment
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

  Future<void> _pickImages() async {
    try {
      final images = await ImagePickerUtil.pickMultipleImages(
        maxImages: 10,
        imageQuality: 80,
      );

      if (images.isNotEmpty) {
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

  void _handlePost() {
    if (_isProcessingPayment) return;

    if (_selectedPlanId == null) {
      CustomToast.showErrorToast(msg: 'Please select a plan');
      return;
    }

    final selectedPlan = _plans.firstWhere((p) => p['id'] == _selectedPlanId);

    setState(() {
      _isProcessingPayment = true;
    });

    // Create Banner Ad Data
    final bannerAdData = CreateBannerAdDataModel(
      images: _selectedImages,
      description: _descriptionController.text,
      selectedPlanId: _selectedPlanId,
      planName: selectedPlan['title'],
      planDays: int.parse(selectedPlan['days']),
      amount: double.parse(selectedPlan['price']),
      termsAccepted: _termsAccepted,
    );

    // Trigger banner ad creation in bloc
    context.read<ProfileBloc>().add(
      ProfileEvent.createBannerAd(
        bannerAdData: bannerAdData,
        // Payment ID and Order ID will be updated after payment
        paymentId: '',
        orderId: '',
      ),
    );
  }

  void _initiatePayment(BannerAdModel bannerAd) async {
    try {
      if (bannerAd.amount == null ||
          bannerAd.id == null ||
          bannerAd.planDays == null) {
        CustomToast.showErrorToast(msg: 'Invalid banner ad data');
        setState(() {
          _isProcessingPayment = false;
        });
        return;
      }

      final amount = bannerAd.amount!;
      final planTitle = bannerAd.planName ?? 'Unknown';
      final days = bannerAd.planDays!;

      // Create order
      final orderResponse = await _razorpayService.createOrder(
        amount: amount,
        paymentFor: ContentType.BANNER_AD.value,
        entityId: bannerAd.id!,
        durationDays: days,
      );

      if (orderResponse == null) {
        if (mounted) {
          setState(() {
            _isProcessingPayment = false;
          });
          _handlePaymentFailure(
            PaymentFailureResponse(-1, 'Failed to create order', null),
          );
        }
        return;
      }

      // Store order details for payment confirmation
      _currentOrderId = orderResponse.id;
      _currentAmount = amount;

      // Prepare notes for payment
      final notes = {
        'content_type': ContentType.BANNER_AD.value,
        'plan_id': _selectedPlanId,
        'plan_title': planTitle,
        'plan_days': days.toString(),
        'banner_ad_id': bannerAd.id,
      };

      _razorpayService.openCheckout(
        amount: amount,
        orderId: orderResponse.id,
        description: 'Banner Ad - $planTitle Plan',
        notes: notes,
        onSuccess: (PaymentSuccessResponse response) =>
            _handlePaymentSuccess(response, bannerAd.id!),
        onFailure: _handlePaymentFailure,
        userContact: context.read<ProfileBloc>().state.userProfile?.phoneNumber,
        userEmail: context.read<ProfileBloc>().state.userProfile?.email,
        userName: context.read<ProfileBloc>().state.userProfile?.username,
      );
    } catch (e) {
      debugPrint('Error initiating payment: $e');
      if (mounted) {
        setState(() {
          _isProcessingPayment = false;
        });
        CustomToast.showErrorToast(msg: 'Failed to initiate payment');
      }
    }
  }

  void _handlePaymentSuccess(
    PaymentSuccessResponse response,
    String bannerAdId,
  ) async {
    debugPrint('Payment successful! Payment ID: ${response.paymentId}');

    // Confirm payment with backend
    if (_currentOrderId == null || _currentAmount == null) {
      debugPrint('Error: Order ID or amount not stored');
      if (mounted) {
        setState(() {
          _isProcessingPayment = false;
        });
        CustomToast.showErrorToast(msg: 'Payment verification failed');
      }
      return;
    }

    final confirmResponse = await _razorpayService.confirmPayment(
      transactionId: _currentOrderId!,
      amount: _currentAmount!,
      paymentFor: ContentType.BANNER_AD.value,
      razorpayPaymentId: response.paymentId ?? '',
      razorpayOrderId: response.orderId ?? '',
      razorpaySignature: response.signature ?? '',
    );

    if (mounted) {
      setState(() {
        _isProcessingPayment = false;
      });

      if (confirmResponse != null && confirmResponse.status == 'SUCCESS') {
        CustomToast.showSuccessToast(
          msg: 'Banner Ad Promoted Successfully!',
        ).then((value) => context.pop());
        // Refresh banner ads list if needed
        context.read<ProfileBloc>().add(const ProfileEvent.loadBannerAds());
      } else {
        debugPrint('Payment confirmation failed');
        CustomToast.showErrorToast(
          msg: 'Payment verification failed. Please contact support.',
        );
      }
    }
  }

  void _handlePaymentFailure(PaymentFailureResponse response) {
    setState(() {
      _isProcessingPayment = false;
    });

    CustomToast.showErrorToast(
      msg: response.message ?? 'Payment failed. Please try again.',
    );
  }
}
