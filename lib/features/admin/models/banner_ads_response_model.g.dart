// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_ads_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannerAdsResponseModelImpl _$$BannerAdsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BannerAdsResponseModelImpl(
      bannerAds: (json['banner_ads'] as List<dynamic>?)
          ?.map((e) => BannerAdModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BannerAdsResponseModelImplToJson(
        _$BannerAdsResponseModelImpl instance) =>
    <String, dynamic>{
      'banner_ads': instance.bannerAds,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
