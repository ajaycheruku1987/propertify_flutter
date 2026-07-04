part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    NotifyStatus? notifyStatus,
    @Default(0) int homeIndex,
    @Default(0) int bottomNavIndex,
    @Default(false) bool showAddButton,
    @Default(0.0) double currentLat,
    @Default(0.0) double currentLng,
    @Default('') String currentCity,
    @Default('') String currentState,
    @Default('') String currentVillage,
    List<FeedPostsResponseModel>? otherUserPosts,
    @Default(false) bool isLoadingOtherUserPosts,
    @Default(false) bool hasMoreOtherUserPosts,
    Map<String, dynamic>? activeFeedsFilter,
    Map<String, dynamic>? activeServicesFilter,
    Map<String, dynamic>? activeRequestsFilter,
    Map<String, dynamic>? activeSalesFilter,
    @Default('') String searchQuery,
  }) = _HomeState;
}
