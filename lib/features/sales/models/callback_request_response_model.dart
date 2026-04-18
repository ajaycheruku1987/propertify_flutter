import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'callback_request_response_model.freezed.dart';
part 'callback_request_response_model.g.dart';

CallbackRequestResponseModel callbackRequestResponseModelFromJson(String str) =>
    CallbackRequestResponseModel.fromJson(json.decode(str));

String callbackRequestResponseModelToJson(CallbackRequestResponseModel data) =>
    json.encode(data.toJson());

@freezed
class CallbackRequestResponseModel with _$CallbackRequestResponseModel {
  const factory CallbackRequestResponseModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "sales_project_id") String? salesProjectId,
    @JsonKey(name: "requested_by_user_id") String? requestedByUserId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "preferred_time") String? preferredTime,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _CallbackRequestResponseModel;

  factory CallbackRequestResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CallbackRequestResponseModelFromJson(json);
}
