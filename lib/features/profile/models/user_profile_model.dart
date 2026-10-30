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
    final Map<String, dynamic> data = json['data'] is Map<String, dynamic>
        ? json['data'] as Map<String, dynamic>
        : (json['result'] is Map<String, dynamic> ? json['result'] as Map<String, dynamic> : json);

    String? city = data['city']?.toString();
    String? state = data['state']?.toString();
    String? country = data['country']?.toString();

    if ((city == null || city.isEmpty) && data['location'] is String && (data['location'] as String).isNotEmpty) {
      final parts = (data['location'] as String).split(',');
      if (parts.isNotEmpty) city = parts[0].trim();
      if (parts.length > 1) state = parts[1].trim();
      if (parts.length > 2) country = parts[2].trim();
    }

    if ((city == null || city.isEmpty) && data['address'] is String && (data['address'] as String).isNotEmpty) {
      final parts = (data['address'] as String).split(',');
      if (parts.isNotEmpty && city == null) city = parts.last.trim();
    }

    return UserProfileModel(
      id: data['id']?.toString() ?? data['user_id']?.toString(),
      username: data['username']?.toString(),
      firstName: data['first_name']?.toString(),
      lastName: data['last_name']?.toString(),
      email: data['email']?.toString(),
      phoneNumber: data['phone_number']?.toString(),
      profilepic: data['profilepic']?.toString(),
      role: data['role']?.toString(),
      memberSince: data['member_since']?.toString(),
      postsCount: data['posts_count'] is num ? (data['posts_count'] as num).toInt() : int.tryParse(data['posts_count']?.toString() ?? ''),
      averageRating: _toDouble(data['average_rating'] ?? data['avg_rating'] ?? data['rating'] ?? data['rating_average']),
      totalReviews: data['total_reviews'] is num ? (data['total_reviews'] as num).toInt() : (int.tryParse(data['total_reviews']?.toString() ?? data['reviews_count']?.toString() ?? data['review_count']?.toString() ?? '') ?? 0),
      city: city,
      state: state,
      country: country,
      facebookUrl: data['facebook_url']?.toString(),
      instagramUrl: data['instagram_url']?.toString(),
      whatsappChannelUrl: data['whatsapp_channel_url']?.toString(),
      websiteUrl: data['website_url']?.toString(),
      xUrl: data['x_url']?.toString(),
      youtubeUrl: data['youtube_url']?.toString(),
    );
  }
}
