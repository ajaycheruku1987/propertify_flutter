// To parse this JSON data, do
//
//     final callbackRequestsResponseModel = callbackRequestsResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'callback_request_model.dart';

part 'callback_requests_response_model.freezed.dart';
part 'callback_requests_response_model.g.dart';

CallbackRequestsResponseModel callbackRequestsResponseModelFromJson(
  String str,
) => CallbackRequestsResponseModel.fromJson(json.decode(str));

String callbackRequestsResponseModelToJson(
  CallbackRequestsResponseModel data,
) => json.encode(data.toJson());

@freezed
class CallbackRequestsResponseModel with _$CallbackRequestsResponseModel {
  const factory CallbackRequestsResponseModel({
    @JsonKey(name: "items") List<CallbackRequestModel>? callbackRequests,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "limit") int? limit,
  }) = _CallbackRequestsResponseModel;

  factory CallbackRequestsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CallbackRequestsResponseModelFromJson(json);
}
