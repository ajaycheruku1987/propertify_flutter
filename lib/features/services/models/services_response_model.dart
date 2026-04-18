// To parse this JSON data, do
//
//     final servicesResponseModel = servicesResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'services_response_model.freezed.dart';
part 'services_response_model.g.dart';

List<ServicesResponseModel> servicesResponseModelFromJson(String str) =>
    List<ServicesResponseModel>.from(
      json.decode(str).map((x) => ServicesResponseModel.fromJson(x)),
    );

String servicesResponseModelToJson(List<ServicesResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ServicesResponseModel with _$ServicesResponseModel {
  const factory ServicesResponseModel({
    @JsonKey(name: "agent_name") String? agentName,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "pincode") String? pincode,
    @JsonKey(name: "latitude") String? latitude,
    @JsonKey(name: "longitude") String? longitude,
    @JsonKey(name: "social_facebook") String? socialFacebook,
    @JsonKey(name: "social_instagram") String? socialInstagram,
    @JsonKey(name: "social_linkedin") String? socialLinkedin,
    @JsonKey(name: "image_urls") List<String>? imageUrls,
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "category") List<String>? category,
    @JsonKey(name: "is_verified") bool? isVerified,
    @JsonKey(name: "rating") String? rating,
    @JsonKey(name: "rating_count") int? ratingCount,
    @JsonKey(name: "is_promoted") bool? isPromoted,
    @JsonKey(name: "promoted_until") String? promotedUntil,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "aadhar_card_image_url") String? aadharCardImageUrl,
    @JsonKey(name: "aadhar_verification_status")
    String? aadharVerificationStatus,
    @JsonKey(name: "owner") Owner? owner,
    @JsonKey(name: "my_review") MyReview? myReview,
  }) = _ServicesResponseModel;

  factory ServicesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesResponseModelFromJson(json);
}

@freezed
class MyReview with _$MyReview {
  const factory MyReview({
    @JsonKey(name: "rating") int? rating,
    @JsonKey(name: "review") String? review,
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "service_id") String? serviceId,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "created_at") String? createdAt,
  }) = _MyReview;

  factory MyReview.fromJson(Map<String, dynamic> json) =>
      _$MyReviewFromJson(json);
}

@freezed
class Owner with _$Owner {
  const factory Owner({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "date_of_birth") String? dateOfBirth,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "profilepic") String? profilepic,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
