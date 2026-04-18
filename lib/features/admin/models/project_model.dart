// To parse this JSON data, do
//
//     final projectModel = projectModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

ProjectModel projectModelFromJson(String str) =>
    ProjectModel.fromJson(json.decode(str));

String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "category") String? category,
    @JsonKey(name: "property_type") String? propertyType,
    @JsonKey(name: "image_urls") List<String>? imageUrls,
    @JsonKey(name: "owner_name") String? ownerName,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "user_id") String? userId,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}
