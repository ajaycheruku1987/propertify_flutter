import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/core/app_theme.dart';
import 'package:propertify/core/content_type.dart';
import 'package:propertify/core/services/razorpay_service.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/utils/common_widgets/payment_failed_screen.dart';
import 'package:propertify/utils/common_widgets/payment_success_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

/// Select Plan Screen - shown when user taps "Boost Now"
///
/// This screen allows users to select a boost/promotion plan
/// for their content (posts, reels, sales, services)
class SelectPlanScreen extends StatefulWidget {
  static const String routeName = '/select-plan';

  final ContentType contentType;
  final String contentId;

  const SelectPlanScreen({
    super.key,
    this.contentType = ContentType.FEED,
    this.contentId = '',
  });

  @override
  State<SelectPlanScreen> createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  String _selectedPlan = '15_days';
  late RazorpayService _razorpayService;
  bool _isProcessingPayment = false;
  late List<Map<String, dynamic>> _plans;

  // Store order details for payment confirmation
  String? _currentOrderId;
  double? _currentAmount;

  @override
  void initState() {
    super.initState();
    _razorpayService = RazorpayService();
    _plans = _getPlansForContentType(widget.contentType);
  }

  /// Get pricing plans based on content type
  List<Map<String, dynamic>> _getPlansForContentType(ContentType contentType) {
    switch (contentType) {
      case ContentType.FEED:
      case ContentType.REEL:
      case ContentType.SERVICE:
        // Feed, Reels, and Service/Experts have the same pricing
        return [
          {'id': '15_days', 'title': '15 Days', 'days': '15', 'price': '149'},
          {'id': '30_days', 'title': '30 Days', 'days': '30', 'price': '299'},
        ];
      case ContentType.SALES:
        // Sales pricing (currently same as others, can be changed later)
        return [
          {'id': '15_days', 'title': '15 Days', 'days': '15', 'price': '149'},
          {'id': '30_days', 'title': '30 Days', 'days': '30', 'price': '299'},
        ];
      case ContentType.BANNER_AD:
        // Banner pricing - to be defined later
        // TODO: Update banner pricing when provided
        return [
          {'id': '15_days', 'title': '15 Days', 'days': '15', 'price': '149'},
          {'id': '30_days', 'title': '30 Days', 'days': '30', 'price': '299'},
        ];
      default:
        // Default pricing for new content types
        return [
          {'id': '15_days', 'title': '15 Days', 'days': '15', 'price': '149'},
          {'id': '30_days', 'title': '30 Days', 'days': '30', 'price': '299'},
        ];
    }
  }

  @override
  void dispose() {
    _razorpayService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F4FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          widget.contentType.boostTitle,
          style: TextStyle(
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
              // Header
              // _buildHeader(isDark),

              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        'Select Plan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Plan cards
                      Row(
                        children: [
                          Expanded(child: _buildPlanCard(_plans[0], isDark)),
                          const SizedBox(width: 16),
                          Expanded(child: _buildPlanCard(_plans[1], isDark)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Footer with checkbox and button
              _buildFooter(isDark),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildHeader(bool isDark) {
  //   return Container(
  //     padding: const EdgeInsets.fromLTRB(20, 48, 20, 24),
  //     decoration: BoxDecoration(
  //       color: isDark
  //           ? AppTheme.backgroundColorDarkTheme
  //           : AppTheme.introductionCardLightThemeColor,
  //     ),
  //     child: Column(
  //       children: [
  //         // App bar
  //         Stack(
  //           children: [
  //             Align(
  //               alignment: Alignment.centerLeft,
  //               child: IconButton(
  //                 onPressed: () => Navigator.pop(context),
  //                 icon: Icon(
  //                   Icons.arrow_back,
  //                   color: isDark ? Colors.white : Colors.black87,
  //                 ),
  //                 padding: EdgeInsets.zero,
  //                 constraints: const BoxConstraints(),
  //               ),
  //             ),
  //             Center(
  //               child: Padding(
  //                 padding: const EdgeInsets.symmetric(vertical: 8),
  //                 child: Text(
  //                   _getHeaderTitle(),
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold,
  //                     color: isDark ? Colors.white : Colors.black,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  String _getHeaderTitle() {
    return widget.contentType.boostTitle;
  }

  Widget _buildPlanCard(Map<String, dynamic> plan, bool isDark) {
    final isSelected = _selectedPlan == plan['id'];
    final primaryColor = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlan = plan['id'];
        });
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected
                  ? (isDark ? const Color(0xFF2D243A) : const Color(0xFFEADFFC))
                  : (isDark ? AppTheme.backgroundColorDarkTheme : Colors.white),
              border: Border.all(
                color: isSelected
                    ? primaryColor
                    : (isDark
                          ? const Color(0xFF3A3B3C)
                          : const Color(0xFFE5E7EB)),
                width: isSelected ? 2 : 1,
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
                // Plan title
                Text(
                  plan['title'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 4),

                // Days number
                Text(
                  plan['days'],
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: primaryColor,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),

                // Days label
                Text(
                  'Days',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDark
                        ? const Color(0xFF9CA3AF)
                        : const Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 12),

                // Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '₹${plan['price']}/-',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Only',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? const Color(0xFF9CA3AF)
                            : const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Checkmark
          if (isSelected)
            Positioned(
              top: 8,
              right: 8,
              child: Icon(Icons.check_circle, color: primaryColor, size: 18),
            ),
        ],
      ),
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
                disabledBackgroundColor: isDark
                    ? const Color(0xFF3A3B3C)
                    : const Color(0xFFE5E7EB),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 8,
                shadowColor: Theme.of(context).primaryColor.withOpacity(0.3),
              ),
              child: const Text(
                'Pay',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handlePay() async {
    if (_isProcessingPayment) return;

    setState(() {
      _isProcessingPayment = true;
    });

    final selectedPlan = _plans.firstWhere((p) => p['id'] == _selectedPlan);
    final amount = double.parse(selectedPlan['price']);
    final planTitle = selectedPlan['title'];
    final days = int.parse(selectedPlan['days']);

    // Create order first
    final orderResponse = await _razorpayService.createOrder(
      amount: amount,
      paymentFor: widget.contentType.value.toUpperCase(),
      entityId: widget.contentId,
      durationDays: days,
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

    // Prepare notes - will be customizable later
    final notes = {
      'content_type': widget.contentType.value,
      'content_id': widget.contentId,
      'plan_id': _selectedPlan,
      'plan_title': planTitle,
      'boost_days': days.toString(),
    };

    _razorpayService.openCheckout(
      amount: amount,
      orderId: orderResponse.id,
      description: 'Boost ${widget.contentType.value} - $planTitle Plan',
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

    final confirmResponse = await _razorpayService.confirmPayment(
      transactionId: _currentOrderId!,
      amount: _currentAmount!,
      paymentFor: widget.contentType.value.toUpperCase(),
      razorpayPaymentId: response.paymentId ?? '',
      razorpayOrderId: response.orderId ?? '',
      razorpaySignature: response.signature ?? '',
    );

    // Check if payment was confirmed successfully
    if (confirmResponse != null && confirmResponse.status == 'SUCCESS') {
      // Payment verified! Navigate to success screen
      final selectedPlan = _plans.firstWhere((p) => p['id'] == _selectedPlan);

      context.pushReplacement(
        '${PaymentSuccessScreen.routeName}?contentType=${widget.contentType.value}&planTitle=${selectedPlan['title']}',
      );
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
