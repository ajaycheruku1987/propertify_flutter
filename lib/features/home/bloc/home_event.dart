part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.reset() = _Reset;
  const factory HomeEvent.isLoading() = _IsLoading;
  const factory HomeEvent.setHomeIndex(int index) = _SetHomeIndex;
  const factory HomeEvent.setBottomNavIndex(int index) = _SetBottomNavIndex;
  const factory HomeEvent.checkToken() = _CheckToken;
  const factory HomeEvent.currentLocationLatLng(double lat, double lng) =
      _CurrentLocationLatLng;
  const factory HomeEvent.updateCurrentLocation({
    required double lat,
    required double lng,
    required String city,
    required String state,
    required String village,
  }) = _UpdateCurrentLocation;

  const factory HomeEvent.loadOtherUserPosts({
    required String userId,
    required int limit,
    required int offset,
  }) = _LoadOtherUserPosts;
}
