// To parse this JSON data, do
//
//     final salesModel = salesModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'sales_model.freezed.dart';
part 'sales_model.g.dart';

SalesModel salesModelFromJson(String str) =>
    SalesModel.fromJson(json.decode(str));

String salesModelToJson(SalesModel data) => json.encode(data.toJson());

@freezed
class SalesModel with _$SalesModel {
  const factory SalesModel({
    @JsonKey(name: "items") List<SaleRecord>? salerecords,
    @JsonKey(name: "meta") Meta? meta,
  }) = _SalesModel;

  factory SalesModel.fromJson(Map<String, dynamic> json) =>
      _$SalesModelFromJson(json);
}

@freezed
class SaleRecord with _$SaleRecord {
  const factory SaleRecord({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "property_type") String? propertyType,
    @JsonKey(name: "project_name") String? projectName,
    @JsonKey(name: "area") int? area,
    @JsonKey(name: "area_unit") String? areaUnit,
    @JsonKey(name: "no_of_units") int? noOfUnits,
    @JsonKey(name: "rera_number") String? reraNumber,
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
    @JsonKey(name: "owner") Owner? owner,
    @JsonKey(name: "possession_date") String? possessionDate,
    @JsonKey(name: "min_price") num? minPrice,
    @JsonKey(name: "max_price") num? maxPrice,
    @JsonKey(name: "sale_specification") String? saleSpecification,
  }) = _SaleRecord;

  factory SaleRecord.fromJson(Map<String, dynamic> json) =>
      _$SaleRecordFromJson(json);
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
    @JsonKey(name: "profilepic") dynamic profilepic,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
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
