// To parse this JSON data, do
//
//     final changePasswordResponseModel = changePasswordResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'change_password_response_model.freezed.dart';
part 'change_password_response_model.g.dart';

ChangePasswordResponseModel changePasswordResponseModelFromJson(String str) =>
    ChangePasswordResponseModel.fromJson(json.decode(str));

String changePasswordResponseModelToJson(ChangePasswordResponseModel data) =>
    json.encode(data.toJson());

@freezed
class ChangePasswordResponseModel with _$ChangePasswordResponseModel {
  const factory ChangePasswordResponseModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "message") String? message,
  }) = _ChangePasswordResponseModel;

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseModelFromJson(json);
}
