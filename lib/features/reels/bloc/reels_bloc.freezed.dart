// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reels_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReelsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit) getReels,
    required TResult Function() isLoading,
    required TResult Function(CreateReelModel createReelModel)
        updateReelDetails,
    required TResult Function(
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
            File videoFile)
        createReel,
    required TResult Function(String reelId) toggleLikeReel,
    required TResult Function(String reelId) getReelComments,
    required TResult Function(String reelId, String text) addCommentToReel,
    required TResult Function(String reelId) recordReelView,
    required TResult Function(String userId) loadOtherUserReels,
    required TResult Function(String reelId) deleteReel,
    required TResult Function() getMyReels,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit)? getReels,
    TResult? Function()? isLoading,
    TResult? Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult? Function(
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
            File videoFile)?
        createReel,
    TResult? Function(String reelId)? toggleLikeReel,
    TResult? Function(String reelId)? getReelComments,
    TResult? Function(String reelId, String text)? addCommentToReel,
    TResult? Function(String reelId)? recordReelView,
    TResult? Function(String userId)? loadOtherUserReels,
    TResult? Function(String reelId)? deleteReel,
    TResult? Function()? getMyReels,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit)? getReels,
    TResult Function()? isLoading,
    TResult Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult Function(
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
            File videoFile)?
        createReel,
    TResult Function(String reelId)? toggleLikeReel,
    TResult Function(String reelId)? getReelComments,
    TResult Function(String reelId, String text)? addCommentToReel,
    TResult Function(String reelId)? recordReelView,
    TResult Function(String userId)? loadOtherUserReels,
    TResult Function(String reelId)? deleteReel,
    TResult Function()? getMyReels,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetReelsEvent value) getReels,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateReelDetailsEvent value) updateReelDetails,
    required TResult Function(_CreateReelEvent value) createReel,
    required TResult Function(_ToggleLikeReel value) toggleLikeReel,
    required TResult Function(_GetReelComments value) getReelComments,
    required TResult Function(_AddCommentToReel value) addCommentToReel,
    required TResult Function(_RecordReelView value) recordReelView,
    required TResult Function(_LoadOtherUserReels value) loadOtherUserReels,
    required TResult Function(_DeleteReel value) deleteReel,
    required TResult Function(_GetMyReels value) getMyReels,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetReelsEvent value)? getReels,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult? Function(_CreateReelEvent value)? createReel,
    TResult? Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult? Function(_GetReelComments value)? getReelComments,
    TResult? Function(_AddCommentToReel value)? addCommentToReel,
    TResult? Function(_RecordReelView value)? recordReelView,
    TResult? Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult? Function(_DeleteReel value)? deleteReel,
    TResult? Function(_GetMyReels value)? getMyReels,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetReelsEvent value)? getReels,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult Function(_CreateReelEvent value)? createReel,
    TResult Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult Function(_GetReelComments value)? getReelComments,
    TResult Function(_AddCommentToReel value)? addCommentToReel,
    TResult Function(_RecordReelView value)? recordReelView,
    TResult Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult Function(_DeleteReel value)? deleteReel,
    TResult Function(_GetMyReels value)? getMyReels,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReelsEventCopyWith<$Res> {
  factory $ReelsEventCopyWith(
          ReelsEvent value, $Res Function(ReelsEvent) then) =
      _$ReelsEventCopyWithImpl<$Res, ReelsEvent>;
}

/// @nodoc
class _$ReelsEventCopyWithImpl<$Res, $Val extends ReelsEvent>
    implements $ReelsEventCopyWith<$Res> {
  _$ReelsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'ReelsEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit) getReels,
    required TResult Function() isLoading,
    required TResult Function(CreateReelModel createReelModel)
        updateReelDetails,
    required TResult Function(
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
            File videoFile)
        createReel,
    required TResult Function(String reelId) toggleLikeReel,
    required TResult Function(String reelId) getReelComments,
    required TResult Function(String reelId, String text) addCommentToReel,
    required TResult Function(String reelId) recordReelView,
    required TResult Function(String userId) loadOtherUserReels,
    required TResult Function(String reelId) deleteReel,
    required TResult Function() getMyReels,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit)? getReels,
    TResult? Function()? isLoading,
    TResult? Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult? Function(
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
            File videoFile)?
        createReel,
    TResult? Function(String reelId)? toggleLikeReel,
    TResult? Function(String reelId)? getReelComments,
    TResult? Function(String reelId, String text)? addCommentToReel,
    TResult? Function(String reelId)? recordReelView,
    TResult? Function(String userId)? loadOtherUserReels,
    TResult? Function(String reelId)? deleteReel,
    TResult? Function()? getMyReels,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit)? getReels,
    TResult Function()? isLoading,
    TResult Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult Function(
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
            File videoFile)?
        createReel,
    TResult Function(String reelId)? toggleLikeReel,
    TResult Function(String reelId)? getReelComments,
    TResult Function(String reelId, String text)? addCommentToReel,
    TResult Function(String reelId)? recordReelView,
    TResult Function(String userId)? loadOtherUserReels,
    TResult Function(String reelId)? deleteReel,
    TResult Function()? getMyReels,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetReelsEvent value) getReels,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateReelDetailsEvent value) updateReelDetails,
    required TResult Function(_CreateReelEvent value) createReel,
    required TResult Function(_ToggleLikeReel value) toggleLikeReel,
    required TResult Function(_GetReelComments value) getReelComments,
    required TResult Function(_AddCommentToReel value) addCommentToReel,
    required TResult Function(_RecordReelView value) recordReelView,
    required TResult Function(_LoadOtherUserReels value) loadOtherUserReels,
    required TResult Function(_DeleteReel value) deleteReel,
    required TResult Function(_GetMyReels value) getMyReels,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetReelsEvent value)? getReels,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult? Function(_CreateReelEvent value)? createReel,
    TResult? Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult? Function(_GetReelComments value)? getReelComments,
    TResult? Function(_AddCommentToReel value)? addCommentToReel,
    TResult? Function(_RecordReelView value)? recordReelView,
    TResult? Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult? Function(_DeleteReel value)? deleteReel,
    TResult? Function(_GetMyReels value)? getMyReels,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetReelsEvent value)? getReels,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult Function(_CreateReelEvent value)? createReel,
    TResult Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult Function(_GetReelComments value)? getReelComments,
    TResult Function(_AddCommentToReel value)? addCommentToReel,
    TResult Function(_RecordReelView value)? recordReelView,
    TResult Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult Function(_DeleteReel value)? deleteReel,
    TResult Function(_GetMyReels value)? getMyReels,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements ReelsEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
abstract class _$$GetReelsEventImplCopyWith<$Res> {
  factory _$$GetReelsEventImplCopyWith(
          _$GetReelsEventImpl value, $Res Function(_$GetReelsEventImpl) then) =
      __$$GetReelsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? skip, int? limit});
}

/// @nodoc
class __$$GetReelsEventImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$GetReelsEventImpl>
    implements _$$GetReelsEventImplCopyWith<$Res> {
  __$$GetReelsEventImplCopyWithImpl(
      _$GetReelsEventImpl _value, $Res Function(_$GetReelsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skip = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$GetReelsEventImpl(
      skip: freezed == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetReelsEventImpl implements _GetReelsEvent {
  const _$GetReelsEventImpl({this.skip, this.limit});

  @override
  final int? skip;
  @override
  final int? limit;

  @override
  String toString() {
    return 'ReelsEvent.getReels(skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReelsEventImpl &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, skip, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetReelsEventImplCopyWith<_$GetReelsEventImpl> get copyWith =>
      __$$GetReelsEventImplCopyWithImpl<_$GetReelsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit) getReels,
    required TResult Function() isLoading,
    required TResult Function(CreateReelModel createReelModel)
        updateReelDetails,
    required TResult Function(
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
            File videoFile)
        createReel,
    required TResult Function(String reelId) toggleLikeReel,
    required TResult Function(String reelId) getReelComments,
    required TResult Function(String reelId, String text) addCommentToReel,
    required TResult Function(String reelId) recordReelView,
    required TResult Function(String userId) loadOtherUserReels,
    required TResult Function(String reelId) deleteReel,
    required TResult Function() getMyReels,
  }) {
    return getReels(skip, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit)? getReels,
    TResult? Function()? isLoading,
    TResult? Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult? Function(
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
            File videoFile)?
        createReel,
    TResult? Function(String reelId)? toggleLikeReel,
    TResult? Function(String reelId)? getReelComments,
    TResult? Function(String reelId, String text)? addCommentToReel,
    TResult? Function(String reelId)? recordReelView,
    TResult? Function(String userId)? loadOtherUserReels,
    TResult? Function(String reelId)? deleteReel,
    TResult? Function()? getMyReels,
  }) {
    return getReels?.call(skip, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit)? getReels,
    TResult Function()? isLoading,
    TResult Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult Function(
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
            File videoFile)?
        createReel,
    TResult Function(String reelId)? toggleLikeReel,
    TResult Function(String reelId)? getReelComments,
    TResult Function(String reelId, String text)? addCommentToReel,
    TResult Function(String reelId)? recordReelView,
    TResult Function(String userId)? loadOtherUserReels,
    TResult Function(String reelId)? deleteReel,
    TResult Function()? getMyReels,
    required TResult orElse(),
  }) {
    if (getReels != null) {
      return getReels(skip, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetReelsEvent value) getReels,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateReelDetailsEvent value) updateReelDetails,
    required TResult Function(_CreateReelEvent value) createReel,
    required TResult Function(_ToggleLikeReel value) toggleLikeReel,
    required TResult Function(_GetReelComments value) getReelComments,
    required TResult Function(_AddCommentToReel value) addCommentToReel,
    required TResult Function(_RecordReelView value) recordReelView,
    required TResult Function(_LoadOtherUserReels value) loadOtherUserReels,
    required TResult Function(_DeleteReel value) deleteReel,
    required TResult Function(_GetMyReels value) getMyReels,
  }) {
    return getReels(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetReelsEvent value)? getReels,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult? Function(_CreateReelEvent value)? createReel,
    TResult? Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult? Function(_GetReelComments value)? getReelComments,
    TResult? Function(_AddCommentToReel value)? addCommentToReel,
    TResult? Function(_RecordReelView value)? recordReelView,
    TResult? Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult? Function(_DeleteReel value)? deleteReel,
    TResult? Function(_GetMyReels value)? getMyReels,
  }) {
    return getReels?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetReelsEvent value)? getReels,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult Function(_CreateReelEvent value)? createReel,
    TResult Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult Function(_GetReelComments value)? getReelComments,
    TResult Function(_AddCommentToReel value)? addCommentToReel,
    TResult Function(_RecordReelView value)? recordReelView,
    TResult Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult Function(_DeleteReel value)? deleteReel,
    TResult Function(_GetMyReels value)? getMyReels,
    required TResult orElse(),
  }) {
    if (getReels != null) {
      return getReels(this);
    }
    return orElse();
  }
}

