class LikeReelResponseModel {
  final String message;
  final String likeId;

  LikeReelResponseModel({required this.message, required this.likeId});

  factory LikeReelResponseModel.fromJson(Map<String, dynamic> json) {
    return LikeReelResponseModel(
      message: json['message'] as String,
      likeId: json['like_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'like_id': likeId};
  }
}
