// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_profile_model.freezed.dart';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

double? _toDouble(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

@freezed
class UserProfileModel with _$UserProfileModel {
  const UserProfileModel._();
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
    @JsonKey(name: "average_rating") double? averageRating,
    @JsonKey(name: "total_reviews") int? totalReviews,
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
    String? city = json['city']?.toString();
    String? state = json['state']?.toString();
    String? country = json['country']?.toString();

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

    return UserProfileModel(
      id: json['id']?.toString() ?? json['user_id']?.toString(),
      username: json['username']?.toString(),
      firstName: json['first_name']?.toString(),
      lastName: json['last_name']?.toString(),
      email: json['email']?.toString(),
      phoneNumber: json['phone_number']?.toString(),
      profilepic: json['profilepic']?.toString(),
      role: json['role']?.toString(),
      memberSince: json['member_since']?.toString(),
      postsCount: json['posts_count'] is num ? (json['posts_count'] as num).toInt() : int.tryParse(json['posts_count']?.toString() ?? ''),
      averageRating: _toDouble(json['average_rating'] ?? json['avg_rating'] ?? json['rating'] ?? json['rating_average']),
      totalReviews: json['total_reviews'] is num ? (json['total_reviews'] as num).toInt() : (int.tryParse(json['total_reviews']?.toString() ?? json['reviews_count']?.toString() ?? json['review_count']?.toString() ?? '') ?? 0),
      city: city,
      state: state,
      country: country,
      facebookUrl: json['facebook_url']?.toString(),
      instagramUrl: json['instagram_url']?.toString(),
      whatsappChannelUrl: json['whatsapp_channel_url']?.toString(),
      websiteUrl: json['website_url']?.toString(),
      xUrl: json['x_url']?.toString(),
      youtubeUrl: json['youtube_url']?.toString(),
    );
  }
}
