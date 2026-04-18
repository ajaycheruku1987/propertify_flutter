// To parse this JSON data, do
//
//     final verificationRequestsResponseModel = verificationRequestsResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'verification_request_model.dart';

part 'verification_requests_response_model.freezed.dart';
part 'verification_requests_response_model.g.dart';

VerificationRequestsResponseModel verificationRequestsResponseModelFromJson(String str) =>
    VerificationRequestsResponseModel.fromJson(json.decode(str));

String verificationRequestsResponseModelToJson(VerificationRequestsResponseModel data) =>
    json.encode(data.toJson());

@freezed
class VerificationRequestsResponseModel with _$VerificationRequestsResponseModel {
  const factory VerificationRequestsResponseModel({
    @JsonKey(name: "verification_requests") List<VerificationRequestModel>? verificationRequests,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "limit") int? limit,
  }) = _VerificationRequestsResponseModel;

  factory VerificationRequestsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationRequestsResponseModelFromJson(json);
}
