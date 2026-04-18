// To parse this JSON data, do
//
//     final feedCommentModel = feedCommentModelFromJson(jsonString);

import 'dart:convert';

List<FeedCommentModel> feedCommentModelFromJson(String str) =>
    List<FeedCommentModel>.from(
      json.decode(str).map((x) => FeedCommentModel.fromJson(x)),
    );

String feedCommentModelToJson(List<FeedCommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedCommentModel {
  String? id;
  String? propertyId;
  String? userId;
  String? comment;
  String? createdAt;
  String? username;

  FeedCommentModel({
    this.id,
    this.propertyId,
    this.userId,
    this.comment,
    this.createdAt,
    this.username,
  });

  FeedCommentModel copyWith({
    String? id,
    String? propertyId,
    String? userId,
    String? comment,
    String? createdAt,
    String? username,
  }) => FeedCommentModel(
    id: id ?? this.id,
    propertyId: propertyId ?? this.propertyId,
    userId: userId ?? this.userId,
    comment: comment ?? this.comment,
    createdAt: createdAt ?? this.createdAt,
    username: username ?? this.username,
  );

  factory FeedCommentModel.fromJson(Map<String, dynamic> json) =>
      FeedCommentModel(
        id: json["id"],
        propertyId: json["property_id"],
        userId: json["user_id"],
        comment: json["comment"],
        createdAt: json["created_at"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "property_id": propertyId,
    "user_id": userId,
    "comment": comment,
    "created_at": createdAt,
    "username": username,
  };
}
