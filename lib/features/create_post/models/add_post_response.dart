// To parse this JSON data, do
//
//     final addPostResponse = addPostResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_post_response.freezed.dart';
part 'add_post_response.g.dart';

AddPostResponse addPostResponseFromJson(String str) => AddPostResponse.fromJson(json.decode(str));

String addPostResponseToJson(AddPostResponse data) => json.encode(data.toJson());

@freezed
class AddPostResponse with _$AddPostResponse {
    const factory AddPostResponse({
        @JsonKey(name: "id")
        String? id,
        @JsonKey(name: "user_id")
        String? userId,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "city")
        String? city,
        @JsonKey(name: "address")
        String? address,
        @JsonKey(name: "property_type")
        String? propertyType,
        @JsonKey(name: "listing_type")
        String? listingType,
        @JsonKey(name: "price")
        int? price,
        @JsonKey(name: "image_urls")
        List<String>? imageUrls,
        @JsonKey(name: "is_featured")
        bool? isFeatured,
        @JsonKey(name: "rating")
        int? rating,
        @JsonKey(name: "created_at")
        String? createdAt,
        @JsonKey(name: "latitude")
        double? latitude,
        @JsonKey(name: "longitude")
        double? longitude,
        @JsonKey(name: "is_promoted")
        bool? isPromoted,
        @JsonKey(name: "promoted_until")
        dynamic promotedUntil,
        @JsonKey(name: "owner")
        Owner? owner,
    }) = _AddPostResponse;

    factory AddPostResponse.fromJson(Map<String, dynamic> json) => _$AddPostResponseFromJson(json);
}

@freezed
class Owner with _$Owner {
    const factory Owner({
        @JsonKey(name: "id")
        String? id,
        @JsonKey(name: "first_name")
        dynamic firstName,
        @JsonKey(name: "last_name")
        dynamic lastName,
        @JsonKey(name: "email")
        String? email,
        @JsonKey(name: "phone_number")
        String? phoneNumber,
        @JsonKey(name: "date_of_birth")
        dynamic dateOfBirth,
    }) = _Owner;

    factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
