import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'request_model.freezed.dart';
part 'request_model.g.dart';

RequestModel requestModelFromJson(String str) =>
    RequestModel.fromJson(json.decode(str));

String requestModelToJson(RequestModel data) => json.encode(data.toJson());

@freezed
class RequestModel with _$RequestModel {
  const factory RequestModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "category") String? category,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "budget") double? budget,
    @JsonKey(name: "latitude") double? latitude,
    @JsonKey(name: "longitude") double? longitude,
    @JsonKey(name: "terms_agreed") bool? termsAgreed,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "owner") RequestOwner? owner,
  }) = _RequestModel;

  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      _$RequestModelFromJson(json);
}

@freezed
class RequestOwner with _$RequestOwner {
  const factory RequestOwner({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "date_of_birth") String? dateOfBirth,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "profilepic") String? profilepic,
  }) = _RequestOwner;

  factory RequestOwner.fromJson(Map<String, dynamic> json) =>
      _$RequestOwnerFromJson(json);
}
