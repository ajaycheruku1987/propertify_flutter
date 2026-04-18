// To parse this JSON data, do
//
//     final callbackRequestModel = callbackRequestModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'callback_request_model.freezed.dart';
part 'callback_request_model.g.dart';

CallbackRequestModel callbackRequestModelFromJson(String str) =>
    CallbackRequestModel.fromJson(json.decode(str));

String callbackRequestModelToJson(CallbackRequestModel data) =>
    json.encode(data.toJson());

@freezed
class CallbackRequestModel with _$CallbackRequestModel {
  const factory CallbackRequestModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "sales_project_id") String? salesProjectId,
    @JsonKey(name: "requested_by_user_id") String? requestedByUserId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "preferred_time") String? preferredTime,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "project_name") String? projectName,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _CallbackRequestModel;

  factory CallbackRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CallbackRequestModelFromJson(json);
}
