// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_banner_ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateBannerAdResponseModelImpl _$$CreateBannerAdResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateBannerAdResponseModelImpl(
      id: json['id'] as String,
      description: json['description'] as String,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      planName: json['planName'] as String,
      planDays: (json['planDays'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CreateBannerAdResponseModelImplToJson(
        _$CreateBannerAdResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'imageUrls': instance.imageUrls,
      'planName': instance.planName,
      'planDays': instance.planDays,
      'amount': instance.amount,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
    };