abstract class _GetReelsEvent implements ReelsEvent {
  const factory _GetReelsEvent({final int? skip, final int? limit}) =
      _$GetReelsEventImpl;

  int? get skip;
  int? get limit;
  @JsonKey(ignore: true)
  _$$GetReelsEventImplCopyWith<_$GetReelsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsLoadingImplCopyWith<$Res> {
  factory _$$IsLoadingImplCopyWith(
          _$IsLoadingImpl value, $Res Function(_$IsLoadingImpl) then) =
      __$$IsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsLoadingImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$IsLoadingImpl>
    implements _$$IsLoadingImplCopyWith<$Res> {
  __$$IsLoadingImplCopyWithImpl(
      _$IsLoadingImpl _value, $Res Function(_$IsLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IsLoadingImpl implements _IsLoading {
  const _$IsLoadingImpl();

  @override
  String toString() {
    return 'ReelsEvent.isLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit) getReels,
    required TResult Function() isLoading,
    required TResult Function(CreateReelModel createReelModel)
        updateReelDetails,
    required TResult Function(
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
            File videoFile)
        createReel,
    required TResult Function(String reelId) toggleLikeReel,
    required TResult Function(String reelId) getReelComments,
    required TResult Function(String reelId, String text) addCommentToReel,
    required TResult Function(String reelId) recordReelView,
    required TResult Function(String userId) loadOtherUserReels,
    required TResult Function(String reelId) deleteReel,
    required TResult Function() getMyReels,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit)? getReels,
    TResult? Function()? isLoading,
    TResult? Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult? Function(
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
            File videoFile)?
        createReel,
    TResult? Function(String reelId)? toggleLikeReel,
    TResult? Function(String reelId)? getReelComments,
    TResult? Function(String reelId, String text)? addCommentToReel,
    TResult? Function(String reelId)? recordReelView,
    TResult? Function(String userId)? loadOtherUserReels,
    TResult? Function(String reelId)? deleteReel,
    TResult? Function()? getMyReels,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit)? getReels,
    TResult Function()? isLoading,
    TResult Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult Function(
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
            File videoFile)?
        createReel,
    TResult Function(String reelId)? toggleLikeReel,
    TResult Function(String reelId)? getReelComments,
    TResult Function(String reelId, String text)? addCommentToReel,
    TResult Function(String reelId)? recordReelView,
    TResult Function(String userId)? loadOtherUserReels,
    TResult Function(String reelId)? deleteReel,
    TResult Function()? getMyReels,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetReelsEvent value) getReels,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateReelDetailsEvent value) updateReelDetails,
    required TResult Function(_CreateReelEvent value) createReel,
    required TResult Function(_ToggleLikeReel value) toggleLikeReel,
    required TResult Function(_GetReelComments value) getReelComments,
    required TResult Function(_AddCommentToReel value) addCommentToReel,
    required TResult Function(_RecordReelView value) recordReelView,
    required TResult Function(_LoadOtherUserReels value) loadOtherUserReels,
    required TResult Function(_DeleteReel value) deleteReel,
    required TResult Function(_GetMyReels value) getMyReels,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetReelsEvent value)? getReels,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult? Function(_CreateReelEvent value)? createReel,
    TResult? Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult? Function(_GetReelComments value)? getReelComments,
    TResult? Function(_AddCommentToReel value)? addCommentToReel,
    TResult? Function(_RecordReelView value)? recordReelView,
    TResult? Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult? Function(_DeleteReel value)? deleteReel,
    TResult? Function(_GetMyReels value)? getMyReels,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetReelsEvent value)? getReels,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult Function(_CreateReelEvent value)? createReel,
    TResult Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult Function(_GetReelComments value)? getReelComments,
    TResult Function(_AddCommentToReel value)? addCommentToReel,
    TResult Function(_RecordReelView value)? recordReelView,
    TResult Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult Function(_DeleteReel value)? deleteReel,
    TResult Function(_GetMyReels value)? getMyReels,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class _IsLoading implements ReelsEvent {
  const factory _IsLoading() = _$IsLoadingImpl;
}

/// @nodoc
abstract class _$$UpdateReelDetailsEventImplCopyWith<$Res> {
  factory _$$UpdateReelDetailsEventImplCopyWith(
          _$UpdateReelDetailsEventImpl value,
          $Res Function(_$UpdateReelDetailsEventImpl) then) =
      __$$UpdateReelDetailsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateReelModel createReelModel});
}

/// @nodoc
class __$$UpdateReelDetailsEventImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$UpdateReelDetailsEventImpl>
    implements _$$UpdateReelDetailsEventImplCopyWith<$Res> {
  __$$UpdateReelDetailsEventImplCopyWithImpl(
      _$UpdateReelDetailsEventImpl _value,
      $Res Function(_$UpdateReelDetailsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createReelModel = null,
  }) {
    return _then(_$UpdateReelDetailsEventImpl(
      createReelModel: null == createReelModel
          ? _value.createReelModel
          : createReelModel // ignore: cast_nullable_to_non_nullable
              as CreateReelModel,
    ));
  }
}

/// @nodoc

class _$UpdateReelDetailsEventImpl implements _UpdateReelDetailsEvent {
  const _$UpdateReelDetailsEventImpl({required this.createReelModel});

  @override
  final CreateReelModel createReelModel;

  @override
  String toString() {
    return 'ReelsEvent.updateReelDetails(createReelModel: $createReelModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateReelDetailsEventImpl &&
            (identical(other.createReelModel, createReelModel) ||
                other.createReelModel == createReelModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createReelModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateReelDetailsEventImplCopyWith<_$UpdateReelDetailsEventImpl>
      get copyWith => __$$UpdateReelDetailsEventImplCopyWithImpl<
          _$UpdateReelDetailsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit) getReels,
    required TResult Function() isLoading,
    required TResult Function(CreateReelModel createReelModel)
        updateReelDetails,
    required TResult Function(
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
            File videoFile)
        createReel,
    required TResult Function(String reelId) toggleLikeReel,
    required TResult Function(String reelId) getReelComments,
    required TResult Function(String reelId, String text) addCommentToReel,
    required TResult Function(String reelId) recordReelView,
    required TResult Function(String userId) loadOtherUserReels,
    required TResult Function(String reelId) deleteReel,
    required TResult Function() getMyReels,
  }) {
    return updateReelDetails(createReelModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit)? getReels,
    TResult? Function()? isLoading,
    TResult? Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult? Function(
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
            File videoFile)?
        createReel,
    TResult? Function(String reelId)? toggleLikeReel,
    TResult? Function(String reelId)? getReelComments,
    TResult? Function(String reelId, String text)? addCommentToReel,
    TResult? Function(String reelId)? recordReelView,
    TResult? Function(String userId)? loadOtherUserReels,
    TResult? Function(String reelId)? deleteReel,
    TResult? Function()? getMyReels,
  }) {
    return updateReelDetails?.call(createReelModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit)? getReels,
    TResult Function()? isLoading,
    TResult Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult Function(
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
            File videoFile)?
        createReel,
    TResult Function(String reelId)? toggleLikeReel,
    TResult Function(String reelId)? getReelComments,
    TResult Function(String reelId, String text)? addCommentToReel,
    TResult Function(String reelId)? recordReelView,
    TResult Function(String userId)? loadOtherUserReels,
    TResult Function(String reelId)? deleteReel,
    TResult Function()? getMyReels,
    required TResult orElse(),
  }) {
    if (updateReelDetails != null) {
      return updateReelDetails(createReelModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetReelsEvent value) getReels,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateReelDetailsEvent value) updateReelDetails,
    required TResult Function(_CreateReelEvent value) createReel,
    required TResult Function(_ToggleLikeReel value) toggleLikeReel,
    required TResult Function(_GetReelComments value) getReelComments,
    required TResult Function(_AddCommentToReel value) addCommentToReel,
    required TResult Function(_RecordReelView value) recordReelView,
    required TResult Function(_LoadOtherUserReels value) loadOtherUserReels,
    required TResult Function(_DeleteReel value) deleteReel,
    required TResult Function(_GetMyReels value) getMyReels,
  }) {
    return updateReelDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetReelsEvent value)? getReels,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult? Function(_CreateReelEvent value)? createReel,
    TResult? Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult? Function(_GetReelComments value)? getReelComments,
    TResult? Function(_AddCommentToReel value)? addCommentToReel,
    TResult? Function(_RecordReelView value)? recordReelView,
    TResult? Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult? Function(_DeleteReel value)? deleteReel,
    TResult? Function(_GetMyReels value)? getMyReels,
  }) {
    return updateReelDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetReelsEvent value)? getReels,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult Function(_CreateReelEvent value)? createReel,
    TResult Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult Function(_GetReelComments value)? getReelComments,
    TResult Function(_AddCommentToReel value)? addCommentToReel,
    TResult Function(_RecordReelView value)? recordReelView,
    TResult Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult Function(_DeleteReel value)? deleteReel,
    TResult Function(_GetMyReels value)? getMyReels,
    required TResult orElse(),
  }) {
    if (updateReelDetails != null) {
      return updateReelDetails(this);
    }
    return orElse();
  }
}

