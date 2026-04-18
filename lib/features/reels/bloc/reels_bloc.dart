import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propertify/features/reels/models/reel_response_model.dart';
import 'package:propertify/features/reels/models/reel_view_response_model.dart';

import '../../../core/failure.dart';
import '../../../core/notify_message.dart';
import '../models/reel_model.dart';
import '../models/create_reel_model.dart';
import '../models/reel_comment_model.dart';
import '../repo/reels_repo.dart';

part 'reels_bloc.freezed.dart';
part 'reels_event.dart';
part 'reels_state.dart';

class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  final ReelsRepo _repo;

  ReelsBloc(this._repo) : super(const ReelsState()) {
    on<_GetReelsEvent>(_onGetReelsEvent);
    on<_IsLoading>(_onIsLoading);
    on<_UpdateReelDetailsEvent>(_onUpdateReelDetailsEvent);
    on<_CreateReelEvent>(_onCreateReelEvent);
    on<_ToggleLikeReel>(_onToggleLikeReel);
    on<_GetReelComments>(_onGetReelComments);
    on<_AddCommentToReel>(_onAddCommentToReel);
    on<_RecordReelView>(_onRecordReelView);
    on<_LoadOtherUserReels>(_onLoadOtherUserReels);
    on<_DeleteReel>(_onDeleteReel);
    on<_GetMyReels>(_onGetMyReels);
    on<_Reset>(_onReset);
  }

  void _onReset(_Reset event, Emitter<ReelsState> emit) {
    emit(const ReelsState());
  }

  void _onIsLoading(_IsLoading event, Emitter<ReelsState> emit) {
    emit(_mergeState(isLoading: true));
  }

  Future<void> _onGetReelsEvent(
    _GetReelsEvent event,
    Emitter<ReelsState> emit,
  ) async {
    try {
      emit(_mergeState(isLoading: true));

      final Either<Failure, List<ReelResponseModel>> reelsEither = await _repo
          .getReels(skip: event.skip, limit: event.limit);

      reelsEither.fold(
        (failure) {
          emit(
            _mergeState(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (reels) {
          final int offset = event.skip ?? 0;
          // Use default limit 10 if not provided, consistent with Repo
          final int limit = event.limit ?? 10;
          final bool hasMoreData = reels.length >= limit;

          final List<ReelResponseModel> updatedList = [
            if (offset > 0) ...state.reelsList,
            ...reels,
          ];

          emit(
            _mergeState(
              isLoading: false,
              reelsList: updatedList,
              currentOffset: offset + limit,
              hasMoreData: hasMoreData,
              notifyStatus: NotifyStatus(message: 'Reels loaded successfully'),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
          ),
        ),
      );
    }
  }

  void _onUpdateReelDetailsEvent(
    _UpdateReelDetailsEvent event,
    Emitter<ReelsState> emit,
  ) {
    emit(_mergeState(createReelModel: event.createReelModel));
  }

  Future<void> _onCreateReelEvent(
    _CreateReelEvent event,
    Emitter<ReelsState> emit,
  ) async {
    try {
      emit(_mergeState(isLoading: true));

      final Either<Failure, ReelResponseModel> result = await _repo.createReel(
        videoFile: event.videoFile,
        description: event.description,
        category: event.category,
        location: event.location,
        city: event.city,
        state: event.state,
        address: event.address,
        latitude: event.latitude,
        longitude: event.longitude,
        isPromoted: event.isPromoted,
        promotedUntil: event.promotedUntil,
      );

      result.fold(
        (failure) {
          emit(
            _mergeState(
              isLoading: false,
              isError: true,
              notifyStatus: NotifyStatus(
                message: failure.message,
                type: NotifyType.error,
              ),
            ),
          );
        },
        (reel) {
          emit(
            _mergeState(
              isLoading: false,
              isSuccess: true,
              notifyStatus: NotifyStatus(
                message: 'Reel created successfully',
                type: NotifyType.success,
              ),
              createReelModel: null, // Clear the draft
            ),
          );
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          isLoading: false,
          isError: true,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  Future<void> _onToggleLikeReel(
    _ToggleLikeReel event,
    Emitter<ReelsState> emit,
  ) async {
    try {
      // Optimistic update - update UI immediately
      final updatedReelsList = state.reelsList.map((reel) {
        if (reel.id == event.reelId) {
          final bool wasLiked = reel.isLiked == true;
          final int currentCount = reel.likesCount ?? 0;
          return reel.copyWith(
            isLiked: !wasLiked,
            likesCount: wasLiked ? currentCount - 1 : currentCount + 1,
          );
        }
        return reel;
      }).toList();

      emit(_mergeState(reelsList: updatedReelsList));

      // Call API
      final result = await _repo.toggleLikeReel(reelId: event.reelId);

      result.fold(
        (failure) {
          // Revert on failure
          emit(_mergeState(reelsList: state.reelsList));
          emit(
            _mergeState(
              notifyStatus: NotifyStatus(
                message: failure.message,
                type: NotifyType.error,
              ),
            ),
          );
        },
        (success) {
          // API call successful, state already updated
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  Future<void> _onGetReelComments(
    _GetReelComments event,
    Emitter<ReelsState> emit,
  ) async {
    try {
      emit(_mergeState(commentsLoading: true));

      final result = await _repo.getReelComments(reelId: event.reelId);

      result.fold(
        (failure) {
          emit(
            _mergeState(
              commentsLoading: false,
              notifyStatus: NotifyStatus(
                message: failure.message,
                type: NotifyType.error,
              ),
            ),
          );
        },
        (comments) {
          emit(_mergeState(commentsLoading: false, reelComments: comments));
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          commentsLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  Future<void> _onAddCommentToReel(
    _AddCommentToReel event,
    Emitter<ReelsState> emit,
  ) async {
    try {
      final result = await _repo.addCommentToReel(
        reelId: event.reelId,
        text: event.text,
      );

      result.fold(
        (failure) {
          emit(
            _mergeState(
              notifyStatus: NotifyStatus(
                message: failure.message,
                type: NotifyType.error,
              ),
            ),
          );
        },
        (newComment) {
          // Add the new comment to the existing list
          final updatedComments = [...state.reelComments, newComment];

          // Update the commentsCount in the reel
          final updatedReelsList = state.reelsList.map((reel) {
            if (reel.id == event.reelId) {
              return reel.copyWith(
                commentsCount: (reel.commentsCount ?? 0) + 1,
              );
            }
            return reel;
          }).toList();

          emit(
            _mergeState(
              reelComments: updatedComments,
              reelsList: updatedReelsList,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  Future<void> _onRecordReelView(
    _RecordReelView event,
    Emitter<ReelsState> emit,
  ) async {
    try {
      // Call API to record view (fire and forget)
      final result = await _repo.recordReelView(reelId: event.reelId);

      result.fold(
        (failure) {
          debugPrint('Error recording reel view: ${failure.message}');
        },
        (success) {
          // Optionally update the view count in the local state
          final updatedReelsList = state.reelsList.map((reel) {
            if (reel.id == event.reelId) {
              return reel.copyWith(viewsCount: (reel.viewsCount ?? 0) + 1);
            }
            return reel;
          }).toList();

          emit(_mergeState(reelsList: updatedReelsList));
        },
      );
    } catch (e) {
      debugPrint('Error recording reel view: $e');
      // Silently fail - view tracking should not disrupt user experience
    }
  }

  void _onLoadOtherUserReels(
    _LoadOtherUserReels event,
    Emitter<ReelsState> emit,
  ) async {
    try {
      emit(_mergeState(isLoadingOtherUserReels: true));

      final result = await _repo.getUserReels(userId: event.userId);

      result.fold(
        (failure) {
          emit(
            _mergeState(
              isLoadingOtherUserReels: false,
              notifyStatus: NotifyStatus(
                message: failure.message,
                type: NotifyType.error,
              ),
            ),
          );
        },
        (reels) {
          emit(
            _mergeState(isLoadingOtherUserReels: false, otherUserReels: reels),
          );
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          isLoadingOtherUserReels: false,
          notifyStatus: NotifyStatus(
            message: 'Failed to load reels',
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  Future<void> _onDeleteReel(
    _DeleteReel event,
    Emitter<ReelsState> emit,
  ) async {
    try {
      final result = await _repo.deleteReel(reelId: event.reelId);

      result.fold(
        (failure) {
          emit(
            _mergeState(
              notifyStatus: NotifyStatus(
                message: failure.message,
                type: NotifyType.error,
              ),
            ),
          );
        },
        (success) {
          // Remove from all lists
          final updatedReels = state.reelsList
              .where((reel) => reel.id != event.reelId)
              .toList();

          final updatedOtherUserReels = state.otherUserReels
              ?.where((reel) => reel.id != event.reelId)
              .toList();

          final updatedMyReels = state.myReels
              ?.where((reel) => reel.id != event.reelId)
              .toList();

          emit(
            _mergeState(
              reelsList: updatedReels,
              otherUserReels: updatedOtherUserReels,
              myReels: updatedMyReels,
              notifyStatus: NotifyStatus(
                message: 'Reel deleted successfully',
                type: NotifyType.success,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  Future<void> _onGetMyReels(
    _GetMyReels event,
    Emitter<ReelsState> emit,
  ) async {
    try {
      emit(_mergeState(isLoadingMyReels: true));

      final result = await _repo.getMyReels();

      result.fold(
        (failure) {
          emit(
            _mergeState(
              isLoadingMyReels: false,
              notifyStatus: NotifyStatus(
                message: failure.message,
                type: NotifyType.error,
              ),
            ),
          );
        },
        (reels) {
          emit(_mergeState(isLoadingMyReels: false, myReels: reels));
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          isLoadingMyReels: false,
          notifyStatus: NotifyStatus(
            message: 'Failed to load my reels',
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  ReelsState _mergeState({
    bool? isLoading,
    bool? isError,
    bool? isSuccess,
    ReelModel? reelDetails,
    List<ReelResponseModel>? reelsList,
    int? currentOffset,
    bool? hasMoreData,
    NotifyStatus? notifyStatus,
    CreateReelModel? createReelModel,
    List<ReelCommentModel>? reelComments,
    bool? commentsLoading,
    List<ReelResponseModel>? otherUserReels,
    bool? isLoadingOtherUserReels,
    List<ReelResponseModel>? myReels,
    bool? isLoadingMyReels,
  }) {
    return ReelsState(
      isLoading: isLoading ?? state.isLoading,
      isError: isError ?? state.isError,
      isSuccess: isSuccess ?? state.isSuccess,
      reelDetails: reelDetails ?? state.reelDetails,
      reelsList: reelsList ?? state.reelsList,
      currentOffset: currentOffset ?? state.currentOffset,
      hasMoreData: hasMoreData ?? state.hasMoreData,
      notifyStatus: notifyStatus ?? state.notifyStatus,
      createReelModel: createReelModel ?? state.createReelModel,
      reelComments: reelComments ?? state.reelComments,
      commentsLoading: commentsLoading ?? state.commentsLoading,
      otherUserReels: otherUserReels ?? state.otherUserReels,
      isLoadingOtherUserReels:
          isLoadingOtherUserReels ?? state.isLoadingOtherUserReels,
      myReels: myReels ?? state.myReels,
      isLoadingMyReels: isLoadingMyReels ?? state.isLoadingMyReels,
    );
  }
}
