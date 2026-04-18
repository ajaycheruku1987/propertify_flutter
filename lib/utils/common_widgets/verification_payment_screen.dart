import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/core/app_theme.dart';
import 'package:propertify/core/content_type.dart';
import 'package:propertify/core/services/razorpay_service.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/utils/common_widgets/payment_failed_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

enum VerificationType { GST, AADHAAR }

/// Verification Payment Screen - shown for GST or Aadhaar verification
///
/// This screen allows users to pay for document verification
class VerificationPaymentScreen extends StatefulWidget {
  static const String routeName = '/verification-payment';

  final VerificationType verificationType;
  final String? entityId; // Company ID or service ID
  final bool showSkip; // Whether to show skip button

  const VerificationPaymentScreen({
    super.key,
    this.verificationType = VerificationType.GST,
    this.entityId,
    this.showSkip = false,
  });

  @override
  State<VerificationPaymentScreen> createState() =>
      _VerificationPaymentScreenState();
}

class _VerificationPaymentScreenState extends State<VerificationPaymentScreen> {
  late RazorpayService _razorpayService;
  bool _isProcessingPayment = false;

  // Store order details for payment confirmation
  String? _currentOrderId;
  double? _currentAmount;

  @override
  void initState() {
    super.initState();
    _razorpayService = RazorpayService();
  }

  @override
  void dispose() {
    _razorpayService.dispose();
    super.dispose();
  }

  /// Get verification price based on type
  double _getVerificationPrice() {
    switch (widget.verificationType) {
      case VerificationType.GST:
        return 300.0;
      case VerificationType.AADHAAR:
        return 500.0; // Different price for Aadhaar
    }
  }

  /// Get verification title based on type
  String _getVerificationTitle() {
    switch (widget.verificationType) {
      case VerificationType.GST:
        return 'GST Verification';
      case VerificationType.AADHAAR:
        return 'Aadhaar Verification';
    }
  }

