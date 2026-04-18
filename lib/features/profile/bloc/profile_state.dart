part of 'profile_bloc.dart';

@Freezed()
class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserProfileModel? userProfile,
    @Default(false) bool isLoading,
    NotifyStatus? notifyStatus,
    List<BannerAdModel>? bannerAds,
    List<BannerAdModel>? myBannerAds,
    BannerAdModel? createdBannerAd,
    UserProfileModel? otherUserProfile,
    @Default(false) bool isLoadingOtherProfile,
  }) = _ProfileState;
}
