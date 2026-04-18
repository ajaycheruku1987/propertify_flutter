// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_list_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserListResponseModel _$UserListResponseModelFromJson(
    Map<String, dynamic> json) {
  return _UserListResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UserListResponseModel {
  @JsonKey(name: "users")
  List<UserModel>? get users => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserListResponseModelCopyWith<UserListResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserListResponseModelCopyWith<$Res> {
  factory $UserListResponseModelCopyWith(UserListResponseModel value,
          $Res Function(UserListResponseModel) then) =
      _$UserListResponseModelCopyWithImpl<$Res, UserListResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "users") List<UserModel>? users,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$UserListResponseModelCopyWithImpl<$Res,
        $Val extends UserListResponseModel>
    implements $UserListResponseModelCopyWith<$Res> {
  _$UserListResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
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
abstract class _$$UserListResponseModelImplCopyWith<$Res>
    implements $UserListResponseModelCopyWith<$Res> {
  factory _$$UserListResponseModelImplCopyWith(
          _$UserListResponseModelImpl value,
          $Res Function(_$UserListResponseModelImpl) then) =
      __$$UserListResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "users") List<UserModel>? users,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$UserListResponseModelImplCopyWithImpl<$Res>
    extends _$UserListResponseModelCopyWithImpl<$Res,
        _$UserListResponseModelImpl>
    implements _$$UserListResponseModelImplCopyWith<$Res> {
  __$$UserListResponseModelImplCopyWithImpl(_$UserListResponseModelImpl _value,
      $Res Function(_$UserListResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$UserListResponseModelImpl(
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>?,
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
class _$UserListResponseModelImpl implements _UserListResponseModel {
  const _$UserListResponseModelImpl(
      {@JsonKey(name: "users") final List<UserModel>? users,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "limit") this.limit})
      : _users = users;

  factory _$UserListResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserListResponseModelImplFromJson(json);

  final List<UserModel>? _users;
  @override
  @JsonKey(name: "users")
  List<UserModel>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
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
    return 'UserListResponseModel(users: $users, total: $total, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserListResponseModelImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_users), total, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserListResponseModelImplCopyWith<_$UserListResponseModelImpl>
      get copyWith => __$$UserListResponseModelImplCopyWithImpl<
          _$UserListResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserListResponseModelImplToJson(
      this,
    );
  }
}

abstract class _UserListResponseModel implements UserListResponseModel {
  const factory _UserListResponseModel(
      {@JsonKey(name: "users") final List<UserModel>? users,
      @JsonKey(name: "total") final int? total,
      @JsonKey(name: "page") final int? page,
      @JsonKey(name: "limit") final int? limit}) = _$UserListResponseModelImpl;

  factory _UserListResponseModel.fromJson(Map<String, dynamic> json) =
      _$UserListResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "users")
  List<UserModel>? get users;
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
  _$$UserListResponseModelImplCopyWith<_$UserListResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
