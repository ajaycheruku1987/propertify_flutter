// To parse this JSON data, do
//
//     final bannerAdsResponseModel = bannerAdsResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../../profile/models/banner_ad_model.dart';

part 'banner_ads_response_model.freezed.dart';
part 'banner_ads_response_model.g.dart';

BannerAdsResponseModel bannerAdsResponseModelFromJson(String str) =>
    BannerAdsResponseModel.fromJson(json.decode(str));

String bannerAdsResponseModelToJson(BannerAdsResponseModel data) =>
    json.encode(data.toJson());

@freezed
class BannerAdsResponseModel with _$BannerAdsResponseModel {
  const factory BannerAdsResponseModel({
    @JsonKey(name: "banner_ads") List<BannerAdModel>? bannerAds,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "limit") int? limit,
  }) = _BannerAdsResponseModel;

  factory BannerAdsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BannerAdsResponseModelFromJson(json);
}
