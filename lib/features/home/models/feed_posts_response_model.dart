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

String? _toString(dynamic value) => value?.toString();

double? _toDouble(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

@freezed
class FeedPostsResponseModel with _$FeedPostsResponseModel {
  const FeedPostsResponseModel._();

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
    @JsonKey(name: "latitude", fromJson: _toDouble) double? latitude,
    @JsonKey(name: "longitude", fromJson: _toDouble) double? longitude,
    @JsonKey(name: "is_promoted") bool? isPromoted,
    @JsonKey(name: "promoted_at") String? promotedAt,
    @JsonKey(name: "promoted_until") String? promotedUntil,
    @JsonKey(name: "owner") Owner? owner,
    @JsonKey(name: "is_favourited") bool? isFavourited,
    @JsonKey(name: "is_liked") bool? isLiked,
    @JsonKey(name: "likes_count") int? likesCount,
    @JsonKey(name: "comments_count") int? commentsCount,
    @JsonKey(name: "views_count") int? viewsCount,
    @JsonKey(name: "plot_area", fromJson: _toString) String? plotArea,
    @JsonKey(name: "area_unit", fromJson: _toString) String? areaUnit,
    @JsonKey(name: "facing", fromJson: _toString) String? facing,
    @JsonKey(name: "road_width", fromJson: _toString) String? roadWidth,
    @JsonKey(name: "posted_by", fromJson: _toString) String? postedBy,
    @JsonKey(name: "approval_status", fromJson: _toString) String? approvalStatus,
    @JsonKey(name: "dimensions", fromJson: _toString) String? dimensions,
    @JsonKey(name: "is_corner_plot") bool? isCornerPlot,
    @JsonKey(name: "is_gated_community") bool? isGatedCommunity,
    @JsonKey(name: "main_category", fromJson: _toString) String? mainCategory,
    @JsonKey(name: "sub_category", fromJson: _toString) String? subCategory,
    @JsonKey(name: "is_negotiable") bool? isNegotiable,
    @JsonKey(name: "security_deposit", fromJson: _toString) String? securityDeposit,
    @JsonKey(name: "property_status", fromJson: _toString) String? propertyStatus,
    @JsonKey(name: "contact_via_phone") bool? contactViaPhone,
    @JsonKey(name: "contact_via_whatsapp") bool? contactViaWhatsApp,
    @JsonKey(name: "carpet_area", fromJson: _toString) String? carpetArea,
    @JsonKey(name: "carpet_area_unit", fromJson: _toString) String? carpetAreaUnit,
  }) = _FeedPostsResponseModel;

  factory FeedPostsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FeedPostsResponseModelFromJson(json);

  bool get isCurrentlyPromoted {
    if (isPromoted == null || !isPromoted!) return false;
    if (promotedUntil == null || promotedUntil!.isEmpty) return false;
    try {
      String dateStr = promotedUntil!;
      if (!dateStr.contains('Z') && !dateStr.contains('+')) {
        dateStr = dateStr.replaceAll(' ', 'T');
        if (!dateStr.contains('T')) {
          dateStr += 'T23:59:59Z';
        } else {
          dateStr += 'Z';
        }
      }
      final expiryDate = DateTime.parse(dateStr).toUtc();
      return expiryDate.isAfter(DateTime.now().toUtc());
    } catch (e) {
      return false;
    }
  }
}

@freezed
class Owner with _$Owner {
  const factory Owner({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "first_name") dynamic firstName,
    @JsonKey(name: "last_name") dynamic lastName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "date_of_birth") dynamic dateOfBirth,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "profilepic") String? profileImage,
    @JsonKey(name: "member_since") String? memberSince,
    @JsonKey(name: "posts_count") int? postsCount,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
