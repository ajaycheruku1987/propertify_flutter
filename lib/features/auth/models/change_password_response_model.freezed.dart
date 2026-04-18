// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChangePasswordResponseModel _$ChangePasswordResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ChangePasswordResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ChangePasswordResponseModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePasswordResponseModelCopyWith<ChangePasswordResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordResponseModelCopyWith<$Res> {
  factory $ChangePasswordResponseModelCopyWith(
          ChangePasswordResponseModel value,
          $Res Function(ChangePasswordResponseModel) then) =
      _$ChangePasswordResponseModelCopyWithImpl<$Res,
          ChangePasswordResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class _$ChangePasswordResponseModelCopyWithImpl<$Res,
        $Val extends ChangePasswordResponseModel>
    implements $ChangePasswordResponseModelCopyWith<$Res> {
  _$ChangePasswordResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePasswordResponseModelImplCopyWith<$Res>
    implements $ChangePasswordResponseModelCopyWith<$Res> {
  factory _$$ChangePasswordResponseModelImplCopyWith(
          _$ChangePasswordResponseModelImpl value,
          $Res Function(_$ChangePasswordResponseModelImpl) then) =
      __$$ChangePasswordResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class __$$ChangePasswordResponseModelImplCopyWithImpl<$Res>
    extends _$ChangePasswordResponseModelCopyWithImpl<$Res,
        _$ChangePasswordResponseModelImpl>
    implements _$$ChangePasswordResponseModelImplCopyWith<$Res> {
  __$$ChangePasswordResponseModelImplCopyWithImpl(
      _$ChangePasswordResponseModelImpl _value,
      $Res Function(_$ChangePasswordResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ChangePasswordResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePasswordResponseModelImpl
    implements _ChangePasswordResponseModel {
  const _$ChangePasswordResponseModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "message") this.message});

  factory _$ChangePasswordResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChangePasswordResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "message")
  final String? message;

  @override
  String toString() {
    return 'ChangePasswordResponseModel(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordResponseModelImplCopyWith<_$ChangePasswordResponseModelImpl>
      get copyWith => __$$ChangePasswordResponseModelImplCopyWithImpl<
          _$ChangePasswordResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePasswordResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ChangePasswordResponseModel
    implements ChangePasswordResponseModel {
  const factory _ChangePasswordResponseModel(
          {@JsonKey(name: "status") final int? status,
          @JsonKey(name: "message") final String? message}) =
      _$ChangePasswordResponseModelImpl;

  factory _ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) =
      _$ChangePasswordResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  int? get status;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ChangePasswordResponseModelImplCopyWith<_$ChangePasswordResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
