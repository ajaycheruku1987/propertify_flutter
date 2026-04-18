// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForgotPasswordResponseModel _$ForgotPasswordResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ForgotPasswordResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordResponseModel {
  @JsonKey(name: "status")
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForgotPasswordResponseModelCopyWith<ForgotPasswordResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordResponseModelCopyWith<$Res> {
  factory $ForgotPasswordResponseModelCopyWith(
          ForgotPasswordResponseModel value,
          $Res Function(ForgotPasswordResponseModel) then) =
      _$ForgotPasswordResponseModelCopyWithImpl<$Res,
          ForgotPasswordResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class _$ForgotPasswordResponseModelCopyWithImpl<$Res,
        $Val extends ForgotPasswordResponseModel>
    implements $ForgotPasswordResponseModelCopyWith<$Res> {
  _$ForgotPasswordResponseModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ForgotPasswordResponseModelImplCopyWith<$Res>
    implements $ForgotPasswordResponseModelCopyWith<$Res> {
  factory _$$ForgotPasswordResponseModelImplCopyWith(
          _$ForgotPasswordResponseModelImpl value,
          $Res Function(_$ForgotPasswordResponseModelImpl) then) =
      __$$ForgotPasswordResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") int? status,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class __$$ForgotPasswordResponseModelImplCopyWithImpl<$Res>
    extends _$ForgotPasswordResponseModelCopyWithImpl<$Res,
        _$ForgotPasswordResponseModelImpl>
    implements _$$ForgotPasswordResponseModelImplCopyWith<$Res> {
  __$$ForgotPasswordResponseModelImplCopyWithImpl(
      _$ForgotPasswordResponseModelImpl _value,
      $Res Function(_$ForgotPasswordResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ForgotPasswordResponseModelImpl(
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
class _$ForgotPasswordResponseModelImpl
    implements _ForgotPasswordResponseModel {
  const _$ForgotPasswordResponseModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "message") this.message});

  factory _$ForgotPasswordResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ForgotPasswordResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final int? status;
  @override
  @JsonKey(name: "message")
  final String? message;

  @override
  String toString() {
    return 'ForgotPasswordResponseModel(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordResponseModelImplCopyWith<_$ForgotPasswordResponseModelImpl>
      get copyWith => __$$ForgotPasswordResponseModelImplCopyWithImpl<
          _$ForgotPasswordResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ForgotPasswordResponseModel
    implements ForgotPasswordResponseModel {
  const factory _ForgotPasswordResponseModel(
          {@JsonKey(name: "status") final int? status,
          @JsonKey(name: "message") final String? message}) =
      _$ForgotPasswordResponseModelImpl;

  factory _ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) =
      _$ForgotPasswordResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  int? get status;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ForgotPasswordResponseModelImplCopyWith<_$ForgotPasswordResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
