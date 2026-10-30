import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_review_model.freezed.dart';

double? _toDouble(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

@freezed
class SellerReviewResponseModel with _$SellerReviewResponseModel {
  const SellerReviewResponseModel._();
  const factory SellerReviewResponseModel({
    @JsonKey(name: "seller_id") String? sellerId,
    @JsonKey(name: "average_rating") double? averageRating,
    @JsonKey(name: "total_reviews") int? totalReviews,
    @JsonKey(name: "rating_distribution") Map<String, int>? ratingDistribution,
    @JsonKey(name: "my_review") SellerReviewItem? myReview,
    @JsonKey(name: "reviews") List<SellerReviewItem>? reviews,
  }) = _SellerReviewResponseModel;

  factory SellerReviewResponseModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> data = json['data'] is Map<String, dynamic>
        ? json['data'] as Map<String, dynamic>
        : (json['result'] is Map<String, dynamic> ? json['result'] as Map<String, dynamic> : json);

    var distMap = <String, int>{};
    if (data['rating_distribution'] is Map) {
      (data['rating_distribution'] as Map).forEach((k, v) {
        distMap[k.toString()] = v is num ? v.toInt() : (int.tryParse(v?.toString() ?? '0') ?? 0);
      });
    }

    var revList = <SellerReviewItem>[];
    if (data['reviews'] is List) {
      revList = (data['reviews'] as List)
          .map((e) => SellerReviewItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    // Deduplicate reviews by ID
    final seenIds = <String>{};
    revList = revList.where((r) => r.id == null || seenIds.add(r.id!)).toList();

    return SellerReviewResponseModel(
      sellerId: data['seller_id']?.toString() ?? data['user_id']?.toString() ?? data['id']?.toString(),
      averageRating: _toDouble(data['average_rating'] ?? data['avg_rating'] ?? data['rating'] ?? data['rating_average']),
      totalReviews: data['total_reviews'] is num ? (data['total_reviews'] as num).toInt() : (int.tryParse(data['total_reviews']?.toString() ?? data['reviews_count']?.toString() ?? data['review_count']?.toString() ?? '') ?? 0),
      ratingDistribution: distMap,
      myReview: data['my_review'] != null ? SellerReviewItem.fromJson(data['my_review'] as Map<String, dynamic>) : null,
      reviews: revList,
    );
  }
}

@freezed
class SellerReviewItem with _$SellerReviewItem {
  const SellerReviewItem._();
  const factory SellerReviewItem({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "rating") double? rating,
    @JsonKey(name: "review") String? review,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "reviewer") ReviewerUser? reviewer,
  }) = _SellerReviewItem;

  factory SellerReviewItem.fromJson(Map<String, dynamic> json) {
    return SellerReviewItem(
      id: json['id']?.toString() ?? json['review_id']?.toString(),
      rating: _toDouble(json['rating'] ?? json['score']),
      review: json['review']?.toString() ?? json['comment']?.toString(),
      createdAt: json['created_at']?.toString() ?? json['date']?.toString(),
      reviewer: json['reviewer'] != null ? ReviewerUser.fromJson(json['reviewer'] as Map<String, dynamic>) : null,
    );
  }
}

@freezed
class ReviewerUser with _$ReviewerUser {
  const ReviewerUser._();
  const factory ReviewerUser({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "first_name") dynamic firstName,
    @JsonKey(name: "last_name") dynamic lastName,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "profilepic") String? profilepic,
  }) = _ReviewerUser;

  factory ReviewerUser.fromJson(Map<String, dynamic> json) {
    return ReviewerUser(
      id: json['id']?.toString() ?? json['user_id']?.toString(),
      firstName: json['first_name'] ?? json['firstname'],
      lastName: json['last_name'] ?? json['lastname'],
      username: json['username']?.toString(),
      profilepic: json['profilepic']?.toString() ?? json['profile_image']?.toString(),
    );
  }
}
