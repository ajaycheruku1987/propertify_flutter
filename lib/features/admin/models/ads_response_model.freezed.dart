// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ads_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdsResponseModel _$AdsResponseModelFromJson(Map<String, dynamic> json) {
  return _AdsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AdsResponseModel {
  @JsonKey(name: "ads")
  List<AdUserModel>? get ads => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdsResponseModelCopyWith<AdsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdsResponseModelCopyWith<$Res> {
  factory $AdsResponseModelCopyWith(
          AdsResponseModel value, $Res Function(AdsResponseModel) then) =
      _$AdsResponseModelCopyWithImpl<$Res, AdsResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "ads") List<AdUserModel>? ads,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$AdsResponseModelCopyWithImpl<$Res, $Val extends AdsResponseModel>
    implements $AdsResponseModelCopyWith<$Res> {
  _$AdsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ads = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      ads: freezed == ads
          ? _value.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<AdUserModel>?,
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
abstract class _$$AdsResponseModelImplCopyWith<$Res>
    implements $AdsResponseModelCopyWith<$Res> {
  factory _$$AdsResponseModelImplCopyWith(_$AdsResponseModelImpl value,
          $Res Function(_$AdsResponseModelImpl) then) =
      __$$AdsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "ads") List<AdUserModel>? ads,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$AdsResponseModelImplCopyWithImpl<$Res>
    extends _$AdsResponseModelCopyWithImpl<$Res, _$AdsResponseModelImpl>
    implements _$$AdsResponseModelImplCopyWith<$Res> {
  __$$AdsResponseModelImplCopyWithImpl(_$AdsResponseModelImpl _value,
      $Res Function(_$AdsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ads = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$AdsResponseModelImpl(
      ads: freezed == ads
          ? _value._ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<AdUserModel>?,
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
class _$AdsResponseModelImpl implements _AdsResponseModel {
  const _$AdsResponseModelImpl(
      {@JsonKey(name: "ads") final List<AdUserModel>? ads,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "limit") this.limit})
      : _ads = ads;

  factory _$AdsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdsResponseModelImplFromJson(json);

  final List<AdUserModel>? _ads;
  @override
  @JsonKey(name: "ads")
  List<AdUserModel>? get ads {
    final value = _ads;
    if (value == null) return null;
    if (_ads is EqualUnmodifiableListView) return _ads;
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
    return 'AdsResponseModel(ads: $ads, total: $total, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdsResponseModelImpl &&
            const DeepCollectionEquality().equals(other._ads, _ads) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_ads), total, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdsResponseModelImplCopyWith<_$AdsResponseModelImpl> get copyWith =>
      __$$AdsResponseModelImplCopyWithImpl<_$AdsResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AdsResponseModel implements AdsResponseModel {
  const factory _AdsResponseModel(
      {@JsonKey(name: "ads") final List<AdUserModel>? ads,
      @JsonKey(name: "total") final int? total,
      @JsonKey(name: "page") final int? page,
      @JsonKey(name: "limit") final int? limit}) = _$AdsResponseModelImpl;

  factory _AdsResponseModel.fromJson(Map<String, dynamic> json) =
      _$AdsResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "ads")
  List<AdUserModel>? get ads;
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
  _$$AdsResponseModelImplCopyWith<_$AdsResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
