import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propertify/features/profile/repo/profile_repo.dart';
import 'package:propertify/utils/custom_toast.dart';

import '../../../core/failure.dart';
import '../../../core/notify_message.dart';
import '../models/user_profile_model.dart';
import '../models/create_banner_ad_model.dart';
import '../models/banner_ad_model.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileBloc(this._profileRepo) : super(const ProfileState()) {
    on<_LoadProfile>(_onLoadProfile);
    on<_UpdateProfile>(_onUpdateProfile);
    on<_UploadProfileImage>(_onUploadProfileImage);
    on<_ChangePassword>(_onChangePassword);
    on<_DeleteAccount>(_onDeleteAccount);
    on<_CreateBannerAd>(_onCreateBannerAd);
    on<_LoadBannerAds>(_onLoadBannerAds);
    on<_LoadMyBannerAds>(_onLoadMyBannerAds);
    on<_LoadOtherUserProfile>(_onLoadOtherUserProfile);
    on<_IsLoading>(_onIsLoading);
    on<_Reset>(_onReset);
  }

  void _onReset(_Reset event, Emitter<ProfileState> emit) {
    emit(const ProfileState());
  }

  void _onLoadProfile(_LoadProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      Either<Failure, UserProfileModel> profileResponseEither =
          await _profileRepo.getUserProfile();

      profileResponseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              userProfile: null,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (profile) {
          emit(
            state.copyWith(
              isLoading: false,
              userProfile: profile,
              notifyStatus: null,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to load profile'),
        ),
      );
    }
  }

  void _onUpdateProfile(
    _UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      Either<Failure, UserProfileModel> updateResponseEither =
          await _profileRepo.updateProfile(
            name: event.name,
            email: event.email,
            phoneNumber: event.phoneNumber,
          );

      updateResponseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (updatedProfile) {
          emit(
            state.copyWith(
              isLoading: false,
              userProfile: updatedProfile,
              notifyStatus: NotifyStatus(
                message: 'Profile updated successfully',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to update profile'),
        ),
      );
    }
  }

  void _onUploadProfileImage(
    _UploadProfileImage event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      Either<Failure, UserProfileModel> uploadResponseEither =
          await _profileRepo.uploadProfileImage(event.imagePath);

      uploadResponseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (data) {
          // Update the profile with new data from server
          emit(state.copyWith(isLoading: false, userProfile: data));
          CustomToast.showSuccessToast(
            msg: 'Profile image updated successfully',
          );
          // add(const ProfileEvent.loadProfile());
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to upload image'),
        ),
      );
    }
  }

  void _onChangePassword(
    _ChangePassword event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      Either<Failure, bool> changePasswordEither = await _profileRepo
          .changePassword(
            currentPassword: event.currentPassword,
            newPassword: event.newPassword,
          );

      changePasswordEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (success) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(
                message: 'Password changed successfully',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to change password'),
        ),
      );
    }
  }

  void _onDeleteAccount(
    _DeleteAccount event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      Either<Failure, bool> deleteResponseEither = await _profileRepo
          .deleteAccount();

      deleteResponseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (success) {
          emit(
            state.copyWith(
              isLoading: false,
              userProfile: null,
              notifyStatus: NotifyStatus(
                message: 'Account deleted successfully',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to delete account'),
        ),
      );
    }
  }

  void _onCreateBannerAd(
    _CreateBannerAd event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      Either<Failure, BannerAdModel> createBannerAdEither = await _profileRepo
          .createBannerAd(
            images: event.bannerAdData.images,
            description: event.bannerAdData.description,
            planName: event.bannerAdData.planName ?? '',
            planDays: event.bannerAdData.planDays ?? 0,
            amount: event.bannerAdData.amount ?? 0.0,
            termsAccepted: event.bannerAdData.termsAccepted,
          );

      createBannerAdEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (response) {
          emit(
            state.copyWith(
              isLoading: false,
              createdBannerAd: response,
              notifyStatus: NotifyStatus(
                message: 'Banner ad created. Please complete payment.',
              ),
            ),
          );
          // Don't show success toast yet, wait for payment
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to create banner ad'),
        ),
      );
    }
  }

  void _onLoadBannerAds(
    _LoadBannerAds event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      Either<Failure, List<BannerAdModel>> bannerAdsEither = await _profileRepo
          .getBannerAds();

      bannerAdsEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (bannerAds) {
          emit(
            state.copyWith(
              isLoading: false,
              bannerAds: bannerAds,
              notifyStatus: null,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to load banner ads'),
        ),
      );
    }
  }

  void _onLoadMyBannerAds(
    _LoadMyBannerAds event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      Either<Failure, List<BannerAdModel>> bannerAdsEither = await _profileRepo
          .getMyBannerAds();

      bannerAdsEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (bannerAds) {
          emit(
            state.copyWith(
              isLoading: false,
              myBannerAds: bannerAds,
              notifyStatus: null,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to load banner ads'),
        ),
      );
    }
  }

  void _onLoadOtherUserProfile(
    _LoadOtherUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoadingOtherProfile: true, otherUserProfile: null));
      Either<Failure, UserProfileModel> profileResponseEither =
          await _profileRepo.getOtherUserProfile(event.userId);

      profileResponseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoadingOtherProfile: false,
              otherUserProfile: null,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (profile) {
          emit(
            state.copyWith(
              isLoadingOtherProfile: false,
              otherUserProfile: profile,
              notifyStatus: null,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoadingOtherProfile: false,
          notifyStatus: NotifyStatus(message: 'Failed to load profile'),
        ),
      );
    }
  }

  void _onIsLoading(_IsLoading event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isLoading: event.flag));
  }
}
