// To parse this JSON data, do
//
//     final serviceReviewsResponseModel = serviceReviewsResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'service_reviews_response_model.freezed.dart';
part 'service_reviews_response_model.g.dart';

List<ServiceReviewsResponseModel> serviceReviewsResponseModelFromJson(
  String str,
) => List<ServiceReviewsResponseModel>.from(
  json.decode(str).map((x) => ServiceReviewsResponseModel.fromJson(x)),
);

String serviceReviewsResponseModelToJson(
  List<ServiceReviewsResponseModel> data,
) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ServiceReviewsResponseModel with _$ServiceReviewsResponseModel {
  const factory ServiceReviewsResponseModel({
    @JsonKey(name: "rating") int? rating,
    @JsonKey(name: "review") String? review,
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "service_id") String? serviceId,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "user") User? user,
  }) = _ServiceReviewsResponseModel;

  factory ServiceReviewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceReviewsResponseModelFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "profilepic") String? profilepic,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