  /// Get verification description based on type
  String _getVerificationDescription() {
    switch (widget.verificationType) {
      case VerificationType.GST:
        return 'Verify your GST number to enable project creation and compliance with platform regulations';
      case VerificationType.AADHAAR:
        return 'Verify your Aadhaar to provide authentic service and build customer confidence';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final price = _getVerificationPrice();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F4FF),
        elevation: 0,
        leading: widget.showSkip
            ? IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: () => context.pop(),
              )
            : IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => context.pop(),
              ),
        title: Text(
          _getVerificationTitle(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: isDark
          ? AppTheme.backgroundColorDarkTheme
          : Colors.white,
      body: BlurryModalProgressHUD(
        inAsyncCall: _isProcessingPayment,
        child: SafeArea(
          child: Column(
            children: [
              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).primaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            widget.verificationType == VerificationType.GST
                                ? Icons.verified_user
                                : Icons.credit_card,
                            size: 64,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Title
                      Center(
                        child: Text(
                          _getVerificationTitle(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Description
                      Center(
                        child: Text(
                          _getVerificationDescription(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark
                                ? const Color(0xFF9CA3AF)
                                : const Color(0xFF6B7280),
                            height: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Price Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF2D243A)
                              : const Color(0xFFEADFFC),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Verification Fee',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isDark ? Colors.white70 : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '₹',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  price.toStringAsFixed(0),
                                  style: TextStyle(
                                    fontSize: 56,
                                    fontWeight: FontWeight.w800,
                                    color: Theme.of(context).primaryColor,
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'One-time payment',
                              style: TextStyle(
                                fontSize: 14,
                                color: isDark
                                    ? const Color(0xFF9CA3AF)
                                    : const Color(0xFF6B7280),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Benefits
                      _buildBenefits(isDark),
                    ],
                  ),
                ),
              ),

              // Footer with buttons
              _buildFooter(isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBenefits(bool isDark) {
    final benefits = widget.verificationType == VerificationType.GST
        ? [
            'Unlock ability to create and manage projects',
            'Get verified badge on your company profile',
            'Build trust with potential customers',
            'Compliance with platform regulations',
          ]
        : [
            'Get verified badge on your service profile',
            'Build customer confidence',
            'Stand out from competitors',
            'Secure and private verification',
          ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Benefits',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        ...benefits.map(
          (benefit) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    benefit,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.white70 : Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(bool isDark) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.backgroundColorDarkTheme : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Pay button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handlePay,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 8,
                shadowColor: Theme.of(context).primaryColor.withOpacity(0.3),
              ),
              child: const Text(
                'Pay Now',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),

          // Skip button (if enabled)
          if (widget.showSkip) ...[
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => context.pop(),
              child: Text(
                'Skip for now',
                style: TextStyle(
                  fontSize: 14,
                  color: isDark
                      ? const Color(0xFF9CA3AF)
                      : const Color(0xFF6B7280),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _handlePay() async {
    if (_isProcessingPayment) return;

    setState(() {
      _isProcessingPayment = true;
    });

    final amount = _getVerificationPrice();
    final contentType = widget.verificationType == VerificationType.GST
        ? ContentType.GST_VERIFICATION
        : ContentType.SERVICE_VERIFICATION;

    // Create order first
    final orderResponse = await _razorpayService.createOrder(
      amount: amount,
      paymentFor: contentType.value.toUpperCase(),
      entityId: widget.entityId ?? '',
      durationDays: 0, // Not applicable for verification
    );

    if (orderResponse == null) {
      setState(() {
        _isProcessingPayment = false;
      });
      _handlePaymentFailure(
        PaymentFailureResponse(-1, 'Failed to create order', null),
      );
      return;
    }

    // Store order details for payment confirmation
    _currentOrderId = orderResponse.id;
    _currentAmount = amount;

    // Prepare notes
    final notes = {
      'verification_type': widget.verificationType.name,
      'entity_id': widget.entityId ?? '',
    };

    _razorpayService.openCheckout(
      amount: amount,
      orderId: orderResponse.id,
      description: '${_getVerificationTitle()} Fee',
      notes: notes,
      onSuccess: _handlePaymentSuccess,
      onFailure: _handlePaymentFailure,
      userContact: context.read<ProfileBloc>().state.userProfile?.phoneNumber,
      userEmail: context.read<ProfileBloc>().state.userProfile?.email,
      userName: context.read<ProfileBloc>().state.userProfile?.username,
    );

    // Reset processing state after a delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isProcessingPayment = false;
        });
      }
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    debugPrint('Payment successful! Payment ID: ${response.paymentId}');

    // Confirm payment with backend
    if (_currentOrderId == null || _currentAmount == null) {
      debugPrint('Error: Order ID or amount not stored');
      _handlePaymentFailure(
        PaymentFailureResponse(-1, 'Payment verification failed', null),
      );
      return;
    }

    final contentType = widget.verificationType == VerificationType.GST
        ? ContentType.GST_VERIFICATION
        : ContentType.GST_VERIFICATION;

    final confirmResponse = await _razorpayService.confirmPayment(
      transactionId: _currentOrderId!,
      amount: _currentAmount!,
      paymentFor: contentType.value.toUpperCase(),
      razorpayPaymentId: response.paymentId ?? '',
      razorpayOrderId: response.orderId ?? '',
      razorpaySignature: response.signature ?? '',
    );

    // Check if payment was confirmed successfully
    if (confirmResponse != null && confirmResponse.status == 'SUCCESS') {
      // Payment verified! Navigate to success screen
      // For verification, we want to go back to profile with refresh
      if (mounted) {
        context.go('/profile?refresh=true');
      }
    } else {
      // Payment confirmation failed
      debugPrint('Payment confirmation failed');
      context.push(
        '${PaymentFailedScreen.routeName}?errorMessage=Payment verification failed. Please contact support.',
      );
    }
    setState(() {
      _isProcessingPayment = false;
    });
  }

  void _handlePaymentFailure(PaymentFailureResponse response) {
    setState(() {
      _isProcessingPayment = false;
    });

    // Navigate to failure screen using GoRouter
    context.push(
      '${PaymentFailedScreen.routeName}?errorMessage=${Uri.encodeComponent(response.message ?? 'Payment was not completed. Please try again.')}',
    );
  }
}
