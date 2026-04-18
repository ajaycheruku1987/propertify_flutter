// To parse this JSON data, do
//
//     final userListResponseModel = userListResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'user_model.dart';

part 'user_list_response_model.freezed.dart';
part 'user_list_response_model.g.dart';

UserListResponseModel userListResponseModelFromJson(String str) =>
    UserListResponseModel.fromJson(json.decode(str));

String userListResponseModelToJson(UserListResponseModel data) =>
    json.encode(data.toJson());

@freezed
class UserListResponseModel with _$UserListResponseModel {
  const factory UserListResponseModel({
    @JsonKey(name: "users") List<UserModel>? users,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "page") int? page,
    @JsonKey(name: "limit") int? limit,
  }) = _UserListResponseModel;

  factory UserListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserListResponseModelFromJson(json);
}

