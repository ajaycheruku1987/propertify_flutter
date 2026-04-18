import 'package:flutter/material.dart';
import 'package:propertify/utils/env.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:dio/dio.dart';
import '../models/razorpay_order_model.dart';
import '../models/payment_confirm_model.dart';
import '../app_cache_service.dart';
import 'package:get_it/get_it.dart';

/// Service to handle Razorpay payment integration
class RazorpayService {
  late Razorpay _razorpay;

  // Callbacks
  Function(PaymentSuccessResponse)? _onSuccess;
  Function(PaymentFailureResponse)? _onFailure;
  Function()? _onWalletSelection;

  RazorpayService() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  /// Create Razorpay Order
  ///
  /// This method must be called before openCheckout to get the order_id
  /// Parameters:
  /// - [amount]: Amount in INR
  /// - [paymentFor]: Type of payment (FEED, REELS, SERVICE, SALES, BANNER)
  /// - [entityId]: ID of the entity being paid for
  /// - [durationDays]: Duration in days
  Future<RazorpayOrderResponse?> createOrder({
    required double amount,
    required String paymentFor,
    required String entityId,
    required int durationDays,
  }) async {
    try {
      final appCacheService = GetIt.instance<AppCacheService>();
      final token = appCacheService.getToken();

      if (token == null || token.isEmpty) {
        debugPrint('No access token found');
        return null;
      }

      final dio = Dio();
      final response = await dio.post(
        '${env.baseUrl.replaceAll('/api', '')}/payments/create-order',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'amount': amount,
          'payment_for': paymentFor,
          'entity_id': entityId,
          'duration_days': durationDays,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('Order created successfully: ${response.data}');
        return RazorpayOrderResponse.fromJson(response.data);
      } else {
        debugPrint('Failed to create order: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error creating Razorpay order: $e');
      return null;
    }
  }

  /// Confirm Payment with Backend
  ///
  /// This method must be called after successful Razorpay payment
  /// to verify and confirm the payment on the backend
  /// Parameters:
  /// - [transactionId]: Order ID from create-order API
  /// - [amount]: Payment amount in INR
  /// - [paymentFor]: Type of payment (FEED, REELS, SERVICE, SALES, BANNER)
  /// - [razorpayPaymentId]: Payment ID from Razorpay
  /// - [razorpayOrderId]: Order ID from Razorpay
  /// - [razorpaySignature]: Signature from Razorpay for verification
  Future<PaymentConfirmResponse?> confirmPayment({
    required String transactionId,
    required double amount,
    required String paymentFor,
    required String razorpayPaymentId,
    required String razorpayOrderId,
    required String razorpaySignature,
  }) async {
    try {
      final appCacheService = GetIt.instance<AppCacheService>();
      final token = appCacheService.getToken();

      if (token == null || token.isEmpty) {
        debugPrint('No access token found');
        return null;
      }

      final request = PaymentConfirmRequest(
        transactionId: transactionId,
        amount: amount,
        paymentFor: paymentFor,
        details: PaymentDetails(
          razorpayPaymentId: razorpayPaymentId,
          razorpayOrderId: razorpayOrderId,
          razorpaySignature: razorpaySignature,
          method: 'RAZORPAY',
        ),
      );

      final dio = Dio();
      final response = await dio.post(
        '${env.baseUrl.replaceAll('/api', '')}/payments/confirm',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('Payment confirmed successfully: ${response.data}');
        final confirmResponse = PaymentConfirmResponse.fromJson(response.data);

        // Check if payment was successful
        if (confirmResponse.status == 'SUCCESS') {
          return confirmResponse;
        } else {
          debugPrint(
            'Payment confirmation failed with status: ${confirmResponse.status}',
          );
          return null;
        }
      } else {
        debugPrint('Failed to confirm payment: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error confirming payment: $e');
      return null;
    }
  }

  /// Initialize payment with Razorpay
  ///
  /// Parameters:
  /// - [amount]: Amount in INR (will be converted to paise)
  /// - [orderId]: Order ID from backend
  /// - [description]: Payment description
  /// - [userEmail]: User's email address
  /// - [userContact]: User's phone number
  /// - [userName]: User's name
  /// - [notes]: Additional notes as key-value pairs
  /// - [onSuccess]: Callback for successful payment
  /// - [onFailure]: Callback for failed payment
  /// - [onWalletSelection]: Callback for external wallet selection
  void openCheckout({
    required double amount,
    String? orderId,
    required String description,
    String? userEmail,
    String? userContact,
    String? userName,
    Map<String, dynamic>? notes,
    Function(PaymentSuccessResponse)? onSuccess,
    Function(PaymentFailureResponse)? onFailure,
    Function()? onWalletSelection,
  }) {
    // Set callbacks
    _onSuccess = onSuccess;
    _onFailure = onFailure;
    _onWalletSelection = onWalletSelection;

    var options = {
      // Razorpay Test Key
      // 'key': 'rzp_test_Rwx5iQnay6w8qO',
      // 'key': 'rzp_live_S0gUGt70XABJuj',
      'key': 'rzp_live_SULYoRSNd4U1M5',
      'amount': (amount * 100).toInt(), // Amount in paise
      'name': 'Propertify',
      'description': description,
      'prefill': {
        'contact': userContact ?? '',
        'email': userEmail ?? '',
        'name': userName ?? '',
      },
      'theme': {
        'color': '#7C3AED', // Your app's primary color
      },
      // Add order_id if provided (from create-order API)
      if (orderId != null) 'order_id': orderId,
      // Add notes if provided
      if (notes != null) 'notes': notes,
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error opening Razorpay checkout: $e');
      if (_onFailure != null) {
        _onFailure!(
          PaymentFailureResponse(-1, 'Failed to open payment gateway', null),
        );
      }
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    debugPrint('Payment Success: ${response.paymentId}');
    debugPrint('Order ID: ${response.orderId}');
    debugPrint('Signature: ${response.signature}');

    if (_onSuccess != null) {
      _onSuccess!(response);
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    debugPrint('Payment Error: ${response.code}');
    debugPrint('Message: ${response.message}');

    if (_onFailure != null) {
      _onFailure!(response);
    }
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint('External Wallet: ${response.walletName}');

    if (_onWalletSelection != null) {
      _onWalletSelection!();
    }
  }

  /// Dispose the Razorpay instance
  void dispose() {
    _razorpay.clear();
  }
}
