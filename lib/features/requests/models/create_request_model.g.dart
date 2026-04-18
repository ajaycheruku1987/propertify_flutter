// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateRequestModelImpl _$$CreateRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateRequestModelImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      city: json['city'] as String,
      state: json['state'] as String,
      address: json['address'] as String,
      requestType: json['request_type'] as String,
      category: json['category'] as String,
      budgetRange: json['budget_range'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      contactNumber: json['contact_number'] as String?,
      preferredContactTime: json['preferred_contact_time'] as String?,
      urgencyLevel: json['urgency_level'] as String?,
      additionalRequirements: json['additional_requirements'] as String?,
    );

Map<String, dynamic> _$$CreateRequestModelImplToJson(
        _$CreateRequestModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'city': instance.city,
      'state': instance.state,
      'address': instance.address,
      'request_type': instance.requestType,
      'category': instance.category,
      'budget_range': instance.budgetRange,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'contact_number': instance.contactNumber,
      'preferred_contact_time': instance.preferredContactTime,
      'urgency_level': instance.urgencyLevel,
      'additional_requirements': instance.additionalRequirements,
    };
