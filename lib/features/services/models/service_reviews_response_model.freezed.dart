// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_reviews_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceReviewsResponseModel _$ServiceReviewsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ServiceReviewsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceReviewsResponseModel {
  @JsonKey(name: "rating")
  int? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "review")
  String? get review => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "service_id")
  String? get serviceId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "user")
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceReviewsResponseModelCopyWith<ServiceReviewsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceReviewsResponseModelCopyWith<$Res> {
  factory $ServiceReviewsResponseModelCopyWith(
          ServiceReviewsResponseModel value,
          $Res Function(ServiceReviewsResponseModel) then) =
      _$ServiceReviewsResponseModelCopyWithImpl<$Res,
          ServiceReviewsResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "rating") int? rating,
      @JsonKey(name: "review") String? review,
      @JsonKey(name: "id") String? id,
      @JsonKey(name: "service_id") String? serviceId,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "user") User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ServiceReviewsResponseModelCopyWithImpl<$Res,
        $Val extends ServiceReviewsResponseModel>
    implements $ServiceReviewsResponseModelCopyWith<$Res> {
  _$ServiceReviewsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? review = freezed,
    Object? id = freezed,
    Object? serviceId = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServiceReviewsResponseModelImplCopyWith<$Res>
    implements $ServiceReviewsResponseModelCopyWith<$Res> {
  factory _$$ServiceReviewsResponseModelImplCopyWith(
          _$ServiceReviewsResponseModelImpl value,
          $Res Function(_$ServiceReviewsResponseModelImpl) then) =
      __$$ServiceReviewsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "rating") int? rating,
      @JsonKey(name: "review") String? review,
      @JsonKey(name: "id") String? id,
      @JsonKey(name: "service_id") String? serviceId,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "user") User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ServiceReviewsResponseModelImplCopyWithImpl<$Res>
    extends _$ServiceReviewsResponseModelCopyWithImpl<$Res,
        _$ServiceReviewsResponseModelImpl>
    implements _$$ServiceReviewsResponseModelImplCopyWith<$Res> {
  __$$ServiceReviewsResponseModelImplCopyWithImpl(
      _$ServiceReviewsResponseModelImpl _value,
      $Res Function(_$ServiceReviewsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? review = freezed,
    Object? id = freezed,
    Object? serviceId = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_$ServiceReviewsResponseModelImpl(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceId: freezed == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceReviewsResponseModelImpl
    implements _ServiceReviewsResponseModel {
  const _$ServiceReviewsResponseModelImpl(
      {@JsonKey(name: "rating") this.rating,
      @JsonKey(name: "review") this.review,
      @JsonKey(name: "id") this.id,
      @JsonKey(name: "service_id") this.serviceId,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "user") this.user});

  factory _$ServiceReviewsResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ServiceReviewsResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "rating")
  final int? rating;
  @override
  @JsonKey(name: "review")
  final String? review;
  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "service_id")
  final String? serviceId;
  @override
  @JsonKey(name: "user_id")
  final String? userId;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "user")
  final User? user;

  @override
  String toString() {
    return 'ServiceReviewsResponseModel(rating: $rating, review: $review, id: $id, serviceId: $serviceId, userId: $userId, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceReviewsResponseModelImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, rating, review, id, serviceId, userId, createdAt, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceReviewsResponseModelImplCopyWith<_$ServiceReviewsResponseModelImpl>
      get copyWith => __$$ServiceReviewsResponseModelImplCopyWithImpl<
          _$ServiceReviewsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceReviewsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ServiceReviewsResponseModel
    implements ServiceReviewsResponseModel {
  const factory _ServiceReviewsResponseModel(
          {@JsonKey(name: "rating") final int? rating,
          @JsonKey(name: "review") final String? review,
          @JsonKey(name: "id") final String? id,
          @JsonKey(name: "service_id") final String? serviceId,
          @JsonKey(name: "user_id") final String? userId,
          @JsonKey(name: "created_at") final String? createdAt,
          @JsonKey(name: "user") final User? user}) =
      _$ServiceReviewsResponseModelImpl;

  factory _ServiceReviewsResponseModel.fromJson(Map<String, dynamic> json) =
      _$ServiceReviewsResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "rating")
  int? get rating;
  @override
  @JsonKey(name: "review")
  String? get review;
  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "service_id")
  String? get serviceId;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "user")
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$ServiceReviewsResponseModelImplCopyWith<_$ServiceReviewsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "profilepic")
  String? get profilepic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "username") String? username,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "profilepic") String? profilepic});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? profilepic = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profilepic: freezed == profilepic
          ? _value.profilepic
          : profilepic // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "username") String? username,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "profilepic") String? profilepic});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? profilepic = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profilepic: freezed == profilepic
          ? _value.profilepic
          : profilepic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "username") this.username,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "phone_number") this.phoneNumber,
      @JsonKey(name: "profilepic") this.profilepic});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "username")
  final String? username;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @override
  @JsonKey(name: "profilepic")
  final String? profilepic;

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, phoneNumber: $phoneNumber, profilepic: $profilepic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profilepic, profilepic) ||
                other.profilepic == profilepic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, email, phoneNumber, profilepic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: "id") final String? id,
      @JsonKey(name: "username") final String? username,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "phone_number") final String? phoneNumber,
      @JsonKey(name: "profilepic") final String? profilepic}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "username")
  String? get username;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  @JsonKey(name: "profilepic")
  String? get profilepic;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