abstract class _UpdateReelDetailsEvent implements ReelsEvent {
  const factory _UpdateReelDetailsEvent(
          {required final CreateReelModel createReelModel}) =
      _$UpdateReelDetailsEventImpl;

  CreateReelModel get createReelModel;
  @JsonKey(ignore: true)
  _$$UpdateReelDetailsEventImplCopyWith<_$UpdateReelDetailsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateReelEventImplCopyWith<$Res> {
  factory _$$CreateReelEventImplCopyWith(_$CreateReelEventImpl value,
          $Res Function(_$CreateReelEventImpl) then) =
      __$$CreateReelEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? description,
      List<String>? category,
      String? location,
      String? city,
      String? state,
      String? address,
      double? latitude,
      double? longitude,
      bool? isPromoted,
      String? promotedUntil,
      File videoFile});
}

/// @nodoc
class __$$CreateReelEventImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$CreateReelEventImpl>
    implements _$$CreateReelEventImplCopyWith<$Res> {
  __$$CreateReelEventImplCopyWithImpl(
      _$CreateReelEventImpl _value, $Res Function(_$CreateReelEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? category = freezed,
    Object? location = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isPromoted = freezed,
    Object? promotedUntil = freezed,
    Object? videoFile = null,
  }) {
    return _then(_$CreateReelEventImpl(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isPromoted: freezed == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool?,
      promotedUntil: freezed == promotedUntil
          ? _value.promotedUntil
          : promotedUntil // ignore: cast_nullable_to_non_nullable
              as String?,
      videoFile: null == videoFile
          ? _value.videoFile
          : videoFile // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$CreateReelEventImpl implements _CreateReelEvent {
  const _$CreateReelEventImpl(
      {this.description,
      final List<String>? category,
      this.location,
      this.city,
      this.state,
      this.address,
      this.latitude,
      this.longitude,
      this.isPromoted,
      this.promotedUntil,
      required this.videoFile})
      : _category = category;

  @override
  final String? description;
  final List<String>? _category;
  @override
  List<String>? get category {
    final value = _category;
    if (value == null) return null;
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? location;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? address;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final bool? isPromoted;
  @override
  final String? promotedUntil;
  @override
  final File videoFile;

  @override
  String toString() {
    return 'ReelsEvent.createReel(description: $description, category: $category, location: $location, city: $city, state: $state, address: $address, latitude: $latitude, longitude: $longitude, isPromoted: $isPromoted, promotedUntil: $promotedUntil, videoFile: $videoFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReelEventImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isPromoted, isPromoted) ||
                other.isPromoted == isPromoted) &&
            (identical(other.promotedUntil, promotedUntil) ||
                other.promotedUntil == promotedUntil) &&
            (identical(other.videoFile, videoFile) ||
                other.videoFile == videoFile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      description,
      const DeepCollectionEquality().hash(_category),
      location,
      city,
      state,
      address,
      latitude,
      longitude,
      isPromoted,
      promotedUntil,
      videoFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReelEventImplCopyWith<_$CreateReelEventImpl> get copyWith =>
      __$$CreateReelEventImplCopyWithImpl<_$CreateReelEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit) getReels,
    required TResult Function() isLoading,
    required TResult Function(CreateReelModel createReelModel)
        updateReelDetails,
    required TResult Function(
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
            File videoFile)
        createReel,
    required TResult Function(String reelId) toggleLikeReel,
    required TResult Function(String reelId) getReelComments,
    required TResult Function(String reelId, String text) addCommentToReel,
    required TResult Function(String reelId) recordReelView,
    required TResult Function(String userId) loadOtherUserReels,
    required TResult Function(String reelId) deleteReel,
    required TResult Function() getMyReels,
  }) {
    return createReel(description, category, location, city, state, address,
        latitude, longitude, isPromoted, promotedUntil, videoFile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit)? getReels,
    TResult? Function()? isLoading,
    TResult? Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult? Function(
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
            File videoFile)?
        createReel,
    TResult? Function(String reelId)? toggleLikeReel,
    TResult? Function(String reelId)? getReelComments,
    TResult? Function(String reelId, String text)? addCommentToReel,
    TResult? Function(String reelId)? recordReelView,
    TResult? Function(String userId)? loadOtherUserReels,
    TResult? Function(String reelId)? deleteReel,
    TResult? Function()? getMyReels,
  }) {
    return createReel?.call(description, category, location, city, state,
        address, latitude, longitude, isPromoted, promotedUntil, videoFile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit)? getReels,
    TResult Function()? isLoading,
    TResult Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult Function(
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
            File videoFile)?
        createReel,
    TResult Function(String reelId)? toggleLikeReel,
    TResult Function(String reelId)? getReelComments,
    TResult Function(String reelId, String text)? addCommentToReel,
    TResult Function(String reelId)? recordReelView,
    TResult Function(String userId)? loadOtherUserReels,
    TResult Function(String reelId)? deleteReel,
    TResult Function()? getMyReels,
    required TResult orElse(),
  }) {
    if (createReel != null) {
      return createReel(description, category, location, city, state, address,
          latitude, longitude, isPromoted, promotedUntil, videoFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetReelsEvent value) getReels,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateReelDetailsEvent value) updateReelDetails,
    required TResult Function(_CreateReelEvent value) createReel,
    required TResult Function(_ToggleLikeReel value) toggleLikeReel,
    required TResult Function(_GetReelComments value) getReelComments,
    required TResult Function(_AddCommentToReel value) addCommentToReel,
    required TResult Function(_RecordReelView value) recordReelView,
    required TResult Function(_LoadOtherUserReels value) loadOtherUserReels,
    required TResult Function(_DeleteReel value) deleteReel,
    required TResult Function(_GetMyReels value) getMyReels,
  }) {
    return createReel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetReelsEvent value)? getReels,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult? Function(_CreateReelEvent value)? createReel,
    TResult? Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult? Function(_GetReelComments value)? getReelComments,
    TResult? Function(_AddCommentToReel value)? addCommentToReel,
    TResult? Function(_RecordReelView value)? recordReelView,
    TResult? Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult? Function(_DeleteReel value)? deleteReel,
    TResult? Function(_GetMyReels value)? getMyReels,
  }) {
    return createReel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetReelsEvent value)? getReels,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult Function(_CreateReelEvent value)? createReel,
    TResult Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult Function(_GetReelComments value)? getReelComments,
    TResult Function(_AddCommentToReel value)? addCommentToReel,
    TResult Function(_RecordReelView value)? recordReelView,
    TResult Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult Function(_DeleteReel value)? deleteReel,
    TResult Function(_GetMyReels value)? getMyReels,
    required TResult orElse(),
  }) {
    if (createReel != null) {
      return createReel(this);
    }
    return orElse();
  }
}

abstract class _CreateReelEvent implements ReelsEvent {
  const factory _CreateReelEvent(
      {final String? description,
      final List<String>? category,
      final String? location,
      final String? city,
      final String? state,
      final String? address,
      final double? latitude,
      final double? longitude,
      final bool? isPromoted,
      final String? promotedUntil,
      required final File videoFile}) = _$CreateReelEventImpl;

  String? get description;
  List<String>? get category;
  String? get location;
  String? get city;
  String? get state;
  String? get address;
  double? get latitude;
  double? get longitude;
  bool? get isPromoted;
  String? get promotedUntil;
  File get videoFile;
  @JsonKey(ignore: true)
  _$$CreateReelEventImplCopyWith<_$CreateReelEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleLikeReelImplCopyWith<$Res> {
  factory _$$ToggleLikeReelImplCopyWith(_$ToggleLikeReelImpl value,
          $Res Function(_$ToggleLikeReelImpl) then) =
      __$$ToggleLikeReelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reelId});
}

