class ReelCommentModel {
  final String? id;
  final String? reelId;
  final String? userId;
  final String? username;
  final String? comment;
  final String? createdAt;
  final String? updatedAt;

  ReelCommentModel({
    this.id,
    this.reelId,
    this.userId,
    this.username,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  factory ReelCommentModel.fromJson(Map<String, dynamic> json) {
    return ReelCommentModel(
      id: json['id'],
      reelId: json['reel_id'],
      userId: json['user_id'],
      username: json['username'],
      comment: json['comment'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reel_id': reelId,
      'user_id': userId,
      'username': username,
      'comment': comment,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
