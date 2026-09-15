part of 'feed_bloc.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState({
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool isLoading,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool isError,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool isSuccess,
    FeedPostsResponseModel? postDetails,
    @Default([]) List<FeedPostsResponseModel> similarProperties,
    @Default([]) List<FeedPostsResponseModel> similarPostsByCategory,
    @Default([]) List<FeedPostsResponseModel> feedsList,
    @Default([]) List<FeedPostsResponseModel> myPropertiesList,
    @Default([]) List<FeedPostsResponseModel> favouritesList,
    @Default(<String>{}) Set<String> likedPostIds,
    @Default(0) int currentOffset,
    @Default(false) bool hasMoreData,
    @JsonKey(includeFromJson: false, includeToJson: false) NotifyStatus? notifyStatus,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool commentsLoading,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool isPostLoading,
    @Default([]) List<FeedCommentModel> feedComments,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool sendCommentLoading,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool isFavouritesLoading,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool similarPropertiesLoading,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool similarPostsByCategoryLoading,
    @Default(0) int myPropertiesOffset,
    @Default(false) bool hasMoreMyProperties,
  }) = _FeedState;

  factory FeedState.fromJson(Map<String, dynamic> json) => _$FeedStateFromJson(json);
}