/// @nodoc
class __$$ToggleLikeReelImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$ToggleLikeReelImpl>
    implements _$$ToggleLikeReelImplCopyWith<$Res> {
  __$$ToggleLikeReelImplCopyWithImpl(
      _$ToggleLikeReelImpl _value, $Res Function(_$ToggleLikeReelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reelId = null,
  }) {
    return _then(_$ToggleLikeReelImpl(
      reelId: null == reelId
          ? _value.reelId
          : reelId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToggleLikeReelImpl implements _ToggleLikeReel {
  const _$ToggleLikeReelImpl({required this.reelId});

  @override
  final String reelId;

  @override
  String toString() {
    return 'ReelsEvent.toggleLikeReel(reelId: $reelId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleLikeReelImpl &&
            (identical(other.reelId, reelId) || other.reelId == reelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleLikeReelImplCopyWith<_$ToggleLikeReelImpl> get copyWith =>
      __$$ToggleLikeReelImplCopyWithImpl<_$ToggleLikeReelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit) getReels,
    required TResult Function() isLoading,
    required TResult Function(CreateReelModel createReelModel)
        updateReelDetails,
    required TResult Function(
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
            File videoFile)
        createReel,
    required TResult Function(String reelId) toggleLikeReel,
    required TResult Function(String reelId) getReelComments,
    required TResult Function(String reelId, String text) addCommentToReel,
    required TResult Function(String reelId) recordReelView,
    required TResult Function(String userId) loadOtherUserReels,
    required TResult Function(String reelId) deleteReel,
    required TResult Function() getMyReels,
  }) {
    return toggleLikeReel(reelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit)? getReels,
    TResult? Function()? isLoading,
    TResult? Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult? Function(
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
            File videoFile)?
        createReel,
    TResult? Function(String reelId)? toggleLikeReel,
    TResult? Function(String reelId)? getReelComments,
    TResult? Function(String reelId, String text)? addCommentToReel,
    TResult? Function(String reelId)? recordReelView,
    TResult? Function(String userId)? loadOtherUserReels,
    TResult? Function(String reelId)? deleteReel,
    TResult? Function()? getMyReels,
  }) {
    return toggleLikeReel?.call(reelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit)? getReels,
    TResult Function()? isLoading,
    TResult Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult Function(
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
            File videoFile)?
        createReel,
    TResult Function(String reelId)? toggleLikeReel,
    TResult Function(String reelId)? getReelComments,
    TResult Function(String reelId, String text)? addCommentToReel,
    TResult Function(String reelId)? recordReelView,
    TResult Function(String userId)? loadOtherUserReels,
    TResult Function(String reelId)? deleteReel,
    TResult Function()? getMyReels,
    required TResult orElse(),
  }) {
    if (toggleLikeReel != null) {
      return toggleLikeReel(reelId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetReelsEvent value) getReels,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateReelDetailsEvent value) updateReelDetails,
    required TResult Function(_CreateReelEvent value) createReel,
    required TResult Function(_ToggleLikeReel value) toggleLikeReel,
    required TResult Function(_GetReelComments value) getReelComments,
    required TResult Function(_AddCommentToReel value) addCommentToReel,
    required TResult Function(_RecordReelView value) recordReelView,
    required TResult Function(_LoadOtherUserReels value) loadOtherUserReels,
    required TResult Function(_DeleteReel value) deleteReel,
    required TResult Function(_GetMyReels value) getMyReels,
  }) {
    return toggleLikeReel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetReelsEvent value)? getReels,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult? Function(_CreateReelEvent value)? createReel,
    TResult? Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult? Function(_GetReelComments value)? getReelComments,
    TResult? Function(_AddCommentToReel value)? addCommentToReel,
    TResult? Function(_RecordReelView value)? recordReelView,
    TResult? Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult? Function(_DeleteReel value)? deleteReel,
    TResult? Function(_GetMyReels value)? getMyReels,
  }) {
    return toggleLikeReel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetReelsEvent value)? getReels,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult Function(_CreateReelEvent value)? createReel,
    TResult Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult Function(_GetReelComments value)? getReelComments,
    TResult Function(_AddCommentToReel value)? addCommentToReel,
    TResult Function(_RecordReelView value)? recordReelView,
    TResult Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult Function(_DeleteReel value)? deleteReel,
    TResult Function(_GetMyReels value)? getMyReels,
    required TResult orElse(),
  }) {
    if (toggleLikeReel != null) {
      return toggleLikeReel(this);
    }
    return orElse();
  }
}

abstract class _ToggleLikeReel implements ReelsEvent {
  const factory _ToggleLikeReel({required final String reelId}) =
      _$ToggleLikeReelImpl;

  String get reelId;
  @JsonKey(ignore: true)
  _$$ToggleLikeReelImplCopyWith<_$ToggleLikeReelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetReelCommentsImplCopyWith<$Res> {
  factory _$$GetReelCommentsImplCopyWith(_$GetReelCommentsImpl value,
          $Res Function(_$GetReelCommentsImpl) then) =
      __$$GetReelCommentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reelId});
}

/// @nodoc
class __$$GetReelCommentsImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$GetReelCommentsImpl>
    implements _$$GetReelCommentsImplCopyWith<$Res> {
  __$$GetReelCommentsImplCopyWithImpl(
      _$GetReelCommentsImpl _value, $Res Function(_$GetReelCommentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reelId = null,
  }) {
    return _then(_$GetReelCommentsImpl(
      reelId: null == reelId
          ? _value.reelId
          : reelId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetReelCommentsImpl implements _GetReelComments {
  const _$GetReelCommentsImpl({required this.reelId});

  @override
  final String reelId;

  @override
  String toString() {
    return 'ReelsEvent.getReelComments(reelId: $reelId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReelCommentsImpl &&
            (identical(other.reelId, reelId) || other.reelId == reelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetReelCommentsImplCopyWith<_$GetReelCommentsImpl> get copyWith =>
      __$$GetReelCommentsImplCopyWithImpl<_$GetReelCommentsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit) getReels,
    required TResult Function() isLoading,
    required TResult Function(CreateReelModel createReelModel)
        updateReelDetails,
    required TResult Function(
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
            File videoFile)
        createReel,
    required TResult Function(String reelId) toggleLikeReel,
    required TResult Function(String reelId) getReelComments,
    required TResult Function(String reelId, String text) addCommentToReel,
    required TResult Function(String reelId) recordReelView,
    required TResult Function(String userId) loadOtherUserReels,
    required TResult Function(String reelId) deleteReel,
    required TResult Function() getMyReels,
  }) {
    return getReelComments(reelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit)? getReels,
    TResult? Function()? isLoading,
    TResult? Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult? Function(
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
            File videoFile)?
        createReel,
    TResult? Function(String reelId)? toggleLikeReel,
    TResult? Function(String reelId)? getReelComments,
    TResult? Function(String reelId, String text)? addCommentToReel,
    TResult? Function(String reelId)? recordReelView,
    TResult? Function(String userId)? loadOtherUserReels,
    TResult? Function(String reelId)? deleteReel,
    TResult? Function()? getMyReels,
  }) {
    return getReelComments?.call(reelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit)? getReels,
    TResult Function()? isLoading,
    TResult Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult Function(
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
            File videoFile)?
        createReel,
    TResult Function(String reelId)? toggleLikeReel,
    TResult Function(String reelId)? getReelComments,
    TResult Function(String reelId, String text)? addCommentToReel,
    TResult Function(String reelId)? recordReelView,
    TResult Function(String userId)? loadOtherUserReels,
    TResult Function(String reelId)? deleteReel,
    TResult Function()? getMyReels,
    required TResult orElse(),
  }) {
    if (getReelComments != null) {
      return getReelComments(reelId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetReelsEvent value) getReels,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateReelDetailsEvent value) updateReelDetails,
    required TResult Function(_CreateReelEvent value) createReel,
    required TResult Function(_ToggleLikeReel value) toggleLikeReel,
    required TResult Function(_GetReelComments value) getReelComments,
    required TResult Function(_AddCommentToReel value) addCommentToReel,
    required TResult Function(_RecordReelView value) recordReelView,
    required TResult Function(_LoadOtherUserReels value) loadOtherUserReels,
    required TResult Function(_DeleteReel value) deleteReel,
    required TResult Function(_GetMyReels value) getMyReels,
  }) {
    return getReelComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetReelsEvent value)? getReels,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult? Function(_CreateReelEvent value)? createReel,
    TResult? Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult? Function(_GetReelComments value)? getReelComments,
    TResult? Function(_AddCommentToReel value)? addCommentToReel,
    TResult? Function(_RecordReelView value)? recordReelView,
    TResult? Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult? Function(_DeleteReel value)? deleteReel,
    TResult? Function(_GetMyReels value)? getMyReels,
  }) {
    return getReelComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetReelsEvent value)? getReels,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult Function(_CreateReelEvent value)? createReel,
    TResult Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult Function(_GetReelComments value)? getReelComments,
    TResult Function(_AddCommentToReel value)? addCommentToReel,
    TResult Function(_RecordReelView value)? recordReelView,
    TResult Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult Function(_DeleteReel value)? deleteReel,
    TResult Function(_GetMyReels value)? getMyReels,
    required TResult orElse(),
  }) {
    if (getReelComments != null) {
      return getReelComments(this);
    }
    return orElse();
  }
}

abstract class _GetReelComments implements ReelsEvent {
  const factory _GetReelComments({required final String reelId}) =
      _$GetReelCommentsImpl;

