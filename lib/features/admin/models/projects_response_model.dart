// To parse this JSON data, do
//
//     final projectsResponseModel = projectsResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'project_model.dart';

part 'projects_response_model.freezed.dart';
part 'projects_response_model.g.dart';

ProjectsResponseModel projectsResponseModelFromJson(String str) =>
    ProjectsResponseModel.fromJson(json.decode(str));

String projectsResponseModelToJson(ProjectsResponseModel data) =>
    json.encode(data.toJson());

@freezed
class ProjectsResponseModel with _$ProjectsResponseModel {
  const factory ProjectsResponseModel({
    @JsonKey(name: "projects") List<ProjectModel>? projects,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "limit") int? limit,
  }) = _ProjectsResponseModel;

  factory ProjectsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectsResponseModelFromJson(json);
}
