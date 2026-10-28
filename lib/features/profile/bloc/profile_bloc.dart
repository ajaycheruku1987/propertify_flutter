import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propertify/core/app_cache_service.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/features/profile/repo/profile_repo.dart';
import 'package:propertify/utils/custom_toast.dart';

import 'package:propertify/core/failure.dart';
import 'package:propertify/core/notify_message.dart';
import 'package:propertify/features/profile/models/user_profile_model.dart';
import 'package:propertify/features/profile/models/create_banner_ad_model.dart';
import 'package:propertify/features/profile/models/banner_ad_model.dart';
import 'package:propertify/features/profile/models/feedback_model.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileBloc(this._profileRepo) : super(const ProfileState()) {
    on<_LoadProfile>(_onLoadProfile);
    on<_UpdateProfile>(_onUpdateProfile);
    on<_UpdateSocialLinks>(_onUpdateSocialLinks);
    on<_UploadProfileImage>(_onUploadProfileImage);
    on<_ChangePassword>(_onChangePassword);
    on<_DeleteAccount>(_onDeleteAccount);
    on<_CreateBannerAd>(_onCreateBannerAd);
    on<_LoadBannerAds>(_onLoadBannerAds);
    on<_LoadMyBannerAds>(_onLoadMyBannerAds);
    on<_LoadOtherUserProfile>(_onLoadOtherUserProfile);
    on<_SubmitFeedback>(_onSubmitFeedback);
    on<_LoadMyFeedbacks>(_onLoadMyFeedbacks);
    on<_LoadAllFeedbacks>(_onLoadAllFeedbacks);
    on<_UpdateFeedback>(_onUpdateFeedback);
    on<_DeleteFeedback>(_onDeleteFeedback);
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
          // Persist profile data to cache for ownership checks across the app
          final cache = serviceLocator<AppCacheService>();
          if (profile.id != null) cache.saveCustomerAccountId(profile.id!);
          if (profile.phoneNumber != null) cache.saveUserPhone(profile.phoneNumber!);

          // Merge cached social links & location
          final cachedSocials = cache.getSocialLinks();
          final cachedLocation = cache.getUserLocation();
          final mergedProfile = profile.copyWith(
            facebookUrl: profile.facebookUrl ?? cachedSocials['facebook_url'],
            instagramUrl: profile.instagramUrl ?? cachedSocials['instagram_url'],
            whatsappChannelUrl: profile.whatsappChannelUrl ?? cachedSocials['whatsapp_channel_url'],
            websiteUrl: profile.websiteUrl ?? cachedSocials['website_url'],
            xUrl: profile.xUrl ?? cachedSocials['x_url'],
            youtubeUrl: profile.youtubeUrl ?? cachedSocials['youtube_url'],
            city: (profile.city != null && profile.city!.isNotEmpty)
                ? profile.city
                : cachedLocation['city'],
            state: (profile.state != null && profile.state!.isNotEmpty)
                ? profile.state
                : cachedLocation['state'],
            country: (profile.country != null && profile.country!.isNotEmpty)
                ? profile.country
                : cachedLocation['country'],
          );

          emit(
            state.copyWith(
              isLoading: false,
              userProfile: mergedProfile,
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

      final currentProfile = state.userProfile;

      // Use trim() to avoid differences caused by accidental spaces
      final newName = event.name.trim();
      final newFirstName = event.firstName?.trim();
      final newLastName = event.lastName?.trim();
      final newEmail = event.email.trim();
      final newPhone = event.phoneNumber.trim();
      final newCity = event.city?.trim();
      final newState = event.state?.trim();
      final newCountry = event.country?.trim();

      final currentName = currentProfile?.username?.trim();
      final currentFirstName = currentProfile?.firstName?.trim();
      final currentLastName = currentProfile?.lastName?.trim();
      final currentEmail = currentProfile?.email?.trim();
      final currentPhone = currentProfile?.phoneNumber?.trim();
      final currentCity = currentProfile?.city?.trim();
      final currentState = currentProfile?.state?.trim();
      final currentCountry = currentProfile?.country?.trim();

      // Only send fields that have actually changed
      final String? nameToSend = newName != currentName ? newName : null;
      final String? firstNameToSend =
          newFirstName != currentFirstName ? newFirstName : null;
      final String? lastNameToSend =
          newLastName != currentLastName ? newLastName : null;
      final String? emailToSend = newEmail != currentEmail ? newEmail : null;
      final String? phoneToSend = newPhone != currentPhone ? newPhone : null;
      final String? cityToSend = newCity != currentCity ? newCity : null;
      final String? stateToSend = newState != currentState ? newState : null;
      final String? countryToSend = newCountry != currentCountry ? newCountry : null;

      if (nameToSend == null &&
          firstNameToSend == null &&
          lastNameToSend == null &&
          emailToSend == null &&
          phoneToSend == null &&
          cityToSend == null &&
          stateToSend == null &&
          countryToSend == null) {
        emit(
          state.copyWith(
            isLoading: false,
            notifyStatus: NotifyStatus(message: 'No changes detected'),
          ),
        );
        return;
      }

      Either<Failure, UserProfileModel> updateResponseEither =
          await _profileRepo.updateProfile(
        name: nameToSend,
        firstName: firstNameToSend,
        lastName: lastNameToSend,
        email: emailToSend,
        phoneNumber: phoneToSend,
        city: cityToSend,
        state: stateToSend,
        country: countryToSend,
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
          final cache = serviceLocator<AppCacheService>();
          cache.saveUserLocation(
            city: (newCity != null && newCity.isNotEmpty) ? newCity : currentProfile?.city,
            state: (newState != null && newState.isNotEmpty) ? newState : currentProfile?.state,
            country: (newCountry != null && newCountry.isNotEmpty) ? newCountry : currentProfile?.country,
          );

          final cachedLocation = cache.getUserLocation();
          final mergedProfile = updatedProfile.copyWith(
            city: (updatedProfile.city != null && updatedProfile.city!.isNotEmpty)
                ? updatedProfile.city
                : cachedLocation['city'],
            state: (updatedProfile.state != null && updatedProfile.state!.isNotEmpty)
                ? updatedProfile.state
                : cachedLocation['state'],
            country: (updatedProfile.country != null && updatedProfile.country!.isNotEmpty)
                ? updatedProfile.country
                : cachedLocation['country'],
          );

          emit(
            state.copyWith(
              isLoading: false,
              userProfile: mergedProfile,
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

  void _onUpdateSocialLinks(
    _UpdateSocialLinks event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final cache = serviceLocator<AppCacheService>();
      await cache.saveSocialLinks(
        facebookUrl: event.facebookUrl,
        instagramUrl: event.instagramUrl,
        whatsappChannelUrl: event.whatsappChannelUrl,
        websiteUrl: event.websiteUrl,
        xUrl: event.xUrl,
        youtubeUrl: event.youtubeUrl,
      );

      Either<Failure, UserProfileModel> updateResponseEither =
          await _profileRepo.updateProfile(
        facebookUrl: event.facebookUrl,
        instagramUrl: event.instagramUrl,
        whatsappChannelUrl: event.whatsappChannelUrl,
        websiteUrl: event.websiteUrl,
        xUrl: event.xUrl,
        youtubeUrl: event.youtubeUrl,
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
          final cachedSocials = cache.getSocialLinks();
          final mergedProfile = updatedProfile.copyWith(
            facebookUrl: event.facebookUrl ?? cachedSocials['facebook_url'] ?? state.userProfile?.facebookUrl,
            instagramUrl: event.instagramUrl ?? cachedSocials['instagram_url'] ?? state.userProfile?.instagramUrl,
            whatsappChannelUrl: event.whatsappChannelUrl ?? cachedSocials['whatsapp_channel_url'] ?? state.userProfile?.whatsappChannelUrl,
            websiteUrl: event.websiteUrl ?? cachedSocials['website_url'] ?? state.userProfile?.websiteUrl,
            xUrl: event.xUrl ?? cachedSocials['x_url'] ?? state.userProfile?.xUrl,
            youtubeUrl: event.youtubeUrl ?? cachedSocials['youtube_url'] ?? state.userProfile?.youtubeUrl,
          );

          emit(
            state.copyWith(
              isLoading: false,
              userProfile: mergedProfile,
              notifyStatus: NotifyStatus(
                message: 'Social links updated successfully',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to update social links'),
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
      Either<Failure, String> deleteResponseEither = await _profileRepo
          .deleteAccount(
            password: event.password,
            actionType: event.actionType,
          );

      deleteResponseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(
                message: failure.message,
                type: NotifyType.error,
              ),
            ),
          );
        },
        (message) {
          emit(
            state.copyWith(
              isLoading: false,
              userProfile: null,
              notifyStatus: NotifyStatus(
                message: message,
                type: NotifyType.success,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'Failed to delete account',
            type: NotifyType.error,
          ),
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
      Either<Failure, BannerAdModel>      createBannerAdEither = await _profileRepo.createBannerAd(
        images: event.bannerAdData.images,
        description: event.bannerAdData.description,
        planName: event.bannerAdData.planName ?? '',
        planDays: event.bannerAdData.planDays ?? 0,
        amount: event.bannerAdData.amount ?? 0.0,
        termsAccepted: event.bannerAdData.termsAccepted,
        latitude: event.bannerAdData.latitude,
        longitude: event.bannerAdData.longitude,
        city: event.bannerAdData.city,
        state: event.bannerAdData.state,
        village: event.bannerAdData.village,
        address: event.bannerAdData.address,
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
      // Feed banner ads are global — never filter by user location/radius.
      Either<Failure, List<BannerAdModel>> bannerAdsEither =
          await _profileRepo.getBannerAds();

      bannerAdsEither.fold(
        (failure) {
          // Keep previous ads on failure so the carousel does not disappear.
          emit(
            state.copyWith(
              bannerAds: state.bannerAds ?? const [],
              notifyStatus: null,
            ),
          );
        },
        (bannerAds) {
          final activeAds = bannerAds
              .where(
                (ad) => ad.isCurrentlyActive && ad.isPaid == true,
              )
              .toList();
          emit(
            state.copyWith(
              bannerAds: activeAds,
              notifyStatus: null,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          bannerAds: state.bannerAds ?? const [],
          notifyStatus: null,
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
          final cache = serviceLocator<AppCacheService>();
          final currentUserId = cache.customerAccountId;
          UserProfileModel mergedProfile = profile;

          if (currentUserId != null && currentUserId == profile.id) {
            final cachedSocials = cache.getSocialLinks();
            mergedProfile = profile.copyWith(
              facebookUrl: profile.facebookUrl ?? cachedSocials['facebook_url'],
              instagramUrl: profile.instagramUrl ?? cachedSocials['instagram_url'],
              whatsappChannelUrl: profile.whatsappChannelUrl ?? cachedSocials['whatsapp_channel_url'],
              websiteUrl: profile.websiteUrl ?? cachedSocials['website_url'],
              xUrl: profile.xUrl ?? cachedSocials['x_url'],
              youtubeUrl: profile.youtubeUrl ?? cachedSocials['youtube_url'],
            );
          }

          emit(
            state.copyWith(
              isLoadingOtherProfile: false,
              otherUserProfile: mergedProfile,
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

  void _onSubmitFeedback(
    _SubmitFeedback event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, notifyStatus: null));
      final response = await _profileRepo.submitFeedback(
        category: event.category,
        subject: event.subject,
        description: event.description,
      );
      response.fold(
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
                message: 'Feedback submitted successfully',
              ),
            ),
          );
          // CustomToast moved to UI listener to avoid Navigator race conditions
          add(const ProfileEvent.loadMyFeedbacks());
          if (state.allFeedbacks != null) {
            add(const ProfileEvent.loadAllFeedbacks());
          }
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to submit feedback'),
        ),
      );
    }
  }

  void _onLoadMyFeedbacks(
    _LoadMyFeedbacks event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, notifyStatus: null));
      final response = await _profileRepo.getMyFeedbacks();
      response.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (feedbacks) {
          emit(
            state.copyWith(
              isLoading: false,
              myFeedbacks: feedbacks,
              notifyStatus: null,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to load feedbacks'),
        ),
      );
    }
  }

  void _onLoadAllFeedbacks(
    _LoadAllFeedbacks event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, notifyStatus: null));
      final response = await _profileRepo.getAllFeedbacks();
      response.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (feedbacks) {
          emit(
            state.copyWith(
              isLoading: false,
              allFeedbacks: feedbacks,
              notifyStatus: null,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to load all feedbacks'),
        ),
      );
    }
  }

  void _onUpdateFeedback(
    _UpdateFeedback event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, notifyStatus: null));
      final response = await _profileRepo.updateFeedback(
        id: event.id,
        category: event.category,
        subject: event.subject,
        description: event.description,
      );
      response.fold(
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
                message: 'Feedback updated successfully',
              ),
            ),
          );
          // CustomToast moved to UI listener to avoid Navigator race conditions
          add(const ProfileEvent.loadMyFeedbacks());
          if (state.allFeedbacks != null) {
            add(const ProfileEvent.loadAllFeedbacks());
          }
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to update feedback'),
        ),
      );
    }
  }

  void _onDeleteFeedback(
    _DeleteFeedback event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await _profileRepo.deleteFeedback(event.id);
      response.fold(
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
                message: 'Feedback deleted successfully',
              ),
            ),
          );
          // Toast remains here as delete usually happens on the list screen
          CustomToast.showSuccessToast(msg: 'Feedback deleted successfully');
          add(const ProfileEvent.loadMyFeedbacks());
          if (state.allFeedbacks != null) {
            add(const ProfileEvent.loadAllFeedbacks());
          }
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'Failed to delete feedback'),
        ),
      );
    }
  }

  void _onIsLoading(_IsLoading event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isLoading: event.flag));
  }
}
