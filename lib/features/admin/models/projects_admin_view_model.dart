import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'projects_admin_view_model.freezed.dart';
part 'projects_admin_view_model.g.dart';

ProjectsAdminViewModel projectsAdminViewModelFromJson(String str) =>
    ProjectsAdminViewModel.fromJson(json.decode(str));

String projectsAdminViewModelToJson(ProjectsAdminViewModel data) =>
    json.encode(data.toJson());

@freezed
class ProjectsAdminResponse with _$ProjectsAdminResponse {
  const factory ProjectsAdminResponse({
    @JsonKey(name: "items") List<ProjectsAdminViewModel>? items,
    @JsonKey(name: "meta") Meta? meta,
  }) = _ProjectsAdminResponse;

  factory ProjectsAdminResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectsAdminResponseFromJson(json);
}

@freezed
class ProjectsAdminViewModel with _$ProjectsAdminViewModel {
  const factory ProjectsAdminViewModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "property_type") String? propertyType,
    @JsonKey(name: "project_name") String? projectName,
    @JsonKey(name: "area") double? area,
    @JsonKey(name: "area_unit") String? areaUnit,
    @JsonKey(name: "rera_number") String? reraNumber,
    @JsonKey(name: "no_of_units") int? noOfUnits,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "specifications") String? specifications,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "location") String? location,
    @JsonKey(name: "latitude") double? latitude,
    @JsonKey(name: "longitude") double? longitude,
    @JsonKey(name: "public_facilities") String? publicFacilities,
    @JsonKey(name: "image_urls") List<String>? imageUrls,
    @JsonKey(name: "brochure_url") String? brochureUrl,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "owner") ProjectOwner? owner,
  }) = _ProjectsAdminViewModel;

  factory ProjectsAdminViewModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectsAdminViewModelFromJson(json);
}

@freezed
class ProjectOwner with _$ProjectOwner {
  const factory ProjectOwner({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "date_of_birth") String? dateOfBirth,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "profilepic") String? profilepic,
  }) = _ProjectOwner;

  factory ProjectOwner.fromJson(Map<String, dynamic> json) =>
      _$ProjectOwnerFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "page_size") int? pageSize,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "has_next") bool? hasNext,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
