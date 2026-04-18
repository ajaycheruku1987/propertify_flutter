part of 'feed_bloc.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default(false) bool isSuccess,
    FeedPostsResponseModel? postDetails,
    @Default([]) List<FeedPostsResponseModel> similarProperties,
    @Default([]) List<FeedPostsResponseModel> similarPostsByCategory,
    @Default([]) List<FeedPostsResponseModel> feedsList,
    @Default([]) List<FeedPostsResponseModel> myPropertiesList,
    @Default([]) List<FeedPostsResponseModel> favouritesList,
    @Default(<String>{}) Set<String> likedPostIds,
    @Default(0) int currentOffset,
    @Default(false) bool hasMoreData,
    NotifyStatus? notifyStatus,
    @Default(false) bool commentsLoading,
    @Default(false) bool isPostLoading,
    @Default([]) List<FeedCommentModel> feedComments,
    @Default(false) bool sendCommentLoading,
    @Default(false) bool isFavouritesLoading,
    @Default(0) int myPropertiesOffset,
    @Default(false) bool hasMoreMyProperties,
  }) = _FeedState;
}
