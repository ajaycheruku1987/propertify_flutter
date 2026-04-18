// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requests_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RequestsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)
        getRequests,
    required TResult Function(String requestId) getRequestDetails,
    required TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        createRequest,
    required TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        updateRequest,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function() isLoading,
    required TResult Function() getMyRequests,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)?
        getRequests,
    TResult? Function(String requestId)? getRequestDetails,
    TResult? Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult? Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function()? isLoading,
    TResult? Function()? getMyRequests,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit, double? latitude, double? longitude,
            double? radiusKm, String? search)?
        getRequests,
    TResult Function(String requestId)? getRequestDetails,
    TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult Function(String requestId)? deleteRequest,
    TResult Function()? isLoading,
    TResult Function()? getMyRequests,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_GetRequestDetailsEvent value) getRequestDetails,
    required TResult Function(_CreateRequestEvent value) createRequest,
    required TResult Function(_UpdateRequestEvent value) updateRequest,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyRequestsEvent value) getMyRequests,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult? Function(_CreateRequestEvent value)? createRequest,
    TResult? Function(_UpdateRequestEvent value)? updateRequest,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyRequestsEvent value)? getMyRequests,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult Function(_CreateRequestEvent value)? createRequest,
    TResult Function(_UpdateRequestEvent value)? updateRequest,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyRequestsEvent value)? getMyRequests,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestsEventCopyWith<$Res> {
  factory $RequestsEventCopyWith(
          RequestsEvent value, $Res Function(RequestsEvent) then) =
      _$RequestsEventCopyWithImpl<$Res, RequestsEvent>;
}

/// @nodoc
class _$RequestsEventCopyWithImpl<$Res, $Val extends RequestsEvent>
    implements $RequestsEventCopyWith<$Res> {
  _$RequestsEventCopyWithImpl(this._value, this._then);

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
    extends _$RequestsEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'RequestsEvent.reset()';
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
    required TResult Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)
        getRequests,
    required TResult Function(String requestId) getRequestDetails,
    required TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        createRequest,
    required TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        updateRequest,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function() isLoading,
    required TResult Function() getMyRequests,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)?
        getRequests,
    TResult? Function(String requestId)? getRequestDetails,
    TResult? Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult? Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function()? isLoading,
    TResult? Function()? getMyRequests,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit, double? latitude, double? longitude,
            double? radiusKm, String? search)?
        getRequests,
    TResult Function(String requestId)? getRequestDetails,
    TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult Function(String requestId)? deleteRequest,
    TResult Function()? isLoading,
    TResult Function()? getMyRequests,
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
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_GetRequestDetailsEvent value) getRequestDetails,
    required TResult Function(_CreateRequestEvent value) createRequest,
    required TResult Function(_UpdateRequestEvent value) updateRequest,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyRequestsEvent value) getMyRequests,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult? Function(_CreateRequestEvent value)? createRequest,
    TResult? Function(_UpdateRequestEvent value)? updateRequest,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyRequestsEvent value)? getMyRequests,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult Function(_CreateRequestEvent value)? createRequest,
    TResult Function(_UpdateRequestEvent value)? updateRequest,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyRequestsEvent value)? getMyRequests,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements RequestsEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
abstract class _$$GetRequestsEventImplCopyWith<$Res> {
  factory _$$GetRequestsEventImplCopyWith(_$GetRequestsEventImpl value,
          $Res Function(_$GetRequestsEventImpl) then) =
      __$$GetRequestsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int? skip,
      int? limit,
      double? latitude,
      double? longitude,
      double? radiusKm,
      String? search});
}

