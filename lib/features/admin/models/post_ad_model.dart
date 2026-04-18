// To parse this JSON data, do
//
//     final postAdModel = postAdModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'post_ad_model.freezed.dart';
part 'post_ad_model.g.dart';

PostAdModel postAdModelFromJson(String str) =>
    PostAdModel.fromJson(json.decode(str));

String postAdModelToJson(PostAdModel data) => json.encode(data.toJson());

@freezed
class PostAdModel with _$PostAdModel {
  const factory PostAdModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "property_type") String? propertyType,
    @JsonKey(name: "category") String? category,
    @JsonKey(name: "image_urls") List<String>? imageUrls,
    @JsonKey(name: "owner_name") String? ownerName,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "user_id") String? userId,
  }) = _PostAdModel;

  factory PostAdModel.fromJson(Map<String, dynamic> json) =>
      _$PostAdModelFromJson(json);
}
