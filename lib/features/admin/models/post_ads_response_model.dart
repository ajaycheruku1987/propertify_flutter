// To parse this JSON data, do
//
//     final postAdsResponseModel = postAdsResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'post_ad_model.dart';

part 'post_ads_response_model.freezed.dart';
part 'post_ads_response_model.g.dart';

PostAdsResponseModel postAdsResponseModelFromJson(String str) =>
    PostAdsResponseModel.fromJson(json.decode(str));

String postAdsResponseModelToJson(PostAdsResponseModel data) =>
    json.encode(data.toJson());

@freezed
class PostAdsResponseModel with _$PostAdsResponseModel {
  const factory PostAdsResponseModel({
    @JsonKey(name: "posts") List<PostAdModel>? posts,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "limit") int? limit,
  }) = _PostAdsResponseModel;

  factory PostAdsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostAdsResponseModelFromJson(json);
}