/// @nodoc
class __$$GetRequestsEventImplCopyWithImpl<$Res>
    extends _$RequestsEventCopyWithImpl<$Res, _$GetRequestsEventImpl>
    implements _$$GetRequestsEventImplCopyWith<$Res> {
  __$$GetRequestsEventImplCopyWithImpl(_$GetRequestsEventImpl _value,
      $Res Function(_$GetRequestsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skip = freezed,
    Object? limit = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radiusKm = freezed,
    Object? search = freezed,
  }) {
    return _then(_$GetRequestsEventImpl(
      skip: freezed == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      radiusKm: freezed == radiusKm
          ? _value.radiusKm
          : radiusKm // ignore: cast_nullable_to_non_nullable
              as double?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetRequestsEventImpl implements _GetRequestsEvent {
  const _$GetRequestsEventImpl(
      {this.skip,
      this.limit,
      this.latitude,
      this.longitude,
      this.radiusKm,
      this.search});

  @override
  final int? skip;
  @override
  final int? limit;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? radiusKm;
  @override
  final String? search;

  @override
  String toString() {
    return 'RequestsEvent.getRequests(skip: $skip, limit: $limit, latitude: $latitude, longitude: $longitude, radiusKm: $radiusKm, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRequestsEventImpl &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radiusKm, radiusKm) ||
                other.radiusKm == radiusKm) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, skip, limit, latitude, longitude, radiusKm, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRequestsEventImplCopyWith<_$GetRequestsEventImpl> get copyWith =>
      __$$GetRequestsEventImplCopyWithImpl<_$GetRequestsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)
        getRequests,
    required TResult Function(String requestId) getRequestDetails,
    required TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        createRequest,
    required TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        updateRequest,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function() isLoading,
    required TResult Function() getMyRequests,
  }) {
    return getRequests(skip, limit, latitude, longitude, radiusKm, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)?
        getRequests,
    TResult? Function(String requestId)? getRequestDetails,
    TResult? Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult? Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function()? isLoading,
    TResult? Function()? getMyRequests,
  }) {
    return getRequests?.call(
        skip, limit, latitude, longitude, radiusKm, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit, double? latitude, double? longitude,
            double? radiusKm, String? search)?
        getRequests,
    TResult Function(String requestId)? getRequestDetails,
    TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult Function(String requestId)? deleteRequest,
    TResult Function()? isLoading,
    TResult Function()? getMyRequests,
    required TResult orElse(),
  }) {
    if (getRequests != null) {
      return getRequests(skip, limit, latitude, longitude, radiusKm, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_GetRequestDetailsEvent value) getRequestDetails,
    required TResult Function(_CreateRequestEvent value) createRequest,
    required TResult Function(_UpdateRequestEvent value) updateRequest,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyRequestsEvent value) getMyRequests,
  }) {
    return getRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult? Function(_CreateRequestEvent value)? createRequest,
    TResult? Function(_UpdateRequestEvent value)? updateRequest,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyRequestsEvent value)? getMyRequests,
  }) {
    return getRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult Function(_CreateRequestEvent value)? createRequest,
    TResult Function(_UpdateRequestEvent value)? updateRequest,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyRequestsEvent value)? getMyRequests,
    required TResult orElse(),
  }) {
    if (getRequests != null) {
      return getRequests(this);
    }
    return orElse();
  }
}

abstract class _GetRequestsEvent implements RequestsEvent {
  const factory _GetRequestsEvent(
      {final int? skip,
      final int? limit,
      final double? latitude,
      final double? longitude,
      final double? radiusKm,
      final String? search}) = _$GetRequestsEventImpl;

  int? get skip;
  int? get limit;
  double? get latitude;
  double? get longitude;
  double? get radiusKm;
  String? get search;
  @JsonKey(ignore: true)
  _$$GetRequestsEventImplCopyWith<_$GetRequestsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetRequestDetailsEventImplCopyWith<$Res> {
  factory _$$GetRequestDetailsEventImplCopyWith(
          _$GetRequestDetailsEventImpl value,
          $Res Function(_$GetRequestDetailsEventImpl) then) =
      __$$GetRequestDetailsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String requestId});
}

