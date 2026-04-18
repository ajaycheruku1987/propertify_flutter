// To parse this JSON data, do
//
//     final homeLoansResponseModel = homeLoansResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'home_loan_model.dart';

part 'home_loans_response_model.freezed.dart';
part 'home_loans_response_model.g.dart';

HomeLoansResponseModel homeLoansResponseModelFromJson(String str) =>
    HomeLoansResponseModel.fromJson(json.decode(str));

String homeLoansResponseModelToJson(HomeLoansResponseModel data) =>
    json.encode(data.toJson());

@freezed
class HomeLoansResponseModel with _$HomeLoansResponseModel {
  const factory HomeLoansResponseModel({
    @JsonKey(name: "home_loans") List<HomeLoanModel>? homeLoans,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "limit") int? limit,
  }) = _HomeLoansResponseModel;

  factory HomeLoansResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeLoansResponseModelFromJson(json);
}
