// To parse this JSON data, do
//
//     final interiorDesignsResponseModel = interiorDesignsResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'interior_design_model.dart';

part 'interior_designs_response_model.freezed.dart';
part 'interior_designs_response_model.g.dart';

InteriorDesignsResponseModel interiorDesignsResponseModelFromJson(String str) =>
    InteriorDesignsResponseModel.fromJson(json.decode(str));

String interiorDesignsResponseModelToJson(InteriorDesignsResponseModel data) =>
    json.encode(data.toJson());

@freezed
class InteriorDesignsResponseModel with _$InteriorDesignsResponseModel {
  const factory InteriorDesignsResponseModel({
    @JsonKey(name: "interior_designs") List<InteriorDesignModel>? interiorDesigns,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "limit") int? limit,
  }) = _InteriorDesignsResponseModel;

  factory InteriorDesignsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InteriorDesignsResponseModelFromJson(json);
}