/// @nodoc
class __$$GetRequestDetailsEventImplCopyWithImpl<$Res>
    extends _$RequestsEventCopyWithImpl<$Res, _$GetRequestDetailsEventImpl>
    implements _$$GetRequestDetailsEventImplCopyWith<$Res> {
  __$$GetRequestDetailsEventImplCopyWithImpl(
      _$GetRequestDetailsEventImpl _value,
      $Res Function(_$GetRequestDetailsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$GetRequestDetailsEventImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetRequestDetailsEventImpl implements _GetRequestDetailsEvent {
  const _$GetRequestDetailsEventImpl({required this.requestId});

  @override
  final String requestId;

  @override
  String toString() {
    return 'RequestsEvent.getRequestDetails(requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRequestDetailsEventImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRequestDetailsEventImplCopyWith<_$GetRequestDetailsEventImpl>
      get copyWith => __$$GetRequestDetailsEventImplCopyWithImpl<
          _$GetRequestDetailsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)
        getRequests,
    required TResult Function(String requestId) getRequestDetails,
    required TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        createRequest,
    required TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        updateRequest,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function() isLoading,
    required TResult Function() getMyRequests,
  }) {
    return getRequestDetails(requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)?
        getRequests,
    TResult? Function(String requestId)? getRequestDetails,
    TResult? Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult? Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function()? isLoading,
    TResult? Function()? getMyRequests,
  }) {
    return getRequestDetails?.call(requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit, double? latitude, double? longitude,
            double? radiusKm, String? search)?
        getRequests,
    TResult Function(String requestId)? getRequestDetails,
    TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult Function(String requestId)? deleteRequest,
    TResult Function()? isLoading,
    TResult Function()? getMyRequests,
    required TResult orElse(),
  }) {
    if (getRequestDetails != null) {
      return getRequestDetails(requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_GetRequestDetailsEvent value) getRequestDetails,
    required TResult Function(_CreateRequestEvent value) createRequest,
    required TResult Function(_UpdateRequestEvent value) updateRequest,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyRequestsEvent value) getMyRequests,
  }) {
    return getRequestDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult? Function(_CreateRequestEvent value)? createRequest,
    TResult? Function(_UpdateRequestEvent value)? updateRequest,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyRequestsEvent value)? getMyRequests,
  }) {
    return getRequestDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult Function(_CreateRequestEvent value)? createRequest,
    TResult Function(_UpdateRequestEvent value)? updateRequest,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyRequestsEvent value)? getMyRequests,
    required TResult orElse(),
  }) {
    if (getRequestDetails != null) {
      return getRequestDetails(this);
    }
    return orElse();
  }
}

abstract class _GetRequestDetailsEvent implements RequestsEvent {
  const factory _GetRequestDetailsEvent({required final String requestId}) =
      _$GetRequestDetailsEventImpl;

  String get requestId;
  @JsonKey(ignore: true)
  _$$GetRequestDetailsEventImplCopyWith<_$GetRequestDetailsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateRequestEventImplCopyWith<$Res> {
  factory _$$CreateRequestEventImplCopyWith(_$CreateRequestEventImpl value,
          $Res Function(_$CreateRequestEventImpl) then) =
      __$$CreateRequestEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String title,
      String category,
      String state,
      String city,
      String address,
      int budget,
      String description,
      bool termsAgreed,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$CreateRequestEventImplCopyWithImpl<$Res>
    extends _$RequestsEventCopyWithImpl<$Res, _$CreateRequestEventImpl>
    implements _$$CreateRequestEventImplCopyWith<$Res> {
  __$$CreateRequestEventImplCopyWithImpl(_$CreateRequestEventImpl _value,
      $Res Function(_$CreateRequestEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? category = null,
    Object? state = null,
    Object? city = null,
    Object? address = null,
    Object? budget = null,
    Object? description = null,
    Object? termsAgreed = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$CreateRequestEventImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      termsAgreed: null == termsAgreed
          ? _value.termsAgreed
          : termsAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CreateRequestEventImpl implements _CreateRequestEvent {
  const _$CreateRequestEventImpl(
      {required this.title,
      required this.category,
      required this.state,
      required this.city,
      required this.address,
      required this.budget,
      required this.description,
      required this.termsAgreed,
      required this.latitude,
      required this.longitude});

  @override
  final String title;
  @override
  final String category;
  @override
  final String state;
  @override
  final String city;
  @override
  final String address;
  @override
  final int budget;
  @override
  final String description;
  @override
  final bool termsAgreed;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'RequestsEvent.createRequest(title: $title, category: $category, state: $state, city: $city, address: $address, budget: $budget, description: $description, termsAgreed: $termsAgreed, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRequestEventImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.termsAgreed, termsAgreed) ||
                other.termsAgreed == termsAgreed) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, category, state, city,
      address, budget, description, termsAgreed, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRequestEventImplCopyWith<_$CreateRequestEventImpl> get copyWith =>
      __$$CreateRequestEventImplCopyWithImpl<_$CreateRequestEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)
        getRequests,
    required TResult Function(String requestId) getRequestDetails,
    required TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        createRequest,
    required TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        updateRequest,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function() isLoading,
    required TResult Function() getMyRequests,
  }) {
    return createRequest(title, category, state, city, address, budget,
        description, termsAgreed, latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)?
        getRequests,
    TResult? Function(String requestId)? getRequestDetails,
    TResult? Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult? Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function()? isLoading,
    TResult? Function()? getMyRequests,
  }) {
    return createRequest?.call(title, category, state, city, address, budget,
        description, termsAgreed, latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit, double? latitude, double? longitude,
            double? radiusKm, String? search)?
        getRequests,
    TResult Function(String requestId)? getRequestDetails,
    TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult Function(String requestId)? deleteRequest,
    TResult Function()? isLoading,
    TResult Function()? getMyRequests,
    required TResult orElse(),
  }) {
    if (createRequest != null) {
      return createRequest(title, category, state, city, address, budget,
          description, termsAgreed, latitude, longitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_GetRequestDetailsEvent value) getRequestDetails,
    required TResult Function(_CreateRequestEvent value) createRequest,
    required TResult Function(_UpdateRequestEvent value) updateRequest,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyRequestsEvent value) getMyRequests,
  }) {
    return createRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult? Function(_CreateRequestEvent value)? createRequest,
    TResult? Function(_UpdateRequestEvent value)? updateRequest,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyRequestsEvent value)? getMyRequests,
  }) {
    return createRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult Function(_CreateRequestEvent value)? createRequest,
    TResult Function(_UpdateRequestEvent value)? updateRequest,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyRequestsEvent value)? getMyRequests,
    required TResult orElse(),
  }) {
    if (createRequest != null) {
      return createRequest(this);
    }
    return orElse();
  }
}

