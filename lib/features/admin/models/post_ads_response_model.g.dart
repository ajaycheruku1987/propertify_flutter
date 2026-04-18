// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_ads_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostAdsResponseModelImpl _$$PostAdsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PostAdsResponseModelImpl(
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => PostAdModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PostAdsResponseModelImplToJson(
        _$PostAdsResponseModelImpl instance) =>
    <String, dynamic>{
      'posts': instance.posts,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
