part of 'feed_bloc.dart';

@freezed
class FeedEvent with _$FeedEvent {
  const factory FeedEvent.reset() = _Reset;
  const factory FeedEvent.getFeedsEvent({
    String? city,
    String? listingType,
    String? propertyType,
    double? minPrice,
    double? maxPrice,
    String? search,
    int? limit,
    int? offset,
    double? latitude,
    double? longitude,
  }) = _GetFeedsEvent;

  const factory FeedEvent.getPostDetailsEvent({required String postId}) =
      _GetPostDetailsEvent;

  const factory FeedEvent.getSimilarPropertiesEvent({
    String? city,
    String? propertyType,
    String? excludePostId,
    int? limit,
  }) = _GetSimilarPropertiesEvent;

  const factory FeedEvent.likeProperty({required String propertyId}) =
      _LikeProperty;

  const factory FeedEvent.getCommentsById({required String propertyId}) =
      _GetCommentsById;
  const factory FeedEvent.addCommentToProperty({
    required String propertyId,
    required String text,
  }) = _AddCommentToProperty;

  const factory FeedEvent.toggleFavorite({required String propertyId}) =
      _ToggleFavorite;

  const factory FeedEvent.isLoading() = _IsLoading;

  const factory FeedEvent.getMyProperties({int? limit, int? offset}) =
      _GetMyProperties;

  const factory FeedEvent.getFavourites() = _GetFavourites;

  const factory FeedEvent.recordPropertyView({required String propertyId}) =
      _RecordPropertyView;

  const factory FeedEvent.getSimilarPostsByCategoryEvent({
    String? propertyType,
    String? excludePostId,
    int? limit,
  }) = _GetSimilarPostsByCategoryEvent;

  const factory FeedEvent.resetSimilarPostsByCategory() =
      _ResetSimilarPostsByCategory;

  const factory FeedEvent.updateProperty({
    required String propertyId,
    required String availableFrom,
    required int totalFloors,
    required bool isFeatured,
    required String propertyType,
    required int bathrooms,
    required int price,
    required String city,
    required int floor,
    required double latitude,
    required int propertyAgeYears,
    required String furnishing,
    required double longitude,
    required String address,
    required String listingType,
    required String amenities,
    required List<File> newImages,
    required int bedrooms,
    required String title,
    required bool isPromoted,
    required List<String> existingImageUrls,
    required String description,
    required bool isVerified,
    required double areaSqft,
  }) = _UpdatePropertyEvent;

  const factory FeedEvent.deleteProperty({
    required String propertyId,
  }) = _DeletePropertyEvent;
}
