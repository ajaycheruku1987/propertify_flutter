// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'razorpay_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateOrderRequestImpl _$$CreateOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOrderRequestImpl(
      amount: (json['amount'] as num).toDouble(),
      paymentFor: json['payment_for'] as String,
      entityId: json['entity_id'] as String,
      durationDays: (json['duration_days'] as num).toInt(),
    );

Map<String, dynamic> _$$CreateOrderRequestImplToJson(
        _$CreateOrderRequestImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'payment_for': instance.paymentFor,
      'entity_id': instance.entityId,
      'duration_days': instance.durationDays,
    };

_$RazorpayOrderResponseImpl _$$RazorpayOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RazorpayOrderResponseImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toInt(),
      currency: json['currency'] as String,
      key: json['key'] as String,
      notes: json['notes'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$RazorpayOrderResponseImplToJson(
        _$RazorpayOrderResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'currency': instance.currency,
      'key': instance.key,
      'notes': instance.notes,
    };
