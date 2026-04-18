// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServicesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesEventCopyWith<$Res> {
  factory $ServicesEventCopyWith(
          ServicesEvent value, $Res Function(ServicesEvent) then) =
      _$ServicesEventCopyWithImpl<$Res, ServicesEvent>;
}

/// @nodoc
class _$ServicesEventCopyWithImpl<$Res, $Val extends ServicesEvent>
    implements $ServicesEventCopyWith<$Res> {
  _$ServicesEventCopyWithImpl(this._value, this._then);

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
    extends _$ServicesEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'ServicesEvent.reset()';
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
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
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
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements ServicesEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
abstract class _$$GetServicesEventImplCopyWith<$Res> {
  factory _$$GetServicesEventImplCopyWith(_$GetServicesEventImpl value,
          $Res Function(_$GetServicesEventImpl) then) =
      __$$GetServicesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int? skip,
      int? limit,
      double? latitude,
      double? longitude,
      double? radiusKm,
      List<String>? categoryNames,
      double? minRating,
      String? search});
}

/// @nodoc
class __$$GetServicesEventImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$GetServicesEventImpl>
    implements _$$GetServicesEventImplCopyWith<$Res> {
  __$$GetServicesEventImplCopyWithImpl(_$GetServicesEventImpl _value,
      $Res Function(_$GetServicesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skip = freezed,
    Object? limit = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radiusKm = freezed,
    Object? categoryNames = freezed,
    Object? minRating = freezed,
    Object? search = freezed,
  }) {
    return _then(_$GetServicesEventImpl(
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
      categoryNames: freezed == categoryNames
          ? _value._categoryNames
          : categoryNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      minRating: freezed == minRating
          ? _value.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as double?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetServicesEventImpl implements _GetServicesEvent {
  const _$GetServicesEventImpl(
      {this.skip,
      this.limit,
      this.latitude,
      this.longitude,
      this.radiusKm,
      final List<String>? categoryNames,
      this.minRating,
      this.search})
      : _categoryNames = categoryNames;

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
  final List<String>? _categoryNames;
  @override
  List<String>? get categoryNames {
    final value = _categoryNames;
    if (value == null) return null;
    if (_categoryNames is EqualUnmodifiableListView) return _categoryNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? minRating;
  @override
  final String? search;

  @override
  String toString() {
    return 'ServicesEvent.getServicesEvent(skip: $skip, limit: $limit, latitude: $latitude, longitude: $longitude, radiusKm: $radiusKm, categoryNames: $categoryNames, minRating: $minRating, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetServicesEventImpl &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radiusKm, radiusKm) ||
                other.radiusKm == radiusKm) &&
            const DeepCollectionEquality()
                .equals(other._categoryNames, _categoryNames) &&
            (identical(other.minRating, minRating) ||
                other.minRating == minRating) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      skip,
      limit,
      latitude,
      longitude,
      radiusKm,
      const DeepCollectionEquality().hash(_categoryNames),
      minRating,
      search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetServicesEventImplCopyWith<_$GetServicesEventImpl> get copyWith =>
      __$$GetServicesEventImplCopyWithImpl<_$GetServicesEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return getServicesEvent(skip, limit, latitude, longitude, radiusKm,
        categoryNames, minRating, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return getServicesEvent?.call(skip, limit, latitude, longitude, radiusKm,
        categoryNames, minRating, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (getServicesEvent != null) {
      return getServicesEvent(skip, limit, latitude, longitude, radiusKm,
          categoryNames, minRating, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return getServicesEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return getServicesEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (getServicesEvent != null) {
      return getServicesEvent(this);
    }
    return orElse();
  }
}

abstract class _GetServicesEvent implements ServicesEvent {
  const factory _GetServicesEvent(
      {final int? skip,
      final int? limit,
      final double? latitude,
      final double? longitude,
      final double? radiusKm,
      final List<String>? categoryNames,
      final double? minRating,
      final String? search}) = _$GetServicesEventImpl;

  int? get skip;
  int? get limit;
  double? get latitude;
  double? get longitude;
  double? get radiusKm;
  List<String>? get categoryNames;
  double? get minRating;
  String? get search;
  @JsonKey(ignore: true)
  _$$GetServicesEventImplCopyWith<_$GetServicesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetServiceDetailsEventImplCopyWith<$Res> {
  factory _$$GetServiceDetailsEventImplCopyWith(
          _$GetServiceDetailsEventImpl value,
          $Res Function(_$GetServiceDetailsEventImpl) then) =
      __$$GetServiceDetailsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serviceId});
}

/// @nodoc
class __$$GetServiceDetailsEventImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$GetServiceDetailsEventImpl>
    implements _$$GetServiceDetailsEventImplCopyWith<$Res> {
  __$$GetServiceDetailsEventImplCopyWithImpl(
      _$GetServiceDetailsEventImpl _value,
      $Res Function(_$GetServiceDetailsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
  }) {
    return _then(_$GetServiceDetailsEventImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetServiceDetailsEventImpl implements _GetServiceDetailsEvent {
  const _$GetServiceDetailsEventImpl({required this.serviceId});

  @override
  final String serviceId;

  @override
  String toString() {
    return 'ServicesEvent.getServiceDetailsEvent(serviceId: $serviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetServiceDetailsEventImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetServiceDetailsEventImplCopyWith<_$GetServiceDetailsEventImpl>
      get copyWith => __$$GetServiceDetailsEventImplCopyWithImpl<
          _$GetServiceDetailsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return getServiceDetailsEvent(serviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return getServiceDetailsEvent?.call(serviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (getServiceDetailsEvent != null) {
      return getServiceDetailsEvent(serviceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return getServiceDetailsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return getServiceDetailsEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (getServiceDetailsEvent != null) {
      return getServiceDetailsEvent(this);
    }
    return orElse();
  }
}

abstract class _GetServiceDetailsEvent implements ServicesEvent {
  const factory _GetServiceDetailsEvent({required final String serviceId}) =
      _$GetServiceDetailsEventImpl;

  String get serviceId;
  @JsonKey(ignore: true)
  _$$GetServiceDetailsEventImplCopyWith<_$GetServiceDetailsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSimilarServicesEventImplCopyWith<$Res> {
  factory _$$GetSimilarServicesEventImplCopyWith(
          _$GetSimilarServicesEventImpl value,
          $Res Function(_$GetSimilarServicesEventImpl) then) =
      __$$GetSimilarServicesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? city, String? category, String? excludeServiceId, int? limit});
}

/// @nodoc
class __$$GetSimilarServicesEventImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$GetSimilarServicesEventImpl>
    implements _$$GetSimilarServicesEventImplCopyWith<$Res> {
  __$$GetSimilarServicesEventImplCopyWithImpl(
      _$GetSimilarServicesEventImpl _value,
      $Res Function(_$GetSimilarServicesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? category = freezed,
    Object? excludeServiceId = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$GetSimilarServicesEventImpl(
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      excludeServiceId: freezed == excludeServiceId
          ? _value.excludeServiceId
          : excludeServiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetSimilarServicesEventImpl implements _GetSimilarServicesEvent {
  const _$GetSimilarServicesEventImpl(
      {this.city, this.category, this.excludeServiceId, this.limit});

  @override
  final String? city;
  @override
  final String? category;
  @override
  final String? excludeServiceId;
  @override
  final int? limit;

  @override
  String toString() {
    return 'ServicesEvent.getSimilarServicesEvent(city: $city, category: $category, excludeServiceId: $excludeServiceId, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSimilarServicesEventImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.excludeServiceId, excludeServiceId) ||
                other.excludeServiceId == excludeServiceId) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, city, category, excludeServiceId, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSimilarServicesEventImplCopyWith<_$GetSimilarServicesEventImpl>
      get copyWith => __$$GetSimilarServicesEventImplCopyWithImpl<
          _$GetSimilarServicesEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return getSimilarServicesEvent(city, category, excludeServiceId, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return getSimilarServicesEvent?.call(
        city, category, excludeServiceId, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (getSimilarServicesEvent != null) {
      return getSimilarServicesEvent(city, category, excludeServiceId, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return getSimilarServicesEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return getSimilarServicesEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (getSimilarServicesEvent != null) {
      return getSimilarServicesEvent(this);
    }
    return orElse();
  }
}

abstract class _GetSimilarServicesEvent implements ServicesEvent {
  const factory _GetSimilarServicesEvent(
      {final String? city,
      final String? category,
      final String? excludeServiceId,
      final int? limit}) = _$GetSimilarServicesEventImpl;

  String? get city;
  String? get category;
  String? get excludeServiceId;
  int? get limit;
  @JsonKey(ignore: true)
  _$$GetSimilarServicesEventImplCopyWith<_$GetSimilarServicesEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsLoadingImplCopyWith<$Res> {
  factory _$$IsLoadingImplCopyWith(
          _$IsLoadingImpl value, $Res Function(_$IsLoadingImpl) then) =
      __$$IsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsLoadingImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$IsLoadingImpl>
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
    return 'ServicesEvent.isLoading()';
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
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
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
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class _IsLoading implements ServicesEvent {
  const factory _IsLoading() = _$IsLoadingImpl;
}

/// @nodoc
abstract class _$$UpdateAgentDetailsEventImplCopyWith<$Res> {
  factory _$$UpdateAgentDetailsEventImplCopyWith(
          _$UpdateAgentDetailsEventImpl value,
          $Res Function(_$UpdateAgentDetailsEventImpl) then) =
      __$$UpdateAgentDetailsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateServiceDataModel createServiceDataModel});
}

/// @nodoc
class __$$UpdateAgentDetailsEventImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$UpdateAgentDetailsEventImpl>
    implements _$$UpdateAgentDetailsEventImplCopyWith<$Res> {
  __$$UpdateAgentDetailsEventImplCopyWithImpl(
      _$UpdateAgentDetailsEventImpl _value,
      $Res Function(_$UpdateAgentDetailsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createServiceDataModel = null,
  }) {
    return _then(_$UpdateAgentDetailsEventImpl(
      createServiceDataModel: null == createServiceDataModel
          ? _value.createServiceDataModel
          : createServiceDataModel // ignore: cast_nullable_to_non_nullable
              as CreateServiceDataModel,
    ));
  }
}

/// @nodoc

class _$UpdateAgentDetailsEventImpl implements _UpdateAgentDetailsEvent {
  const _$UpdateAgentDetailsEventImpl({required this.createServiceDataModel});

  @override
  final CreateServiceDataModel createServiceDataModel;

  @override
  String toString() {
    return 'ServicesEvent.updateAgentDetails(createServiceDataModel: $createServiceDataModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAgentDetailsEventImpl &&
            (identical(other.createServiceDataModel, createServiceDataModel) ||
                other.createServiceDataModel == createServiceDataModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createServiceDataModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAgentDetailsEventImplCopyWith<_$UpdateAgentDetailsEventImpl>
      get copyWith => __$$UpdateAgentDetailsEventImplCopyWithImpl<
          _$UpdateAgentDetailsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return updateAgentDetails(createServiceDataModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return updateAgentDetails?.call(createServiceDataModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (updateAgentDetails != null) {
      return updateAgentDetails(createServiceDataModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return updateAgentDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return updateAgentDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (updateAgentDetails != null) {
      return updateAgentDetails(this);
    }
    return orElse();
  }
}

abstract class _UpdateAgentDetailsEvent implements ServicesEvent {
  const factory _UpdateAgentDetailsEvent(
          {required final CreateServiceDataModel createServiceDataModel}) =
      _$UpdateAgentDetailsEventImpl;

  CreateServiceDataModel get createServiceDataModel;
  @JsonKey(ignore: true)
  _$$UpdateAgentDetailsEventImplCopyWith<_$UpdateAgentDetailsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateImagesAndMediaDetailsEventImplCopyWith<$Res> {
  factory _$$UpdateImagesAndMediaDetailsEventImplCopyWith(
          _$UpdateImagesAndMediaDetailsEventImpl value,
          $Res Function(_$UpdateImagesAndMediaDetailsEventImpl) then) =
      __$$UpdateImagesAndMediaDetailsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateServiceDataModel createServiceDataModel});
}

/// @nodoc
class __$$UpdateImagesAndMediaDetailsEventImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res,
        _$UpdateImagesAndMediaDetailsEventImpl>
    implements _$$UpdateImagesAndMediaDetailsEventImplCopyWith<$Res> {
  __$$UpdateImagesAndMediaDetailsEventImplCopyWithImpl(
      _$UpdateImagesAndMediaDetailsEventImpl _value,
      $Res Function(_$UpdateImagesAndMediaDetailsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createServiceDataModel = null,
  }) {
    return _then(_$UpdateImagesAndMediaDetailsEventImpl(
      createServiceDataModel: null == createServiceDataModel
          ? _value.createServiceDataModel
          : createServiceDataModel // ignore: cast_nullable_to_non_nullable
              as CreateServiceDataModel,
    ));
  }
}

/// @nodoc

class _$UpdateImagesAndMediaDetailsEventImpl
    implements _UpdateImagesAndMediaDetailsEvent {
  const _$UpdateImagesAndMediaDetailsEventImpl(
      {required this.createServiceDataModel});

  @override
  final CreateServiceDataModel createServiceDataModel;

  @override
  String toString() {
    return 'ServicesEvent.updateImagesAndMediaDetails(createServiceDataModel: $createServiceDataModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImagesAndMediaDetailsEventImpl &&
            (identical(other.createServiceDataModel, createServiceDataModel) ||
                other.createServiceDataModel == createServiceDataModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createServiceDataModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImagesAndMediaDetailsEventImplCopyWith<
          _$UpdateImagesAndMediaDetailsEventImpl>
      get copyWith => __$$UpdateImagesAndMediaDetailsEventImplCopyWithImpl<
          _$UpdateImagesAndMediaDetailsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return updateImagesAndMediaDetails(createServiceDataModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return updateImagesAndMediaDetails?.call(createServiceDataModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (updateImagesAndMediaDetails != null) {
      return updateImagesAndMediaDetails(createServiceDataModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return updateImagesAndMediaDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return updateImagesAndMediaDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (updateImagesAndMediaDetails != null) {
      return updateImagesAndMediaDetails(this);
    }
    return orElse();
  }
}

abstract class _UpdateImagesAndMediaDetailsEvent implements ServicesEvent {
  const factory _UpdateImagesAndMediaDetailsEvent(
          {required final CreateServiceDataModel createServiceDataModel}) =
      _$UpdateImagesAndMediaDetailsEventImpl;

  CreateServiceDataModel get createServiceDataModel;
  @JsonKey(ignore: true)
  _$$UpdateImagesAndMediaDetailsEventImplCopyWith<
          _$UpdateImagesAndMediaDetailsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateServiceEventImplCopyWith<$Res> {
  factory _$$UpdateServiceEventImplCopyWith(_$UpdateServiceEventImpl value,
          $Res Function(_$UpdateServiceEventImpl) then) =
      __$$UpdateServiceEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String serviceId,
      CreateServiceDataModel updateServiceDataModel,
      List<String> existingImageUrls});
}

/// @nodoc
class __$$UpdateServiceEventImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$UpdateServiceEventImpl>
    implements _$$UpdateServiceEventImplCopyWith<$Res> {
  __$$UpdateServiceEventImplCopyWithImpl(_$UpdateServiceEventImpl _value,
      $Res Function(_$UpdateServiceEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? updateServiceDataModel = null,
    Object? existingImageUrls = null,
  }) {
    return _then(_$UpdateServiceEventImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      updateServiceDataModel: null == updateServiceDataModel
          ? _value.updateServiceDataModel
          : updateServiceDataModel // ignore: cast_nullable_to_non_nullable
              as CreateServiceDataModel,
      existingImageUrls: null == existingImageUrls
          ? _value._existingImageUrls
          : existingImageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$UpdateServiceEventImpl implements _UpdateServiceEvent {
  const _$UpdateServiceEventImpl(
      {required this.serviceId,
      required this.updateServiceDataModel,
      required final List<String> existingImageUrls})
      : _existingImageUrls = existingImageUrls;

  @override
  final String serviceId;
  @override
  final CreateServiceDataModel updateServiceDataModel;
  final List<String> _existingImageUrls;
  @override
  List<String> get existingImageUrls {
    if (_existingImageUrls is EqualUnmodifiableListView)
      return _existingImageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_existingImageUrls);
  }

  @override
  String toString() {
    return 'ServicesEvent.updateServiceEvent(serviceId: $serviceId, updateServiceDataModel: $updateServiceDataModel, existingImageUrls: $existingImageUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateServiceEventImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.updateServiceDataModel, updateServiceDataModel) ||
                other.updateServiceDataModel == updateServiceDataModel) &&
            const DeepCollectionEquality()
                .equals(other._existingImageUrls, _existingImageUrls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      serviceId,
      updateServiceDataModel,
      const DeepCollectionEquality().hash(_existingImageUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateServiceEventImplCopyWith<_$UpdateServiceEventImpl> get copyWith =>
      __$$UpdateServiceEventImplCopyWithImpl<_$UpdateServiceEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return updateServiceEvent(
        serviceId, updateServiceDataModel, existingImageUrls);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return updateServiceEvent?.call(
        serviceId, updateServiceDataModel, existingImageUrls);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (updateServiceEvent != null) {
      return updateServiceEvent(
          serviceId, updateServiceDataModel, existingImageUrls);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return updateServiceEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return updateServiceEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (updateServiceEvent != null) {
      return updateServiceEvent(this);
    }
    return orElse();
  }
}

abstract class _UpdateServiceEvent implements ServicesEvent {
  const factory _UpdateServiceEvent(
          {required final String serviceId,
          required final CreateServiceDataModel updateServiceDataModel,
          required final List<String> existingImageUrls}) =
      _$UpdateServiceEventImpl;

  String get serviceId;
  CreateServiceDataModel get updateServiceDataModel;
  List<String> get existingImageUrls;
  @JsonKey(ignore: true)
  _$$UpdateServiceEventImplCopyWith<_$UpdateServiceEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteServiceEventImplCopyWith<$Res> {
  factory _$$DeleteServiceEventImplCopyWith(_$DeleteServiceEventImpl value,
          $Res Function(_$DeleteServiceEventImpl) then) =
      __$$DeleteServiceEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serviceId});
}

/// @nodoc
class __$$DeleteServiceEventImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$DeleteServiceEventImpl>
    implements _$$DeleteServiceEventImplCopyWith<$Res> {
  __$$DeleteServiceEventImplCopyWithImpl(_$DeleteServiceEventImpl _value,
      $Res Function(_$DeleteServiceEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
  }) {
    return _then(_$DeleteServiceEventImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteServiceEventImpl implements _DeleteServiceEvent {
  const _$DeleteServiceEventImpl({required this.serviceId});

  @override
  final String serviceId;

  @override
  String toString() {
    return 'ServicesEvent.deleteServiceEvent(serviceId: $serviceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteServiceEventImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteServiceEventImplCopyWith<_$DeleteServiceEventImpl> get copyWith =>
      __$$DeleteServiceEventImplCopyWithImpl<_$DeleteServiceEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return deleteServiceEvent(serviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return deleteServiceEvent?.call(serviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (deleteServiceEvent != null) {
      return deleteServiceEvent(serviceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return deleteServiceEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return deleteServiceEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (deleteServiceEvent != null) {
      return deleteServiceEvent(this);
    }
    return orElse();
  }
}

abstract class _DeleteServiceEvent implements ServicesEvent {
  const factory _DeleteServiceEvent({required final String serviceId}) =
      _$DeleteServiceEventImpl;

  String get serviceId;
  @JsonKey(ignore: true)
  _$$DeleteServiceEventImplCopyWith<_$DeleteServiceEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostReviewEventImplCopyWith<$Res> {
  factory _$$PostReviewEventImplCopyWith(_$PostReviewEventImpl value,
          $Res Function(_$PostReviewEventImpl) then) =
      __$$PostReviewEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serviceId, double rating, String review});
}

/// @nodoc
class __$$PostReviewEventImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$PostReviewEventImpl>
    implements _$$PostReviewEventImplCopyWith<$Res> {
  __$$PostReviewEventImplCopyWithImpl(
      _$PostReviewEventImpl _value, $Res Function(_$PostReviewEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? rating = null,
    Object? review = null,
  }) {
    return _then(_$PostReviewEventImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PostReviewEventImpl implements _PostReviewEvent {
  const _$PostReviewEventImpl(
      {required this.serviceId, required this.rating, required this.review});

  @override
  final String serviceId;
  @override
  final double rating;
  @override
  final String review;

  @override
  String toString() {
    return 'ServicesEvent.postReviewEvent(serviceId: $serviceId, rating: $rating, review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostReviewEventImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceId, rating, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostReviewEventImplCopyWith<_$PostReviewEventImpl> get copyWith =>
      __$$PostReviewEventImplCopyWithImpl<_$PostReviewEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return postReviewEvent(serviceId, rating, review);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return postReviewEvent?.call(serviceId, rating, review);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (postReviewEvent != null) {
      return postReviewEvent(serviceId, rating, review);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return postReviewEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return postReviewEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (postReviewEvent != null) {
      return postReviewEvent(this);
    }
    return orElse();
  }
}

abstract class _PostReviewEvent implements ServicesEvent {
  const factory _PostReviewEvent(
      {required final String serviceId,
      required final double rating,
      required final String review}) = _$PostReviewEventImpl;

  String get serviceId;
  double get rating;
  String get review;
  @JsonKey(ignore: true)
  _$$PostReviewEventImplCopyWith<_$PostReviewEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditReviewEventImplCopyWith<$Res> {
  factory _$$EditReviewEventImplCopyWith(_$EditReviewEventImpl value,
          $Res Function(_$EditReviewEventImpl) then) =
      __$$EditReviewEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serviceId, String reviewId, double rating, String review});
}

/// @nodoc
class __$$EditReviewEventImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$EditReviewEventImpl>
    implements _$$EditReviewEventImplCopyWith<$Res> {
  __$$EditReviewEventImplCopyWithImpl(
      _$EditReviewEventImpl _value, $Res Function(_$EditReviewEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? reviewId = null,
    Object? rating = null,
    Object? review = null,
  }) {
    return _then(_$EditReviewEventImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditReviewEventImpl implements _EditReviewEvent {
  const _$EditReviewEventImpl(
      {required this.serviceId,
      required this.reviewId,
      required this.rating,
      required this.review});

  @override
  final String serviceId;
  @override
  final String reviewId;
  @override
  final double rating;
  @override
  final String review;

  @override
  String toString() {
    return 'ServicesEvent.editReviewEvent(serviceId: $serviceId, reviewId: $reviewId, rating: $rating, review: $review)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditReviewEventImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, serviceId, reviewId, rating, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditReviewEventImplCopyWith<_$EditReviewEventImpl> get copyWith =>
      __$$EditReviewEventImplCopyWithImpl<_$EditReviewEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return editReviewEvent(serviceId, reviewId, rating, review);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return editReviewEvent?.call(serviceId, reviewId, rating, review);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (editReviewEvent != null) {
      return editReviewEvent(serviceId, reviewId, rating, review);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return editReviewEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return editReviewEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (editReviewEvent != null) {
      return editReviewEvent(this);
    }
    return orElse();
  }
}

abstract class _EditReviewEvent implements ServicesEvent {
  const factory _EditReviewEvent(
      {required final String serviceId,
      required final String reviewId,
      required final double rating,
      required final String review}) = _$EditReviewEventImpl;

  String get serviceId;
  String get reviewId;
  double get rating;
  String get review;
  @JsonKey(ignore: true)
  _$$EditReviewEventImplCopyWith<_$EditReviewEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetServiceReviewsEventImplCopyWith<$Res> {
  factory _$$GetServiceReviewsEventImplCopyWith(
          _$GetServiceReviewsEventImpl value,
          $Res Function(_$GetServiceReviewsEventImpl) then) =
      __$$GetServiceReviewsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serviceId, int? skip, int? limit});
}

/// @nodoc
class __$$GetServiceReviewsEventImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$GetServiceReviewsEventImpl>
    implements _$$GetServiceReviewsEventImplCopyWith<$Res> {
  __$$GetServiceReviewsEventImplCopyWithImpl(
      _$GetServiceReviewsEventImpl _value,
      $Res Function(_$GetServiceReviewsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? skip = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$GetServiceReviewsEventImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$GetServiceReviewsEventImpl implements _GetServiceReviewsEvent {
  const _$GetServiceReviewsEventImpl(
      {required this.serviceId, this.skip, this.limit});

  @override
  final String serviceId;
  @override
  final int? skip;
  @override
  final int? limit;

  @override
  String toString() {
    return 'ServicesEvent.getServiceReviewsEvent(serviceId: $serviceId, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetServiceReviewsEventImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceId, skip, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetServiceReviewsEventImplCopyWith<_$GetServiceReviewsEventImpl>
      get copyWith => __$$GetServiceReviewsEventImplCopyWithImpl<
          _$GetServiceReviewsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return getServiceReviewsEvent(serviceId, skip, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return getServiceReviewsEvent?.call(serviceId, skip, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (getServiceReviewsEvent != null) {
      return getServiceReviewsEvent(serviceId, skip, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return getServiceReviewsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return getServiceReviewsEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (getServiceReviewsEvent != null) {
      return getServiceReviewsEvent(this);
    }
    return orElse();
  }
}

abstract class _GetServiceReviewsEvent implements ServicesEvent {
  const factory _GetServiceReviewsEvent(
      {required final String serviceId,
      final int? skip,
      final int? limit}) = _$GetServiceReviewsEventImpl;

  String get serviceId;
  int? get skip;
  int? get limit;
  @JsonKey(ignore: true)
  _$$GetServiceReviewsEventImplCopyWith<_$GetServiceReviewsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetMyServicesEventImplCopyWith<$Res> {
  factory _$$GetMyServicesEventImplCopyWith(_$GetMyServicesEventImpl value,
          $Res Function(_$GetMyServicesEventImpl) then) =
      __$$GetMyServicesEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMyServicesEventImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$GetMyServicesEventImpl>
    implements _$$GetMyServicesEventImplCopyWith<$Res> {
  __$$GetMyServicesEventImplCopyWithImpl(_$GetMyServicesEventImpl _value,
      $Res Function(_$GetMyServicesEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetMyServicesEventImpl implements _GetMyServicesEvent {
  const _$GetMyServicesEventImpl();

  @override
  String toString() {
    return 'ServicesEvent.getMyServicesEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetMyServicesEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return getMyServicesEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return getMyServicesEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (getMyServicesEvent != null) {
      return getMyServicesEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return getMyServicesEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return getMyServicesEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (getMyServicesEvent != null) {
      return getMyServicesEvent(this);
    }
    return orElse();
  }
}

abstract class _GetMyServicesEvent implements ServicesEvent {
  const factory _GetMyServicesEvent() = _$GetMyServicesEventImpl;
}

/// @nodoc
abstract class _$$UploadAadharEventImplCopyWith<$Res> {
  factory _$$UploadAadharEventImplCopyWith(_$UploadAadharEventImpl value,
          $Res Function(_$UploadAadharEventImpl) then) =
      __$$UploadAadharEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serviceId, File aadharFile});
}

/// @nodoc
class __$$UploadAadharEventImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$UploadAadharEventImpl>
    implements _$$UploadAadharEventImplCopyWith<$Res> {
  __$$UploadAadharEventImplCopyWithImpl(_$UploadAadharEventImpl _value,
      $Res Function(_$UploadAadharEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? aadharFile = null,
  }) {
    return _then(_$UploadAadharEventImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      aadharFile: null == aadharFile
          ? _value.aadharFile
          : aadharFile // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$UploadAadharEventImpl implements _UploadAadharEvent {
  const _$UploadAadharEventImpl(
      {required this.serviceId, required this.aadharFile});

  @override
  final String serviceId;
  @override
  final File aadharFile;

  @override
  String toString() {
    return 'ServicesEvent.uploadAadharEvent(serviceId: $serviceId, aadharFile: $aadharFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadAadharEventImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.aadharFile, aadharFile) ||
                other.aadharFile == aadharFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceId, aadharFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadAadharEventImplCopyWith<_$UploadAadharEventImpl> get copyWith =>
      __$$UploadAadharEventImplCopyWithImpl<_$UploadAadharEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return uploadAadharEvent(serviceId, aadharFile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return uploadAadharEvent?.call(serviceId, aadharFile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (uploadAadharEvent != null) {
      return uploadAadharEvent(serviceId, aadharFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return uploadAadharEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return uploadAadharEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (uploadAadharEvent != null) {
      return uploadAadharEvent(this);
    }
    return orElse();
  }
}

abstract class _UploadAadharEvent implements ServicesEvent {
  const factory _UploadAadharEvent(
      {required final String serviceId,
      required final File aadharFile}) = _$UploadAadharEventImpl;

  String get serviceId;
  File get aadharFile;
  @JsonKey(ignore: true)
  _$$UploadAadharEventImplCopyWith<_$UploadAadharEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadOtherUserServicesImplCopyWith<$Res> {
  factory _$$LoadOtherUserServicesImplCopyWith(
          _$LoadOtherUserServicesImpl value,
          $Res Function(_$LoadOtherUserServicesImpl) then) =
      __$$LoadOtherUserServicesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, int skip, int limit});
}

/// @nodoc
class __$$LoadOtherUserServicesImplCopyWithImpl<$Res>
    extends _$ServicesEventCopyWithImpl<$Res, _$LoadOtherUserServicesImpl>
    implements _$$LoadOtherUserServicesImplCopyWith<$Res> {
  __$$LoadOtherUserServicesImplCopyWithImpl(_$LoadOtherUserServicesImpl _value,
      $Res Function(_$LoadOtherUserServicesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? skip = null,
    Object? limit = null,
  }) {
    return _then(_$LoadOtherUserServicesImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadOtherUserServicesImpl implements _LoadOtherUserServices {
  const _$LoadOtherUserServicesImpl(
      {required this.userId, required this.skip, required this.limit});

  @override
  final String userId;
  @override
  final int skip;
  @override
  final int limit;

  @override
  String toString() {
    return 'ServicesEvent.loadOtherUserServices(userId: $userId, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadOtherUserServicesImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, skip, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadOtherUserServicesImplCopyWith<_$LoadOtherUserServicesImpl>
      get copyWith => __$$LoadOtherUserServicesImplCopyWithImpl<
          _$LoadOtherUserServicesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)
        getServicesEvent,
    required TResult Function(String serviceId) getServiceDetailsEvent,
    required TResult Function(String? city, String? category,
            String? excludeServiceId, int? limit)
        getSimilarServicesEvent,
    required TResult Function() isLoading,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateAgentDetails,
    required TResult Function(CreateServiceDataModel createServiceDataModel)
        updateImagesAndMediaDetails,
    required TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)
        updateServiceEvent,
    required TResult Function(String serviceId) deleteServiceEvent,
    required TResult Function(String serviceId, double rating, String review)
        postReviewEvent,
    required TResult Function(
            String serviceId, String reviewId, double rating, String review)
        editReviewEvent,
    required TResult Function(String serviceId, int? skip, int? limit)
        getServiceReviewsEvent,
    required TResult Function() getMyServicesEvent,
    required TResult Function(String serviceId, File aadharFile)
        uploadAadharEvent,
    required TResult Function(String userId, int skip, int limit)
        loadOtherUserServices,
  }) {
    return loadOtherUserServices(userId, skip, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult? Function(String serviceId)? getServiceDetailsEvent,
    TResult? Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult? Function()? isLoading,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult? Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult? Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult? Function(String serviceId)? deleteServiceEvent,
    TResult? Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult? Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult? Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult? Function()? getMyServicesEvent,
    TResult? Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult? Function(String userId, int skip, int limit)?
        loadOtherUserServices,
  }) {
    return loadOtherUserServices?.call(userId, skip, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            int? skip,
            int? limit,
            double? latitude,
            double? longitude,
            double? radiusKm,
            List<String>? categoryNames,
            double? minRating,
            String? search)?
        getServicesEvent,
    TResult Function(String serviceId)? getServiceDetailsEvent,
    TResult Function(String? city, String? category, String? excludeServiceId,
            int? limit)?
        getSimilarServicesEvent,
    TResult Function()? isLoading,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateAgentDetails,
    TResult Function(CreateServiceDataModel createServiceDataModel)?
        updateImagesAndMediaDetails,
    TResult Function(
            String serviceId,
            CreateServiceDataModel updateServiceDataModel,
            List<String> existingImageUrls)?
        updateServiceEvent,
    TResult Function(String serviceId)? deleteServiceEvent,
    TResult Function(String serviceId, double rating, String review)?
        postReviewEvent,
    TResult Function(
            String serviceId, String reviewId, double rating, String review)?
        editReviewEvent,
    TResult Function(String serviceId, int? skip, int? limit)?
        getServiceReviewsEvent,
    TResult Function()? getMyServicesEvent,
    TResult Function(String serviceId, File aadharFile)? uploadAadharEvent,
    TResult Function(String userId, int skip, int limit)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (loadOtherUserServices != null) {
      return loadOtherUserServices(userId, skip, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetServicesEvent value) getServicesEvent,
    required TResult Function(_GetServiceDetailsEvent value)
        getServiceDetailsEvent,
    required TResult Function(_GetSimilarServicesEvent value)
        getSimilarServicesEvent,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateAgentDetailsEvent value)
        updateAgentDetails,
    required TResult Function(_UpdateImagesAndMediaDetailsEvent value)
        updateImagesAndMediaDetails,
    required TResult Function(_UpdateServiceEvent value) updateServiceEvent,
    required TResult Function(_DeleteServiceEvent value) deleteServiceEvent,
    required TResult Function(_PostReviewEvent value) postReviewEvent,
    required TResult Function(_EditReviewEvent value) editReviewEvent,
    required TResult Function(_GetServiceReviewsEvent value)
        getServiceReviewsEvent,
    required TResult Function(_GetMyServicesEvent value) getMyServicesEvent,
    required TResult Function(_UploadAadharEvent value) uploadAadharEvent,
    required TResult Function(_LoadOtherUserServices value)
        loadOtherUserServices,
  }) {
    return loadOtherUserServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetServicesEvent value)? getServicesEvent,
    TResult? Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult? Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult? Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult? Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult? Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult? Function(_PostReviewEvent value)? postReviewEvent,
    TResult? Function(_EditReviewEvent value)? editReviewEvent,
    TResult? Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult? Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult? Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult? Function(_LoadOtherUserServices value)? loadOtherUserServices,
  }) {
    return loadOtherUserServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetServicesEvent value)? getServicesEvent,
    TResult Function(_GetServiceDetailsEvent value)? getServiceDetailsEvent,
    TResult Function(_GetSimilarServicesEvent value)? getSimilarServicesEvent,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateAgentDetailsEvent value)? updateAgentDetails,
    TResult Function(_UpdateImagesAndMediaDetailsEvent value)?
        updateImagesAndMediaDetails,
    TResult Function(_UpdateServiceEvent value)? updateServiceEvent,
    TResult Function(_DeleteServiceEvent value)? deleteServiceEvent,
    TResult Function(_PostReviewEvent value)? postReviewEvent,
    TResult Function(_EditReviewEvent value)? editReviewEvent,
    TResult Function(_GetServiceReviewsEvent value)? getServiceReviewsEvent,
    TResult Function(_GetMyServicesEvent value)? getMyServicesEvent,
    TResult Function(_UploadAadharEvent value)? uploadAadharEvent,
    TResult Function(_LoadOtherUserServices value)? loadOtherUserServices,
    required TResult orElse(),
  }) {
    if (loadOtherUserServices != null) {
      return loadOtherUserServices(this);
    }
    return orElse();
  }
}

abstract class _LoadOtherUserServices implements ServicesEvent {
  const factory _LoadOtherUserServices(
      {required final String userId,
      required final int skip,
      required final int limit}) = _$LoadOtherUserServicesImpl;

  String get userId;
  int get skip;
  int get limit;
  @JsonKey(ignore: true)
  _$$LoadOtherUserServicesImplCopyWith<_$LoadOtherUserServicesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ServicesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  ServicesResponseModel? get serviceDetails =>
      throw _privateConstructorUsedError;
  List<ServicesResponseModel> get similarServices =>
      throw _privateConstructorUsedError;
  List<ServicesResponseModel> get servicesList =>
      throw _privateConstructorUsedError;
  List<ServicesResponseModel> get myServicesList =>
      throw _privateConstructorUsedError;
  int get currentOffset => throw _privateConstructorUsedError;
  bool get hasMoreData => throw _privateConstructorUsedError;
  CreateServiceDataModel? get createServiceDataModel =>
      throw _privateConstructorUsedError;
  NotifyStatus? get notifyStatus => throw _privateConstructorUsedError;
  bool get isMyServicesLoading => throw _privateConstructorUsedError;
  bool get isAadharUploading => throw _privateConstructorUsedError;
  bool get isAadharUploadSuccess => throw _privateConstructorUsedError;
  List<ServiceReviewsResponseModel> get serviceReviews =>
      throw _privateConstructorUsedError;
  bool get isReviewsLoading => throw _privateConstructorUsedError;
  List<ServicesResponseModel> get otherUserServices =>
      throw _privateConstructorUsedError;
  bool get isLoadingOtherUserServices => throw _privateConstructorUsedError;
  bool get hasMoreOtherUserServices => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServicesStateCopyWith<ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesStateCopyWith<$Res> {
  factory $ServicesStateCopyWith(
          ServicesState value, $Res Function(ServicesState) then) =
      _$ServicesStateCopyWithImpl<$Res, ServicesState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool isSuccess,
      ServicesResponseModel? serviceDetails,
      List<ServicesResponseModel> similarServices,
      List<ServicesResponseModel> servicesList,
      List<ServicesResponseModel> myServicesList,
      int currentOffset,
      bool hasMoreData,
      CreateServiceDataModel? createServiceDataModel,
      NotifyStatus? notifyStatus,
      bool isMyServicesLoading,
      bool isAadharUploading,
      bool isAadharUploadSuccess,
      List<ServiceReviewsResponseModel> serviceReviews,
      bool isReviewsLoading,
      List<ServicesResponseModel> otherUserServices,
      bool isLoadingOtherUserServices,
      bool hasMoreOtherUserServices});

  $ServicesResponseModelCopyWith<$Res>? get serviceDetails;
}

/// @nodoc
class _$ServicesStateCopyWithImpl<$Res, $Val extends ServicesState>
    implements $ServicesStateCopyWith<$Res> {
  _$ServicesStateCopyWithImpl(this._value, this._then);

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
    Object? serviceDetails = freezed,
    Object? similarServices = null,
    Object? servicesList = null,
    Object? myServicesList = null,
    Object? currentOffset = null,
    Object? hasMoreData = null,
    Object? createServiceDataModel = freezed,
    Object? notifyStatus = freezed,
    Object? isMyServicesLoading = null,
    Object? isAadharUploading = null,
    Object? isAadharUploadSuccess = null,
    Object? serviceReviews = null,
    Object? isReviewsLoading = null,
    Object? otherUserServices = null,
    Object? isLoadingOtherUserServices = null,
    Object? hasMoreOtherUserServices = null,
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
      serviceDetails: freezed == serviceDetails
          ? _value.serviceDetails
          : serviceDetails // ignore: cast_nullable_to_non_nullable
              as ServicesResponseModel?,
      similarServices: null == similarServices
          ? _value.similarServices
          : similarServices // ignore: cast_nullable_to_non_nullable
              as List<ServicesResponseModel>,
      servicesList: null == servicesList
          ? _value.servicesList
          : servicesList // ignore: cast_nullable_to_non_nullable
              as List<ServicesResponseModel>,
      myServicesList: null == myServicesList
          ? _value.myServicesList
          : myServicesList // ignore: cast_nullable_to_non_nullable
              as List<ServicesResponseModel>,
      currentOffset: null == currentOffset
          ? _value.currentOffset
          : currentOffset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
      createServiceDataModel: freezed == createServiceDataModel
          ? _value.createServiceDataModel
          : createServiceDataModel // ignore: cast_nullable_to_non_nullable
              as CreateServiceDataModel?,
      notifyStatus: freezed == notifyStatus
          ? _value.notifyStatus
          : notifyStatus // ignore: cast_nullable_to_non_nullable
              as NotifyStatus?,
      isMyServicesLoading: null == isMyServicesLoading
          ? _value.isMyServicesLoading
          : isMyServicesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAadharUploading: null == isAadharUploading
          ? _value.isAadharUploading
          : isAadharUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAadharUploadSuccess: null == isAadharUploadSuccess
          ? _value.isAadharUploadSuccess
          : isAadharUploadSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceReviews: null == serviceReviews
          ? _value.serviceReviews
          : serviceReviews // ignore: cast_nullable_to_non_nullable
              as List<ServiceReviewsResponseModel>,
      isReviewsLoading: null == isReviewsLoading
          ? _value.isReviewsLoading
          : isReviewsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      otherUserServices: null == otherUserServices
          ? _value.otherUserServices
          : otherUserServices // ignore: cast_nullable_to_non_nullable
              as List<ServicesResponseModel>,
      isLoadingOtherUserServices: null == isLoadingOtherUserServices
          ? _value.isLoadingOtherUserServices
          : isLoadingOtherUserServices // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreOtherUserServices: null == hasMoreOtherUserServices
          ? _value.hasMoreOtherUserServices
          : hasMoreOtherUserServices // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServicesResponseModelCopyWith<$Res>? get serviceDetails {
    if (_value.serviceDetails == null) {
      return null;
    }

    return $ServicesResponseModelCopyWith<$Res>(_value.serviceDetails!,
        (value) {
      return _then(_value.copyWith(serviceDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServicesStateImplCopyWith<$Res>
    implements $ServicesStateCopyWith<$Res> {
  factory _$$ServicesStateImplCopyWith(
          _$ServicesStateImpl value, $Res Function(_$ServicesStateImpl) then) =
      __$$ServicesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool isSuccess,
      ServicesResponseModel? serviceDetails,
      List<ServicesResponseModel> similarServices,
      List<ServicesResponseModel> servicesList,
      List<ServicesResponseModel> myServicesList,
      int currentOffset,
      bool hasMoreData,
      CreateServiceDataModel? createServiceDataModel,
      NotifyStatus? notifyStatus,
      bool isMyServicesLoading,
      bool isAadharUploading,
      bool isAadharUploadSuccess,
      List<ServiceReviewsResponseModel> serviceReviews,
      bool isReviewsLoading,
      List<ServicesResponseModel> otherUserServices,
      bool isLoadingOtherUserServices,
      bool hasMoreOtherUserServices});

  @override
  $ServicesResponseModelCopyWith<$Res>? get serviceDetails;
}

/// @nodoc
class __$$ServicesStateImplCopyWithImpl<$Res>
    extends _$ServicesStateCopyWithImpl<$Res, _$ServicesStateImpl>
    implements _$$ServicesStateImplCopyWith<$Res> {
  __$$ServicesStateImplCopyWithImpl(
      _$ServicesStateImpl _value, $Res Function(_$ServicesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? isSuccess = null,
    Object? serviceDetails = freezed,
    Object? similarServices = null,
    Object? servicesList = null,
    Object? myServicesList = null,
    Object? currentOffset = null,
    Object? hasMoreData = null,
    Object? createServiceDataModel = freezed,
    Object? notifyStatus = freezed,
    Object? isMyServicesLoading = null,
    Object? isAadharUploading = null,
    Object? isAadharUploadSuccess = null,
    Object? serviceReviews = null,
    Object? isReviewsLoading = null,
    Object? otherUserServices = null,
    Object? isLoadingOtherUserServices = null,
    Object? hasMoreOtherUserServices = null,
  }) {
    return _then(_$ServicesStateImpl(
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
      serviceDetails: freezed == serviceDetails
          ? _value.serviceDetails
          : serviceDetails // ignore: cast_nullable_to_non_nullable
              as ServicesResponseModel?,
      similarServices: null == similarServices
          ? _value._similarServices
          : similarServices // ignore: cast_nullable_to_non_nullable
              as List<ServicesResponseModel>,
      servicesList: null == servicesList
          ? _value._servicesList
          : servicesList // ignore: cast_nullable_to_non_nullable
              as List<ServicesResponseModel>,
      myServicesList: null == myServicesList
          ? _value._myServicesList
          : myServicesList // ignore: cast_nullable_to_non_nullable
              as List<ServicesResponseModel>,
      currentOffset: null == currentOffset
          ? _value.currentOffset
          : currentOffset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
      createServiceDataModel: freezed == createServiceDataModel
          ? _value.createServiceDataModel
          : createServiceDataModel // ignore: cast_nullable_to_non_nullable
              as CreateServiceDataModel?,
      notifyStatus: freezed == notifyStatus
          ? _value.notifyStatus
          : notifyStatus // ignore: cast_nullable_to_non_nullable
              as NotifyStatus?,
      isMyServicesLoading: null == isMyServicesLoading
          ? _value.isMyServicesLoading
          : isMyServicesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAadharUploading: null == isAadharUploading
          ? _value.isAadharUploading
          : isAadharUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAadharUploadSuccess: null == isAadharUploadSuccess
          ? _value.isAadharUploadSuccess
          : isAadharUploadSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceReviews: null == serviceReviews
          ? _value._serviceReviews
          : serviceReviews // ignore: cast_nullable_to_non_nullable
              as List<ServiceReviewsResponseModel>,
      isReviewsLoading: null == isReviewsLoading
          ? _value.isReviewsLoading
          : isReviewsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      otherUserServices: null == otherUserServices
          ? _value._otherUserServices
          : otherUserServices // ignore: cast_nullable_to_non_nullable
              as List<ServicesResponseModel>,
      isLoadingOtherUserServices: null == isLoadingOtherUserServices
          ? _value.isLoadingOtherUserServices
          : isLoadingOtherUserServices // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreOtherUserServices: null == hasMoreOtherUserServices
          ? _value.hasMoreOtherUserServices
          : hasMoreOtherUserServices // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ServicesStateImpl implements _ServicesState {
  const _$ServicesStateImpl(
      {this.isLoading = false,
      this.isError = false,
      this.isSuccess = false,
      this.serviceDetails,
      final List<ServicesResponseModel> similarServices = const [],
      final List<ServicesResponseModel> servicesList = const [],
      final List<ServicesResponseModel> myServicesList = const [],
      this.currentOffset = 0,
      this.hasMoreData = false,
      this.createServiceDataModel,
      this.notifyStatus,
      this.isMyServicesLoading = false,
      this.isAadharUploading = false,
      this.isAadharUploadSuccess = false,
      final List<ServiceReviewsResponseModel> serviceReviews = const [],
      this.isReviewsLoading = false,
      final List<ServicesResponseModel> otherUserServices = const [],
      this.isLoadingOtherUserServices = false,
      this.hasMoreOtherUserServices = false})
      : _similarServices = similarServices,
        _servicesList = servicesList,
        _myServicesList = myServicesList,
        _serviceReviews = serviceReviews,
        _otherUserServices = otherUserServices;

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
  final ServicesResponseModel? serviceDetails;
  final List<ServicesResponseModel> _similarServices;
  @override
  @JsonKey()
  List<ServicesResponseModel> get similarServices {
    if (_similarServices is EqualUnmodifiableListView) return _similarServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_similarServices);
  }

  final List<ServicesResponseModel> _servicesList;
  @override
  @JsonKey()
  List<ServicesResponseModel> get servicesList {
    if (_servicesList is EqualUnmodifiableListView) return _servicesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servicesList);
  }

  final List<ServicesResponseModel> _myServicesList;
  @override
  @JsonKey()
  List<ServicesResponseModel> get myServicesList {
    if (_myServicesList is EqualUnmodifiableListView) return _myServicesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myServicesList);
  }

  @override
  @JsonKey()
  final int currentOffset;
  @override
  @JsonKey()
  final bool hasMoreData;
  @override
  final CreateServiceDataModel? createServiceDataModel;
  @override
  final NotifyStatus? notifyStatus;
  @override
  @JsonKey()
  final bool isMyServicesLoading;
  @override
  @JsonKey()
  final bool isAadharUploading;
  @override
  @JsonKey()
  final bool isAadharUploadSuccess;
  final List<ServiceReviewsResponseModel> _serviceReviews;
  @override
  @JsonKey()
  List<ServiceReviewsResponseModel> get serviceReviews {
    if (_serviceReviews is EqualUnmodifiableListView) return _serviceReviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceReviews);
  }

  @override
  @JsonKey()
  final bool isReviewsLoading;
  final List<ServicesResponseModel> _otherUserServices;
  @override
  @JsonKey()
  List<ServicesResponseModel> get otherUserServices {
    if (_otherUserServices is EqualUnmodifiableListView)
      return _otherUserServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherUserServices);
  }

  @override
  @JsonKey()
  final bool isLoadingOtherUserServices;
  @override
  @JsonKey()
  final bool hasMoreOtherUserServices;

  @override
  String toString() {
    return 'ServicesState(isLoading: $isLoading, isError: $isError, isSuccess: $isSuccess, serviceDetails: $serviceDetails, similarServices: $similarServices, servicesList: $servicesList, myServicesList: $myServicesList, currentOffset: $currentOffset, hasMoreData: $hasMoreData, createServiceDataModel: $createServiceDataModel, notifyStatus: $notifyStatus, isMyServicesLoading: $isMyServicesLoading, isAadharUploading: $isAadharUploading, isAadharUploadSuccess: $isAadharUploadSuccess, serviceReviews: $serviceReviews, isReviewsLoading: $isReviewsLoading, otherUserServices: $otherUserServices, isLoadingOtherUserServices: $isLoadingOtherUserServices, hasMoreOtherUserServices: $hasMoreOtherUserServices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.serviceDetails, serviceDetails) ||
                other.serviceDetails == serviceDetails) &&
            const DeepCollectionEquality()
                .equals(other._similarServices, _similarServices) &&
            const DeepCollectionEquality()
                .equals(other._servicesList, _servicesList) &&
            const DeepCollectionEquality()
                .equals(other._myServicesList, _myServicesList) &&
            (identical(other.currentOffset, currentOffset) ||
                other.currentOffset == currentOffset) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData) &&
            (identical(other.createServiceDataModel, createServiceDataModel) ||
                other.createServiceDataModel == createServiceDataModel) &&
            (identical(other.notifyStatus, notifyStatus) ||
                other.notifyStatus == notifyStatus) &&
            (identical(other.isMyServicesLoading, isMyServicesLoading) ||
                other.isMyServicesLoading == isMyServicesLoading) &&
            (identical(other.isAadharUploading, isAadharUploading) ||
                other.isAadharUploading == isAadharUploading) &&
            (identical(other.isAadharUploadSuccess, isAadharUploadSuccess) ||
                other.isAadharUploadSuccess == isAadharUploadSuccess) &&
            const DeepCollectionEquality()
                .equals(other._serviceReviews, _serviceReviews) &&
            (identical(other.isReviewsLoading, isReviewsLoading) ||
                other.isReviewsLoading == isReviewsLoading) &&
            const DeepCollectionEquality()
                .equals(other._otherUserServices, _otherUserServices) &&
            (identical(other.isLoadingOtherUserServices,
                    isLoadingOtherUserServices) ||
                other.isLoadingOtherUserServices ==
                    isLoadingOtherUserServices) &&
            (identical(
                    other.hasMoreOtherUserServices, hasMoreOtherUserServices) ||
                other.hasMoreOtherUserServices == hasMoreOtherUserServices));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        isError,
        isSuccess,
        serviceDetails,
        const DeepCollectionEquality().hash(_similarServices),
        const DeepCollectionEquality().hash(_servicesList),
        const DeepCollectionEquality().hash(_myServicesList),
        currentOffset,
        hasMoreData,
        createServiceDataModel,
        notifyStatus,
        isMyServicesLoading,
        isAadharUploading,
        isAadharUploadSuccess,
        const DeepCollectionEquality().hash(_serviceReviews),
        isReviewsLoading,
        const DeepCollectionEquality().hash(_otherUserServices),
        isLoadingOtherUserServices,
        hasMoreOtherUserServices
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicesStateImplCopyWith<_$ServicesStateImpl> get copyWith =>
      __$$ServicesStateImplCopyWithImpl<_$ServicesStateImpl>(this, _$identity);
}

abstract class _ServicesState implements ServicesState {
  const factory _ServicesState(
      {final bool isLoading,
      final bool isError,
      final bool isSuccess,
      final ServicesResponseModel? serviceDetails,
      final List<ServicesResponseModel> similarServices,
      final List<ServicesResponseModel> servicesList,
      final List<ServicesResponseModel> myServicesList,
      final int currentOffset,
      final bool hasMoreData,
      final CreateServiceDataModel? createServiceDataModel,
      final NotifyStatus? notifyStatus,
      final bool isMyServicesLoading,
      final bool isAadharUploading,
      final bool isAadharUploadSuccess,
      final List<ServiceReviewsResponseModel> serviceReviews,
      final bool isReviewsLoading,
      final List<ServicesResponseModel> otherUserServices,
      final bool isLoadingOtherUserServices,
      final bool hasMoreOtherUserServices}) = _$ServicesStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get isSuccess;
  @override
  ServicesResponseModel? get serviceDetails;
  @override
  List<ServicesResponseModel> get similarServices;
  @override
  List<ServicesResponseModel> get servicesList;
  @override
  List<ServicesResponseModel> get myServicesList;
  @override
  int get currentOffset;
  @override
  bool get hasMoreData;
  @override
  CreateServiceDataModel? get createServiceDataModel;
  @override
  NotifyStatus? get notifyStatus;
  @override
  bool get isMyServicesLoading;
  @override
  bool get isAadharUploading;
  @override
  bool get isAadharUploadSuccess;
  @override
  List<ServiceReviewsResponseModel> get serviceReviews;
  @override
  bool get isReviewsLoading;
  @override
  List<ServicesResponseModel> get otherUserServices;
  @override
  bool get isLoadingOtherUserServices;
  @override
  bool get hasMoreOtherUserServices;
  @override
  @JsonKey(ignore: true)
  _$$ServicesStateImplCopyWith<_$ServicesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