abstract class _CreateRequestEvent implements RequestsEvent {
  const factory _CreateRequestEvent(
      {required final String title,
      required final String category,
      required final String state,
      required final String city,
      required final String address,
      required final int budget,
      required final String description,
      required final bool termsAgreed,
      required final double latitude,
      required final double longitude}) = _$CreateRequestEventImpl;

  String get title;
  String get category;
  String get state;
  String get city;
  String get address;
  int get budget;
  String get description;
  bool get termsAgreed;
  double get latitude;
  double get longitude;
  @JsonKey(ignore: true)
  _$$CreateRequestEventImplCopyWith<_$CreateRequestEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateRequestEventImplCopyWith<$Res> {
  factory _$$UpdateRequestEventImplCopyWith(_$UpdateRequestEventImpl value,
          $Res Function(_$UpdateRequestEventImpl) then) =
      __$$UpdateRequestEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String requestId,
      String title,
      String category,
      String state,
      String city,
      String address,
      int budget,
      String description,
      bool termsAgreed,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$UpdateRequestEventImplCopyWithImpl<$Res>
    extends _$RequestsEventCopyWithImpl<$Res, _$UpdateRequestEventImpl>
    implements _$$UpdateRequestEventImplCopyWith<$Res> {
  __$$UpdateRequestEventImplCopyWithImpl(_$UpdateRequestEventImpl _value,
      $Res Function(_$UpdateRequestEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? title = null,
    Object? category = null,
    Object? state = null,
    Object? city = null,
    Object? address = null,
    Object? budget = null,
    Object? description = null,
    Object? termsAgreed = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$UpdateRequestEventImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      termsAgreed: null == termsAgreed
          ? _value.termsAgreed
          : termsAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$UpdateRequestEventImpl implements _UpdateRequestEvent {
  const _$UpdateRequestEventImpl(
      {required this.requestId,
      required this.title,
      required this.category,
      required this.state,
      required this.city,
      required this.address,
      required this.budget,
      required this.description,
      required this.termsAgreed,
      required this.latitude,
      required this.longitude});

  @override
  final String requestId;
  @override
  final String title;
  @override
  final String category;
  @override
  final String state;
  @override
  final String city;
  @override
  final String address;
  @override
  final int budget;
  @override
  final String description;
  @override
  final bool termsAgreed;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'RequestsEvent.updateRequest(requestId: $requestId, title: $title, category: $category, state: $state, city: $city, address: $address, budget: $budget, description: $description, termsAgreed: $termsAgreed, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRequestEventImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.termsAgreed, termsAgreed) ||
                other.termsAgreed == termsAgreed) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestId,
      title,
      category,
      state,
      city,
      address,
      budget,
      description,
      termsAgreed,
      latitude,
      longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRequestEventImplCopyWith<_$UpdateRequestEventImpl> get copyWith =>
      __$$UpdateRequestEventImplCopyWithImpl<_$UpdateRequestEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)
        getRequests,
    required TResult Function(String requestId) getRequestDetails,
    required TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        createRequest,
    required TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        updateRequest,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function() isLoading,
    required TResult Function() getMyRequests,
  }) {
    return updateRequest(requestId, title, category, state, city, address,
        budget, description, termsAgreed, latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)?
        getRequests,
    TResult? Function(String requestId)? getRequestDetails,
    TResult? Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult? Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function()? isLoading,
    TResult? Function()? getMyRequests,
  }) {
    return updateRequest?.call(requestId, title, category, state, city, address,
        budget, description, termsAgreed, latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit, double? latitude, double? longitude,
            double? radiusKm, String? search)?
        getRequests,
    TResult Function(String requestId)? getRequestDetails,
    TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult Function(String requestId)? deleteRequest,
    TResult Function()? isLoading,
    TResult Function()? getMyRequests,
    required TResult orElse(),
  }) {
    if (updateRequest != null) {
      return updateRequest(requestId, title, category, state, city, address,
          budget, description, termsAgreed, latitude, longitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_GetRequestDetailsEvent value) getRequestDetails,
    required TResult Function(_CreateRequestEvent value) createRequest,
    required TResult Function(_UpdateRequestEvent value) updateRequest,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyRequestsEvent value) getMyRequests,
  }) {
    return updateRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult? Function(_CreateRequestEvent value)? createRequest,
    TResult? Function(_UpdateRequestEvent value)? updateRequest,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyRequestsEvent value)? getMyRequests,
  }) {
    return updateRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult Function(_CreateRequestEvent value)? createRequest,
    TResult Function(_UpdateRequestEvent value)? updateRequest,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyRequestsEvent value)? getMyRequests,
    required TResult orElse(),
  }) {
    if (updateRequest != null) {
      return updateRequest(this);
    }
    return orElse();
  }
}

