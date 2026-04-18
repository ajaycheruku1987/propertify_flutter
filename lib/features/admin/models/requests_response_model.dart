import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
import 'request_model.dart';

part 'requests_response_model.freezed.dart';
part 'requests_response_model.g.dart';

AdminViewRequestsModel adminViewRequestsModelFromJson(String str) =>
    AdminViewRequestsModel.fromJson(json.decode(str));

String adminViewRequestsModelToJson(AdminViewRequestsModel data) =>
    json.encode(data.toJson());

@freezed
class AdminViewRequestsModel with _$AdminViewRequestsModel {
  const factory AdminViewRequestsModel({
    @JsonKey(name: "requests") List<RequestModel>? requests,
    @JsonKey(name: "total") int? total,
  }) = _AdminViewRequestsModel;

  factory AdminViewRequestsModel.fromJson(Map<String, dynamic> json) =>
      _$AdminViewRequestsModelFromJson(json);
}
