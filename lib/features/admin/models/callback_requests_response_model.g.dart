// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'callback_requests_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallbackRequestsResponseModelImpl
    _$$CallbackRequestsResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$CallbackRequestsResponseModelImpl(
          callbackRequests: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  CallbackRequestModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          total: (json['total'] as num?)?.toInt(),
          page: (json['page'] as num?)?.toInt(),
          limit: (json['limit'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$CallbackRequestsResponseModelImplToJson(
        _$CallbackRequestsResponseModelImpl instance) =>
    <String, dynamic>{
      'items': instance.callbackRequests,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
