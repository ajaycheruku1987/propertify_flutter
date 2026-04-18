// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FeedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedEventCopyWith<$Res> {
  factory $FeedEventCopyWith(FeedEvent value, $Res Function(FeedEvent) then) =
      _$FeedEventCopyWithImpl<$Res, FeedEvent>;
}

/// @nodoc
class _$FeedEventCopyWithImpl<$Res, $Val extends FeedEvent>
    implements $FeedEventCopyWith<$Res> {
  _$FeedEventCopyWithImpl(this._value, this._then);

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
    extends _$FeedEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'FeedEvent.reset()';
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
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
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
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements FeedEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
abstract class _$$GetFeedsEventImplCopyWith<$Res> {
  factory _$$GetFeedsEventImplCopyWith(
          _$GetFeedsEventImpl value, $Res Function(_$GetFeedsEventImpl) then) =
      __$$GetFeedsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? city,
      String? listingType,
      String? propertyType,
      double? minPrice,
      double? maxPrice,
      String? search,
      int? limit,
      int? offset,
      double? latitude,
      double? longitude});
}

/// @nodoc
class __$$GetFeedsEventImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$GetFeedsEventImpl>
    implements _$$GetFeedsEventImplCopyWith<$Res> {
  __$$GetFeedsEventImplCopyWithImpl(
      _$GetFeedsEventImpl _value, $Res Function(_$GetFeedsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? listingType = freezed,
    Object? propertyType = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? search = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$GetFeedsEventImpl(
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      listingType: freezed == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String?,
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String?,
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$GetFeedsEventImpl implements _GetFeedsEvent {
  const _$GetFeedsEventImpl(
      {this.city,
      this.listingType,
      this.propertyType,
      this.minPrice,
      this.maxPrice,
      this.search,
      this.limit,
      this.offset,
      this.latitude,
      this.longitude});

  @override
  final String? city;
  @override
  final String? listingType;
  @override
  final String? propertyType;
  @override
  final double? minPrice;
  @override
  final double? maxPrice;
  @override
  final String? search;
  @override
  final int? limit;
  @override
  final int? offset;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'FeedEvent.getFeedsEvent(city: $city, listingType: $listingType, propertyType: $propertyType, minPrice: $minPrice, maxPrice: $maxPrice, search: $search, limit: $limit, offset: $offset, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFeedsEventImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, city, listingType, propertyType,
      minPrice, maxPrice, search, limit, offset, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFeedsEventImplCopyWith<_$GetFeedsEventImpl> get copyWith =>
      __$$GetFeedsEventImplCopyWithImpl<_$GetFeedsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return getFeedsEvent(city, listingType, propertyType, minPrice, maxPrice,
        search, limit, offset, latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return getFeedsEvent?.call(city, listingType, propertyType, minPrice,
        maxPrice, search, limit, offset, latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getFeedsEvent != null) {
      return getFeedsEvent(city, listingType, propertyType, minPrice, maxPrice,
          search, limit, offset, latitude, longitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return getFeedsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return getFeedsEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getFeedsEvent != null) {
      return getFeedsEvent(this);
    }
    return orElse();
  }
}

abstract class _GetFeedsEvent implements FeedEvent {
  const factory _GetFeedsEvent(
      {final String? city,
      final String? listingType,
      final String? propertyType,
      final double? minPrice,
      final double? maxPrice,
      final String? search,
      final int? limit,
      final int? offset,
      final double? latitude,
      final double? longitude}) = _$GetFeedsEventImpl;

  String? get city;
  String? get listingType;
  String? get propertyType;
  double? get minPrice;
  double? get maxPrice;
  String? get search;
  int? get limit;
  int? get offset;
  double? get latitude;
  double? get longitude;
  @JsonKey(ignore: true)
  _$$GetFeedsEventImplCopyWith<_$GetFeedsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPostDetailsEventImplCopyWith<$Res> {
  factory _$$GetPostDetailsEventImplCopyWith(_$GetPostDetailsEventImpl value,
          $Res Function(_$GetPostDetailsEventImpl) then) =
      __$$GetPostDetailsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$$GetPostDetailsEventImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$GetPostDetailsEventImpl>
    implements _$$GetPostDetailsEventImplCopyWith<$Res> {
  __$$GetPostDetailsEventImplCopyWithImpl(_$GetPostDetailsEventImpl _value,
      $Res Function(_$GetPostDetailsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_$GetPostDetailsEventImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetPostDetailsEventImpl implements _GetPostDetailsEvent {
  const _$GetPostDetailsEventImpl({required this.postId});

  @override
  final String postId;

  @override
  String toString() {
    return 'FeedEvent.getPostDetailsEvent(postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPostDetailsEventImpl &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPostDetailsEventImplCopyWith<_$GetPostDetailsEventImpl> get copyWith =>
      __$$GetPostDetailsEventImplCopyWithImpl<_$GetPostDetailsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return getPostDetailsEvent(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return getPostDetailsEvent?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getPostDetailsEvent != null) {
      return getPostDetailsEvent(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return getPostDetailsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return getPostDetailsEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getPostDetailsEvent != null) {
      return getPostDetailsEvent(this);
    }
    return orElse();
  }
}

abstract class _GetPostDetailsEvent implements FeedEvent {
  const factory _GetPostDetailsEvent({required final String postId}) =
      _$GetPostDetailsEventImpl;

  String get postId;
  @JsonKey(ignore: true)
  _$$GetPostDetailsEventImplCopyWith<_$GetPostDetailsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSimilarPropertiesEventImplCopyWith<$Res> {
  factory _$$GetSimilarPropertiesEventImplCopyWith(
          _$GetSimilarPropertiesEventImpl value,
          $Res Function(_$GetSimilarPropertiesEventImpl) then) =
      __$$GetSimilarPropertiesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? city, String? propertyType, String? excludePostId, int? limit});
}

/// @nodoc
class __$$GetSimilarPropertiesEventImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$GetSimilarPropertiesEventImpl>
    implements _$$GetSimilarPropertiesEventImplCopyWith<$Res> {
  __$$GetSimilarPropertiesEventImplCopyWithImpl(
      _$GetSimilarPropertiesEventImpl _value,
      $Res Function(_$GetSimilarPropertiesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? propertyType = freezed,
    Object? excludePostId = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$GetSimilarPropertiesEventImpl(
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String?,
      excludePostId: freezed == excludePostId
          ? _value.excludePostId
          : excludePostId // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetSimilarPropertiesEventImpl implements _GetSimilarPropertiesEvent {
  const _$GetSimilarPropertiesEventImpl(
      {this.city, this.propertyType, this.excludePostId, this.limit});

  @override
  final String? city;
  @override
  final String? propertyType;
  @override
  final String? excludePostId;
  @override
  final int? limit;

  @override
  String toString() {
    return 'FeedEvent.getSimilarPropertiesEvent(city: $city, propertyType: $propertyType, excludePostId: $excludePostId, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSimilarPropertiesEventImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.excludePostId, excludePostId) ||
                other.excludePostId == excludePostId) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, city, propertyType, excludePostId, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSimilarPropertiesEventImplCopyWith<_$GetSimilarPropertiesEventImpl>
      get copyWith => __$$GetSimilarPropertiesEventImplCopyWithImpl<
          _$GetSimilarPropertiesEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return getSimilarPropertiesEvent(city, propertyType, excludePostId, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return getSimilarPropertiesEvent?.call(
        city, propertyType, excludePostId, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getSimilarPropertiesEvent != null) {
      return getSimilarPropertiesEvent(
          city, propertyType, excludePostId, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return getSimilarPropertiesEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return getSimilarPropertiesEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getSimilarPropertiesEvent != null) {
      return getSimilarPropertiesEvent(this);
    }
    return orElse();
  }
}

abstract class _GetSimilarPropertiesEvent implements FeedEvent {
  const factory _GetSimilarPropertiesEvent(
      {final String? city,
      final String? propertyType,
      final String? excludePostId,
      final int? limit}) = _$GetSimilarPropertiesEventImpl;

  String? get city;
  String? get propertyType;
  String? get excludePostId;
  int? get limit;
  @JsonKey(ignore: true)
  _$$GetSimilarPropertiesEventImplCopyWith<_$GetSimilarPropertiesEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LikePropertyImplCopyWith<$Res> {
  factory _$$LikePropertyImplCopyWith(
          _$LikePropertyImpl value, $Res Function(_$LikePropertyImpl) then) =
      __$$LikePropertyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String propertyId});
}

/// @nodoc
class __$$LikePropertyImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$LikePropertyImpl>
    implements _$$LikePropertyImplCopyWith<$Res> {
  __$$LikePropertyImplCopyWithImpl(
      _$LikePropertyImpl _value, $Res Function(_$LikePropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
  }) {
    return _then(_$LikePropertyImpl(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LikePropertyImpl implements _LikeProperty {
  const _$LikePropertyImpl({required this.propertyId});

  @override
  final String propertyId;

  @override
  String toString() {
    return 'FeedEvent.likeProperty(propertyId: $propertyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikePropertyImpl &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikePropertyImplCopyWith<_$LikePropertyImpl> get copyWith =>
      __$$LikePropertyImplCopyWithImpl<_$LikePropertyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return likeProperty(propertyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return likeProperty?.call(propertyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (likeProperty != null) {
      return likeProperty(propertyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return likeProperty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return likeProperty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (likeProperty != null) {
      return likeProperty(this);
    }
    return orElse();
  }
}

abstract class _LikeProperty implements FeedEvent {
  const factory _LikeProperty({required final String propertyId}) =
      _$LikePropertyImpl;

  String get propertyId;
  @JsonKey(ignore: true)
  _$$LikePropertyImplCopyWith<_$LikePropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCommentsByIdImplCopyWith<$Res> {
  factory _$$GetCommentsByIdImplCopyWith(_$GetCommentsByIdImpl value,
          $Res Function(_$GetCommentsByIdImpl) then) =
      __$$GetCommentsByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String propertyId});
}

/// @nodoc
class __$$GetCommentsByIdImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$GetCommentsByIdImpl>
    implements _$$GetCommentsByIdImplCopyWith<$Res> {
  __$$GetCommentsByIdImplCopyWithImpl(
      _$GetCommentsByIdImpl _value, $Res Function(_$GetCommentsByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
  }) {
    return _then(_$GetCommentsByIdImpl(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetCommentsByIdImpl implements _GetCommentsById {
  const _$GetCommentsByIdImpl({required this.propertyId});

  @override
  final String propertyId;

  @override
  String toString() {
    return 'FeedEvent.getCommentsById(propertyId: $propertyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCommentsByIdImpl &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCommentsByIdImplCopyWith<_$GetCommentsByIdImpl> get copyWith =>
      __$$GetCommentsByIdImplCopyWithImpl<_$GetCommentsByIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return getCommentsById(propertyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return getCommentsById?.call(propertyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getCommentsById != null) {
      return getCommentsById(propertyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return getCommentsById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return getCommentsById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getCommentsById != null) {
      return getCommentsById(this);
    }
    return orElse();
  }
}

abstract class _GetCommentsById implements FeedEvent {
  const factory _GetCommentsById({required final String propertyId}) =
      _$GetCommentsByIdImpl;

  String get propertyId;
  @JsonKey(ignore: true)
  _$$GetCommentsByIdImplCopyWith<_$GetCommentsByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddCommentToPropertyImplCopyWith<$Res> {
  factory _$$AddCommentToPropertyImplCopyWith(_$AddCommentToPropertyImpl value,
          $Res Function(_$AddCommentToPropertyImpl) then) =
      __$$AddCommentToPropertyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String propertyId, String text});
}

/// @nodoc
class __$$AddCommentToPropertyImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$AddCommentToPropertyImpl>
    implements _$$AddCommentToPropertyImplCopyWith<$Res> {
  __$$AddCommentToPropertyImplCopyWithImpl(_$AddCommentToPropertyImpl _value,
      $Res Function(_$AddCommentToPropertyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
    Object? text = null,
  }) {
    return _then(_$AddCommentToPropertyImpl(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddCommentToPropertyImpl implements _AddCommentToProperty {
  const _$AddCommentToPropertyImpl(
      {required this.propertyId, required this.text});

  @override
  final String propertyId;
  @override
  final String text;

  @override
  String toString() {
    return 'FeedEvent.addCommentToProperty(propertyId: $propertyId, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCommentToPropertyImpl &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyId, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCommentToPropertyImplCopyWith<_$AddCommentToPropertyImpl>
      get copyWith =>
          __$$AddCommentToPropertyImplCopyWithImpl<_$AddCommentToPropertyImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return addCommentToProperty(propertyId, text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return addCommentToProperty?.call(propertyId, text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (addCommentToProperty != null) {
      return addCommentToProperty(propertyId, text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return addCommentToProperty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return addCommentToProperty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (addCommentToProperty != null) {
      return addCommentToProperty(this);
    }
    return orElse();
  }
}

abstract class _AddCommentToProperty implements FeedEvent {
  const factory _AddCommentToProperty(
      {required final String propertyId,
      required final String text}) = _$AddCommentToPropertyImpl;

  String get propertyId;
  String get text;
  @JsonKey(ignore: true)
  _$$AddCommentToPropertyImplCopyWith<_$AddCommentToPropertyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleFavoriteImplCopyWith<$Res> {
  factory _$$ToggleFavoriteImplCopyWith(_$ToggleFavoriteImpl value,
          $Res Function(_$ToggleFavoriteImpl) then) =
      __$$ToggleFavoriteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String propertyId});
}

/// @nodoc
class __$$ToggleFavoriteImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$ToggleFavoriteImpl>
    implements _$$ToggleFavoriteImplCopyWith<$Res> {
  __$$ToggleFavoriteImplCopyWithImpl(
      _$ToggleFavoriteImpl _value, $Res Function(_$ToggleFavoriteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
  }) {
    return _then(_$ToggleFavoriteImpl(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToggleFavoriteImpl implements _ToggleFavorite {
  const _$ToggleFavoriteImpl({required this.propertyId});

  @override
  final String propertyId;

  @override
  String toString() {
    return 'FeedEvent.toggleFavorite(propertyId: $propertyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleFavoriteImpl &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleFavoriteImplCopyWith<_$ToggleFavoriteImpl> get copyWith =>
      __$$ToggleFavoriteImplCopyWithImpl<_$ToggleFavoriteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return toggleFavorite(propertyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return toggleFavorite?.call(propertyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (toggleFavorite != null) {
      return toggleFavorite(propertyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return toggleFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return toggleFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (toggleFavorite != null) {
      return toggleFavorite(this);
    }
    return orElse();
  }
}

abstract class _ToggleFavorite implements FeedEvent {
  const factory _ToggleFavorite({required final String propertyId}) =
      _$ToggleFavoriteImpl;

  String get propertyId;
  @JsonKey(ignore: true)
  _$$ToggleFavoriteImplCopyWith<_$ToggleFavoriteImpl> get copyWith =>
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
    extends _$FeedEventCopyWithImpl<$Res, _$IsLoadingImpl>
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
    return 'FeedEvent.isLoading()';
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
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
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
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class _IsLoading implements FeedEvent {
  const factory _IsLoading() = _$IsLoadingImpl;
}

/// @nodoc
abstract class _$$GetMyPropertiesImplCopyWith<$Res> {
  factory _$$GetMyPropertiesImplCopyWith(_$GetMyPropertiesImpl value,
          $Res Function(_$GetMyPropertiesImpl) then) =
      __$$GetMyPropertiesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? limit, int? offset});
}

/// @nodoc
class __$$GetMyPropertiesImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$GetMyPropertiesImpl>
    implements _$$GetMyPropertiesImplCopyWith<$Res> {
  __$$GetMyPropertiesImplCopyWithImpl(
      _$GetMyPropertiesImpl _value, $Res Function(_$GetMyPropertiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? offset = freezed,
  }) {
    return _then(_$GetMyPropertiesImpl(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetMyPropertiesImpl implements _GetMyProperties {
  const _$GetMyPropertiesImpl({this.limit, this.offset});

  @override
  final int? limit;
  @override
  final int? offset;

  @override
  String toString() {
    return 'FeedEvent.getMyProperties(limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMyPropertiesImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMyPropertiesImplCopyWith<_$GetMyPropertiesImpl> get copyWith =>
      __$$GetMyPropertiesImplCopyWithImpl<_$GetMyPropertiesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return getMyProperties(limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return getMyProperties?.call(limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getMyProperties != null) {
      return getMyProperties(limit, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return getMyProperties(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return getMyProperties?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getMyProperties != null) {
      return getMyProperties(this);
    }
    return orElse();
  }
}

abstract class _GetMyProperties implements FeedEvent {
  const factory _GetMyProperties({final int? limit, final int? offset}) =
      _$GetMyPropertiesImpl;

  int? get limit;
  int? get offset;
  @JsonKey(ignore: true)
  _$$GetMyPropertiesImplCopyWith<_$GetMyPropertiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetFavouritesImplCopyWith<$Res> {
  factory _$$GetFavouritesImplCopyWith(
          _$GetFavouritesImpl value, $Res Function(_$GetFavouritesImpl) then) =
      __$$GetFavouritesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetFavouritesImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$GetFavouritesImpl>
    implements _$$GetFavouritesImplCopyWith<$Res> {
  __$$GetFavouritesImplCopyWithImpl(
      _$GetFavouritesImpl _value, $Res Function(_$GetFavouritesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetFavouritesImpl implements _GetFavourites {
  const _$GetFavouritesImpl();

  @override
  String toString() {
    return 'FeedEvent.getFavourites()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetFavouritesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return getFavourites();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return getFavourites?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getFavourites != null) {
      return getFavourites();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return getFavourites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return getFavourites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getFavourites != null) {
      return getFavourites(this);
    }
    return orElse();
  }
}

abstract class _GetFavourites implements FeedEvent {
  const factory _GetFavourites() = _$GetFavouritesImpl;
}

/// @nodoc
abstract class _$$RecordPropertyViewImplCopyWith<$Res> {
  factory _$$RecordPropertyViewImplCopyWith(_$RecordPropertyViewImpl value,
          $Res Function(_$RecordPropertyViewImpl) then) =
      __$$RecordPropertyViewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String propertyId});
}

/// @nodoc
class __$$RecordPropertyViewImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$RecordPropertyViewImpl>
    implements _$$RecordPropertyViewImplCopyWith<$Res> {
  __$$RecordPropertyViewImplCopyWithImpl(_$RecordPropertyViewImpl _value,
      $Res Function(_$RecordPropertyViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
  }) {
    return _then(_$RecordPropertyViewImpl(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RecordPropertyViewImpl implements _RecordPropertyView {
  const _$RecordPropertyViewImpl({required this.propertyId});

  @override
  final String propertyId;

  @override
  String toString() {
    return 'FeedEvent.recordPropertyView(propertyId: $propertyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordPropertyViewImpl &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordPropertyViewImplCopyWith<_$RecordPropertyViewImpl> get copyWith =>
      __$$RecordPropertyViewImplCopyWithImpl<_$RecordPropertyViewImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return recordPropertyView(propertyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return recordPropertyView?.call(propertyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (recordPropertyView != null) {
      return recordPropertyView(propertyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return recordPropertyView(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return recordPropertyView?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (recordPropertyView != null) {
      return recordPropertyView(this);
    }
    return orElse();
  }
}

abstract class _RecordPropertyView implements FeedEvent {
  const factory _RecordPropertyView({required final String propertyId}) =
      _$RecordPropertyViewImpl;

  String get propertyId;
  @JsonKey(ignore: true)
  _$$RecordPropertyViewImplCopyWith<_$RecordPropertyViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSimilarPostsByCategoryEventImplCopyWith<$Res> {
  factory _$$GetSimilarPostsByCategoryEventImplCopyWith(
          _$GetSimilarPostsByCategoryEventImpl value,
          $Res Function(_$GetSimilarPostsByCategoryEventImpl) then) =
      __$$GetSimilarPostsByCategoryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? propertyType, String? excludePostId, int? limit});
}

/// @nodoc
class __$$GetSimilarPostsByCategoryEventImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$GetSimilarPostsByCategoryEventImpl>
    implements _$$GetSimilarPostsByCategoryEventImplCopyWith<$Res> {
  __$$GetSimilarPostsByCategoryEventImplCopyWithImpl(
      _$GetSimilarPostsByCategoryEventImpl _value,
      $Res Function(_$GetSimilarPostsByCategoryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyType = freezed,
    Object? excludePostId = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$GetSimilarPostsByCategoryEventImpl(
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String?,
      excludePostId: freezed == excludePostId
          ? _value.excludePostId
          : excludePostId // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetSimilarPostsByCategoryEventImpl
    implements _GetSimilarPostsByCategoryEvent {
  const _$GetSimilarPostsByCategoryEventImpl(
      {this.propertyType, this.excludePostId, this.limit});

  @override
  final String? propertyType;
  @override
  final String? excludePostId;
  @override
  final int? limit;

  @override
  String toString() {
    return 'FeedEvent.getSimilarPostsByCategoryEvent(propertyType: $propertyType, excludePostId: $excludePostId, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSimilarPostsByCategoryEventImpl &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.excludePostId, excludePostId) ||
                other.excludePostId == excludePostId) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, propertyType, excludePostId, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSimilarPostsByCategoryEventImplCopyWith<
          _$GetSimilarPostsByCategoryEventImpl>
      get copyWith => __$$GetSimilarPostsByCategoryEventImplCopyWithImpl<
          _$GetSimilarPostsByCategoryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return getSimilarPostsByCategoryEvent(propertyType, excludePostId, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return getSimilarPostsByCategoryEvent?.call(
        propertyType, excludePostId, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getSimilarPostsByCategoryEvent != null) {
      return getSimilarPostsByCategoryEvent(propertyType, excludePostId, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return getSimilarPostsByCategoryEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return getSimilarPostsByCategoryEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (getSimilarPostsByCategoryEvent != null) {
      return getSimilarPostsByCategoryEvent(this);
    }
    return orElse();
  }
}

abstract class _GetSimilarPostsByCategoryEvent implements FeedEvent {
  const factory _GetSimilarPostsByCategoryEvent(
      {final String? propertyType,
      final String? excludePostId,
      final int? limit}) = _$GetSimilarPostsByCategoryEventImpl;

  String? get propertyType;
  String? get excludePostId;
  int? get limit;
  @JsonKey(ignore: true)
  _$$GetSimilarPostsByCategoryEventImplCopyWith<
          _$GetSimilarPostsByCategoryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetSimilarPostsByCategoryImplCopyWith<$Res> {
  factory _$$ResetSimilarPostsByCategoryImplCopyWith(
          _$ResetSimilarPostsByCategoryImpl value,
          $Res Function(_$ResetSimilarPostsByCategoryImpl) then) =
      __$$ResetSimilarPostsByCategoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetSimilarPostsByCategoryImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$ResetSimilarPostsByCategoryImpl>
    implements _$$ResetSimilarPostsByCategoryImplCopyWith<$Res> {
  __$$ResetSimilarPostsByCategoryImplCopyWithImpl(
      _$ResetSimilarPostsByCategoryImpl _value,
      $Res Function(_$ResetSimilarPostsByCategoryImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetSimilarPostsByCategoryImpl
    implements _ResetSimilarPostsByCategory {
  const _$ResetSimilarPostsByCategoryImpl();

  @override
  String toString() {
    return 'FeedEvent.resetSimilarPostsByCategory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetSimilarPostsByCategoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return resetSimilarPostsByCategory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return resetSimilarPostsByCategory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (resetSimilarPostsByCategory != null) {
      return resetSimilarPostsByCategory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return resetSimilarPostsByCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return resetSimilarPostsByCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (resetSimilarPostsByCategory != null) {
      return resetSimilarPostsByCategory(this);
    }
    return orElse();
  }
}

abstract class _ResetSimilarPostsByCategory implements FeedEvent {
  const factory _ResetSimilarPostsByCategory() =
      _$ResetSimilarPostsByCategoryImpl;
}

/// @nodoc
abstract class _$$UpdatePropertyEventImplCopyWith<$Res> {
  factory _$$UpdatePropertyEventImplCopyWith(_$UpdatePropertyEventImpl value,
          $Res Function(_$UpdatePropertyEventImpl) then) =
      __$$UpdatePropertyEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String propertyId,
      String availableFrom,
      int totalFloors,
      bool isFeatured,
      String propertyType,
      int bathrooms,
      int price,
      String city,
      int floor,
      double latitude,
      int propertyAgeYears,
      String furnishing,
      double longitude,
      String address,
      String listingType,
      String amenities,
      List<File> newImages,
      int bedrooms,
      String title,
      bool isPromoted,
      List<String> existingImageUrls,
      String description,
      bool isVerified,
      double areaSqft});
}

/// @nodoc
class __$$UpdatePropertyEventImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$UpdatePropertyEventImpl>
    implements _$$UpdatePropertyEventImplCopyWith<$Res> {
  __$$UpdatePropertyEventImplCopyWithImpl(_$UpdatePropertyEventImpl _value,
      $Res Function(_$UpdatePropertyEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
    Object? availableFrom = null,
    Object? totalFloors = null,
    Object? isFeatured = null,
    Object? propertyType = null,
    Object? bathrooms = null,
    Object? price = null,
    Object? city = null,
    Object? floor = null,
    Object? latitude = null,
    Object? propertyAgeYears = null,
    Object? furnishing = null,
    Object? longitude = null,
    Object? address = null,
    Object? listingType = null,
    Object? amenities = null,
    Object? newImages = null,
    Object? bedrooms = null,
    Object? title = null,
    Object? isPromoted = null,
    Object? existingImageUrls = null,
    Object? description = null,
    Object? isVerified = null,
    Object? areaSqft = null,
  }) {
    return _then(_$UpdatePropertyEventImpl(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      availableFrom: null == availableFrom
          ? _value.availableFrom
          : availableFrom // ignore: cast_nullable_to_non_nullable
              as String,
      totalFloors: null == totalFloors
          ? _value.totalFloors
          : totalFloors // ignore: cast_nullable_to_non_nullable
              as int,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      propertyType: null == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String,
      bathrooms: null == bathrooms
          ? _value.bathrooms
          : bathrooms // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      propertyAgeYears: null == propertyAgeYears
          ? _value.propertyAgeYears
          : propertyAgeYears // ignore: cast_nullable_to_non_nullable
              as int,
      furnishing: null == furnishing
          ? _value.furnishing
          : furnishing // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String,
      amenities: null == amenities
          ? _value.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as String,
      newImages: null == newImages
          ? _value._newImages
          : newImages // ignore: cast_nullable_to_non_nullable
              as List<File>,
      bedrooms: null == bedrooms
          ? _value.bedrooms
          : bedrooms // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isPromoted: null == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool,
      existingImageUrls: null == existingImageUrls
          ? _value._existingImageUrls
          : existingImageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      areaSqft: null == areaSqft
          ? _value.areaSqft
          : areaSqft // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$UpdatePropertyEventImpl implements _UpdatePropertyEvent {
  const _$UpdatePropertyEventImpl(
      {required this.propertyId,
      required this.availableFrom,
      required this.totalFloors,
      required this.isFeatured,
      required this.propertyType,
      required this.bathrooms,
      required this.price,
      required this.city,
      required this.floor,
      required this.latitude,
      required this.propertyAgeYears,
      required this.furnishing,
      required this.longitude,
      required this.address,
      required this.listingType,
      required this.amenities,
      required final List<File> newImages,
      required this.bedrooms,
      required this.title,
      required this.isPromoted,
      required final List<String> existingImageUrls,
      required this.description,
      required this.isVerified,
      required this.areaSqft})
      : _newImages = newImages,
        _existingImageUrls = existingImageUrls;

  @override
  final String propertyId;
  @override
  final String availableFrom;
  @override
  final int totalFloors;
  @override
  final bool isFeatured;
  @override
  final String propertyType;
  @override
  final int bathrooms;
  @override
  final int price;
  @override
  final String city;
  @override
  final int floor;
  @override
  final double latitude;
  @override
  final int propertyAgeYears;
  @override
  final String furnishing;
  @override
  final double longitude;
  @override
  final String address;
  @override
  final String listingType;
  @override
  final String amenities;
  final List<File> _newImages;
  @override
  List<File> get newImages {
    if (_newImages is EqualUnmodifiableListView) return _newImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newImages);
  }

  @override
  final int bedrooms;
  @override
  final String title;
  @override
  final bool isPromoted;
  final List<String> _existingImageUrls;
  @override
  List<String> get existingImageUrls {
    if (_existingImageUrls is EqualUnmodifiableListView)
      return _existingImageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_existingImageUrls);
  }

  @override
  final String description;
  @override
  final bool isVerified;
  @override
  final double areaSqft;

  @override
  String toString() {
    return 'FeedEvent.updateProperty(propertyId: $propertyId, availableFrom: $availableFrom, totalFloors: $totalFloors, isFeatured: $isFeatured, propertyType: $propertyType, bathrooms: $bathrooms, price: $price, city: $city, floor: $floor, latitude: $latitude, propertyAgeYears: $propertyAgeYears, furnishing: $furnishing, longitude: $longitude, address: $address, listingType: $listingType, amenities: $amenities, newImages: $newImages, bedrooms: $bedrooms, title: $title, isPromoted: $isPromoted, existingImageUrls: $existingImageUrls, description: $description, isVerified: $isVerified, areaSqft: $areaSqft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePropertyEventImpl &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.availableFrom, availableFrom) ||
                other.availableFrom == availableFrom) &&
            (identical(other.totalFloors, totalFloors) ||
                other.totalFloors == totalFloors) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.bathrooms, bathrooms) ||
                other.bathrooms == bathrooms) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.propertyAgeYears, propertyAgeYears) ||
                other.propertyAgeYears == propertyAgeYears) &&
            (identical(other.furnishing, furnishing) ||
                other.furnishing == furnishing) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            (identical(other.amenities, amenities) ||
                other.amenities == amenities) &&
            const DeepCollectionEquality()
                .equals(other._newImages, _newImages) &&
            (identical(other.bedrooms, bedrooms) ||
                other.bedrooms == bedrooms) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isPromoted, isPromoted) ||
                other.isPromoted == isPromoted) &&
            const DeepCollectionEquality()
                .equals(other._existingImageUrls, _existingImageUrls) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.areaSqft, areaSqft) ||
                other.areaSqft == areaSqft));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        propertyId,
        availableFrom,
        totalFloors,
        isFeatured,
        propertyType,
        bathrooms,
        price,
        city,
        floor,
        latitude,
        propertyAgeYears,
        furnishing,
        longitude,
        address,
        listingType,
        amenities,
        const DeepCollectionEquality().hash(_newImages),
        bedrooms,
        title,
        isPromoted,
        const DeepCollectionEquality().hash(_existingImageUrls),
        description,
        isVerified,
        areaSqft
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePropertyEventImplCopyWith<_$UpdatePropertyEventImpl> get copyWith =>
      __$$UpdatePropertyEventImplCopyWithImpl<_$UpdatePropertyEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return updateProperty(
        propertyId,
        availableFrom,
        totalFloors,
        isFeatured,
        propertyType,
        bathrooms,
        price,
        city,
        floor,
        latitude,
        propertyAgeYears,
        furnishing,
        longitude,
        address,
        listingType,
        amenities,
        newImages,
        bedrooms,
        title,
        isPromoted,
        existingImageUrls,
        description,
        isVerified,
        areaSqft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return updateProperty?.call(
        propertyId,
        availableFrom,
        totalFloors,
        isFeatured,
        propertyType,
        bathrooms,
        price,
        city,
        floor,
        latitude,
        propertyAgeYears,
        furnishing,
        longitude,
        address,
        listingType,
        amenities,
        newImages,
        bedrooms,
        title,
        isPromoted,
        existingImageUrls,
        description,
        isVerified,
        areaSqft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (updateProperty != null) {
      return updateProperty(
          propertyId,
          availableFrom,
          totalFloors,
          isFeatured,
          propertyType,
          bathrooms,
          price,
          city,
          floor,
          latitude,
          propertyAgeYears,
          furnishing,
          longitude,
          address,
          listingType,
          amenities,
          newImages,
          bedrooms,
          title,
          isPromoted,
          existingImageUrls,
          description,
          isVerified,
          areaSqft);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return updateProperty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return updateProperty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (updateProperty != null) {
      return updateProperty(this);
    }
    return orElse();
  }
}

abstract class _UpdatePropertyEvent implements FeedEvent {
  const factory _UpdatePropertyEvent(
      {required final String propertyId,
      required final String availableFrom,
      required final int totalFloors,
      required final bool isFeatured,
      required final String propertyType,
      required final int bathrooms,
      required final int price,
      required final String city,
      required final int floor,
      required final double latitude,
      required final int propertyAgeYears,
      required final String furnishing,
      required final double longitude,
      required final String address,
      required final String listingType,
      required final String amenities,
      required final List<File> newImages,
      required final int bedrooms,
      required final String title,
      required final bool isPromoted,
      required final List<String> existingImageUrls,
      required final String description,
      required final bool isVerified,
      required final double areaSqft}) = _$UpdatePropertyEventImpl;

  String get propertyId;
  String get availableFrom;
  int get totalFloors;
  bool get isFeatured;
  String get propertyType;
  int get bathrooms;
  int get price;
  String get city;
  int get floor;
  double get latitude;
  int get propertyAgeYears;
  String get furnishing;
  double get longitude;
  String get address;
  String get listingType;
  String get amenities;
  List<File> get newImages;
  int get bedrooms;
  String get title;
  bool get isPromoted;
  List<String> get existingImageUrls;
  String get description;
  bool get isVerified;
  double get areaSqft;
  @JsonKey(ignore: true)
  _$$UpdatePropertyEventImplCopyWith<_$UpdatePropertyEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletePropertyEventImplCopyWith<$Res> {
  factory _$$DeletePropertyEventImplCopyWith(_$DeletePropertyEventImpl value,
          $Res Function(_$DeletePropertyEventImpl) then) =
      __$$DeletePropertyEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String propertyId});
}

/// @nodoc
class __$$DeletePropertyEventImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$DeletePropertyEventImpl>
    implements _$$DeletePropertyEventImplCopyWith<$Res> {
  __$$DeletePropertyEventImplCopyWithImpl(_$DeletePropertyEventImpl _value,
      $Res Function(_$DeletePropertyEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyId = null,
  }) {
    return _then(_$DeletePropertyEventImpl(
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeletePropertyEventImpl implements _DeletePropertyEvent {
  const _$DeletePropertyEventImpl({required this.propertyId});

  @override
  final String propertyId;

  @override
  String toString() {
    return 'FeedEvent.deleteProperty(propertyId: $propertyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletePropertyEventImpl &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, propertyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletePropertyEventImplCopyWith<_$DeletePropertyEventImpl> get copyWith =>
      __$$DeletePropertyEventImplCopyWithImpl<_$DeletePropertyEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)
        getFeedsEvent,
    required TResult Function(String postId) getPostDetailsEvent,
    required TResult Function(String? city, String? propertyType,
            String? excludePostId, int? limit)
        getSimilarPropertiesEvent,
    required TResult Function(String propertyId) likeProperty,
    required TResult Function(String propertyId) getCommentsById,
    required TResult Function(String propertyId, String text)
        addCommentToProperty,
    required TResult Function(String propertyId) toggleFavorite,
    required TResult Function() isLoading,
    required TResult Function(int? limit, int? offset) getMyProperties,
    required TResult Function() getFavourites,
    required TResult Function(String propertyId) recordPropertyView,
    required TResult Function(
            String? propertyType, String? excludePostId, int? limit)
        getSimilarPostsByCategoryEvent,
    required TResult Function() resetSimilarPostsByCategory,
    required TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)
        updateProperty,
    required TResult Function(String propertyId) deleteProperty,
  }) {
    return deleteProperty(propertyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult? Function(String postId)? getPostDetailsEvent,
    TResult? Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult? Function(String propertyId)? likeProperty,
    TResult? Function(String propertyId)? getCommentsById,
    TResult? Function(String propertyId, String text)? addCommentToProperty,
    TResult? Function(String propertyId)? toggleFavorite,
    TResult? Function()? isLoading,
    TResult? Function(int? limit, int? offset)? getMyProperties,
    TResult? Function()? getFavourites,
    TResult? Function(String propertyId)? recordPropertyView,
    TResult? Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult? Function()? resetSimilarPostsByCategory,
    TResult? Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult? Function(String propertyId)? deleteProperty,
  }) {
    return deleteProperty?.call(propertyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(
            String? city,
            String? listingType,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset,
            double? latitude,
            double? longitude)?
        getFeedsEvent,
    TResult Function(String postId)? getPostDetailsEvent,
    TResult Function(String? city, String? propertyType, String? excludePostId,
            int? limit)?
        getSimilarPropertiesEvent,
    TResult Function(String propertyId)? likeProperty,
    TResult Function(String propertyId)? getCommentsById,
    TResult Function(String propertyId, String text)? addCommentToProperty,
    TResult Function(String propertyId)? toggleFavorite,
    TResult Function()? isLoading,
    TResult Function(int? limit, int? offset)? getMyProperties,
    TResult Function()? getFavourites,
    TResult Function(String propertyId)? recordPropertyView,
    TResult Function(String? propertyType, String? excludePostId, int? limit)?
        getSimilarPostsByCategoryEvent,
    TResult Function()? resetSimilarPostsByCategory,
    TResult Function(
            String propertyId,
            String availableFrom,
            int totalFloors,
            bool isFeatured,
            String propertyType,
            int bathrooms,
            int price,
            String city,
            int floor,
            double latitude,
            int propertyAgeYears,
            String furnishing,
            double longitude,
            String address,
            String listingType,
            String amenities,
            List<File> newImages,
            int bedrooms,
            String title,
            bool isPromoted,
            List<String> existingImageUrls,
            String description,
            bool isVerified,
            double areaSqft)?
        updateProperty,
    TResult Function(String propertyId)? deleteProperty,
    required TResult orElse(),
  }) {
    if (deleteProperty != null) {
      return deleteProperty(propertyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetFeedsEvent value) getFeedsEvent,
    required TResult Function(_GetPostDetailsEvent value) getPostDetailsEvent,
    required TResult Function(_GetSimilarPropertiesEvent value)
        getSimilarPropertiesEvent,
    required TResult Function(_LikeProperty value) likeProperty,
    required TResult Function(_GetCommentsById value) getCommentsById,
    required TResult Function(_AddCommentToProperty value) addCommentToProperty,
    required TResult Function(_ToggleFavorite value) toggleFavorite,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_GetMyProperties value) getMyProperties,
    required TResult Function(_GetFavourites value) getFavourites,
    required TResult Function(_RecordPropertyView value) recordPropertyView,
    required TResult Function(_GetSimilarPostsByCategoryEvent value)
        getSimilarPostsByCategoryEvent,
    required TResult Function(_ResetSimilarPostsByCategory value)
        resetSimilarPostsByCategory,
    required TResult Function(_UpdatePropertyEvent value) updateProperty,
    required TResult Function(_DeletePropertyEvent value) deleteProperty,
  }) {
    return deleteProperty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult? Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult? Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult? Function(_LikeProperty value)? likeProperty,
    TResult? Function(_GetCommentsById value)? getCommentsById,
    TResult? Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult? Function(_ToggleFavorite value)? toggleFavorite,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_GetMyProperties value)? getMyProperties,
    TResult? Function(_GetFavourites value)? getFavourites,
    TResult? Function(_RecordPropertyView value)? recordPropertyView,
    TResult? Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult? Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult? Function(_UpdatePropertyEvent value)? updateProperty,
    TResult? Function(_DeletePropertyEvent value)? deleteProperty,
  }) {
    return deleteProperty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetFeedsEvent value)? getFeedsEvent,
    TResult Function(_GetPostDetailsEvent value)? getPostDetailsEvent,
    TResult Function(_GetSimilarPropertiesEvent value)?
        getSimilarPropertiesEvent,
    TResult Function(_LikeProperty value)? likeProperty,
    TResult Function(_GetCommentsById value)? getCommentsById,
    TResult Function(_AddCommentToProperty value)? addCommentToProperty,
    TResult Function(_ToggleFavorite value)? toggleFavorite,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_GetMyProperties value)? getMyProperties,
    TResult Function(_GetFavourites value)? getFavourites,
    TResult Function(_RecordPropertyView value)? recordPropertyView,
    TResult Function(_GetSimilarPostsByCategoryEvent value)?
        getSimilarPostsByCategoryEvent,
    TResult Function(_ResetSimilarPostsByCategory value)?
        resetSimilarPostsByCategory,
    TResult Function(_UpdatePropertyEvent value)? updateProperty,
    TResult Function(_DeletePropertyEvent value)? deleteProperty,
    required TResult orElse(),
  }) {
    if (deleteProperty != null) {
      return deleteProperty(this);
    }
    return orElse();
  }
}

abstract class _DeletePropertyEvent implements FeedEvent {
  const factory _DeletePropertyEvent({required final String propertyId}) =
      _$DeletePropertyEventImpl;

  String get propertyId;
  @JsonKey(ignore: true)
  _$$DeletePropertyEventImplCopyWith<_$DeletePropertyEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FeedState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  FeedPostsResponseModel? get postDetails => throw _privateConstructorUsedError;
  List<FeedPostsResponseModel> get similarProperties =>
      throw _privateConstructorUsedError;
  List<FeedPostsResponseModel> get similarPostsByCategory =>
      throw _privateConstructorUsedError;
  List<FeedPostsResponseModel> get feedsList =>
      throw _privateConstructorUsedError;
  List<FeedPostsResponseModel> get myPropertiesList =>
      throw _privateConstructorUsedError;
  List<FeedPostsResponseModel> get favouritesList =>
      throw _privateConstructorUsedError;
  Set<String> get likedPostIds => throw _privateConstructorUsedError;
  int get currentOffset => throw _privateConstructorUsedError;
  bool get hasMoreData => throw _privateConstructorUsedError;
  NotifyStatus? get notifyStatus => throw _privateConstructorUsedError;
  bool get commentsLoading => throw _privateConstructorUsedError;
  bool get isPostLoading => throw _privateConstructorUsedError;
  List<FeedCommentModel> get feedComments => throw _privateConstructorUsedError;
  bool get sendCommentLoading => throw _privateConstructorUsedError;
  bool get isFavouritesLoading => throw _privateConstructorUsedError;
  int get myPropertiesOffset => throw _privateConstructorUsedError;
  bool get hasMoreMyProperties => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedStateCopyWith<FeedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedStateCopyWith<$Res> {
  factory $FeedStateCopyWith(FeedState value, $Res Function(FeedState) then) =
      _$FeedStateCopyWithImpl<$Res, FeedState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool isSuccess,
      FeedPostsResponseModel? postDetails,
      List<FeedPostsResponseModel> similarProperties,
      List<FeedPostsResponseModel> similarPostsByCategory,
      List<FeedPostsResponseModel> feedsList,
      List<FeedPostsResponseModel> myPropertiesList,
      List<FeedPostsResponseModel> favouritesList,
      Set<String> likedPostIds,
      int currentOffset,
      bool hasMoreData,
      NotifyStatus? notifyStatus,
      bool commentsLoading,
      bool isPostLoading,
      List<FeedCommentModel> feedComments,
      bool sendCommentLoading,
      bool isFavouritesLoading,
      int myPropertiesOffset,
      bool hasMoreMyProperties});

  $FeedPostsResponseModelCopyWith<$Res>? get postDetails;
}

/// @nodoc
class _$FeedStateCopyWithImpl<$Res, $Val extends FeedState>
    implements $FeedStateCopyWith<$Res> {
  _$FeedStateCopyWithImpl(this._value, this._then);

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
    Object? postDetails = freezed,
    Object? similarProperties = null,
    Object? similarPostsByCategory = null,
    Object? feedsList = null,
    Object? myPropertiesList = null,
    Object? favouritesList = null,
    Object? likedPostIds = null,
    Object? currentOffset = null,
    Object? hasMoreData = null,
    Object? notifyStatus = freezed,
    Object? commentsLoading = null,
    Object? isPostLoading = null,
    Object? feedComments = null,
    Object? sendCommentLoading = null,
    Object? isFavouritesLoading = null,
    Object? myPropertiesOffset = null,
    Object? hasMoreMyProperties = null,
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
      postDetails: freezed == postDetails
          ? _value.postDetails
          : postDetails // ignore: cast_nullable_to_non_nullable
              as FeedPostsResponseModel?,
      similarProperties: null == similarProperties
          ? _value.similarProperties
          : similarProperties // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>,
      similarPostsByCategory: null == similarPostsByCategory
          ? _value.similarPostsByCategory
          : similarPostsByCategory // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>,
      feedsList: null == feedsList
          ? _value.feedsList
          : feedsList // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>,
      myPropertiesList: null == myPropertiesList
          ? _value.myPropertiesList
          : myPropertiesList // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>,
      favouritesList: null == favouritesList
          ? _value.favouritesList
          : favouritesList // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>,
      likedPostIds: null == likedPostIds
          ? _value.likedPostIds
          : likedPostIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
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
      commentsLoading: null == commentsLoading
          ? _value.commentsLoading
          : commentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPostLoading: null == isPostLoading
          ? _value.isPostLoading
          : isPostLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      feedComments: null == feedComments
          ? _value.feedComments
          : feedComments // ignore: cast_nullable_to_non_nullable
              as List<FeedCommentModel>,
      sendCommentLoading: null == sendCommentLoading
          ? _value.sendCommentLoading
          : sendCommentLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavouritesLoading: null == isFavouritesLoading
          ? _value.isFavouritesLoading
          : isFavouritesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      myPropertiesOffset: null == myPropertiesOffset
          ? _value.myPropertiesOffset
          : myPropertiesOffset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMoreMyProperties: null == hasMoreMyProperties
          ? _value.hasMoreMyProperties
          : hasMoreMyProperties // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FeedPostsResponseModelCopyWith<$Res>? get postDetails {
    if (_value.postDetails == null) {
      return null;
    }

    return $FeedPostsResponseModelCopyWith<$Res>(_value.postDetails!, (value) {
      return _then(_value.copyWith(postDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedStateImplCopyWith<$Res>
    implements $FeedStateCopyWith<$Res> {
  factory _$$FeedStateImplCopyWith(
          _$FeedStateImpl value, $Res Function(_$FeedStateImpl) then) =
      __$$FeedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool isSuccess,
      FeedPostsResponseModel? postDetails,
      List<FeedPostsResponseModel> similarProperties,
      List<FeedPostsResponseModel> similarPostsByCategory,
      List<FeedPostsResponseModel> feedsList,
      List<FeedPostsResponseModel> myPropertiesList,
      List<FeedPostsResponseModel> favouritesList,
      Set<String> likedPostIds,
      int currentOffset,
      bool hasMoreData,
      NotifyStatus? notifyStatus,
      bool commentsLoading,
      bool isPostLoading,
      List<FeedCommentModel> feedComments,
      bool sendCommentLoading,
      bool isFavouritesLoading,
      int myPropertiesOffset,
      bool hasMoreMyProperties});

  @override
  $FeedPostsResponseModelCopyWith<$Res>? get postDetails;
}

/// @nodoc
class __$$FeedStateImplCopyWithImpl<$Res>
    extends _$FeedStateCopyWithImpl<$Res, _$FeedStateImpl>
    implements _$$FeedStateImplCopyWith<$Res> {
  __$$FeedStateImplCopyWithImpl(
      _$FeedStateImpl _value, $Res Function(_$FeedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? isSuccess = null,
    Object? postDetails = freezed,
    Object? similarProperties = null,
    Object? similarPostsByCategory = null,
    Object? feedsList = null,
    Object? myPropertiesList = null,
    Object? favouritesList = null,
    Object? likedPostIds = null,
    Object? currentOffset = null,
    Object? hasMoreData = null,
    Object? notifyStatus = freezed,
    Object? commentsLoading = null,
    Object? isPostLoading = null,
    Object? feedComments = null,
    Object? sendCommentLoading = null,
    Object? isFavouritesLoading = null,
    Object? myPropertiesOffset = null,
    Object? hasMoreMyProperties = null,
  }) {
    return _then(_$FeedStateImpl(
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
      postDetails: freezed == postDetails
          ? _value.postDetails
          : postDetails // ignore: cast_nullable_to_non_nullable
              as FeedPostsResponseModel?,
      similarProperties: null == similarProperties
          ? _value._similarProperties
          : similarProperties // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>,
      similarPostsByCategory: null == similarPostsByCategory
          ? _value._similarPostsByCategory
          : similarPostsByCategory // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>,
      feedsList: null == feedsList
          ? _value._feedsList
          : feedsList // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>,
      myPropertiesList: null == myPropertiesList
          ? _value._myPropertiesList
          : myPropertiesList // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>,
      favouritesList: null == favouritesList
          ? _value._favouritesList
          : favouritesList // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>,
      likedPostIds: null == likedPostIds
          ? _value._likedPostIds
          : likedPostIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
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
      commentsLoading: null == commentsLoading
          ? _value.commentsLoading
          : commentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPostLoading: null == isPostLoading
          ? _value.isPostLoading
          : isPostLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      feedComments: null == feedComments
          ? _value._feedComments
          : feedComments // ignore: cast_nullable_to_non_nullable
              as List<FeedCommentModel>,
      sendCommentLoading: null == sendCommentLoading
          ? _value.sendCommentLoading
          : sendCommentLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavouritesLoading: null == isFavouritesLoading
          ? _value.isFavouritesLoading
          : isFavouritesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      myPropertiesOffset: null == myPropertiesOffset
          ? _value.myPropertiesOffset
          : myPropertiesOffset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMoreMyProperties: null == hasMoreMyProperties
          ? _value.hasMoreMyProperties
          : hasMoreMyProperties // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FeedStateImpl implements _FeedState {
  const _$FeedStateImpl(
      {this.isLoading = false,
      this.isError = false,
      this.isSuccess = false,
      this.postDetails,
      final List<FeedPostsResponseModel> similarProperties = const [],
      final List<FeedPostsResponseModel> similarPostsByCategory = const [],
      final List<FeedPostsResponseModel> feedsList = const [],
      final List<FeedPostsResponseModel> myPropertiesList = const [],
      final List<FeedPostsResponseModel> favouritesList = const [],
      final Set<String> likedPostIds = const <String>{},
      this.currentOffset = 0,
      this.hasMoreData = false,
      this.notifyStatus,
      this.commentsLoading = false,
      this.isPostLoading = false,
      final List<FeedCommentModel> feedComments = const [],
      this.sendCommentLoading = false,
      this.isFavouritesLoading = false,
      this.myPropertiesOffset = 0,
      this.hasMoreMyProperties = false})
      : _similarProperties = similarProperties,
        _similarPostsByCategory = similarPostsByCategory,
        _feedsList = feedsList,
        _myPropertiesList = myPropertiesList,
        _favouritesList = favouritesList,
        _likedPostIds = likedPostIds,
        _feedComments = feedComments;

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
  final FeedPostsResponseModel? postDetails;
  final List<FeedPostsResponseModel> _similarProperties;
  @override
  @JsonKey()
  List<FeedPostsResponseModel> get similarProperties {
    if (_similarProperties is EqualUnmodifiableListView)
      return _similarProperties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_similarProperties);
  }

  final List<FeedPostsResponseModel> _similarPostsByCategory;
  @override
  @JsonKey()
  List<FeedPostsResponseModel> get similarPostsByCategory {
    if (_similarPostsByCategory is EqualUnmodifiableListView)
      return _similarPostsByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_similarPostsByCategory);
  }

  final List<FeedPostsResponseModel> _feedsList;
  @override
  @JsonKey()
  List<FeedPostsResponseModel> get feedsList {
    if (_feedsList is EqualUnmodifiableListView) return _feedsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feedsList);
  }

  final List<FeedPostsResponseModel> _myPropertiesList;
  @override
  @JsonKey()
  List<FeedPostsResponseModel> get myPropertiesList {
    if (_myPropertiesList is EqualUnmodifiableListView)
      return _myPropertiesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myPropertiesList);
  }

  final List<FeedPostsResponseModel> _favouritesList;
  @override
  @JsonKey()
  List<FeedPostsResponseModel> get favouritesList {
    if (_favouritesList is EqualUnmodifiableListView) return _favouritesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favouritesList);
  }

  final Set<String> _likedPostIds;
  @override
  @JsonKey()
  Set<String> get likedPostIds {
    if (_likedPostIds is EqualUnmodifiableSetView) return _likedPostIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_likedPostIds);
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
  final bool commentsLoading;
  @override
  @JsonKey()
  final bool isPostLoading;
  final List<FeedCommentModel> _feedComments;
  @override
  @JsonKey()
  List<FeedCommentModel> get feedComments {
    if (_feedComments is EqualUnmodifiableListView) return _feedComments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feedComments);
  }

  @override
  @JsonKey()
  final bool sendCommentLoading;
  @override
  @JsonKey()
  final bool isFavouritesLoading;
  @override
  @JsonKey()
  final int myPropertiesOffset;
  @override
  @JsonKey()
  final bool hasMoreMyProperties;

  @override
  String toString() {
    return 'FeedState(isLoading: $isLoading, isError: $isError, isSuccess: $isSuccess, postDetails: $postDetails, similarProperties: $similarProperties, similarPostsByCategory: $similarPostsByCategory, feedsList: $feedsList, myPropertiesList: $myPropertiesList, favouritesList: $favouritesList, likedPostIds: $likedPostIds, currentOffset: $currentOffset, hasMoreData: $hasMoreData, notifyStatus: $notifyStatus, commentsLoading: $commentsLoading, isPostLoading: $isPostLoading, feedComments: $feedComments, sendCommentLoading: $sendCommentLoading, isFavouritesLoading: $isFavouritesLoading, myPropertiesOffset: $myPropertiesOffset, hasMoreMyProperties: $hasMoreMyProperties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.postDetails, postDetails) ||
                other.postDetails == postDetails) &&
            const DeepCollectionEquality()
                .equals(other._similarProperties, _similarProperties) &&
            const DeepCollectionEquality().equals(
                other._similarPostsByCategory, _similarPostsByCategory) &&
            const DeepCollectionEquality()
                .equals(other._feedsList, _feedsList) &&
            const DeepCollectionEquality()
                .equals(other._myPropertiesList, _myPropertiesList) &&
            const DeepCollectionEquality()
                .equals(other._favouritesList, _favouritesList) &&
            const DeepCollectionEquality()
                .equals(other._likedPostIds, _likedPostIds) &&
            (identical(other.currentOffset, currentOffset) ||
                other.currentOffset == currentOffset) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData) &&
            (identical(other.notifyStatus, notifyStatus) ||
                other.notifyStatus == notifyStatus) &&
            (identical(other.commentsLoading, commentsLoading) ||
                other.commentsLoading == commentsLoading) &&
            (identical(other.isPostLoading, isPostLoading) ||
                other.isPostLoading == isPostLoading) &&
            const DeepCollectionEquality()
                .equals(other._feedComments, _feedComments) &&
            (identical(other.sendCommentLoading, sendCommentLoading) ||
                other.sendCommentLoading == sendCommentLoading) &&
            (identical(other.isFavouritesLoading, isFavouritesLoading) ||
                other.isFavouritesLoading == isFavouritesLoading) &&
            (identical(other.myPropertiesOffset, myPropertiesOffset) ||
                other.myPropertiesOffset == myPropertiesOffset) &&
            (identical(other.hasMoreMyProperties, hasMoreMyProperties) ||
                other.hasMoreMyProperties == hasMoreMyProperties));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        isError,
        isSuccess,
        postDetails,
        const DeepCollectionEquality().hash(_similarProperties),
        const DeepCollectionEquality().hash(_similarPostsByCategory),
        const DeepCollectionEquality().hash(_feedsList),
        const DeepCollectionEquality().hash(_myPropertiesList),
        const DeepCollectionEquality().hash(_favouritesList),
        const DeepCollectionEquality().hash(_likedPostIds),
        currentOffset,
        hasMoreData,
        notifyStatus,
        commentsLoading,
        isPostLoading,
        const DeepCollectionEquality().hash(_feedComments),
        sendCommentLoading,
        isFavouritesLoading,
        myPropertiesOffset,
        hasMoreMyProperties
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedStateImplCopyWith<_$FeedStateImpl> get copyWith =>
      __$$FeedStateImplCopyWithImpl<_$FeedStateImpl>(this, _$identity);
}

abstract class _FeedState implements FeedState {
  const factory _FeedState(
      {final bool isLoading,
      final bool isError,
      final bool isSuccess,
      final FeedPostsResponseModel? postDetails,
      final List<FeedPostsResponseModel> similarProperties,
      final List<FeedPostsResponseModel> similarPostsByCategory,
      final List<FeedPostsResponseModel> feedsList,
      final List<FeedPostsResponseModel> myPropertiesList,
      final List<FeedPostsResponseModel> favouritesList,
      final Set<String> likedPostIds,
      final int currentOffset,
      final bool hasMoreData,
      final NotifyStatus? notifyStatus,
      final bool commentsLoading,
      final bool isPostLoading,
      final List<FeedCommentModel> feedComments,
      final bool sendCommentLoading,
      final bool isFavouritesLoading,
      final int myPropertiesOffset,
      final bool hasMoreMyProperties}) = _$FeedStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get isSuccess;
  @override
  FeedPostsResponseModel? get postDetails;
  @override
  List<FeedPostsResponseModel> get similarProperties;
  @override
  List<FeedPostsResponseModel> get similarPostsByCategory;
  @override
  List<FeedPostsResponseModel> get feedsList;
  @override
  List<FeedPostsResponseModel> get myPropertiesList;
  @override
  List<FeedPostsResponseModel> get favouritesList;
  @override
  Set<String> get likedPostIds;
  @override
  int get currentOffset;
  @override
  bool get hasMoreData;
  @override
  NotifyStatus? get notifyStatus;
  @override
  bool get commentsLoading;
  @override
  bool get isPostLoading;
  @override
  List<FeedCommentModel> get feedComments;
  @override
  bool get sendCommentLoading;
  @override
  bool get isFavouritesLoading;
  @override
  int get myPropertiesOffset;
  @override
  bool get hasMoreMyProperties;
  @override
  @JsonKey(ignore: true)
  _$$FeedStateImplCopyWith<_$FeedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
