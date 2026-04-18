// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      propertyType: json['property_type'] as String?,
      imageUrls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ownerName: json['owner_name'] as String?,
      createdAt: json['created_at'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'property_type': instance.propertyType,
      'image_urls': instance.imageUrls,
      'owner_name': instance.ownerName,
      'created_at': instance.createdAt,
      'user_id': instance.userId,
    };