abstract class _UpdateRequestEvent implements RequestsEvent {
  const factory _UpdateRequestEvent(
      {required final String requestId,
      required final String title,
      required final String category,
      required final String state,
      required final String city,
      required final String address,
      required final int budget,
      required final String description,
      required final bool termsAgreed,
      required final double latitude,
      required final double longitude}) = _$UpdateRequestEventImpl;

  String get requestId;
  String get title;
  String get category;
  String get state;
  String get city;
  String get address;
  int get budget;
  String get description;
  bool get termsAgreed;
  double get latitude;
  double get longitude;
  @JsonKey(ignore: true)
  _$$UpdateRequestEventImplCopyWith<_$UpdateRequestEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteRequestEventImplCopyWith<$Res> {
  factory _$$DeleteRequestEventImplCopyWith(_$DeleteRequestEventImpl value,
          $Res Function(_$DeleteRequestEventImpl) then) =
      __$$DeleteRequestEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String requestId});
}

/// @nodoc
class __$$DeleteRequestEventImplCopyWithImpl<$Res>
    extends _$RequestsEventCopyWithImpl<$Res, _$DeleteRequestEventImpl>
    implements _$$DeleteRequestEventImplCopyWith<$Res> {
  __$$DeleteRequestEventImplCopyWithImpl(_$DeleteRequestEventImpl _value,
      $Res Function(_$DeleteRequestEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$DeleteRequestEventImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteRequestEventImpl implements _DeleteRequestEvent {
  const _$DeleteRequestEventImpl({required this.requestId});

  @override
  final String requestId;

  @override
  String toString() {
    return 'RequestsEvent.deleteRequest(requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteRequestEventImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteRequestEventImplCopyWith<_$DeleteRequestEventImpl> get copyWith =>
      __$$DeleteRequestEventImplCopyWithImpl<_$DeleteRequestEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)
        getRequests,
    required TResult Function(String requestId) getRequestDetails,
    required TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        createRequest,
    required TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        updateRequest,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function() isLoading,
    required TResult Function() getMyRequests,
  }) {
    return deleteRequest(requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)?
        getRequests,
    TResult? Function(String requestId)? getRequestDetails,
    TResult? Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult? Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function()? isLoading,
    TResult? Function()? getMyRequests,
  }) {
    return deleteRequest?.call(requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit, double? latitude, double? longitude,
            double? radiusKm, String? search)?
        getRequests,
    TResult Function(String requestId)? getRequestDetails,
    TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult Function(String requestId)? deleteRequest,
    TResult Function()? isLoading,
    TResult Function()? getMyRequests,
    required TResult orElse(),
  }) {
    if (deleteRequest != null) {
      return deleteRequest(requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_GetRequestDetailsEvent value) getRequestDetails,
    required TResult Function(_CreateRequestEvent value) createRequest,
    required TResult Function(_UpdateRequestEvent value) updateRequest,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyRequestsEvent value) getMyRequests,
  }) {
    return deleteRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult? Function(_CreateRequestEvent value)? createRequest,
    TResult? Function(_UpdateRequestEvent value)? updateRequest,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyRequestsEvent value)? getMyRequests,
  }) {
    return deleteRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult Function(_CreateRequestEvent value)? createRequest,
    TResult Function(_UpdateRequestEvent value)? updateRequest,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyRequestsEvent value)? getMyRequests,
    required TResult orElse(),
  }) {
    if (deleteRequest != null) {
      return deleteRequest(this);
    }
    return orElse();
  }
}

