// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationRequestModelImpl _$$VerificationRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationRequestModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      propertyType: json['property_type'] as String?,
      imageUrls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ownerName: json['owner_name'] as String?,
      documentType: json['document_type'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$VerificationRequestModelImplToJson(
        _$VerificationRequestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'property_type': instance.propertyType,
      'image_urls': instance.imageUrls,
      'owner_name': instance.ownerName,
      'document_type': instance.documentType,
      'status': instance.status,
      'created_at': instance.createdAt,
      'user_id': instance.userId,
    };
