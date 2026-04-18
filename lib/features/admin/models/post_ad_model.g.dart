// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostAdModelImpl _$$PostAdModelImplFromJson(Map<String, dynamic> json) =>
    _$PostAdModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      propertyType: json['property_type'] as String?,
      category: json['category'] as String?,
      imageUrls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ownerName: json['owner_name'] as String?,
      createdAt: json['created_at'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$PostAdModelImplToJson(_$PostAdModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'property_type': instance.propertyType,
      'category': instance.category,
      'image_urls': instance.imageUrls,
      'owner_name': instance.ownerName,
      'created_at': instance.createdAt,
      'user_id': instance.userId,
    };
