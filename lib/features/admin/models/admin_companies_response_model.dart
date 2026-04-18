import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'admin_companies_response_model.freezed.dart';
part 'admin_companies_response_model.g.dart';

AdminCompaniesResponseModel adminCompaniesResponseModelFromJson(String str) =>
    AdminCompaniesResponseModel.fromJson(json.decode(str));

String adminCompaniesResponseModelToJson(AdminCompaniesResponseModel data) =>
    json.encode(data.toJson());

@freezed
class AdminCompaniesResponseModel with _$AdminCompaniesResponseModel {
  const factory AdminCompaniesResponseModel({
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "companies") List<AdminCompanyModel>? companies,
  }) = _AdminCompaniesResponseModel;

  factory AdminCompaniesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AdminCompaniesResponseModelFromJson(json);
}

@freezed
class AdminCompanyModel with _$AdminCompanyModel {
  const factory AdminCompanyModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "company_name") String? companyName,
    @JsonKey(name: "category") String? category,
    @JsonKey(name: "about") String? about,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "gst_number") String? gstNumber,
    @JsonKey(name: "facebook_url") String? facebookUrl,
    @JsonKey(name: "instagram_url") String? instagramUrl,
    @JsonKey(name: "twitter_url") String? twitterUrl,
    @JsonKey(name: "website_url") String? websiteUrl,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "is_promoted") bool? isPromoted,
    @JsonKey(name: "promoted_until") String? promotedUntil,
    @JsonKey(name: "isverified") bool? isVerified,
    @JsonKey(name: "gst_verification_status") String? gstVerificationStatus,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "owner") AdminCompanyOwner? owner,
  }) = _AdminCompanyModel;

  factory AdminCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$AdminCompanyModelFromJson(json);
}

@freezed
class AdminCompanyOwner with _$AdminCompanyOwner {
  const factory AdminCompanyOwner({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "date_of_birth") String? dateOfBirth,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "profilepic") String? profilepic,
  }) = _AdminCompanyOwner;

  factory AdminCompanyOwner.fromJson(Map<String, dynamic> json) =>
      _$AdminCompanyOwnerFromJson(json);
}
