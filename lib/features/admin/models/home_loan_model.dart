// To parse this JSON data, do
//
//     final homeLoanModel = homeLoanModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'home_loan_model.freezed.dart';
part 'home_loan_model.g.dart';

HomeLoanModel homeLoanModelFromJson(String str) =>
    HomeLoanModel.fromJson(json.decode(str));

String homeLoanModelToJson(HomeLoanModel data) => json.encode(data.toJson());

@freezed
class HomeLoanModel with _$HomeLoanModel {
  const factory HomeLoanModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "budget_price") String? budgetPrice,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "posted_by") String? postedBy,
    @JsonKey(name: "created_at") String? createdAt,
  }) = _HomeLoanModel;

  factory HomeLoanModel.fromJson(Map<String, dynamic> json) =>
      _$HomeLoanModelFromJson(json);
}
