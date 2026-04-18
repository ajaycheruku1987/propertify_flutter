// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interior_designs_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InteriorDesignsResponseModelImpl _$$InteriorDesignsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InteriorDesignsResponseModelImpl(
      interiorDesigns: (json['interior_designs'] as List<dynamic>?)
          ?.map((e) => InteriorDesignModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$InteriorDesignsResponseModelImplToJson(
        _$InteriorDesignsResponseModelImpl instance) =>
    <String, dynamic>{
      'interior_designs': instance.interiorDesigns,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
