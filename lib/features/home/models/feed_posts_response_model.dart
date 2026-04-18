// To parse this JSON data, do
//
//     final feedPostsResponseModel = feedPostsResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'feed_posts_response_model.freezed.dart';
part 'feed_posts_response_model.g.dart';

List<FeedPostsResponseModel> feedPostsResponseModelFromJson(String str) =>
    List<FeedPostsResponseModel>.from(
      json.decode(str).map((x) => FeedPostsResponseModel.fromJson(x)),
    );

String feedPostsResponseModelToJson(List<FeedPostsResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class FeedPostsResponseModel with _$FeedPostsResponseModel {
  const factory FeedPostsResponseModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "property_type") String? propertyType,
    @JsonKey(name: "listing_type") String? listingType,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "image_urls") List<String>? imageUrls,
    @JsonKey(name: "is_featured") bool? isFeatured,
    @JsonKey(name: "rating") int? rating,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "latitude") int? latitude,
    @JsonKey(name: "longitude") int? longitude,
    @JsonKey(name: "is_promoted") bool? isPromoted,
    @JsonKey(name: "promoted_until") String? promotedUntil,
    @JsonKey(name: "owner") Owner? owner,
    @JsonKey(name: "is_favourited") bool? isFavourited,
    @JsonKey(name: "is_liked") bool? isLiked,
    @JsonKey(name: "likes_count") int? likesCount,
    @JsonKey(name: "comments_count") int? commentsCount,
    @JsonKey(name: "views_count") int? viewsCount,
  }) = _FeedPostsResponseModel;

  factory FeedPostsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FeedPostsResponseModelFromJson(json);
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