abstract class _DeleteRequestEvent implements RequestsEvent {
  const factory _DeleteRequestEvent({required final String requestId}) =
      _$DeleteRequestEventImpl;

  String get requestId;
  @JsonKey(ignore: true)
  _$$DeleteRequestEventImplCopyWith<_$DeleteRequestEventImpl> get copyWith =>
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
    extends _$RequestsEventCopyWithImpl<$Res, _$IsLoadingImpl>
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
    return 'RequestsEvent.isLoading()';
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
    required TResult Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)
        getRequests,
    required TResult Function(String requestId) getRequestDetails,
    required TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        createRequest,
    required TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        updateRequest,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function() isLoading,
    required TResult Function() getMyRequests,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)?
        getRequests,
    TResult? Function(String requestId)? getRequestDetails,
    TResult? Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult? Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function()? isLoading,
    TResult? Function()? getMyRequests,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit, double? latitude, double? longitude,
            double? radiusKm, String? search)?
        getRequests,
    TResult Function(String requestId)? getRequestDetails,
    TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult Function(String requestId)? deleteRequest,
    TResult Function()? isLoading,
    TResult Function()? getMyRequests,
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
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_GetRequestDetailsEvent value) getRequestDetails,
    required TResult Function(_CreateRequestEvent value) createRequest,
    required TResult Function(_UpdateRequestEvent value) updateRequest,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyRequestsEvent value) getMyRequests,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult? Function(_CreateRequestEvent value)? createRequest,
    TResult? Function(_UpdateRequestEvent value)? updateRequest,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyRequestsEvent value)? getMyRequests,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult Function(_CreateRequestEvent value)? createRequest,
    TResult Function(_UpdateRequestEvent value)? updateRequest,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyRequestsEvent value)? getMyRequests,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class _IsLoading implements RequestsEvent {
  const factory _IsLoading() = _$IsLoadingImpl;
}

/// @nodoc
abstract class _$$GetMyRequestsEventImplCopyWith<$Res> {
  factory _$$GetMyRequestsEventImplCopyWith(_$GetMyRequestsEventImpl value,
          $Res Function(_$GetMyRequestsEventImpl) then) =
      __$$GetMyRequestsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMyRequestsEventImplCopyWithImpl<$Res>
    extends _$RequestsEventCopyWithImpl<$Res, _$GetMyRequestsEventImpl>
    implements _$$GetMyRequestsEventImplCopyWith<$Res> {
  __$$GetMyRequestsEventImplCopyWithImpl(_$GetMyRequestsEventImpl _value,
      $Res Function(_$GetMyRequestsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetMyRequestsEventImpl implements _GetMyRequestsEvent {
  const _$GetMyRequestsEventImpl();

  @override
  String toString() {
    return 'RequestsEvent.getMyRequests()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetMyRequestsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)
        getRequests,
    required TResult Function(String requestId) getRequestDetails,
    required TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        createRequest,
    required TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)
        updateRequest,
    required TResult Function(String requestId) deleteRequest,
    required TResult Function() isLoading,
    required TResult Function() getMyRequests,
  }) {
    return getMyRequests();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(int? skip, int? limit, double? latitude,
            double? longitude, double? radiusKm, String? search)?
        getRequests,
    TResult? Function(String requestId)? getRequestDetails,
    TResult? Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult? Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult? Function(String requestId)? deleteRequest,
    TResult? Function()? isLoading,
    TResult? Function()? getMyRequests,
  }) {
    return getMyRequests?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(int? skip, int? limit, double? latitude, double? longitude,
            double? radiusKm, String? search)?
        getRequests,
    TResult Function(String requestId)? getRequestDetails,
    TResult Function(
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        createRequest,
    TResult Function(
            String requestId,
            String title,
            String category,
            String state,
            String city,
            String address,
            int budget,
            String description,
            bool termsAgreed,
            double latitude,
            double longitude)?
        updateRequest,
    TResult Function(String requestId)? deleteRequest,
    TResult Function()? isLoading,
    TResult Function()? getMyRequests,
    required TResult orElse(),
  }) {
    if (getMyRequests != null) {
      return getMyRequests();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetRequestsEvent value) getRequests,
    required TResult Function(_GetRequestDetailsEvent value) getRequestDetails,
    required TResult Function(_CreateRequestEvent value) createRequest,
    required TResult Function(_UpdateRequestEvent value) updateRequest,
    required TResult Function(_DeleteRequestEvent value) deleteRequest,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyRequestsEvent value) getMyRequests,
  }) {
    return getMyRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetRequestsEvent value)? getRequests,
    TResult? Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult? Function(_CreateRequestEvent value)? createRequest,
    TResult? Function(_UpdateRequestEvent value)? updateRequest,
    TResult? Function(_DeleteRequestEvent value)? deleteRequest,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyRequestsEvent value)? getMyRequests,
  }) {
    return getMyRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetRequestsEvent value)? getRequests,
    TResult Function(_GetRequestDetailsEvent value)? getRequestDetails,
    TResult Function(_CreateRequestEvent value)? createRequest,
    TResult Function(_UpdateRequestEvent value)? updateRequest,
    TResult Function(_DeleteRequestEvent value)? deleteRequest,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyRequestsEvent value)? getMyRequests,
    required TResult orElse(),
  }) {
    if (getMyRequests != null) {
      return getMyRequests(this);
    }
    return orElse();
  }
}