  String get reelId;
  @JsonKey(ignore: true)
  _$$GetReelCommentsImplCopyWith<_$GetReelCommentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddCommentToReelImplCopyWith<$Res> {
  factory _$$AddCommentToReelImplCopyWith(_$AddCommentToReelImpl value,
          $Res Function(_$AddCommentToReelImpl) then) =
      __$$AddCommentToReelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reelId, String text});
}

/// @nodoc
class __$$AddCommentToReelImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$AddCommentToReelImpl>
    implements _$$AddCommentToReelImplCopyWith<$Res> {
  __$$AddCommentToReelImplCopyWithImpl(_$AddCommentToReelImpl _value,
      $Res Function(_$AddCommentToReelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reelId = null,
    Object? text = null,
  }) {
    return _then(_$AddCommentToReelImpl(
      reelId: null == reelId
          ? _value.reelId
          : reelId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddCommentToReelImpl implements _AddCommentToReel {
  const _$AddCommentToReelImpl({required this.reelId, required this.text});

  @override
  final String reelId;
  @override
  final String text;

  @override
  String toString() {
    return 'ReelsEvent.addCommentToReel(reelId: $reelId, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCommentToReelImpl &&
            (identical(other.reelId, reelId) || other.reelId == reelId) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reelId, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCommentToReelImplCopyWith<_$AddCommentToReelImpl> get copyWith =>
      __$$AddCommentToReelImplCopyWithImpl<_$AddCommentToReelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit) getReels,
    required TResult Function() isLoading,
    required TResult Function(CreateReelModel createReelModel)
        updateReelDetails,
    required TResult Function(
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
            File videoFile)
        createReel,
    required TResult Function(String reelId) toggleLikeReel,
    required TResult Function(String reelId) getReelComments,
    required TResult Function(String reelId, String text) addCommentToReel,
    required TResult Function(String reelId) recordReelView,
    required TResult Function(String userId) loadOtherUserReels,
    required TResult Function(String reelId) deleteReel,
    required TResult Function() getMyReels,
  }) {
    return addCommentToReel(reelId, text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit)? getReels,
    TResult? Function()? isLoading,
    TResult? Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult? Function(
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
            File videoFile)?
        createReel,
    TResult? Function(String reelId)? toggleLikeReel,
    TResult? Function(String reelId)? getReelComments,
    TResult? Function(String reelId, String text)? addCommentToReel,
    TResult? Function(String reelId)? recordReelView,
    TResult? Function(String userId)? loadOtherUserReels,
    TResult? Function(String reelId)? deleteReel,
    TResult? Function()? getMyReels,
  }) {
    return addCommentToReel?.call(reelId, text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit)? getReels,
    TResult Function()? isLoading,
    TResult Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult Function(
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
            File videoFile)?
        createReel,
    TResult Function(String reelId)? toggleLikeReel,
    TResult Function(String reelId)? getReelComments,
    TResult Function(String reelId, String text)? addCommentToReel,
    TResult Function(String reelId)? recordReelView,
    TResult Function(String userId)? loadOtherUserReels,
    TResult Function(String reelId)? deleteReel,
    TResult Function()? getMyReels,
    required TResult orElse(),
  }) {
    if (addCommentToReel != null) {
      return addCommentToReel(reelId, text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetReelsEvent value) getReels,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateReelDetailsEvent value) updateReelDetails,
    required TResult Function(_CreateReelEvent value) createReel,
    required TResult Function(_ToggleLikeReel value) toggleLikeReel,
    required TResult Function(_GetReelComments value) getReelComments,
    required TResult Function(_AddCommentToReel value) addCommentToReel,
    required TResult Function(_RecordReelView value) recordReelView,
    required TResult Function(_LoadOtherUserReels value) loadOtherUserReels,
    required TResult Function(_DeleteReel value) deleteReel,
    required TResult Function(_GetMyReels value) getMyReels,
  }) {
    return addCommentToReel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetReelsEvent value)? getReels,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult? Function(_CreateReelEvent value)? createReel,
    TResult? Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult? Function(_GetReelComments value)? getReelComments,
    TResult? Function(_AddCommentToReel value)? addCommentToReel,
    TResult? Function(_RecordReelView value)? recordReelView,
    TResult? Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult? Function(_DeleteReel value)? deleteReel,
    TResult? Function(_GetMyReels value)? getMyReels,
  }) {
    return addCommentToReel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetReelsEvent value)? getReels,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult Function(_CreateReelEvent value)? createReel,
    TResult Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult Function(_GetReelComments value)? getReelComments,
    TResult Function(_AddCommentToReel value)? addCommentToReel,
    TResult Function(_RecordReelView value)? recordReelView,
    TResult Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult Function(_DeleteReel value)? deleteReel,
    TResult Function(_GetMyReels value)? getMyReels,
    required TResult orElse(),
  }) {
    if (addCommentToReel != null) {
      return addCommentToReel(this);
    }
    return orElse();
  }
}

abstract class _AddCommentToReel implements ReelsEvent {
  const factory _AddCommentToReel(
      {required final String reelId,
      required final String text}) = _$AddCommentToReelImpl;

  String get reelId;
  String get text;
  @JsonKey(ignore: true)
  _$$AddCommentToReelImplCopyWith<_$AddCommentToReelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordReelViewImplCopyWith<$Res> {
  factory _$$RecordReelViewImplCopyWith(_$RecordReelViewImpl value,
          $Res Function(_$RecordReelViewImpl) then) =
      __$$RecordReelViewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reelId});
}

/// @nodoc
class __$$RecordReelViewImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$RecordReelViewImpl>
    implements _$$RecordReelViewImplCopyWith<$Res> {
  __$$RecordReelViewImplCopyWithImpl(
      _$RecordReelViewImpl _value, $Res Function(_$RecordReelViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reelId = null,
  }) {
    return _then(_$RecordReelViewImpl(
      reelId: null == reelId
          ? _value.reelId
          : reelId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RecordReelViewImpl implements _RecordReelView {
  const _$RecordReelViewImpl({required this.reelId});

  @override
  final String reelId;

  @override
  String toString() {
    return 'ReelsEvent.recordReelView(reelId: $reelId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordReelViewImpl &&
            (identical(other.reelId, reelId) || other.reelId == reelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordReelViewImplCopyWith<_$RecordReelViewImpl> get copyWith =>
      __$$RecordReelViewImplCopyWithImpl<_$RecordReelViewImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit) getReels,
    required TResult Function() isLoading,
    required TResult Function(CreateReelModel createReelModel)
        updateReelDetails,
    required TResult Function(
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
            File videoFile)
        createReel,
    required TResult Function(String reelId) toggleLikeReel,
    required TResult Function(String reelId) getReelComments,
    required TResult Function(String reelId, String text) addCommentToReel,
    required TResult Function(String reelId) recordReelView,
    required TResult Function(String userId) loadOtherUserReels,
    required TResult Function(String reelId) deleteReel,
    required TResult Function() getMyReels,
  }) {
    return recordReelView(reelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit)? getReels,
    TResult? Function()? isLoading,
    TResult? Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult? Function(
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
            File videoFile)?
        createReel,
    TResult? Function(String reelId)? toggleLikeReel,
    TResult? Function(String reelId)? getReelComments,
    TResult? Function(String reelId, String text)? addCommentToReel,
    TResult? Function(String reelId)? recordReelView,
    TResult? Function(String userId)? loadOtherUserReels,
    TResult? Function(String reelId)? deleteReel,
    TResult? Function()? getMyReels,
  }) {
    return recordReelView?.call(reelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit)? getReels,
    TResult Function()? isLoading,
    TResult Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult Function(
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
            File videoFile)?
        createReel,
    TResult Function(String reelId)? toggleLikeReel,
    TResult Function(String reelId)? getReelComments,
    TResult Function(String reelId, String text)? addCommentToReel,
    TResult Function(String reelId)? recordReelView,
    TResult Function(String userId)? loadOtherUserReels,
    TResult Function(String reelId)? deleteReel,
    TResult Function()? getMyReels,
    required TResult orElse(),
  }) {
    if (recordReelView != null) {
      return recordReelView(reelId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetReelsEvent value) getReels,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateReelDetailsEvent value) updateReelDetails,
    required TResult Function(_CreateReelEvent value) createReel,
    required TResult Function(_ToggleLikeReel value) toggleLikeReel,
    required TResult Function(_GetReelComments value) getReelComments,
    required TResult Function(_AddCommentToReel value) addCommentToReel,
    required TResult Function(_RecordReelView value) recordReelView,
    required TResult Function(_LoadOtherUserReels value) loadOtherUserReels,
    required TResult Function(_DeleteReel value) deleteReel,
    required TResult Function(_GetMyReels value) getMyReels,
  }) {
    return recordReelView(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetReelsEvent value)? getReels,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult? Function(_CreateReelEvent value)? createReel,
    TResult? Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult? Function(_GetReelComments value)? getReelComments,
    TResult? Function(_AddCommentToReel value)? addCommentToReel,
    TResult? Function(_RecordReelView value)? recordReelView,
    TResult? Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult? Function(_DeleteReel value)? deleteReel,
    TResult? Function(_GetMyReels value)? getMyReels,
  }) {
    return recordReelView?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetReelsEvent value)? getReels,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult Function(_CreateReelEvent value)? createReel,
    TResult Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult Function(_GetReelComments value)? getReelComments,
    TResult Function(_AddCommentToReel value)? addCommentToReel,
    TResult Function(_RecordReelView value)? recordReelView,
    TResult Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult Function(_DeleteReel value)? deleteReel,
    TResult Function(_GetMyReels value)? getMyReels,
    required TResult orElse(),
  }) {
    if (recordReelView != null) {
      return recordReelView(this);
    }
    return orElse();
  }
}

