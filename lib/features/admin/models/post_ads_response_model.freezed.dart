// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_ads_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostAdsResponseModel _$PostAdsResponseModelFromJson(Map<String, dynamic> json) {
  return _PostAdsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PostAdsResponseModel {
  @JsonKey(name: "posts")
  List<PostAdModel>? get posts => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostAdsResponseModelCopyWith<PostAdsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostAdsResponseModelCopyWith<$Res> {
  factory $PostAdsResponseModelCopyWith(PostAdsResponseModel value,
          $Res Function(PostAdsResponseModel) then) =
      _$PostAdsResponseModelCopyWithImpl<$Res, PostAdsResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "posts") List<PostAdModel>? posts,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$PostAdsResponseModelCopyWithImpl<$Res,
        $Val extends PostAdsResponseModel>
    implements $PostAdsResponseModelCopyWith<$Res> {
  _$PostAdsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      posts: freezed == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostAdModel>?,
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
abstract class _$$PostAdsResponseModelImplCopyWith<$Res>
    implements $PostAdsResponseModelCopyWith<$Res> {
  factory _$$PostAdsResponseModelImplCopyWith(_$PostAdsResponseModelImpl value,
          $Res Function(_$PostAdsResponseModelImpl) then) =
      __$$PostAdsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "posts") List<PostAdModel>? posts,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$PostAdsResponseModelImplCopyWithImpl<$Res>
    extends _$PostAdsResponseModelCopyWithImpl<$Res, _$PostAdsResponseModelImpl>
    implements _$$PostAdsResponseModelImplCopyWith<$Res> {
  __$$PostAdsResponseModelImplCopyWithImpl(_$PostAdsResponseModelImpl _value,
      $Res Function(_$PostAdsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$PostAdsResponseModelImpl(
      posts: freezed == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostAdModel>?,
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
class _$PostAdsResponseModelImpl implements _PostAdsResponseModel {
  const _$PostAdsResponseModelImpl(
      {@JsonKey(name: "posts") final List<PostAdModel>? posts,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "limit") this.limit})
      : _posts = posts;

  factory _$PostAdsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostAdsResponseModelImplFromJson(json);

  final List<PostAdModel>? _posts;
  @override
  @JsonKey(name: "posts")
  List<PostAdModel>? get posts {
    final value = _posts;
    if (value == null) return null;
    if (_posts is EqualUnmodifiableListView) return _posts;
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
    return 'PostAdsResponseModel(posts: $posts, total: $total, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostAdsResponseModelImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_posts), total, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostAdsResponseModelImplCopyWith<_$PostAdsResponseModelImpl>
      get copyWith =>
          __$$PostAdsResponseModelImplCopyWithImpl<_$PostAdsResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostAdsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PostAdsResponseModel implements PostAdsResponseModel {
  const factory _PostAdsResponseModel(
      {@JsonKey(name: "posts") final List<PostAdModel>? posts,
      @JsonKey(name: "total") final int? total,
      @JsonKey(name: "page") final int? page,
      @JsonKey(name: "limit") final int? limit}) = _$PostAdsResponseModelImpl;

  factory _PostAdsResponseModel.fromJson(Map<String, dynamic> json) =
      _$PostAdsResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "posts")
  List<PostAdModel>? get posts;
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
  _$$PostAdsResponseModelImplCopyWith<_$PostAdsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
