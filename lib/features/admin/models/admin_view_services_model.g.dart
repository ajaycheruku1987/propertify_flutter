// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_view_services_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminViewServicesModelImpl _$$AdminViewServicesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminViewServicesModelImpl(
      total: (json['total'] as num?)?.toInt(),
      services: (json['services'] as List<dynamic>?)
          ?.map(
              (e) => ServicesResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AdminViewServicesModelImplToJson(
        _$AdminViewServicesModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'services': instance.services,
    };