abstract class _GetMyRequestsEvent implements RequestsEvent {
  const factory _GetMyRequestsEvent() = _$GetMyRequestsEventImpl;
}

/// @nodoc
mixin _$RequestsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  RequestResponseModel? get requestDetails =>
      throw _privateConstructorUsedError;
  List<RequestResponseModel> get requestsList =>
      throw _privateConstructorUsedError;
  List<RequestResponseModel> get myRequestsList =>
      throw _privateConstructorUsedError;
  int get currentOffset => throw _privateConstructorUsedError;
  bool get hasMoreData => throw _privateConstructorUsedError;
  NotifyStatus? get notifyStatus => throw _privateConstructorUsedError;
  bool get isMyRequestsLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestsStateCopyWith<RequestsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestsStateCopyWith<$Res> {
  factory $RequestsStateCopyWith(
          RequestsState value, $Res Function(RequestsState) then) =
      _$RequestsStateCopyWithImpl<$Res, RequestsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool isSuccess,
      RequestResponseModel? requestDetails,
      List<RequestResponseModel> requestsList,
      List<RequestResponseModel> myRequestsList,
      int currentOffset,
      bool hasMoreData,
      NotifyStatus? notifyStatus,
      bool isMyRequestsLoading});
}

/// @nodoc
class _$RequestsStateCopyWithImpl<$Res, $Val extends RequestsState>
    implements $RequestsStateCopyWith<$Res> {
  _$RequestsStateCopyWithImpl(this._value, this._then);

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
    Object? requestDetails = freezed,
    Object? requestsList = null,
    Object? myRequestsList = null,
    Object? currentOffset = null,
    Object? hasMoreData = null,
    Object? notifyStatus = freezed,
    Object? isMyRequestsLoading = null,
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
      requestDetails: freezed == requestDetails
          ? _value.requestDetails
          : requestDetails // ignore: cast_nullable_to_non_nullable
              as RequestResponseModel?,
      requestsList: null == requestsList
          ? _value.requestsList
          : requestsList // ignore: cast_nullable_to_non_nullable
              as List<RequestResponseModel>,
      myRequestsList: null == myRequestsList
          ? _value.myRequestsList
          : myRequestsList // ignore: cast_nullable_to_non_nullable
              as List<RequestResponseModel>,
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
      isMyRequestsLoading: null == isMyRequestsLoading
          ? _value.isMyRequestsLoading
          : isMyRequestsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestsStateImplCopyWith<$Res>
    implements $RequestsStateCopyWith<$Res> {
  factory _$$RequestsStateImplCopyWith(
          _$RequestsStateImpl value, $Res Function(_$RequestsStateImpl) then) =
      __$$RequestsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool isSuccess,
      RequestResponseModel? requestDetails,
      List<RequestResponseModel> requestsList,
      List<RequestResponseModel> myRequestsList,
      int currentOffset,
      bool hasMoreData,
      NotifyStatus? notifyStatus,
      bool isMyRequestsLoading});
}

