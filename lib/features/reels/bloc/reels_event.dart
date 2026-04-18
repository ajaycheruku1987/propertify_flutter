part of 'reels_bloc.dart';

@freezed
class ReelsEvent with _$ReelsEvent {
  const factory ReelsEvent.reset() = _Reset;
  const factory ReelsEvent.getReels({int? skip, int? limit}) = _GetReelsEvent;
  const factory ReelsEvent.isLoading() = _IsLoading;

  // Save details from create reel form
  const factory ReelsEvent.updateReelDetails({
    required CreateReelModel createReelModel,
  }) = _UpdateReelDetailsEvent;

  // Create reel event
  const factory ReelsEvent.createReel({
    String? description,
    List<String>? category,
    String? location,
    String? city,
    String? state,
    String? address,
    double? latitude,
    double? longitude,
    bool? isPromoted,
    String? promotedUntil,
    required File videoFile,
  }) = _CreateReelEvent;

  // Toggle like on a reel
  const factory ReelsEvent.toggleLikeReel({required String reelId}) =
      _ToggleLikeReel;

  // Get comments for a reel
  const factory ReelsEvent.getReelComments({required String reelId}) =
      _GetReelComments;

  // Add comment to a reel
  const factory ReelsEvent.addCommentToReel({
    required String reelId,
    required String text,
  }) = _AddCommentToReel;

  // Record a view for a reel
  const factory ReelsEvent.recordReelView({required String reelId}) =
      _RecordReelView;

  // Load other user's reels
  const factory ReelsEvent.loadOtherUserReels({required String userId}) =
      _LoadOtherUserReels;

  // Delete a reel
  const factory ReelsEvent.deleteReel({required String reelId}) = _DeleteReel;

  // Get current user's reels
  const factory ReelsEvent.getMyReels() = _GetMyReels;
}
