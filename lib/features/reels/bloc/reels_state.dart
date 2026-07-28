part of 'reels_bloc.dart';

@freezed
class ReelsState with _$ReelsState {
  const factory ReelsState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default(false) bool isSuccess,
    ReelModel? reelDetails,
    @Default(<ReelResponseModel>[]) List<ReelResponseModel> reelsList,
    @Default(0) int currentOffset,
    @Default(false) bool hasMoreData,
    NotifyStatus? notifyStatus,
    CreateReelModel? createReelModel,
    @Default(<ReelCommentModel>[]) List<ReelCommentModel> reelComments,
    @Default(false) bool commentsLoading,
    @Default(<ReelResponseModel>[]) List<ReelResponseModel> otherUserReels,
    @Default(false) bool isLoadingOtherUserReels,
    @Default(<ReelResponseModel>[]) List<ReelResponseModel> myReels,
    @Default(false) bool isLoadingMyReels,
    @Default('') String searchQuery,
    @Default(<String>[]) List<String> selectedCategories,
    @Default(10.0) double radiusKm,
    @Default('trending') String sortBy,
    @Default(<ReelResponseModel>[]) List<ReelResponseModel> searchSuggestions,
    @Default(false) bool suggestionsLoading,
  }) = _ReelsState;
}
