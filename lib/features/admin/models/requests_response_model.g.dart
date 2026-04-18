// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminViewRequestsModelImpl _$$AdminViewRequestsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminViewRequestsModelImpl(
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) => RequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AdminViewRequestsModelImplToJson(
        _$AdminViewRequestsModelImpl instance) =>
    <String, dynamic>{
      'requests': instance.requests,
      'total': instance.total,
    };
