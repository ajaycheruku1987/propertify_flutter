// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "profilepic") String? profilepic,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "member_since") String? memberSince,
    @JsonKey(name: "posts_count") int? postsCount,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "facebook_url") String? facebookUrl,
    @JsonKey(name: "instagram_url") String? instagramUrl,
    @JsonKey(name: "whatsapp_channel_url") String? whatsappChannelUrl,
    @JsonKey(name: "website_url") String? websiteUrl,
    @JsonKey(name: "x_url") String? xUrl,
    @JsonKey(name: "youtube_url") String? youtubeUrl,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    var model = _$UserProfileModelFromJson(json);
    String? city = model.city;
    String? state = model.state;
    String? country = model.country;

    if ((city == null || city.isEmpty) && json['location'] is String && (json['location'] as String).isNotEmpty) {
      final parts = (json['location'] as String).split(',');
      if (parts.isNotEmpty) city = parts[0].trim();
      if (parts.length > 1) state = parts[1].trim();
      if (parts.length > 2) country = parts[2].trim();
    }

    if ((city == null || city.isEmpty) && json['address'] is String && (json['address'] as String).isNotEmpty) {
      final parts = (json['address'] as String).split(',');
      if (parts.isNotEmpty && city == null) city = parts.last.trim();
    }

    return model.copyWith(
      city: city,
      state: state,
      country: country,
    );
  }
}
