// To parse this JSON data, do
//
//     final forgotPasswordResponseModel = forgotPasswordResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'forgot_password_response_model.freezed.dart';
part 'forgot_password_response_model.g.dart';

ForgotPasswordResponseModel forgotPasswordResponseModelFromJson(String str) =>
    ForgotPasswordResponseModel.fromJson(json.decode(str));

String forgotPasswordResponseModelToJson(ForgotPasswordResponseModel data) =>
    json.encode(data.toJson());

@freezed
class ForgotPasswordResponseModel with _$ForgotPasswordResponseModel {
  const factory ForgotPasswordResponseModel({
    @JsonKey(name: "status") int? status,
    @JsonKey(name: "message") String? message,
  }) = _ForgotPasswordResponseModel;

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseModelFromJson(json);
}
