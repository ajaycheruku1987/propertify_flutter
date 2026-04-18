// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_confirm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentConfirmRequestImpl _$$PaymentConfirmRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentConfirmRequestImpl(
      transactionId: json['transaction_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      paymentFor: json['payment_for'] as String,
      details: PaymentDetails.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentConfirmRequestImplToJson(
        _$PaymentConfirmRequestImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'amount': instance.amount,
      'payment_for': instance.paymentFor,
      'details': instance.details,
    };

_$PaymentDetailsImpl _$$PaymentDetailsImplFromJson(Map<String, dynamic> json) =>
    _$PaymentDetailsImpl(
      razorpayPaymentId: json['razorpay_payment_id'] as String,
      razorpayOrderId: json['razorpay_order_id'] as String,
      razorpaySignature: json['razorpay_signature'] as String,
      method: json['method'] as String,
    );

Map<String, dynamic> _$$PaymentDetailsImplToJson(
        _$PaymentDetailsImpl instance) =>
    <String, dynamic>{
      'razorpay_payment_id': instance.razorpayPaymentId,
      'razorpay_order_id': instance.razorpayOrderId,
      'razorpay_signature': instance.razorpaySignature,
      'method': instance.method,
    };

_$PaymentConfirmResponseImpl _$$PaymentConfirmResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentConfirmResponseImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      razorpayPaymentId: json['razorpay_payment_id'] as String?,
      razorpayOrderId: json['razorpay_order_id'] as String?,
      razorpaySignature: json['razorpay_signature'] as String?,
      transactionId: json['transaction_id'] as String,
      paymentMethod: json['payment_method'] as String,
      status: json['status'] as String,
      paymentFor: json['payment_for'] as String,
      entityId: json['entity_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PaymentConfirmResponseImplToJson(
        _$PaymentConfirmResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'amount': instance.amount,
      'currency': instance.currency,
      'razorpay_payment_id': instance.razorpayPaymentId,
      'razorpay_order_id': instance.razorpayOrderId,
      'razorpay_signature': instance.razorpaySignature,
      'transaction_id': instance.transactionId,
      'payment_method': instance.paymentMethod,
      'status': instance.status,
      'payment_for': instance.paymentFor,
      'entity_id': instance.entityId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
