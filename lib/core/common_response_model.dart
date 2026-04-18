// To parse this JSON data, do
//
//     final commonResponseModel = commonResponseModelFromJson(jsonString);

import 'dart:convert';

CommonResponseModel commonResponseModelFromJson(String str) =>
    CommonResponseModel.fromJson(json.decode(str));

String commonResponseModelToJson(CommonResponseModel data) =>
    json.encode(data.toJson());

class CommonResponseModel {
  String? status;
  String? data;
  List<String>? errors;

  CommonResponseModel({
    this.status,
    this.data,
    this.errors,
  });

  CommonResponseModel copyWith({
    String? status,
    String? data,
    List<String>? errors,
  }) =>
      CommonResponseModel(
        status: status ?? this.status,
        data: data ?? this.data,
        errors: errors ?? this.errors,
      );

  factory CommonResponseModel.fromJson(Map<String, dynamic> json) =>
      CommonResponseModel(
        status: json["status"],
        data: json["data"],
        errors: json["errors"] == null
            ? []
            : List<String>.from(json["errors"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
        "errors":
            errors == null ? [] : List<dynamic>.from(errors!.map((x) => x)),
      };
}
