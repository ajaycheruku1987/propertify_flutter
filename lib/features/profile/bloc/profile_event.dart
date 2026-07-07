part of 'profile_bloc.dart';

@Freezed()
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.reset() = _Reset;
  const factory ProfileEvent.loadProfile() = _LoadProfile;

  const factory ProfileEvent.updateProfile({
    required String name,
    String? firstName,
    String? lastName,
    required String email,
    required String phoneNumber,
  }) = _UpdateProfile;

  const factory ProfileEvent.uploadProfileImage({required String imagePath}) =
      _UploadProfileImage;

  const factory ProfileEvent.changePassword({
    required String currentPassword,
    required String newPassword,
  }) = _ChangePassword;

  const factory ProfileEvent.deleteAccount({
    required String password,
    required String actionType,
  }) = _DeleteAccount;

  const factory ProfileEvent.createBannerAd({
    required CreateBannerAdDataModel bannerAdData,
    String? paymentId,
    String? orderId,
  }) = _CreateBannerAd;

  const factory ProfileEvent.loadBannerAds() = _LoadBannerAds;
  const factory ProfileEvent.loadMyBannerAds() = _LoadMyBannerAds;

  const factory ProfileEvent.loadOtherUserProfile({required String userId}) =
      _LoadOtherUserProfile;

  const factory ProfileEvent.submitFeedback({
    required String category,
    required String subject,
    required String description,
  }) = _SubmitFeedback;

  const factory ProfileEvent.loadMyFeedbacks() = _LoadMyFeedbacks;
  const factory ProfileEvent.loadAllFeedbacks() = _LoadAllFeedbacks;

  const factory ProfileEvent.updateFeedback({
    required String id,
    required String category,
    required String subject,
    required String description,
  }) = _UpdateFeedback;

  const factory ProfileEvent.deleteFeedback({required String id}) = _DeleteFeedback;

  const factory ProfileEvent.isLoading(bool flag) = _IsLoading;
}
