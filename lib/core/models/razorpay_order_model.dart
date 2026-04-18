import 'package:freezed_annotation/freezed_annotation.dart';

part 'razorpay_order_model.freezed.dart';
part 'razorpay_order_model.g.dart';

/// Request model for creating Razorpay order
@freezed
class CreateOrderRequest with _$CreateOrderRequest {
  const factory CreateOrderRequest({
    required double amount,
    @JsonKey(name: 'payment_for') required String paymentFor,
    @JsonKey(name: 'entity_id') required String entityId,
    @JsonKey(name: 'duration_days') required int durationDays,
  }) = _CreateOrderRequest;

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);
}

/// Response model for Razorpay order creation
@freezed
class RazorpayOrderResponse with _$RazorpayOrderResponse {
  const factory RazorpayOrderResponse({
    required String id,
    required int amount,
    required String currency,
    required String key,
    required Map<String, dynamic> notes,
  }) = _RazorpayOrderResponse;

  factory RazorpayOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$RazorpayOrderResponseFromJson(json);
}
