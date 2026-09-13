part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool isLoading,
    @JsonKey(includeFromJson: false, includeToJson: false) NotifyStatus? notifyStatus,
    @Default(0) int homeIndex,
    @Default(0) int bottomNavIndex,
    @Default(false) bool showAddButton,
    @Default(0.0) double currentLat,
    @Default(0.0) double currentLng,
    @Default('') String currentCity,
    @Default('') String currentState,
    @Default('') String currentVillage,
    @JsonKey(includeFromJson: false, includeToJson: false) List<FeedPostsResponseModel>? otherUserPosts,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool isLoadingOtherUserPosts,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool hasMoreOtherUserPosts,
    Map<String, dynamic>? activeFeedsFilter,
    Map<String, dynamic>? activeServicesFilter,
    Map<String, dynamic>? activeRequestsFilter,
    Map<String, dynamic>? activeSalesFilter,
    @Default('') String searchQuery,
    @JsonKey(includeFromJson: false, includeToJson: false) Locale? locale,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) => _$HomeStateFromJson(json);
}
