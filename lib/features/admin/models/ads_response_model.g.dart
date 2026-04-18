// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdsResponseModelImpl _$$AdsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdsResponseModelImpl(
      ads: (json['ads'] as List<dynamic>?)
          ?.map((e) => AdUserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AdsResponseModelImplToJson(
        _$AdsResponseModelImpl instance) =>
    <String, dynamic>{
      'ads': instance.ads,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
