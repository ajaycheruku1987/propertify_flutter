// To parse this JSON data, do
//
//     final verificationRequestModel = verificationRequestModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'verification_request_model.freezed.dart';
part 'verification_request_model.g.dart';

VerificationRequestModel verificationRequestModelFromJson(String str) =>
    VerificationRequestModel.fromJson(json.decode(str));

String verificationRequestModelToJson(VerificationRequestModel data) =>
    json.encode(data.toJson());

@freezed
class VerificationRequestModel with _$VerificationRequestModel {
  const factory VerificationRequestModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "category") String? category,
    @JsonKey(name: "property_type") String? propertyType,
    @JsonKey(name: "image_urls") List<String>? imageUrls,
    @JsonKey(name: "owner_name") String? ownerName,
    @JsonKey(name: "document_type") String? documentType,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "user_id") String? userId,
  }) = _VerificationRequestModel;

  factory VerificationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationRequestModelFromJson(json);
}
