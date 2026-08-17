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
  const BannerAdModel._();

  const factory BannerAdModel({
    @JsonKey(name: "amount") double? amount,
    @JsonKey(name: "approved") bool? approved,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "expires_at") String? expiresAt,
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "image_urls") List<String>? imageUrls,
    @JsonKey(name: "is_paid") bool? isPaid,
    @JsonKey(name: "owner") Owner? owner,
    @JsonKey(name: "plan_days") int? planDays,
    @JsonKey(name: "plan_name") String? planName,
    @JsonKey(name: "terms_accepted") bool? termsAccepted,
    @JsonKey(name: "user_id") String? userId,
  }) = _BannerAdModel;

  factory BannerAdModel.fromJson(Map<String, dynamic> json) =>
      _$BannerAdModelFromJson(json);

  bool get isCurrentlyActive {
    if (expiresAt == null) return true;
    try {
      final expiryDate = DateTime.parse(expiresAt!);
      return expiryDate.isAfter(DateTime.now());
    } catch (e) {
      return true;
    }
  }
}

@freezed
class Owner with _$Owner {
  const factory Owner({
    @JsonKey(name: "date_of_birth") DateTime? dateOfBirth,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "profilepic") String? profileImage,
    @JsonKey(name: "username") String? username,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
