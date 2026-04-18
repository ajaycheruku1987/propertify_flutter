import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_confirm_model.freezed.dart';
part 'payment_confirm_model.g.dart';

/// Payment confirmation request model
@freezed
class PaymentConfirmRequest with _$PaymentConfirmRequest {
  const factory PaymentConfirmRequest({
    @JsonKey(name: 'transaction_id') required String transactionId,
    required double amount,
    @JsonKey(name: 'payment_for') required String paymentFor,
    required PaymentDetails details,
  }) = _PaymentConfirmRequest;

  factory PaymentConfirmRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentConfirmRequestFromJson(json);
}

/// Payment details for confirmation
@freezed
class PaymentDetails with _$PaymentDetails {
  const factory PaymentDetails({
    @JsonKey(name: 'razorpay_payment_id') required String razorpayPaymentId,
    @JsonKey(name: 'razorpay_order_id') required String razorpayOrderId,
    @JsonKey(name: 'razorpay_signature') required String razorpaySignature,
    required String method,
  }) = _PaymentDetails;

  factory PaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsFromJson(json);
}

/// Payment confirmation response model
@freezed
class PaymentConfirmResponse with _$PaymentConfirmResponse {
  const factory PaymentConfirmResponse({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required double amount,
    required String currency,
    @JsonKey(name: 'razorpay_payment_id') String? razorpayPaymentId,
    @JsonKey(name: 'razorpay_order_id') String? razorpayOrderId,
    @JsonKey(name: 'razorpay_signature') String? razorpaySignature,
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    required String status,
    @JsonKey(name: 'payment_for') required String paymentFor,
    @JsonKey(name: 'entity_id') String? entityId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _PaymentConfirmResponse;

  factory PaymentConfirmResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentConfirmResponseFromJson(json);
}
