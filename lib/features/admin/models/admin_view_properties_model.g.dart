// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_view_properties_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminViewPropertiesModelImpl _$$AdminViewPropertiesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminViewPropertiesModelImpl(
      total: (json['total'] as num?)?.toInt(),
      properties: (json['properties'] as List<dynamic>?)
          ?.map(
              (e) => FeedPostsResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AdminViewPropertiesModelImplToJson(
        _$AdminViewPropertiesModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'properties': instance.properties,
    };
