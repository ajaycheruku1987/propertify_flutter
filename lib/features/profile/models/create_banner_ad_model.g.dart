// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_banner_ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateBannerAdResponseModelImpl _$$CreateBannerAdResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateBannerAdResponseModelImpl(
      amount: (json['amount'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String,
      id: json['id'] as String,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      planDays: (json['planDays'] as num).toInt(),
      planName: json['planName'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$CreateBannerAdResponseModelImplToJson(
        _$CreateBannerAdResponseModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
      'description': instance.description,
      'id': instance.id,
      'imageUrls': instance.imageUrls,
      'planDays': instance.planDays,
      'planName': instance.planName,
      'status': instance.status,
    };