abstract class _RecordReelView implements ReelsEvent {
  const factory _RecordReelView({required final String reelId}) =
      _$RecordReelViewImpl;

  String get reelId;
  @JsonKey(ignore: true)
  _$$RecordReelViewImplCopyWith<_$RecordReelViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadOtherUserReelsImplCopyWith<$Res> {
  factory _$$LoadOtherUserReelsImplCopyWith(_$LoadOtherUserReelsImpl value,
          $Res Function(_$LoadOtherUserReelsImpl) then) =
      __$$LoadOtherUserReelsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoadOtherUserReelsImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$LoadOtherUserReelsImpl>
    implements _$$LoadOtherUserReelsImplCopyWith<$Res> {
  __$$LoadOtherUserReelsImplCopyWithImpl(_$LoadOtherUserReelsImpl _value,
      $Res Function(_$LoadOtherUserReelsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$LoadOtherUserReelsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadOtherUserReelsImpl implements _LoadOtherUserReels {
  const _$LoadOtherUserReelsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'ReelsEvent.loadOtherUserReels(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadOtherUserReelsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadOtherUserReelsImplCopyWith<_$LoadOtherUserReelsImpl> get copyWith =>
      __$$LoadOtherUserReelsImplCopyWithImpl<_$LoadOtherUserReelsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit) getReels,
    required TResult Function() isLoading,
    required TResult Function(CreateReelModel createReelModel)
        updateReelDetails,
    required TResult Function(
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
            File videoFile)
        createReel,
    required TResult Function(String reelId) toggleLikeReel,
    required TResult Function(String reelId) getReelComments,
    required TResult Function(String reelId, String text) addCommentToReel,
    required TResult Function(String reelId) recordReelView,
    required TResult Function(String userId) loadOtherUserReels,
    required TResult Function(String reelId) deleteReel,
    required TResult Function() getMyReels,
  }) {
    return loadOtherUserReels(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit)? getReels,
    TResult? Function()? isLoading,
    TResult? Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult? Function(
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
            File videoFile)?
        createReel,
    TResult? Function(String reelId)? toggleLikeReel,
    TResult? Function(String reelId)? getReelComments,
    TResult? Function(String reelId, String text)? addCommentToReel,
    TResult? Function(String reelId)? recordReelView,
    TResult? Function(String userId)? loadOtherUserReels,
    TResult? Function(String reelId)? deleteReel,
    TResult? Function()? getMyReels,
  }) {
    return loadOtherUserReels?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit)? getReels,
    TResult Function()? isLoading,
    TResult Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult Function(
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
            File videoFile)?
        createReel,
    TResult Function(String reelId)? toggleLikeReel,
    TResult Function(String reelId)? getReelComments,
    TResult Function(String reelId, String text)? addCommentToReel,
    TResult Function(String reelId)? recordReelView,
    TResult Function(String userId)? loadOtherUserReels,
    TResult Function(String reelId)? deleteReel,
    TResult Function()? getMyReels,
    required TResult orElse(),
  }) {
    if (loadOtherUserReels != null) {
      return loadOtherUserReels(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetReelsEvent value) getReels,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateReelDetailsEvent value) updateReelDetails,
    required TResult Function(_CreateReelEvent value) createReel,
    required TResult Function(_ToggleLikeReel value) toggleLikeReel,
    required TResult Function(_GetReelComments value) getReelComments,
    required TResult Function(_AddCommentToReel value) addCommentToReel,
    required TResult Function(_RecordReelView value) recordReelView,
    required TResult Function(_LoadOtherUserReels value) loadOtherUserReels,
    required TResult Function(_DeleteReel value) deleteReel,
    required TResult Function(_GetMyReels value) getMyReels,
  }) {
    return loadOtherUserReels(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetReelsEvent value)? getReels,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult? Function(_CreateReelEvent value)? createReel,
    TResult? Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult? Function(_GetReelComments value)? getReelComments,
    TResult? Function(_AddCommentToReel value)? addCommentToReel,
    TResult? Function(_RecordReelView value)? recordReelView,
    TResult? Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult? Function(_DeleteReel value)? deleteReel,
    TResult? Function(_GetMyReels value)? getMyReels,
  }) {
    return loadOtherUserReels?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetReelsEvent value)? getReels,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult Function(_CreateReelEvent value)? createReel,
    TResult Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult Function(_GetReelComments value)? getReelComments,
    TResult Function(_AddCommentToReel value)? addCommentToReel,
    TResult Function(_RecordReelView value)? recordReelView,
    TResult Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult Function(_DeleteReel value)? deleteReel,
    TResult Function(_GetMyReels value)? getMyReels,
    required TResult orElse(),
  }) {
    if (loadOtherUserReels != null) {
      return loadOtherUserReels(this);
    }
    return orElse();
  }
}

abstract class _LoadOtherUserReels implements ReelsEvent {
  const factory _LoadOtherUserReels({required final String userId}) =
      _$LoadOtherUserReelsImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$LoadOtherUserReelsImplCopyWith<_$LoadOtherUserReelsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteReelImplCopyWith<$Res> {
  factory _$$DeleteReelImplCopyWith(
          _$DeleteReelImpl value, $Res Function(_$DeleteReelImpl) then) =
      __$$DeleteReelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reelId});
}

/// @nodoc
class __$$DeleteReelImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$DeleteReelImpl>
    implements _$$DeleteReelImplCopyWith<$Res> {
  __$$DeleteReelImplCopyWithImpl(
      _$DeleteReelImpl _value, $Res Function(_$DeleteReelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reelId = null,
  }) {
    return _then(_$DeleteReelImpl(
      reelId: null == reelId
          ? _value.reelId
          : reelId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteReelImpl implements _DeleteReel {
  const _$DeleteReelImpl({required this.reelId});

  @override
  final String reelId;

  @override
  String toString() {
    return 'ReelsEvent.deleteReel(reelId: $reelId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteReelImpl &&
            (identical(other.reelId, reelId) || other.reelId == reelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reelId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteReelImplCopyWith<_$DeleteReelImpl> get copyWith =>
      __$$DeleteReelImplCopyWithImpl<_$DeleteReelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit) getReels,
    required TResult Function() isLoading,
    required TResult Function(CreateReelModel createReelModel)
        updateReelDetails,
    required TResult Function(
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
            File videoFile)
        createReel,
    required TResult Function(String reelId) toggleLikeReel,
    required TResult Function(String reelId) getReelComments,
    required TResult Function(String reelId, String text) addCommentToReel,
    required TResult Function(String reelId) recordReelView,
    required TResult Function(String userId) loadOtherUserReels,
    required TResult Function(String reelId) deleteReel,
    required TResult Function() getMyReels,
  }) {
    return deleteReel(reelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit)? getReels,
    TResult? Function()? isLoading,
    TResult? Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult? Function(
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
            File videoFile)?
        createReel,
    TResult? Function(String reelId)? toggleLikeReel,
    TResult? Function(String reelId)? getReelComments,
    TResult? Function(String reelId, String text)? addCommentToReel,
    TResult? Function(String reelId)? recordReelView,
    TResult? Function(String userId)? loadOtherUserReels,
    TResult? Function(String reelId)? deleteReel,
    TResult? Function()? getMyReels,
  }) {
    return deleteReel?.call(reelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit)? getReels,
    TResult Function()? isLoading,
    TResult Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult Function(
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
            File videoFile)?
        createReel,
    TResult Function(String reelId)? toggleLikeReel,
    TResult Function(String reelId)? getReelComments,
    TResult Function(String reelId, String text)? addCommentToReel,
    TResult Function(String reelId)? recordReelView,
    TResult Function(String userId)? loadOtherUserReels,
    TResult Function(String reelId)? deleteReel,
    TResult Function()? getMyReels,
    required TResult orElse(),
  }) {
    if (deleteReel != null) {
      return deleteReel(reelId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetReelsEvent value) getReels,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateReelDetailsEvent value) updateReelDetails,
    required TResult Function(_CreateReelEvent value) createReel,
    required TResult Function(_ToggleLikeReel value) toggleLikeReel,
    required TResult Function(_GetReelComments value) getReelComments,
    required TResult Function(_AddCommentToReel value) addCommentToReel,
    required TResult Function(_RecordReelView value) recordReelView,
    required TResult Function(_LoadOtherUserReels value) loadOtherUserReels,
    required TResult Function(_DeleteReel value) deleteReel,
    required TResult Function(_GetMyReels value) getMyReels,
  }) {
    return deleteReel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetReelsEvent value)? getReels,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult? Function(_CreateReelEvent value)? createReel,
    TResult? Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult? Function(_GetReelComments value)? getReelComments,
    TResult? Function(_AddCommentToReel value)? addCommentToReel,
    TResult? Function(_RecordReelView value)? recordReelView,
    TResult? Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult? Function(_DeleteReel value)? deleteReel,
    TResult? Function(_GetMyReels value)? getMyReels,
  }) {
    return deleteReel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetReelsEvent value)? getReels,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult Function(_CreateReelEvent value)? createReel,
    TResult Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult Function(_GetReelComments value)? getReelComments,
    TResult Function(_AddCommentToReel value)? addCommentToReel,
    TResult Function(_RecordReelView value)? recordReelView,
    TResult Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult Function(_DeleteReel value)? deleteReel,
    TResult Function(_GetMyReels value)? getMyReels,
    required TResult orElse(),
  }) {
    if (deleteReel != null) {
      return deleteReel(this);
    }
    return orElse();
  }
}

