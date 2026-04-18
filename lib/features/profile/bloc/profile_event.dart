part of 'profile_bloc.dart';

@Freezed()
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.reset() = _Reset;
  const factory ProfileEvent.loadProfile() = _LoadProfile;

  const factory ProfileEvent.updateProfile({
    required String name,
    required String email,
    required String phoneNumber,
  }) = _UpdateProfile;

  const factory ProfileEvent.uploadProfileImage({required String imagePath}) =
      _UploadProfileImage;

  const factory ProfileEvent.changePassword({
    required String currentPassword,
    required String newPassword,
  }) = _ChangePassword;

  const factory ProfileEvent.deleteAccount() = _DeleteAccount;

  const factory ProfileEvent.createBannerAd({
    required CreateBannerAdDataModel bannerAdData,
    String? paymentId,
    String? orderId,
  }) = _CreateBannerAd;

  const factory ProfileEvent.loadBannerAds() = _LoadBannerAds;
  const factory ProfileEvent.loadMyBannerAds() = _LoadMyBannerAds;

  const factory ProfileEvent.loadOtherUserProfile({required String userId}) =
      _LoadOtherUserProfile;

  const factory ProfileEvent.isLoading(bool flag) = _IsLoading;
}
