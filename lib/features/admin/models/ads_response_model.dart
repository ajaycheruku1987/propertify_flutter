// To parse this JSON data, do
//
//     final adsResponseModel = adsResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'ad_user_model.dart';

part 'ads_response_model.freezed.dart';
part 'ads_response_model.g.dart';

AdsResponseModel adsResponseModelFromJson(String str) =>
    AdsResponseModel.fromJson(json.decode(str));

String adsResponseModelToJson(AdsResponseModel data) =>
    json.encode(data.toJson());

@freezed
class AdsResponseModel with _$AdsResponseModel {
  const factory AdsResponseModel({
    @JsonKey(name: "ads") List<AdUserModel>? ads,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "limit") int? limit,
  }) = _AdsResponseModel;

  factory AdsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AdsResponseModelFromJson(json);
}