abstract class _DeleteReel implements ReelsEvent {
  const factory _DeleteReel({required final String reelId}) = _$DeleteReelImpl;

  String get reelId;
  @JsonKey(ignore: true)
  _$$DeleteReelImplCopyWith<_$DeleteReelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetMyReelsImplCopyWith<$Res> {
  factory _$$GetMyReelsImplCopyWith(
          _$GetMyReelsImpl value, $Res Function(_$GetMyReelsImpl) then) =
      __$$GetMyReelsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMyReelsImplCopyWithImpl<$Res>
    extends _$ReelsEventCopyWithImpl<$Res, _$GetMyReelsImpl>
    implements _$$GetMyReelsImplCopyWith<$Res> {
  __$$GetMyReelsImplCopyWithImpl(
      _$GetMyReelsImpl _value, $Res Function(_$GetMyReelsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetMyReelsImpl implements _GetMyReels {
  const _$GetMyReelsImpl();

  @override
  String toString() {
    return 'ReelsEvent.getMyReels()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetMyReelsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit) getReels,
    required TResult Function() isLoading,
    required TResult Function(CreateReelModel createReelModel)
        updateReelDetails,
    required TResult Function(
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
            File videoFile)
        createReel,
    required TResult Function(String reelId) toggleLikeReel,
    required TResult Function(String reelId) getReelComments,
    required TResult Function(String reelId, String text) addCommentToReel,
    required TResult Function(String reelId) recordReelView,
    required TResult Function(String userId) loadOtherUserReels,
    required TResult Function(String reelId) deleteReel,
    required TResult Function() getMyReels,
  }) {
    return getMyReels();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit)? getReels,
    TResult? Function()? isLoading,
    TResult? Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult? Function(
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
            File videoFile)?
        createReel,
    TResult? Function(String reelId)? toggleLikeReel,
    TResult? Function(String reelId)? getReelComments,
    TResult? Function(String reelId, String text)? addCommentToReel,
    TResult? Function(String reelId)? recordReelView,
    TResult? Function(String userId)? loadOtherUserReels,
    TResult? Function(String reelId)? deleteReel,
    TResult? Function()? getMyReels,
  }) {
    return getMyReels?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit)? getReels,
    TResult Function()? isLoading,
    TResult Function(CreateReelModel createReelModel)? updateReelDetails,
    TResult Function(
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
            File videoFile)?
        createReel,
    TResult Function(String reelId)? toggleLikeReel,
    TResult Function(String reelId)? getReelComments,
    TResult Function(String reelId, String text)? addCommentToReel,
    TResult Function(String reelId)? recordReelView,
    TResult Function(String userId)? loadOtherUserReels,
    TResult Function(String reelId)? deleteReel,
    TResult Function()? getMyReels,
    required TResult orElse(),
  }) {
    if (getMyReels != null) {
      return getMyReels();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetReelsEvent value) getReels,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateReelDetailsEvent value) updateReelDetails,
    required TResult Function(_CreateReelEvent value) createReel,
    required TResult Function(_ToggleLikeReel value) toggleLikeReel,
    required TResult Function(_GetReelComments value) getReelComments,
    required TResult Function(_AddCommentToReel value) addCommentToReel,
    required TResult Function(_RecordReelView value) recordReelView,
    required TResult Function(_LoadOtherUserReels value) loadOtherUserReels,
    required TResult Function(_DeleteReel value) deleteReel,
    required TResult Function(_GetMyReels value) getMyReels,
  }) {
    return getMyReels(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetReelsEvent value)? getReels,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult? Function(_CreateReelEvent value)? createReel,
    TResult? Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult? Function(_GetReelComments value)? getReelComments,
    TResult? Function(_AddCommentToReel value)? addCommentToReel,
    TResult? Function(_RecordReelView value)? recordReelView,
    TResult? Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult? Function(_DeleteReel value)? deleteReel,
    TResult? Function(_GetMyReels value)? getMyReels,
  }) {
    return getMyReels?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetReelsEvent value)? getReels,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateReelDetailsEvent value)? updateReelDetails,
    TResult Function(_CreateReelEvent value)? createReel,
    TResult Function(_ToggleLikeReel value)? toggleLikeReel,
    TResult Function(_GetReelComments value)? getReelComments,
    TResult Function(_AddCommentToReel value)? addCommentToReel,
    TResult Function(_RecordReelView value)? recordReelView,
    TResult Function(_LoadOtherUserReels value)? loadOtherUserReels,
    TResult Function(_DeleteReel value)? deleteReel,
    TResult Function(_GetMyReels value)? getMyReels,
    required TResult orElse(),
  }) {
    if (getMyReels != null) {
      return getMyReels(this);
    }
    return orElse();
  }
}

abstract class _GetMyReels implements ReelsEvent {
  const factory _GetMyReels() = _$GetMyReelsImpl;
}

/// @nodoc
mixin _$ReelsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  ReelModel? get reelDetails => throw _privateConstructorUsedError;
  List<ReelResponseModel> get reelsList => throw _privateConstructorUsedError;
  int get currentOffset => throw _privateConstructorUsedError;
  bool get hasMoreData => throw _privateConstructorUsedError;
  NotifyStatus? get notifyStatus => throw _privateConstructorUsedError;
  CreateReelModel? get createReelModel => throw _privateConstructorUsedError;
  List<ReelCommentModel> get reelComments => throw _privateConstructorUsedError;
  bool get commentsLoading => throw _privateConstructorUsedError;
  List<ReelResponseModel> get otherUserReels =>
      throw _privateConstructorUsedError;
  bool get isLoadingOtherUserReels => throw _privateConstructorUsedError;
  List<ReelResponseModel> get myReels => throw _privateConstructorUsedError;
  bool get isLoadingMyReels => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReelsStateCopyWith<ReelsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReelsStateCopyWith<$Res> {
  factory $ReelsStateCopyWith(
          ReelsState value, $Res Function(ReelsState) then) =
      _$ReelsStateCopyWithImpl<$Res, ReelsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool isSuccess,
      ReelModel? reelDetails,
      List<ReelResponseModel> reelsList,
      int currentOffset,
      bool hasMoreData,
      NotifyStatus? notifyStatus,
      CreateReelModel? createReelModel,
      List<ReelCommentModel> reelComments,
      bool commentsLoading,
      List<ReelResponseModel> otherUserReels,
      bool isLoadingOtherUserReels,
      List<ReelResponseModel> myReels,
      bool isLoadingMyReels});
}

/// @nodoc
class _$ReelsStateCopyWithImpl<$Res, $Val extends ReelsState>
    implements $ReelsStateCopyWith<$Res> {
  _$ReelsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? isSuccess = null,
    Object? reelDetails = freezed,
    Object? reelsList = null,
    Object? currentOffset = null,
    Object? hasMoreData = null,
    Object? notifyStatus = freezed,
    Object? createReelModel = freezed,
    Object? reelComments = null,
    Object? commentsLoading = null,
    Object? otherUserReels = null,
    Object? isLoadingOtherUserReels = null,
    Object? myReels = null,
    Object? isLoadingMyReels = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      reelDetails: freezed == reelDetails
          ? _value.reelDetails
          : reelDetails // ignore: cast_nullable_to_non_nullable
              as ReelModel?,
      reelsList: null == reelsList
          ? _value.reelsList
          : reelsList // ignore: cast_nullable_to_non_nullable
              as List<ReelResponseModel>,
      currentOffset: null == currentOffset
          ? _value.currentOffset
          : currentOffset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
      notifyStatus: freezed == notifyStatus
          ? _value.notifyStatus
          : notifyStatus // ignore: cast_nullable_to_non_nullable
              as NotifyStatus?,
      createReelModel: freezed == createReelModel
          ? _value.createReelModel
          : createReelModel // ignore: cast_nullable_to_non_nullable
              as CreateReelModel?,
      reelComments: null == reelComments
          ? _value.reelComments
          : reelComments // ignore: cast_nullable_to_non_nullable
              as List<ReelCommentModel>,
      commentsLoading: null == commentsLoading
          ? _value.commentsLoading
          : commentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      otherUserReels: null == otherUserReels
          ? _value.otherUserReels
          : otherUserReels // ignore: cast_nullable_to_non_nullable
              as List<ReelResponseModel>,
      isLoadingOtherUserReels: null == isLoadingOtherUserReels
          ? _value.isLoadingOtherUserReels
          : isLoadingOtherUserReels // ignore: cast_nullable_to_non_nullable
              as bool,
      myReels: null == myReels
          ? _value.myReels
          : myReels // ignore: cast_nullable_to_non_nullable
              as List<ReelResponseModel>,
      isLoadingMyReels: null == isLoadingMyReels
          ? _value.isLoadingMyReels
          : isLoadingMyReels // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReelsStateImplCopyWith<$Res>
    implements $ReelsStateCopyWith<$Res> {
  factory _$$ReelsStateImplCopyWith(
          _$ReelsStateImpl value, $Res Function(_$ReelsStateImpl) then) =
      __$$ReelsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool isSuccess,
      ReelModel? reelDetails,
      List<ReelResponseModel> reelsList,
      int currentOffset,
      bool hasMoreData,
      NotifyStatus? notifyStatus,
      CreateReelModel? createReelModel,
      List<ReelCommentModel> reelComments,
      bool commentsLoading,
      List<ReelResponseModel> otherUserReels,
      bool isLoadingOtherUserReels,
      List<ReelResponseModel> myReels,
      bool isLoadingMyReels});
}

