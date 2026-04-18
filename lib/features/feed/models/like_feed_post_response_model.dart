// To parse this JSON data, do
//
//     final likeFeedPostResponseModel = likeFeedPostResponseModelFromJson(jsonString);

import 'dart:convert';

LikeFeedPostResponseModel likeFeedPostResponseModelFromJson(String str) => LikeFeedPostResponseModel.fromJson(json.decode(str));

String likeFeedPostResponseModelToJson(LikeFeedPostResponseModel data) => json.encode(data.toJson());

class LikeFeedPostResponseModel {
    String? message;
    String? likeId;

    LikeFeedPostResponseModel({
        this.message,
        this.likeId,
    });

    LikeFeedPostResponseModel copyWith({
        String? message,
        String? likeId,
    }) => 
        LikeFeedPostResponseModel(
            message: message ?? this.message,
            likeId: likeId ?? this.likeId,
        );

    factory LikeFeedPostResponseModel.fromJson(Map<String, dynamic> json) => LikeFeedPostResponseModel(
        message: json["message"],
        likeId: json["like_id"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "like_id": likeId,
    };
}
