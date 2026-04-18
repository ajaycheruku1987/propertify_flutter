// To parse this JSON data, do
//
//     final adUserModel = adUserModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'ad_user_model.freezed.dart';
part 'ad_user_model.g.dart';

AdUserModel adUserModelFromJson(String str) =>
    AdUserModel.fromJson(json.decode(str));

String adUserModelToJson(AdUserModel data) => json.encode(data.toJson());

@freezed
class AdUserModel with _$AdUserModel {
  const factory AdUserModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "user_id") String? userId,
  }) = _AdUserModel;

  factory AdUserModel.fromJson(Map<String, dynamic> json) =>
      _$AdUserModelFromJson(json);
}