/// @nodoc
class __$$RequestsStateImplCopyWithImpl<$Res>
    extends _$RequestsStateCopyWithImpl<$Res, _$RequestsStateImpl>
    implements _$$RequestsStateImplCopyWith<$Res> {
  __$$RequestsStateImplCopyWithImpl(
      _$RequestsStateImpl _value, $Res Function(_$RequestsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? isSuccess = null,
    Object? requestDetails = freezed,
    Object? requestsList = null,
    Object? myRequestsList = null,
    Object? currentOffset = null,
    Object? hasMoreData = null,
    Object? notifyStatus = freezed,
    Object? isMyRequestsLoading = null,
  }) {
    return _then(_$RequestsStateImpl(
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
      requestDetails: freezed == requestDetails
          ? _value.requestDetails
          : requestDetails // ignore: cast_nullable_to_non_nullable
              as RequestResponseModel?,
      requestsList: null == requestsList
          ? _value._requestsList
          : requestsList // ignore: cast_nullable_to_non_nullable
              as List<RequestResponseModel>,
      myRequestsList: null == myRequestsList
          ? _value._myRequestsList
          : myRequestsList // ignore: cast_nullable_to_non_nullable
              as List<RequestResponseModel>,
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
      isMyRequestsLoading: null == isMyRequestsLoading
          ? _value.isMyRequestsLoading
          : isMyRequestsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RequestsStateImpl implements _RequestsState {
  const _$RequestsStateImpl(
      {this.isLoading = false,
      this.isError = false,
      this.isSuccess = false,
      this.requestDetails,
      final List<RequestResponseModel> requestsList =
          const <RequestResponseModel>[],
      final List<RequestResponseModel> myRequestsList =
          const <RequestResponseModel>[],
      this.currentOffset = 0,
      this.hasMoreData = false,
      this.notifyStatus,
      this.isMyRequestsLoading = false})
      : _requestsList = requestsList,
        _myRequestsList = myRequestsList;

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
  final RequestResponseModel? requestDetails;
  final List<RequestResponseModel> _requestsList;
  @override
  @JsonKey()
  List<RequestResponseModel> get requestsList {
    if (_requestsList is EqualUnmodifiableListView) return _requestsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestsList);
  }

  final List<RequestResponseModel> _myRequestsList;
  @override
  @JsonKey()
  List<RequestResponseModel> get myRequestsList {
    if (_myRequestsList is EqualUnmodifiableListView) return _myRequestsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myRequestsList);
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
  @JsonKey()
  final bool isMyRequestsLoading;

  @override
  String toString() {
    return 'RequestsState(isLoading: $isLoading, isError: $isError, isSuccess: $isSuccess, requestDetails: $requestDetails, requestsList: $requestsList, myRequestsList: $myRequestsList, currentOffset: $currentOffset, hasMoreData: $hasMoreData, notifyStatus: $notifyStatus, isMyRequestsLoading: $isMyRequestsLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.requestDetails, requestDetails) ||
                other.requestDetails == requestDetails) &&
            const DeepCollectionEquality()
                .equals(other._requestsList, _requestsList) &&
            const DeepCollectionEquality()
                .equals(other._myRequestsList, _myRequestsList) &&
            (identical(other.currentOffset, currentOffset) ||
                other.currentOffset == currentOffset) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData) &&
            (identical(other.notifyStatus, notifyStatus) ||
                other.notifyStatus == notifyStatus) &&
            (identical(other.isMyRequestsLoading, isMyRequestsLoading) ||
                other.isMyRequestsLoading == isMyRequestsLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isError,
      isSuccess,
      requestDetails,
      const DeepCollectionEquality().hash(_requestsList),
      const DeepCollectionEquality().hash(_myRequestsList),
      currentOffset,
      hasMoreData,
      notifyStatus,
      isMyRequestsLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestsStateImplCopyWith<_$RequestsStateImpl> get copyWith =>
      __$$RequestsStateImplCopyWithImpl<_$RequestsStateImpl>(this, _$identity);
}

abstract class _RequestsState implements RequestsState {
  const factory _RequestsState(
      {final bool isLoading,
      final bool isError,
      final bool isSuccess,
      final RequestResponseModel? requestDetails,
      final List<RequestResponseModel> requestsList,
      final List<RequestResponseModel> myRequestsList,
      final int currentOffset,
      final bool hasMoreData,
      final NotifyStatus? notifyStatus,
      final bool isMyRequestsLoading}) = _$RequestsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get isSuccess;
  @override
  RequestResponseModel? get requestDetails;
  @override
  List<RequestResponseModel> get requestsList;
  @override
  List<RequestResponseModel> get myRequestsList;
  @override
  int get currentOffset;
  @override
  bool get hasMoreData;
  @override
  NotifyStatus? get notifyStatus;
  @override
  bool get isMyRequestsLoading;
  @override
  @JsonKey(ignore: true)
  _$$RequestsStateImplCopyWith<_$RequestsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
