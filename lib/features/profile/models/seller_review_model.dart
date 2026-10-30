import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_review_model.freezed.dart';
part 'seller_review_model.g.dart';

double? _toDouble(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

@freezed
class SellerReviewResponseModel with _$SellerReviewResponseModel {
  const factory SellerReviewResponseModel({
    @JsonKey(name: "seller_id") String? sellerId,
    @JsonKey(name: "average_rating", fromJson: _toDouble) double? averageRating,
    @JsonKey(name: "total_reviews") int? totalReviews,
    @JsonKey(name: "rating_distribution") Map<String, int>? ratingDistribution,
    @JsonKey(name: "my_review") SellerReviewItem? myReview,
    @JsonKey(name: "reviews") List<SellerReviewItem>? reviews,
  }) = _SellerReviewResponseModel;

  factory SellerReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SellerReviewResponseModelFromJson(json);
}

@freezed
class SellerReviewItem with _$SellerReviewItem {
  const factory SellerReviewItem({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "rating", fromJson: _toDouble) double? rating,
    @JsonKey(name: "review") String? review,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "reviewer") ReviewerUser? reviewer,
  }) = _SellerReviewItem;

  factory SellerReviewItem.fromJson(Map<String, dynamic> json) =>
      _$SellerReviewItemFromJson(json);
}

@freezed
class ReviewerUser with _$ReviewerUser {
  const factory ReviewerUser({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "first_name") dynamic firstName,
    @JsonKey(name: "last_name") dynamic lastName,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "profilepic") String? profilepic,
  }) = _ReviewerUser;

  factory ReviewerUser.fromJson(Map<String, dynamic> json) =>
      _$ReviewerUserFromJson(json);
}
