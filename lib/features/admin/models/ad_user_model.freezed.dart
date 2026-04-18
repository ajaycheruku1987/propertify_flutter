// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdUserModel _$AdUserModelFromJson(Map<String, dynamic> json) {
  return _AdUserModel.fromJson(json);
}

/// @nodoc
mixin _$AdUserModel {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdUserModelCopyWith<AdUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdUserModelCopyWith<$Res> {
  factory $AdUserModelCopyWith(
          AdUserModel value, $Res Function(AdUserModel) then) =
      _$AdUserModelCopyWithImpl<$Res, AdUserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "role") String? role,
      @JsonKey(name: "user_id") String? userId});
}

/// @nodoc
class _$AdUserModelCopyWithImpl<$Res, $Val extends AdUserModel>
    implements $AdUserModelCopyWith<$Res> {
  _$AdUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phoneNumber = freezed,
    Object? role = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdUserModelImplCopyWith<$Res>
    implements $AdUserModelCopyWith<$Res> {
  factory _$$AdUserModelImplCopyWith(
          _$AdUserModelImpl value, $Res Function(_$AdUserModelImpl) then) =
      __$$AdUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "role") String? role,
      @JsonKey(name: "user_id") String? userId});
}

/// @nodoc
class __$$AdUserModelImplCopyWithImpl<$Res>
    extends _$AdUserModelCopyWithImpl<$Res, _$AdUserModelImpl>
    implements _$$AdUserModelImplCopyWith<$Res> {
  __$$AdUserModelImplCopyWithImpl(
      _$AdUserModelImpl _value, $Res Function(_$AdUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phoneNumber = freezed,
    Object? role = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$AdUserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdUserModelImpl implements _AdUserModel {
  const _$AdUserModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "phone_number") this.phoneNumber,
      @JsonKey(name: "role") this.role,
      @JsonKey(name: "user_id") this.userId});

  factory _$AdUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdUserModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @override
  @JsonKey(name: "role")
  final String? role;
  @override
  @JsonKey(name: "user_id")
  final String? userId;

  @override
  String toString() {
    return 'AdUserModel(id: $id, phoneNumber: $phoneNumber, role: $role, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, phoneNumber, role, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdUserModelImplCopyWith<_$AdUserModelImpl> get copyWith =>
      __$$AdUserModelImplCopyWithImpl<_$AdUserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdUserModelImplToJson(
      this,
    );
  }
}

abstract class _AdUserModel implements AdUserModel {
  const factory _AdUserModel(
      {@JsonKey(name: "id") final String? id,
      @JsonKey(name: "phone_number") final String? phoneNumber,
      @JsonKey(name: "role") final String? role,
      @JsonKey(name: "user_id") final String? userId}) = _$AdUserModelImpl;

  factory _AdUserModel.fromJson(Map<String, dynamic> json) =
      _$AdUserModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  @JsonKey(name: "role")
  String? get role;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$AdUserModelImplCopyWith<_$AdUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
