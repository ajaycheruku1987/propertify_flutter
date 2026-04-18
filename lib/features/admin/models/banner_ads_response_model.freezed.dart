// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_ads_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BannerAdsResponseModel _$BannerAdsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _BannerAdsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$BannerAdsResponseModel {
  @JsonKey(name: "banner_ads")
  List<BannerAdModel>? get bannerAds => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BannerAdsResponseModelCopyWith<BannerAdsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerAdsResponseModelCopyWith<$Res> {
  factory $BannerAdsResponseModelCopyWith(BannerAdsResponseModel value,
          $Res Function(BannerAdsResponseModel) then) =
      _$BannerAdsResponseModelCopyWithImpl<$Res, BannerAdsResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "banner_ads") List<BannerAdModel>? bannerAds,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$BannerAdsResponseModelCopyWithImpl<$Res,
        $Val extends BannerAdsResponseModel>
    implements $BannerAdsResponseModelCopyWith<$Res> {
  _$BannerAdsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerAds = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      bannerAds: freezed == bannerAds
          ? _value.bannerAds
          : bannerAds // ignore: cast_nullable_to_non_nullable
              as List<BannerAdModel>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannerAdsResponseModelImplCopyWith<$Res>
    implements $BannerAdsResponseModelCopyWith<$Res> {
  factory _$$BannerAdsResponseModelImplCopyWith(
          _$BannerAdsResponseModelImpl value,
          $Res Function(_$BannerAdsResponseModelImpl) then) =
      __$$BannerAdsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "banner_ads") List<BannerAdModel>? bannerAds,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$BannerAdsResponseModelImplCopyWithImpl<$Res>
    extends _$BannerAdsResponseModelCopyWithImpl<$Res,
        _$BannerAdsResponseModelImpl>
    implements _$$BannerAdsResponseModelImplCopyWith<$Res> {
  __$$BannerAdsResponseModelImplCopyWithImpl(
      _$BannerAdsResponseModelImpl _value,
      $Res Function(_$BannerAdsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerAds = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$BannerAdsResponseModelImpl(
      bannerAds: freezed == bannerAds
          ? _value._bannerAds
          : bannerAds // ignore: cast_nullable_to_non_nullable
              as List<BannerAdModel>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BannerAdsResponseModelImpl implements _BannerAdsResponseModel {
  const _$BannerAdsResponseModelImpl(
      {@JsonKey(name: "banner_ads") final List<BannerAdModel>? bannerAds,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "limit") this.limit})
      : _bannerAds = bannerAds;

  factory _$BannerAdsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannerAdsResponseModelImplFromJson(json);

  final List<BannerAdModel>? _bannerAds;
  @override
  @JsonKey(name: "banner_ads")
  List<BannerAdModel>? get bannerAds {
    final value = _bannerAds;
    if (value == null) return null;
    if (_bannerAds is EqualUnmodifiableListView) return _bannerAds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "total")
  final int? total;
  @override
  @JsonKey(name: "page")
  final int? page;
  @override
  @JsonKey(name: "limit")
  final int? limit;

  @override
  String toString() {
    return 'BannerAdsResponseModel(bannerAds: $bannerAds, total: $total, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerAdsResponseModelImpl &&
            const DeepCollectionEquality()
                .equals(other._bannerAds, _bannerAds) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_bannerAds), total, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerAdsResponseModelImplCopyWith<_$BannerAdsResponseModelImpl>
      get copyWith => __$$BannerAdsResponseModelImplCopyWithImpl<
          _$BannerAdsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BannerAdsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _BannerAdsResponseModel implements BannerAdsResponseModel {
  const factory _BannerAdsResponseModel(
      {@JsonKey(name: "banner_ads") final List<BannerAdModel>? bannerAds,
      @JsonKey(name: "total") final int? total,
      @JsonKey(name: "page") final int? page,
      @JsonKey(name: "limit") final int? limit}) = _$BannerAdsResponseModelImpl;

  factory _BannerAdsResponseModel.fromJson(Map<String, dynamic> json) =
      _$BannerAdsResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "banner_ads")
  List<BannerAdModel>? get bannerAds;
  @override
  @JsonKey(name: "total")
  int? get total;
  @override
  @JsonKey(name: "page")
  int? get page;
  @override
  @JsonKey(name: "limit")
  int? get limit;
  @override
  @JsonKey(ignore: true)
  _$$BannerAdsResponseModelImplCopyWith<_$BannerAdsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
