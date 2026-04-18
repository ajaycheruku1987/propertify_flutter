class ReelModel {
  final String id;
  final String title;
  final String description;
  final String mediaUrl;
  final String thumbnailUrl;
  final String publisherName;
  final String publisherAvatarUrl;
  final DateTime publishedAt;
  final int likes;
  final int comments;
  final int views;

  const ReelModel({
    required this.id,
    required this.title,
    required this.description,
    required this.mediaUrl,
    required this.thumbnailUrl,
    required this.publisherName,
    required this.publisherAvatarUrl,
    required this.publishedAt,
    required this.likes,
    required this.comments,
    required this.views,
  });
}