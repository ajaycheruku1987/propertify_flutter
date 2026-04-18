// To parse this JSON data, do
//
//     final bannerAdModel = bannerAdModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'banner_ad_model.freezed.dart';
part 'banner_ad_model.g.dart';

BannerAdModel bannerAdModelFromJson(String str) =>
    BannerAdModel.fromJson(json.decode(str));

String bannerAdModelToJson(BannerAdModel data) => json.encode(data.toJson());

@freezed
class BannerAdModel with _$BannerAdModel {
  const factory BannerAdModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "image_urls") List<String>? imageUrls,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "plan_name") String? planName,
    @JsonKey(name: "plan_days") int? planDays,
    @JsonKey(name: "amount") double? amount,
    @JsonKey(name: "terms_accepted") bool? termsAccepted,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "expires_at") String? expiresAt,
    @JsonKey(name: "approved") bool? approved,
    @JsonKey(name: "is_paid") bool? isPaid,
    @JsonKey(name: "owner") Owner? owner,
  }) = _BannerAdModel;

  factory BannerAdModel.fromJson(Map<String, dynamic> json) =>
      _$BannerAdModelFromJson(json);
}


@freezed
class Owner with _$Owner {
  const factory Owner({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "date_of_birth") DateTime? dateOfBirth,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "profilepic") String? profileImage,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
