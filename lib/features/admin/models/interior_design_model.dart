// To parse this JSON data, do
//
//     final interiorDesignModel = interiorDesignModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'interior_design_model.freezed.dart';
part 'interior_design_model.g.dart';

InteriorDesignModel interiorDesignModelFromJson(String str) =>
    InteriorDesignModel.fromJson(json.decode(str));

String interiorDesignModelToJson(InteriorDesignModel data) =>
    json.encode(data.toJson());

@freezed
class InteriorDesignModel with _$InteriorDesignModel {
  const factory InteriorDesignModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "budget_price") String? budgetPrice,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "posted_by") String? postedBy,
    @JsonKey(name: "created_at") String? createdAt,
  }) = _InteriorDesignModel;

  factory InteriorDesignModel.fromJson(Map<String, dynamic> json) =>
      _$InteriorDesignModelFromJson(json);
}
