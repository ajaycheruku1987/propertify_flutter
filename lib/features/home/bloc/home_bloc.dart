import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propertify/core/app_cache_service.dart';

import '../../../core/failure.dart';
import '../../../core/notify_message.dart';
import '../../../core/service_locator.dart';
import '../models/feed_posts_response_model.dart';
import '../repo/home_repo.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo _homeRepo;
  HomeBloc(this._homeRepo) : super(const HomeState()) {
    on<_IsLoading>(_onIsLoading);
    on<_SetHomeIndex>(_onSetHomeIndex);
    on<_SetBottomNavIndex>(_onSetBottomNavIndex);
    on<_CheckToken>(_checkAccessToken);
    // Handle current location updates
    on<_CurrentLocationLatLng>(_onCurrentLocationLatLng);
    on<_UpdateCurrentLocation>(_onUpdateCurrentLocation);
    on<_LoadOtherUserPosts>(_onLoadOtherUserPosts);
    on<_Reset>(_onReset);
  }

  void _onReset(_Reset event, Emitter<HomeState> emit) {
    emit(const HomeState());
  }

  void _checkAccessToken(_CheckToken event, Emitter<HomeState> emit) {
    final accessToken = serviceLocator<AppCacheService>().getToken();
    debugPrint('accessToken=====: $accessToken');
    if (accessToken != null && accessToken.isNotEmpty) {
      emit(state.copyWith(showAddButton: true));
    } else {
      emit(state.copyWith(showAddButton: false));
    }
  }

  void _onIsLoading(_IsLoading event, Emitter<HomeState> emit) {
    emit(state.copyWith(isLoading: true));
  }

  void _onSetHomeIndex(_SetHomeIndex event, Emitter<HomeState> emit) {
    emit(state.copyWith(homeIndex: event.index));
  }

  void _onSetBottomNavIndex(_SetBottomNavIndex event, Emitter<HomeState> emit) {
    emit(state.copyWith(bottomNavIndex: event.index));
  }

  void _onCurrentLocationLatLng(
    _CurrentLocationLatLng event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(currentLat: event.lat, currentLng: event.lng));
  }

  void _onUpdateCurrentLocation(
    _UpdateCurrentLocation event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        currentLat: event.lat,
        currentLng: event.lng,
        currentCity: event.city,
        currentState: event.state,
        currentVillage: event.village,
      ),
    );
  }

  void _onLoadOtherUserPosts(
    _LoadOtherUserPosts event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoadingOtherUserPosts: true));

      final result = await _homeRepo.getUserPosts(
        userId: event.userId,
        limit: event.limit,
        offset: event.offset,
      );

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoadingOtherUserPosts: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (posts) {
          final bool hasMore = posts.length >= event.limit;
          final List<FeedPostsResponseModel> updatedPosts = [
            if (event.offset > 0 && state.otherUserPosts != null)
              ...state.otherUserPosts!,
            ...posts,
          ];

          emit(
            state.copyWith(
              isLoadingOtherUserPosts: false,
              otherUserPosts: updatedPosts,
              hasMoreOtherUserPosts: hasMore,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoadingOtherUserPosts: false,
          notifyStatus: NotifyStatus(message: 'Failed to load posts'),
        ),
      );
    }
  }
}