/// @nodoc
class __$$ReelsStateImplCopyWithImpl<$Res>
    extends _$ReelsStateCopyWithImpl<$Res, _$ReelsStateImpl>
    implements _$$ReelsStateImplCopyWith<$Res> {
  __$$ReelsStateImplCopyWithImpl(
      _$ReelsStateImpl _value, $Res Function(_$ReelsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? isSuccess = null,
    Object? reelDetails = freezed,
    Object? reelsList = null,
    Object? currentOffset = null,
    Object? hasMoreData = null,
    Object? notifyStatus = freezed,
    Object? createReelModel = freezed,
    Object? reelComments = null,
    Object? commentsLoading = null,
    Object? otherUserReels = null,
    Object? isLoadingOtherUserReels = null,
    Object? myReels = null,
    Object? isLoadingMyReels = null,
  }) {
    return _then(_$ReelsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      reelDetails: freezed == reelDetails
          ? _value.reelDetails
          : reelDetails // ignore: cast_nullable_to_non_nullable
              as ReelModel?,
      reelsList: null == reelsList
          ? _value._reelsList
          : reelsList // ignore: cast_nullable_to_non_nullable
              as List<ReelResponseModel>,
      currentOffset: null == currentOffset
          ? _value.currentOffset
          : currentOffset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
      notifyStatus: freezed == notifyStatus
          ? _value.notifyStatus
          : notifyStatus // ignore: cast_nullable_to_non_nullable
              as NotifyStatus?,
      createReelModel: freezed == createReelModel
          ? _value.createReelModel
          : createReelModel // ignore: cast_nullable_to_non_nullable
              as CreateReelModel?,
      reelComments: null == reelComments
          ? _value._reelComments
          : reelComments // ignore: cast_nullable_to_non_nullable
              as List<ReelCommentModel>,
      commentsLoading: null == commentsLoading
          ? _value.commentsLoading
          : commentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      otherUserReels: null == otherUserReels
          ? _value._otherUserReels
          : otherUserReels // ignore: cast_nullable_to_non_nullable
              as List<ReelResponseModel>,
      isLoadingOtherUserReels: null == isLoadingOtherUserReels
          ? _value.isLoadingOtherUserReels
          : isLoadingOtherUserReels // ignore: cast_nullable_to_non_nullable
              as bool,
      myReels: null == myReels
          ? _value._myReels
          : myReels // ignore: cast_nullable_to_non_nullable
              as List<ReelResponseModel>,
      isLoadingMyReels: null == isLoadingMyReels
          ? _value.isLoadingMyReels
          : isLoadingMyReels // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReelsStateImpl implements _ReelsState {
  const _$ReelsStateImpl(
      {this.isLoading = false,
      this.isError = false,
      this.isSuccess = false,
      this.reelDetails,
      final List<ReelResponseModel> reelsList = const <ReelResponseModel>[],
      this.currentOffset = 0,
      this.hasMoreData = false,
      this.notifyStatus,
      this.createReelModel,
      final List<ReelCommentModel> reelComments = const <ReelCommentModel>[],
      this.commentsLoading = false,
      final List<ReelResponseModel> otherUserReels =
          const <ReelResponseModel>[],
      this.isLoadingOtherUserReels = false,
      final List<ReelResponseModel> myReels = const <ReelResponseModel>[],
      this.isLoadingMyReels = false})
      : _reelsList = reelsList,
        _reelComments = reelComments,
        _otherUserReels = otherUserReels,
        _myReels = myReels;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final ReelModel? reelDetails;
  final List<ReelResponseModel> _reelsList;
  @override
  @JsonKey()
  List<ReelResponseModel> get reelsList {
    if (_reelsList is EqualUnmodifiableListView) return _reelsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reelsList);
  }

  @override
  @JsonKey()
  final int currentOffset;
  @override
  @JsonKey()
  final bool hasMoreData;
  @override
  final NotifyStatus? notifyStatus;
  @override
  final CreateReelModel? createReelModel;
  final List<ReelCommentModel> _reelComments;
  @override
  @JsonKey()
  List<ReelCommentModel> get reelComments {
    if (_reelComments is EqualUnmodifiableListView) return _reelComments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reelComments);
  }

  @override
  @JsonKey()
  final bool commentsLoading;
  final List<ReelResponseModel> _otherUserReels;
  @override
  @JsonKey()
  List<ReelResponseModel> get otherUserReels {
    if (_otherUserReels is EqualUnmodifiableListView) return _otherUserReels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherUserReels);
  }

  @override
  @JsonKey()
  final bool isLoadingOtherUserReels;
  final List<ReelResponseModel> _myReels;
  @override
  @JsonKey()
  List<ReelResponseModel> get myReels {
    if (_myReels is EqualUnmodifiableListView) return _myReels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myReels);
  }

  @override
  @JsonKey()
  final bool isLoadingMyReels;

  @override
  String toString() {
    return 'ReelsState(isLoading: $isLoading, isError: $isError, isSuccess: $isSuccess, reelDetails: $reelDetails, reelsList: $reelsList, currentOffset: $currentOffset, hasMoreData: $hasMoreData, notifyStatus: $notifyStatus, createReelModel: $createReelModel, reelComments: $reelComments, commentsLoading: $commentsLoading, otherUserReels: $otherUserReels, isLoadingOtherUserReels: $isLoadingOtherUserReels, myReels: $myReels, isLoadingMyReels: $isLoadingMyReels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReelsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.reelDetails, reelDetails) ||
                other.reelDetails == reelDetails) &&
            const DeepCollectionEquality()
                .equals(other._reelsList, _reelsList) &&
            (identical(other.currentOffset, currentOffset) ||
                other.currentOffset == currentOffset) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData) &&
            (identical(other.notifyStatus, notifyStatus) ||
                other.notifyStatus == notifyStatus) &&
            (identical(other.createReelModel, createReelModel) ||
                other.createReelModel == createReelModel) &&
            const DeepCollectionEquality()
                .equals(other._reelComments, _reelComments) &&
            (identical(other.commentsLoading, commentsLoading) ||
                other.commentsLoading == commentsLoading) &&
            const DeepCollectionEquality()
                .equals(other._otherUserReels, _otherUserReels) &&
            (identical(
                    other.isLoadingOtherUserReels, isLoadingOtherUserReels) ||
                other.isLoadingOtherUserReels == isLoadingOtherUserReels) &&
            const DeepCollectionEquality().equals(other._myReels, _myReels) &&
            (identical(other.isLoadingMyReels, isLoadingMyReels) ||
                other.isLoadingMyReels == isLoadingMyReels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isError,
      isSuccess,
      reelDetails,
      const DeepCollectionEquality().hash(_reelsList),
      currentOffset,
      hasMoreData,
      notifyStatus,
      createReelModel,
      const DeepCollectionEquality().hash(_reelComments),
      commentsLoading,
      const DeepCollectionEquality().hash(_otherUserReels),
      isLoadingOtherUserReels,
      const DeepCollectionEquality().hash(_myReels),
      isLoadingMyReels);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReelsStateImplCopyWith<_$ReelsStateImpl> get copyWith =>
      __$$ReelsStateImplCopyWithImpl<_$ReelsStateImpl>(this, _$identity);
}

abstract class _ReelsState implements ReelsState {
  const factory _ReelsState(
      {final bool isLoading,
      final bool isError,
      final bool isSuccess,
      final ReelModel? reelDetails,
      final List<ReelResponseModel> reelsList,
      final int currentOffset,
      final bool hasMoreData,
      final NotifyStatus? notifyStatus,
      final CreateReelModel? createReelModel,
      final List<ReelCommentModel> reelComments,
      final bool commentsLoading,
      final List<ReelResponseModel> otherUserReels,
      final bool isLoadingOtherUserReels,
      final List<ReelResponseModel> myReels,
      final bool isLoadingMyReels}) = _$ReelsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get isSuccess;
  @override
  ReelModel? get reelDetails;
  @override
  List<ReelResponseModel> get reelsList;
  @override
  int get currentOffset;
  @override
  bool get hasMoreData;
  @override
  NotifyStatus? get notifyStatus;
  @override
  CreateReelModel? get createReelModel;
  @override
  List<ReelCommentModel> get reelComments;
  @override
  bool get commentsLoading;
  @override
  List<ReelResponseModel> get otherUserReels;
  @override
  bool get isLoadingOtherUserReels;
  @override
  List<ReelResponseModel> get myReels;
  @override
  bool get isLoadingMyReels;
  @override
  @JsonKey(ignore: true)
  _$$ReelsStateImplCopyWith<_$ReelsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
