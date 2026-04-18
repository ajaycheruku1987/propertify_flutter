// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(bool flag) isLoading,
    required TResult Function(String mobileNummber, String password) login,
    required TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)
        signup,
    required TResult Function(String mobileNumber) verifyPhoneNumber,
    required TResult Function(String phoneNumber) getOtp,
    required TResult Function() clearShowOtpWidget,
    required TResult Function() clearAllAuth,
    required TResult Function(String phoneNumber) sendForgotPasswordOtp,
    required TResult Function(
            String phoneNumber, String newPassword, String otp)
        confirmForgotPassword,
    required TResult Function(String fcmToken) updateFcmToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(bool flag)? isLoading,
    TResult? Function(String mobileNummber, String password)? login,
    TResult? Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult? Function(String mobileNumber)? verifyPhoneNumber,
    TResult? Function(String phoneNumber)? getOtp,
    TResult? Function()? clearShowOtpWidget,
    TResult? Function()? clearAllAuth,
    TResult? Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult? Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult? Function(String fcmToken)? updateFcmToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(bool flag)? isLoading,
    TResult Function(String mobileNummber, String password)? login,
    TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult Function(String mobileNumber)? verifyPhoneNumber,
    TResult Function(String phoneNumber)? getOtp,
    TResult Function()? clearShowOtpWidget,
    TResult Function()? clearAllAuth,
    TResult Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult Function(String fcmToken)? updateFcmToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogoutEvent value) logout,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_SignupEvent value) signup,
    required TResult Function(_VerifyPhoneNumberEvent value) verifyPhoneNumber,
    required TResult Function(_GetOtpEvent value) getOtp,
    required TResult Function(_ClearShowOtpWidgetEvent value)
        clearShowOtpWidget,
    required TResult Function(_ClearAllAuthEvent value) clearAllAuth,
    required TResult Function(_SendForgotPasswordOtpEvent value)
        sendForgotPasswordOtp,
    required TResult Function(_ConfirmForgotPasswordEvent value)
        confirmForgotPassword,
    required TResult Function(_UpdateFcmTokenEvent value) updateFcmToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutEvent value)? logout,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_SignupEvent value)? signup,
    TResult? Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult? Function(_GetOtpEvent value)? getOtp,
    TResult? Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult? Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult? Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult? Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult? Function(_UpdateFcmTokenEvent value)? updateFcmToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutEvent value)? logout,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoginEvent value)? login,
    TResult Function(_SignupEvent value)? signup,
    TResult Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult Function(_GetOtpEvent value)? getOtp,
    TResult Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult Function(_UpdateFcmTokenEvent value)? updateFcmToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LogoutEventImplCopyWith<$Res> {
  factory _$$LogoutEventImplCopyWith(
          _$LogoutEventImpl value, $Res Function(_$LogoutEventImpl) then) =
      __$$LogoutEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutEventImpl>
    implements _$$LogoutEventImplCopyWith<$Res> {
  __$$LogoutEventImplCopyWithImpl(
      _$LogoutEventImpl _value, $Res Function(_$LogoutEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutEventImpl implements _LogoutEvent {
  const _$LogoutEventImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(bool flag) isLoading,
    required TResult Function(String mobileNummber, String password) login,
    required TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)
        signup,
    required TResult Function(String mobileNumber) verifyPhoneNumber,
    required TResult Function(String phoneNumber) getOtp,
    required TResult Function() clearShowOtpWidget,
    required TResult Function() clearAllAuth,
    required TResult Function(String phoneNumber) sendForgotPasswordOtp,
    required TResult Function(
            String phoneNumber, String newPassword, String otp)
        confirmForgotPassword,
    required TResult Function(String fcmToken) updateFcmToken,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(bool flag)? isLoading,
    TResult? Function(String mobileNummber, String password)? login,
    TResult? Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult? Function(String mobileNumber)? verifyPhoneNumber,
    TResult? Function(String phoneNumber)? getOtp,
    TResult? Function()? clearShowOtpWidget,
    TResult? Function()? clearAllAuth,
    TResult? Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult? Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult? Function(String fcmToken)? updateFcmToken,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(bool flag)? isLoading,
    TResult Function(String mobileNummber, String password)? login,
    TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult Function(String mobileNumber)? verifyPhoneNumber,
    TResult Function(String phoneNumber)? getOtp,
    TResult Function()? clearShowOtpWidget,
    TResult Function()? clearAllAuth,
    TResult Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult Function(String fcmToken)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogoutEvent value) logout,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_SignupEvent value) signup,
    required TResult Function(_VerifyPhoneNumberEvent value) verifyPhoneNumber,
    required TResult Function(_GetOtpEvent value) getOtp,
    required TResult Function(_ClearShowOtpWidgetEvent value)
        clearShowOtpWidget,
    required TResult Function(_ClearAllAuthEvent value) clearAllAuth,
    required TResult Function(_SendForgotPasswordOtpEvent value)
        sendForgotPasswordOtp,
    required TResult Function(_ConfirmForgotPasswordEvent value)
        confirmForgotPassword,
    required TResult Function(_UpdateFcmTokenEvent value) updateFcmToken,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutEvent value)? logout,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_SignupEvent value)? signup,
    TResult? Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult? Function(_GetOtpEvent value)? getOtp,
    TResult? Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult? Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult? Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult? Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult? Function(_UpdateFcmTokenEvent value)? updateFcmToken,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutEvent value)? logout,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoginEvent value)? login,
    TResult Function(_SignupEvent value)? signup,
    TResult Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult Function(_GetOtpEvent value)? getOtp,
    TResult Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult Function(_UpdateFcmTokenEvent value)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _LogoutEvent implements AuthEvent {
  const factory _LogoutEvent() = _$LogoutEventImpl;
}

/// @nodoc
abstract class _$$IsLoadingImplCopyWith<$Res> {
  factory _$$IsLoadingImplCopyWith(
          _$IsLoadingImpl value, $Res Function(_$IsLoadingImpl) then) =
      __$$IsLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool flag});
}

/// @nodoc
class __$$IsLoadingImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$IsLoadingImpl>
    implements _$$IsLoadingImplCopyWith<$Res> {
  __$$IsLoadingImplCopyWithImpl(
      _$IsLoadingImpl _value, $Res Function(_$IsLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flag = null,
  }) {
    return _then(_$IsLoadingImpl(
      null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IsLoadingImpl implements _IsLoading {
  const _$IsLoadingImpl(this.flag);

  @override
  final bool flag;

  @override
  String toString() {
    return 'AuthEvent.isLoading(flag: $flag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsLoadingImpl &&
            (identical(other.flag, flag) || other.flag == flag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsLoadingImplCopyWith<_$IsLoadingImpl> get copyWith =>
      __$$IsLoadingImplCopyWithImpl<_$IsLoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(bool flag) isLoading,
    required TResult Function(String mobileNummber, String password) login,
    required TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)
        signup,
    required TResult Function(String mobileNumber) verifyPhoneNumber,
    required TResult Function(String phoneNumber) getOtp,
    required TResult Function() clearShowOtpWidget,
    required TResult Function() clearAllAuth,
    required TResult Function(String phoneNumber) sendForgotPasswordOtp,
    required TResult Function(
            String phoneNumber, String newPassword, String otp)
        confirmForgotPassword,
    required TResult Function(String fcmToken) updateFcmToken,
  }) {
    return isLoading(flag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(bool flag)? isLoading,
    TResult? Function(String mobileNummber, String password)? login,
    TResult? Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult? Function(String mobileNumber)? verifyPhoneNumber,
    TResult? Function(String phoneNumber)? getOtp,
    TResult? Function()? clearShowOtpWidget,
    TResult? Function()? clearAllAuth,
    TResult? Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult? Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult? Function(String fcmToken)? updateFcmToken,
  }) {
    return isLoading?.call(flag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(bool flag)? isLoading,
    TResult Function(String mobileNummber, String password)? login,
    TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult Function(String mobileNumber)? verifyPhoneNumber,
    TResult Function(String phoneNumber)? getOtp,
    TResult Function()? clearShowOtpWidget,
    TResult Function()? clearAllAuth,
    TResult Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult Function(String fcmToken)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(flag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogoutEvent value) logout,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_SignupEvent value) signup,
    required TResult Function(_VerifyPhoneNumberEvent value) verifyPhoneNumber,
    required TResult Function(_GetOtpEvent value) getOtp,
    required TResult Function(_ClearShowOtpWidgetEvent value)
        clearShowOtpWidget,
    required TResult Function(_ClearAllAuthEvent value) clearAllAuth,
    required TResult Function(_SendForgotPasswordOtpEvent value)
        sendForgotPasswordOtp,
    required TResult Function(_ConfirmForgotPasswordEvent value)
        confirmForgotPassword,
    required TResult Function(_UpdateFcmTokenEvent value) updateFcmToken,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutEvent value)? logout,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_SignupEvent value)? signup,
    TResult? Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult? Function(_GetOtpEvent value)? getOtp,
    TResult? Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult? Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult? Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult? Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult? Function(_UpdateFcmTokenEvent value)? updateFcmToken,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutEvent value)? logout,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoginEvent value)? login,
    TResult Function(_SignupEvent value)? signup,
    TResult Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult Function(_GetOtpEvent value)? getOtp,
    TResult Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult Function(_UpdateFcmTokenEvent value)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class _IsLoading implements AuthEvent {
  const factory _IsLoading(final bool flag) = _$IsLoadingImpl;

  bool get flag;
  @JsonKey(ignore: true)
  _$$IsLoadingImplCopyWith<_$IsLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginEventImplCopyWith<$Res> {
  factory _$$LoginEventImplCopyWith(
          _$LoginEventImpl value, $Res Function(_$LoginEventImpl) then) =
      __$$LoginEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mobileNummber, String password});
}

/// @nodoc
class __$$LoginEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginEventImpl>
    implements _$$LoginEventImplCopyWith<$Res> {
  __$$LoginEventImplCopyWithImpl(
      _$LoginEventImpl _value, $Res Function(_$LoginEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileNummber = null,
    Object? password = null,
  }) {
    return _then(_$LoginEventImpl(
      mobileNummber: null == mobileNummber
          ? _value.mobileNummber
          : mobileNummber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginEventImpl implements _LoginEvent {
  const _$LoginEventImpl({required this.mobileNummber, required this.password});

  @override
  final String mobileNummber;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.login(mobileNummber: $mobileNummber, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginEventImpl &&
            (identical(other.mobileNummber, mobileNummber) ||
                other.mobileNummber == mobileNummber) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mobileNummber, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginEventImplCopyWith<_$LoginEventImpl> get copyWith =>
      __$$LoginEventImplCopyWithImpl<_$LoginEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(bool flag) isLoading,
    required TResult Function(String mobileNummber, String password) login,
    required TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)
        signup,
    required TResult Function(String mobileNumber) verifyPhoneNumber,
    required TResult Function(String phoneNumber) getOtp,
    required TResult Function() clearShowOtpWidget,
    required TResult Function() clearAllAuth,
    required TResult Function(String phoneNumber) sendForgotPasswordOtp,
    required TResult Function(
            String phoneNumber, String newPassword, String otp)
        confirmForgotPassword,
    required TResult Function(String fcmToken) updateFcmToken,
  }) {
    return login(mobileNummber, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(bool flag)? isLoading,
    TResult? Function(String mobileNummber, String password)? login,
    TResult? Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult? Function(String mobileNumber)? verifyPhoneNumber,
    TResult? Function(String phoneNumber)? getOtp,
    TResult? Function()? clearShowOtpWidget,
    TResult? Function()? clearAllAuth,
    TResult? Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult? Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult? Function(String fcmToken)? updateFcmToken,
  }) {
    return login?.call(mobileNummber, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(bool flag)? isLoading,
    TResult Function(String mobileNummber, String password)? login,
    TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult Function(String mobileNumber)? verifyPhoneNumber,
    TResult Function(String phoneNumber)? getOtp,
    TResult Function()? clearShowOtpWidget,
    TResult Function()? clearAllAuth,
    TResult Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult Function(String fcmToken)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(mobileNummber, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogoutEvent value) logout,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_SignupEvent value) signup,
    required TResult Function(_VerifyPhoneNumberEvent value) verifyPhoneNumber,
    required TResult Function(_GetOtpEvent value) getOtp,
    required TResult Function(_ClearShowOtpWidgetEvent value)
        clearShowOtpWidget,
    required TResult Function(_ClearAllAuthEvent value) clearAllAuth,
    required TResult Function(_SendForgotPasswordOtpEvent value)
        sendForgotPasswordOtp,
    required TResult Function(_ConfirmForgotPasswordEvent value)
        confirmForgotPassword,
    required TResult Function(_UpdateFcmTokenEvent value) updateFcmToken,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutEvent value)? logout,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_SignupEvent value)? signup,
    TResult? Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult? Function(_GetOtpEvent value)? getOtp,
    TResult? Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult? Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult? Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult? Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult? Function(_UpdateFcmTokenEvent value)? updateFcmToken,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutEvent value)? logout,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoginEvent value)? login,
    TResult Function(_SignupEvent value)? signup,
    TResult Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult Function(_GetOtpEvent value)? getOtp,
    TResult Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult Function(_UpdateFcmTokenEvent value)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _LoginEvent implements AuthEvent {
  const factory _LoginEvent(
      {required final String mobileNummber,
      required final String password}) = _$LoginEventImpl;

  String get mobileNummber;
  String get password;
  @JsonKey(ignore: true)
  _$$LoginEventImplCopyWith<_$LoginEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignupEventImplCopyWith<$Res> {
  factory _$$SignupEventImplCopyWith(
          _$SignupEventImpl value, $Res Function(_$SignupEventImpl) then) =
      __$$SignupEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String name,
      String? email,
      String mobileNumber,
      String password,
      String otp});
}

/// @nodoc
class __$$SignupEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignupEventImpl>
    implements _$$SignupEventImplCopyWith<$Res> {
  __$$SignupEventImplCopyWithImpl(
      _$SignupEventImpl _value, $Res Function(_$SignupEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = freezed,
    Object? mobileNumber = null,
    Object? password = null,
    Object? otp = null,
  }) {
    return _then(_$SignupEventImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignupEventImpl implements _SignupEvent {
  const _$SignupEventImpl(
      {required this.name,
      this.email,
      required this.mobileNumber,
      required this.password,
      required this.otp});

  @override
  final String name;
  @override
  final String? email;
  @override
  final String mobileNumber;
  @override
  final String password;
  @override
  final String otp;

  @override
  String toString() {
    return 'AuthEvent.signup(name: $name, email: $email, mobileNumber: $mobileNumber, password: $password, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupEventImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, mobileNumber, password, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupEventImplCopyWith<_$SignupEventImpl> get copyWith =>
      __$$SignupEventImplCopyWithImpl<_$SignupEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(bool flag) isLoading,
    required TResult Function(String mobileNummber, String password) login,
    required TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)
        signup,
    required TResult Function(String mobileNumber) verifyPhoneNumber,
    required TResult Function(String phoneNumber) getOtp,
    required TResult Function() clearShowOtpWidget,
    required TResult Function() clearAllAuth,
    required TResult Function(String phoneNumber) sendForgotPasswordOtp,
    required TResult Function(
            String phoneNumber, String newPassword, String otp)
        confirmForgotPassword,
    required TResult Function(String fcmToken) updateFcmToken,
  }) {
    return signup(name, email, mobileNumber, password, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(bool flag)? isLoading,
    TResult? Function(String mobileNummber, String password)? login,
    TResult? Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult? Function(String mobileNumber)? verifyPhoneNumber,
    TResult? Function(String phoneNumber)? getOtp,
    TResult? Function()? clearShowOtpWidget,
    TResult? Function()? clearAllAuth,
    TResult? Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult? Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult? Function(String fcmToken)? updateFcmToken,
  }) {
    return signup?.call(name, email, mobileNumber, password, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(bool flag)? isLoading,
    TResult Function(String mobileNummber, String password)? login,
    TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult Function(String mobileNumber)? verifyPhoneNumber,
    TResult Function(String phoneNumber)? getOtp,
    TResult Function()? clearShowOtpWidget,
    TResult Function()? clearAllAuth,
    TResult Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult Function(String fcmToken)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (signup != null) {
      return signup(name, email, mobileNumber, password, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogoutEvent value) logout,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_SignupEvent value) signup,
    required TResult Function(_VerifyPhoneNumberEvent value) verifyPhoneNumber,
    required TResult Function(_GetOtpEvent value) getOtp,
    required TResult Function(_ClearShowOtpWidgetEvent value)
        clearShowOtpWidget,
    required TResult Function(_ClearAllAuthEvent value) clearAllAuth,
    required TResult Function(_SendForgotPasswordOtpEvent value)
        sendForgotPasswordOtp,
    required TResult Function(_ConfirmForgotPasswordEvent value)
        confirmForgotPassword,
    required TResult Function(_UpdateFcmTokenEvent value) updateFcmToken,
  }) {
    return signup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutEvent value)? logout,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_SignupEvent value)? signup,
    TResult? Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult? Function(_GetOtpEvent value)? getOtp,
    TResult? Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult? Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult? Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult? Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult? Function(_UpdateFcmTokenEvent value)? updateFcmToken,
  }) {
    return signup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutEvent value)? logout,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoginEvent value)? login,
    TResult Function(_SignupEvent value)? signup,
    TResult Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult Function(_GetOtpEvent value)? getOtp,
    TResult Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult Function(_UpdateFcmTokenEvent value)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (signup != null) {
      return signup(this);
    }
    return orElse();
  }
}

abstract class _SignupEvent implements AuthEvent {
  const factory _SignupEvent(
      {required final String name,
      final String? email,
      required final String mobileNumber,
      required final String password,
      required final String otp}) = _$SignupEventImpl;

  String get name;
  String? get email;
  String get mobileNumber;
  String get password;
  String get otp;
  @JsonKey(ignore: true)
  _$$SignupEventImplCopyWith<_$SignupEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyPhoneNumberEventImplCopyWith<$Res> {
  factory _$$VerifyPhoneNumberEventImplCopyWith(
          _$VerifyPhoneNumberEventImpl value,
          $Res Function(_$VerifyPhoneNumberEventImpl) then) =
      __$$VerifyPhoneNumberEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mobileNumber});
}

/// @nodoc
class __$$VerifyPhoneNumberEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerifyPhoneNumberEventImpl>
    implements _$$VerifyPhoneNumberEventImplCopyWith<$Res> {
  __$$VerifyPhoneNumberEventImplCopyWithImpl(
      _$VerifyPhoneNumberEventImpl _value,
      $Res Function(_$VerifyPhoneNumberEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileNumber = null,
  }) {
    return _then(_$VerifyPhoneNumberEventImpl(
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyPhoneNumberEventImpl implements _VerifyPhoneNumberEvent {
  const _$VerifyPhoneNumberEventImpl({required this.mobileNumber});

  @override
  final String mobileNumber;

  @override
  String toString() {
    return 'AuthEvent.verifyPhoneNumber(mobileNumber: $mobileNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyPhoneNumberEventImpl &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mobileNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyPhoneNumberEventImplCopyWith<_$VerifyPhoneNumberEventImpl>
      get copyWith => __$$VerifyPhoneNumberEventImplCopyWithImpl<
          _$VerifyPhoneNumberEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(bool flag) isLoading,
    required TResult Function(String mobileNummber, String password) login,
    required TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)
        signup,
    required TResult Function(String mobileNumber) verifyPhoneNumber,
    required TResult Function(String phoneNumber) getOtp,
    required TResult Function() clearShowOtpWidget,
    required TResult Function() clearAllAuth,
    required TResult Function(String phoneNumber) sendForgotPasswordOtp,
    required TResult Function(
            String phoneNumber, String newPassword, String otp)
        confirmForgotPassword,
    required TResult Function(String fcmToken) updateFcmToken,
  }) {
    return verifyPhoneNumber(mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(bool flag)? isLoading,
    TResult? Function(String mobileNummber, String password)? login,
    TResult? Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult? Function(String mobileNumber)? verifyPhoneNumber,
    TResult? Function(String phoneNumber)? getOtp,
    TResult? Function()? clearShowOtpWidget,
    TResult? Function()? clearAllAuth,
    TResult? Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult? Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult? Function(String fcmToken)? updateFcmToken,
  }) {
    return verifyPhoneNumber?.call(mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(bool flag)? isLoading,
    TResult Function(String mobileNummber, String password)? login,
    TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult Function(String mobileNumber)? verifyPhoneNumber,
    TResult Function(String phoneNumber)? getOtp,
    TResult Function()? clearShowOtpWidget,
    TResult Function()? clearAllAuth,
    TResult Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult Function(String fcmToken)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (verifyPhoneNumber != null) {
      return verifyPhoneNumber(mobileNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogoutEvent value) logout,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_SignupEvent value) signup,
    required TResult Function(_VerifyPhoneNumberEvent value) verifyPhoneNumber,
    required TResult Function(_GetOtpEvent value) getOtp,
    required TResult Function(_ClearShowOtpWidgetEvent value)
        clearShowOtpWidget,
    required TResult Function(_ClearAllAuthEvent value) clearAllAuth,
    required TResult Function(_SendForgotPasswordOtpEvent value)
        sendForgotPasswordOtp,
    required TResult Function(_ConfirmForgotPasswordEvent value)
        confirmForgotPassword,
    required TResult Function(_UpdateFcmTokenEvent value) updateFcmToken,
  }) {
    return verifyPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutEvent value)? logout,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_SignupEvent value)? signup,
    TResult? Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult? Function(_GetOtpEvent value)? getOtp,
    TResult? Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult? Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult? Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult? Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult? Function(_UpdateFcmTokenEvent value)? updateFcmToken,
  }) {
    return verifyPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutEvent value)? logout,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoginEvent value)? login,
    TResult Function(_SignupEvent value)? signup,
    TResult Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult Function(_GetOtpEvent value)? getOtp,
    TResult Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult Function(_UpdateFcmTokenEvent value)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (verifyPhoneNumber != null) {
      return verifyPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class _VerifyPhoneNumberEvent implements AuthEvent {
  const factory _VerifyPhoneNumberEvent({required final String mobileNumber}) =
      _$VerifyPhoneNumberEventImpl;

  String get mobileNumber;
  @JsonKey(ignore: true)
  _$$VerifyPhoneNumberEventImplCopyWith<_$VerifyPhoneNumberEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetOtpEventImplCopyWith<$Res> {
  factory _$$GetOtpEventImplCopyWith(
          _$GetOtpEventImpl value, $Res Function(_$GetOtpEventImpl) then) =
      __$$GetOtpEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$GetOtpEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$GetOtpEventImpl>
    implements _$$GetOtpEventImplCopyWith<$Res> {
  __$$GetOtpEventImplCopyWithImpl(
      _$GetOtpEventImpl _value, $Res Function(_$GetOtpEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$GetOtpEventImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetOtpEventImpl implements _GetOtpEvent {
  const _$GetOtpEventImpl({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthEvent.getOtp(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOtpEventImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOtpEventImplCopyWith<_$GetOtpEventImpl> get copyWith =>
      __$$GetOtpEventImplCopyWithImpl<_$GetOtpEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(bool flag) isLoading,
    required TResult Function(String mobileNummber, String password) login,
    required TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)
        signup,
    required TResult Function(String mobileNumber) verifyPhoneNumber,
    required TResult Function(String phoneNumber) getOtp,
    required TResult Function() clearShowOtpWidget,
    required TResult Function() clearAllAuth,
    required TResult Function(String phoneNumber) sendForgotPasswordOtp,
    required TResult Function(
            String phoneNumber, String newPassword, String otp)
        confirmForgotPassword,
    required TResult Function(String fcmToken) updateFcmToken,
  }) {
    return getOtp(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(bool flag)? isLoading,
    TResult? Function(String mobileNummber, String password)? login,
    TResult? Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult? Function(String mobileNumber)? verifyPhoneNumber,
    TResult? Function(String phoneNumber)? getOtp,
    TResult? Function()? clearShowOtpWidget,
    TResult? Function()? clearAllAuth,
    TResult? Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult? Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult? Function(String fcmToken)? updateFcmToken,
  }) {
    return getOtp?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(bool flag)? isLoading,
    TResult Function(String mobileNummber, String password)? login,
    TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult Function(String mobileNumber)? verifyPhoneNumber,
    TResult Function(String phoneNumber)? getOtp,
    TResult Function()? clearShowOtpWidget,
    TResult Function()? clearAllAuth,
    TResult Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult Function(String fcmToken)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (getOtp != null) {
      return getOtp(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogoutEvent value) logout,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_SignupEvent value) signup,
    required TResult Function(_VerifyPhoneNumberEvent value) verifyPhoneNumber,
    required TResult Function(_GetOtpEvent value) getOtp,
    required TResult Function(_ClearShowOtpWidgetEvent value)
        clearShowOtpWidget,
    required TResult Function(_ClearAllAuthEvent value) clearAllAuth,
    required TResult Function(_SendForgotPasswordOtpEvent value)
        sendForgotPasswordOtp,
    required TResult Function(_ConfirmForgotPasswordEvent value)
        confirmForgotPassword,
    required TResult Function(_UpdateFcmTokenEvent value) updateFcmToken,
  }) {
    return getOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutEvent value)? logout,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_SignupEvent value)? signup,
    TResult? Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult? Function(_GetOtpEvent value)? getOtp,
    TResult? Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult? Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult? Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult? Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult? Function(_UpdateFcmTokenEvent value)? updateFcmToken,
  }) {
    return getOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutEvent value)? logout,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoginEvent value)? login,
    TResult Function(_SignupEvent value)? signup,
    TResult Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult Function(_GetOtpEvent value)? getOtp,
    TResult Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult Function(_UpdateFcmTokenEvent value)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (getOtp != null) {
      return getOtp(this);
    }
    return orElse();
  }
}

abstract class _GetOtpEvent implements AuthEvent {
  const factory _GetOtpEvent({required final String phoneNumber}) =
      _$GetOtpEventImpl;

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$GetOtpEventImplCopyWith<_$GetOtpEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearShowOtpWidgetEventImplCopyWith<$Res> {
  factory _$$ClearShowOtpWidgetEventImplCopyWith(
          _$ClearShowOtpWidgetEventImpl value,
          $Res Function(_$ClearShowOtpWidgetEventImpl) then) =
      __$$ClearShowOtpWidgetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearShowOtpWidgetEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ClearShowOtpWidgetEventImpl>
    implements _$$ClearShowOtpWidgetEventImplCopyWith<$Res> {
  __$$ClearShowOtpWidgetEventImplCopyWithImpl(
      _$ClearShowOtpWidgetEventImpl _value,
      $Res Function(_$ClearShowOtpWidgetEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearShowOtpWidgetEventImpl implements _ClearShowOtpWidgetEvent {
  const _$ClearShowOtpWidgetEventImpl();

  @override
  String toString() {
    return 'AuthEvent.clearShowOtpWidget()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearShowOtpWidgetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(bool flag) isLoading,
    required TResult Function(String mobileNummber, String password) login,
    required TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)
        signup,
    required TResult Function(String mobileNumber) verifyPhoneNumber,
    required TResult Function(String phoneNumber) getOtp,
    required TResult Function() clearShowOtpWidget,
    required TResult Function() clearAllAuth,
    required TResult Function(String phoneNumber) sendForgotPasswordOtp,
    required TResult Function(
            String phoneNumber, String newPassword, String otp)
        confirmForgotPassword,
    required TResult Function(String fcmToken) updateFcmToken,
  }) {
    return clearShowOtpWidget();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(bool flag)? isLoading,
    TResult? Function(String mobileNummber, String password)? login,
    TResult? Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult? Function(String mobileNumber)? verifyPhoneNumber,
    TResult? Function(String phoneNumber)? getOtp,
    TResult? Function()? clearShowOtpWidget,
    TResult? Function()? clearAllAuth,
    TResult? Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult? Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult? Function(String fcmToken)? updateFcmToken,
  }) {
    return clearShowOtpWidget?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(bool flag)? isLoading,
    TResult Function(String mobileNummber, String password)? login,
    TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult Function(String mobileNumber)? verifyPhoneNumber,
    TResult Function(String phoneNumber)? getOtp,
    TResult Function()? clearShowOtpWidget,
    TResult Function()? clearAllAuth,
    TResult Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult Function(String fcmToken)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (clearShowOtpWidget != null) {
      return clearShowOtpWidget();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogoutEvent value) logout,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_SignupEvent value) signup,
    required TResult Function(_VerifyPhoneNumberEvent value) verifyPhoneNumber,
    required TResult Function(_GetOtpEvent value) getOtp,
    required TResult Function(_ClearShowOtpWidgetEvent value)
        clearShowOtpWidget,
    required TResult Function(_ClearAllAuthEvent value) clearAllAuth,
    required TResult Function(_SendForgotPasswordOtpEvent value)
        sendForgotPasswordOtp,
    required TResult Function(_ConfirmForgotPasswordEvent value)
        confirmForgotPassword,
    required TResult Function(_UpdateFcmTokenEvent value) updateFcmToken,
  }) {
    return clearShowOtpWidget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutEvent value)? logout,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_SignupEvent value)? signup,
    TResult? Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult? Function(_GetOtpEvent value)? getOtp,
    TResult? Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult? Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult? Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult? Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult? Function(_UpdateFcmTokenEvent value)? updateFcmToken,
  }) {
    return clearShowOtpWidget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutEvent value)? logout,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoginEvent value)? login,
    TResult Function(_SignupEvent value)? signup,
    TResult Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult Function(_GetOtpEvent value)? getOtp,
    TResult Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult Function(_UpdateFcmTokenEvent value)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (clearShowOtpWidget != null) {
      return clearShowOtpWidget(this);
    }
    return orElse();
  }
}

abstract class _ClearShowOtpWidgetEvent implements AuthEvent {
  const factory _ClearShowOtpWidgetEvent() = _$ClearShowOtpWidgetEventImpl;
}

/// @nodoc
abstract class _$$ClearAllAuthEventImplCopyWith<$Res> {
  factory _$$ClearAllAuthEventImplCopyWith(_$ClearAllAuthEventImpl value,
          $Res Function(_$ClearAllAuthEventImpl) then) =
      __$$ClearAllAuthEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearAllAuthEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ClearAllAuthEventImpl>
    implements _$$ClearAllAuthEventImplCopyWith<$Res> {
  __$$ClearAllAuthEventImplCopyWithImpl(_$ClearAllAuthEventImpl _value,
      $Res Function(_$ClearAllAuthEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearAllAuthEventImpl implements _ClearAllAuthEvent {
  const _$ClearAllAuthEventImpl();

  @override
  String toString() {
    return 'AuthEvent.clearAllAuth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearAllAuthEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(bool flag) isLoading,
    required TResult Function(String mobileNummber, String password) login,
    required TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)
        signup,
    required TResult Function(String mobileNumber) verifyPhoneNumber,
    required TResult Function(String phoneNumber) getOtp,
    required TResult Function() clearShowOtpWidget,
    required TResult Function() clearAllAuth,
    required TResult Function(String phoneNumber) sendForgotPasswordOtp,
    required TResult Function(
            String phoneNumber, String newPassword, String otp)
        confirmForgotPassword,
    required TResult Function(String fcmToken) updateFcmToken,
  }) {
    return clearAllAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(bool flag)? isLoading,
    TResult? Function(String mobileNummber, String password)? login,
    TResult? Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult? Function(String mobileNumber)? verifyPhoneNumber,
    TResult? Function(String phoneNumber)? getOtp,
    TResult? Function()? clearShowOtpWidget,
    TResult? Function()? clearAllAuth,
    TResult? Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult? Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult? Function(String fcmToken)? updateFcmToken,
  }) {
    return clearAllAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(bool flag)? isLoading,
    TResult Function(String mobileNummber, String password)? login,
    TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult Function(String mobileNumber)? verifyPhoneNumber,
    TResult Function(String phoneNumber)? getOtp,
    TResult Function()? clearShowOtpWidget,
    TResult Function()? clearAllAuth,
    TResult Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult Function(String fcmToken)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (clearAllAuth != null) {
      return clearAllAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogoutEvent value) logout,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_SignupEvent value) signup,
    required TResult Function(_VerifyPhoneNumberEvent value) verifyPhoneNumber,
    required TResult Function(_GetOtpEvent value) getOtp,
    required TResult Function(_ClearShowOtpWidgetEvent value)
        clearShowOtpWidget,
    required TResult Function(_ClearAllAuthEvent value) clearAllAuth,
    required TResult Function(_SendForgotPasswordOtpEvent value)
        sendForgotPasswordOtp,
    required TResult Function(_ConfirmForgotPasswordEvent value)
        confirmForgotPassword,
    required TResult Function(_UpdateFcmTokenEvent value) updateFcmToken,
  }) {
    return clearAllAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutEvent value)? logout,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_SignupEvent value)? signup,
    TResult? Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult? Function(_GetOtpEvent value)? getOtp,
    TResult? Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult? Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult? Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult? Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult? Function(_UpdateFcmTokenEvent value)? updateFcmToken,
  }) {
    return clearAllAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutEvent value)? logout,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoginEvent value)? login,
    TResult Function(_SignupEvent value)? signup,
    TResult Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult Function(_GetOtpEvent value)? getOtp,
    TResult Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult Function(_UpdateFcmTokenEvent value)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (clearAllAuth != null) {
      return clearAllAuth(this);
    }
    return orElse();
  }
}

abstract class _ClearAllAuthEvent implements AuthEvent {
  const factory _ClearAllAuthEvent() = _$ClearAllAuthEventImpl;
}

/// @nodoc
abstract class _$$SendForgotPasswordOtpEventImplCopyWith<$Res> {
  factory _$$SendForgotPasswordOtpEventImplCopyWith(
          _$SendForgotPasswordOtpEventImpl value,
          $Res Function(_$SendForgotPasswordOtpEventImpl) then) =
      __$$SendForgotPasswordOtpEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$SendForgotPasswordOtpEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SendForgotPasswordOtpEventImpl>
    implements _$$SendForgotPasswordOtpEventImplCopyWith<$Res> {
  __$$SendForgotPasswordOtpEventImplCopyWithImpl(
      _$SendForgotPasswordOtpEventImpl _value,
      $Res Function(_$SendForgotPasswordOtpEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$SendForgotPasswordOtpEventImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendForgotPasswordOtpEventImpl implements _SendForgotPasswordOtpEvent {
  const _$SendForgotPasswordOtpEventImpl({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthEvent.sendForgotPasswordOtp(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendForgotPasswordOtpEventImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendForgotPasswordOtpEventImplCopyWith<_$SendForgotPasswordOtpEventImpl>
      get copyWith => __$$SendForgotPasswordOtpEventImplCopyWithImpl<
          _$SendForgotPasswordOtpEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(bool flag) isLoading,
    required TResult Function(String mobileNummber, String password) login,
    required TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)
        signup,
    required TResult Function(String mobileNumber) verifyPhoneNumber,
    required TResult Function(String phoneNumber) getOtp,
    required TResult Function() clearShowOtpWidget,
    required TResult Function() clearAllAuth,
    required TResult Function(String phoneNumber) sendForgotPasswordOtp,
    required TResult Function(
            String phoneNumber, String newPassword, String otp)
        confirmForgotPassword,
    required TResult Function(String fcmToken) updateFcmToken,
  }) {
    return sendForgotPasswordOtp(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(bool flag)? isLoading,
    TResult? Function(String mobileNummber, String password)? login,
    TResult? Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult? Function(String mobileNumber)? verifyPhoneNumber,
    TResult? Function(String phoneNumber)? getOtp,
    TResult? Function()? clearShowOtpWidget,
    TResult? Function()? clearAllAuth,
    TResult? Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult? Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult? Function(String fcmToken)? updateFcmToken,
  }) {
    return sendForgotPasswordOtp?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(bool flag)? isLoading,
    TResult Function(String mobileNummber, String password)? login,
    TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult Function(String mobileNumber)? verifyPhoneNumber,
    TResult Function(String phoneNumber)? getOtp,
    TResult Function()? clearShowOtpWidget,
    TResult Function()? clearAllAuth,
    TResult Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult Function(String fcmToken)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (sendForgotPasswordOtp != null) {
      return sendForgotPasswordOtp(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogoutEvent value) logout,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_SignupEvent value) signup,
    required TResult Function(_VerifyPhoneNumberEvent value) verifyPhoneNumber,
    required TResult Function(_GetOtpEvent value) getOtp,
    required TResult Function(_ClearShowOtpWidgetEvent value)
        clearShowOtpWidget,
    required TResult Function(_ClearAllAuthEvent value) clearAllAuth,
    required TResult Function(_SendForgotPasswordOtpEvent value)
        sendForgotPasswordOtp,
    required TResult Function(_ConfirmForgotPasswordEvent value)
        confirmForgotPassword,
    required TResult Function(_UpdateFcmTokenEvent value) updateFcmToken,
  }) {
    return sendForgotPasswordOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutEvent value)? logout,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_SignupEvent value)? signup,
    TResult? Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult? Function(_GetOtpEvent value)? getOtp,
    TResult? Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult? Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult? Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult? Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult? Function(_UpdateFcmTokenEvent value)? updateFcmToken,
  }) {
    return sendForgotPasswordOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutEvent value)? logout,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoginEvent value)? login,
    TResult Function(_SignupEvent value)? signup,
    TResult Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult Function(_GetOtpEvent value)? getOtp,
    TResult Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult Function(_UpdateFcmTokenEvent value)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (sendForgotPasswordOtp != null) {
      return sendForgotPasswordOtp(this);
    }
    return orElse();
  }
}

abstract class _SendForgotPasswordOtpEvent implements AuthEvent {
  const factory _SendForgotPasswordOtpEvent(
      {required final String phoneNumber}) = _$SendForgotPasswordOtpEventImpl;

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$SendForgotPasswordOtpEventImplCopyWith<_$SendForgotPasswordOtpEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmForgotPasswordEventImplCopyWith<$Res> {
  factory _$$ConfirmForgotPasswordEventImplCopyWith(
          _$ConfirmForgotPasswordEventImpl value,
          $Res Function(_$ConfirmForgotPasswordEventImpl) then) =
      __$$ConfirmForgotPasswordEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, String newPassword, String otp});
}

/// @nodoc
class __$$ConfirmForgotPasswordEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ConfirmForgotPasswordEventImpl>
    implements _$$ConfirmForgotPasswordEventImplCopyWith<$Res> {
  __$$ConfirmForgotPasswordEventImplCopyWithImpl(
      _$ConfirmForgotPasswordEventImpl _value,
      $Res Function(_$ConfirmForgotPasswordEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? newPassword = null,
    Object? otp = null,
  }) {
    return _then(_$ConfirmForgotPasswordEventImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConfirmForgotPasswordEventImpl implements _ConfirmForgotPasswordEvent {
  const _$ConfirmForgotPasswordEventImpl(
      {required this.phoneNumber,
      required this.newPassword,
      required this.otp});

  @override
  final String phoneNumber;
  @override
  final String newPassword;
  @override
  final String otp;

  @override
  String toString() {
    return 'AuthEvent.confirmForgotPassword(phoneNumber: $phoneNumber, newPassword: $newPassword, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmForgotPasswordEventImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, newPassword, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmForgotPasswordEventImplCopyWith<_$ConfirmForgotPasswordEventImpl>
      get copyWith => __$$ConfirmForgotPasswordEventImplCopyWithImpl<
          _$ConfirmForgotPasswordEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(bool flag) isLoading,
    required TResult Function(String mobileNummber, String password) login,
    required TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)
        signup,
    required TResult Function(String mobileNumber) verifyPhoneNumber,
    required TResult Function(String phoneNumber) getOtp,
    required TResult Function() clearShowOtpWidget,
    required TResult Function() clearAllAuth,
    required TResult Function(String phoneNumber) sendForgotPasswordOtp,
    required TResult Function(
            String phoneNumber, String newPassword, String otp)
        confirmForgotPassword,
    required TResult Function(String fcmToken) updateFcmToken,
  }) {
    return confirmForgotPassword(phoneNumber, newPassword, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(bool flag)? isLoading,
    TResult? Function(String mobileNummber, String password)? login,
    TResult? Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult? Function(String mobileNumber)? verifyPhoneNumber,
    TResult? Function(String phoneNumber)? getOtp,
    TResult? Function()? clearShowOtpWidget,
    TResult? Function()? clearAllAuth,
    TResult? Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult? Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult? Function(String fcmToken)? updateFcmToken,
  }) {
    return confirmForgotPassword?.call(phoneNumber, newPassword, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(bool flag)? isLoading,
    TResult Function(String mobileNummber, String password)? login,
    TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult Function(String mobileNumber)? verifyPhoneNumber,
    TResult Function(String phoneNumber)? getOtp,
    TResult Function()? clearShowOtpWidget,
    TResult Function()? clearAllAuth,
    TResult Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult Function(String fcmToken)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (confirmForgotPassword != null) {
      return confirmForgotPassword(phoneNumber, newPassword, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogoutEvent value) logout,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_SignupEvent value) signup,
    required TResult Function(_VerifyPhoneNumberEvent value) verifyPhoneNumber,
    required TResult Function(_GetOtpEvent value) getOtp,
    required TResult Function(_ClearShowOtpWidgetEvent value)
        clearShowOtpWidget,
    required TResult Function(_ClearAllAuthEvent value) clearAllAuth,
    required TResult Function(_SendForgotPasswordOtpEvent value)
        sendForgotPasswordOtp,
    required TResult Function(_ConfirmForgotPasswordEvent value)
        confirmForgotPassword,
    required TResult Function(_UpdateFcmTokenEvent value) updateFcmToken,
  }) {
    return confirmForgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutEvent value)? logout,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_SignupEvent value)? signup,
    TResult? Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult? Function(_GetOtpEvent value)? getOtp,
    TResult? Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult? Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult? Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult? Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult? Function(_UpdateFcmTokenEvent value)? updateFcmToken,
  }) {
    return confirmForgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutEvent value)? logout,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoginEvent value)? login,
    TResult Function(_SignupEvent value)? signup,
    TResult Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult Function(_GetOtpEvent value)? getOtp,
    TResult Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult Function(_UpdateFcmTokenEvent value)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (confirmForgotPassword != null) {
      return confirmForgotPassword(this);
    }
    return orElse();
  }
}

abstract class _ConfirmForgotPasswordEvent implements AuthEvent {
  const factory _ConfirmForgotPasswordEvent(
      {required final String phoneNumber,
      required final String newPassword,
      required final String otp}) = _$ConfirmForgotPasswordEventImpl;

  String get phoneNumber;
  String get newPassword;
  String get otp;
  @JsonKey(ignore: true)
  _$$ConfirmForgotPasswordEventImplCopyWith<_$ConfirmForgotPasswordEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateFcmTokenEventImplCopyWith<$Res> {
  factory _$$UpdateFcmTokenEventImplCopyWith(_$UpdateFcmTokenEventImpl value,
          $Res Function(_$UpdateFcmTokenEventImpl) then) =
      __$$UpdateFcmTokenEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String fcmToken});
}

/// @nodoc
class __$$UpdateFcmTokenEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UpdateFcmTokenEventImpl>
    implements _$$UpdateFcmTokenEventImplCopyWith<$Res> {
  __$$UpdateFcmTokenEventImplCopyWithImpl(_$UpdateFcmTokenEventImpl _value,
      $Res Function(_$UpdateFcmTokenEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
  }) {
    return _then(_$UpdateFcmTokenEventImpl(
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateFcmTokenEventImpl implements _UpdateFcmTokenEvent {
  const _$UpdateFcmTokenEventImpl({required this.fcmToken});

  @override
  final String fcmToken;

  @override
  String toString() {
    return 'AuthEvent.updateFcmToken(fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFcmTokenEventImpl &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fcmToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFcmTokenEventImplCopyWith<_$UpdateFcmTokenEventImpl> get copyWith =>
      __$$UpdateFcmTokenEventImplCopyWithImpl<_$UpdateFcmTokenEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logout,
    required TResult Function(bool flag) isLoading,
    required TResult Function(String mobileNummber, String password) login,
    required TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)
        signup,
    required TResult Function(String mobileNumber) verifyPhoneNumber,
    required TResult Function(String phoneNumber) getOtp,
    required TResult Function() clearShowOtpWidget,
    required TResult Function() clearAllAuth,
    required TResult Function(String phoneNumber) sendForgotPasswordOtp,
    required TResult Function(
            String phoneNumber, String newPassword, String otp)
        confirmForgotPassword,
    required TResult Function(String fcmToken) updateFcmToken,
  }) {
    return updateFcmToken(fcmToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? logout,
    TResult? Function(bool flag)? isLoading,
    TResult? Function(String mobileNummber, String password)? login,
    TResult? Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult? Function(String mobileNumber)? verifyPhoneNumber,
    TResult? Function(String phoneNumber)? getOtp,
    TResult? Function()? clearShowOtpWidget,
    TResult? Function()? clearAllAuth,
    TResult? Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult? Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult? Function(String fcmToken)? updateFcmToken,
  }) {
    return updateFcmToken?.call(fcmToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logout,
    TResult Function(bool flag)? isLoading,
    TResult Function(String mobileNummber, String password)? login,
    TResult Function(String name, String? email, String mobileNumber,
            String password, String otp)?
        signup,
    TResult Function(String mobileNumber)? verifyPhoneNumber,
    TResult Function(String phoneNumber)? getOtp,
    TResult Function()? clearShowOtpWidget,
    TResult Function()? clearAllAuth,
    TResult Function(String phoneNumber)? sendForgotPasswordOtp,
    TResult Function(String phoneNumber, String newPassword, String otp)?
        confirmForgotPassword,
    TResult Function(String fcmToken)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (updateFcmToken != null) {
      return updateFcmToken(fcmToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogoutEvent value) logout,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_LoginEvent value) login,
    required TResult Function(_SignupEvent value) signup,
    required TResult Function(_VerifyPhoneNumberEvent value) verifyPhoneNumber,
    required TResult Function(_GetOtpEvent value) getOtp,
    required TResult Function(_ClearShowOtpWidgetEvent value)
        clearShowOtpWidget,
    required TResult Function(_ClearAllAuthEvent value) clearAllAuth,
    required TResult Function(_SendForgotPasswordOtpEvent value)
        sendForgotPasswordOtp,
    required TResult Function(_ConfirmForgotPasswordEvent value)
        confirmForgotPassword,
    required TResult Function(_UpdateFcmTokenEvent value) updateFcmToken,
  }) {
    return updateFcmToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutEvent value)? logout,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_LoginEvent value)? login,
    TResult? Function(_SignupEvent value)? signup,
    TResult? Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult? Function(_GetOtpEvent value)? getOtp,
    TResult? Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult? Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult? Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult? Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult? Function(_UpdateFcmTokenEvent value)? updateFcmToken,
  }) {
    return updateFcmToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutEvent value)? logout,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_LoginEvent value)? login,
    TResult Function(_SignupEvent value)? signup,
    TResult Function(_VerifyPhoneNumberEvent value)? verifyPhoneNumber,
    TResult Function(_GetOtpEvent value)? getOtp,
    TResult Function(_ClearShowOtpWidgetEvent value)? clearShowOtpWidget,
    TResult Function(_ClearAllAuthEvent value)? clearAllAuth,
    TResult Function(_SendForgotPasswordOtpEvent value)? sendForgotPasswordOtp,
    TResult Function(_ConfirmForgotPasswordEvent value)? confirmForgotPassword,
    TResult Function(_UpdateFcmTokenEvent value)? updateFcmToken,
    required TResult orElse(),
  }) {
    if (updateFcmToken != null) {
      return updateFcmToken(this);
    }
    return orElse();
  }
}

abstract class _UpdateFcmTokenEvent implements AuthEvent {
  const factory _UpdateFcmTokenEvent({required final String fcmToken}) =
      _$UpdateFcmTokenEventImpl;

  String get fcmToken;
  @JsonKey(ignore: true)
  _$$UpdateFcmTokenEventImplCopyWith<_$UpdateFcmTokenEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  LoginResponseModel? get loginResponse => throw _privateConstructorUsedError;
  ForgotPasswordResponseModel? get sendOtpResponse =>
      throw _privateConstructorUsedError;
  ForgotPasswordResponseModel? get resetPasswordResponse =>
      throw _privateConstructorUsedError;
  LoginResponseModel? get validateLoginOtp =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool? get isNumberExists => throw _privateConstructorUsedError;
  NotifyStatus? get notifyStatus => throw _privateConstructorUsedError;
  bool get isOtpSent => throw _privateConstructorUsedError;
  bool get showOtpWidget => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {LoginResponseModel? loginResponse,
      ForgotPasswordResponseModel? sendOtpResponse,
      ForgotPasswordResponseModel? resetPasswordResponse,
      LoginResponseModel? validateLoginOtp,
      bool isLoading,
      bool? isNumberExists,
      NotifyStatus? notifyStatus,
      bool isOtpSent,
      bool showOtpWidget});

  $LoginResponseModelCopyWith<$Res>? get loginResponse;
  $ForgotPasswordResponseModelCopyWith<$Res>? get sendOtpResponse;
  $ForgotPasswordResponseModelCopyWith<$Res>? get resetPasswordResponse;
  $LoginResponseModelCopyWith<$Res>? get validateLoginOtp;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginResponse = freezed,
    Object? sendOtpResponse = freezed,
    Object? resetPasswordResponse = freezed,
    Object? validateLoginOtp = freezed,
    Object? isLoading = null,
    Object? isNumberExists = freezed,
    Object? notifyStatus = freezed,
    Object? isOtpSent = null,
    Object? showOtpWidget = null,
  }) {
    return _then(_value.copyWith(
      loginResponse: freezed == loginResponse
          ? _value.loginResponse
          : loginResponse // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
      sendOtpResponse: freezed == sendOtpResponse
          ? _value.sendOtpResponse
          : sendOtpResponse // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordResponseModel?,
      resetPasswordResponse: freezed == resetPasswordResponse
          ? _value.resetPasswordResponse
          : resetPasswordResponse // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordResponseModel?,
      validateLoginOtp: freezed == validateLoginOtp
          ? _value.validateLoginOtp
          : validateLoginOtp // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNumberExists: freezed == isNumberExists
          ? _value.isNumberExists
          : isNumberExists // ignore: cast_nullable_to_non_nullable
              as bool?,
      notifyStatus: freezed == notifyStatus
          ? _value.notifyStatus
          : notifyStatus // ignore: cast_nullable_to_non_nullable
              as NotifyStatus?,
      isOtpSent: null == isOtpSent
          ? _value.isOtpSent
          : isOtpSent // ignore: cast_nullable_to_non_nullable
              as bool,
      showOtpWidget: null == showOtpWidget
          ? _value.showOtpWidget
          : showOtpWidget // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginResponseModelCopyWith<$Res>? get loginResponse {
    if (_value.loginResponse == null) {
      return null;
    }

    return $LoginResponseModelCopyWith<$Res>(_value.loginResponse!, (value) {
      return _then(_value.copyWith(loginResponse: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ForgotPasswordResponseModelCopyWith<$Res>? get sendOtpResponse {
    if (_value.sendOtpResponse == null) {
      return null;
    }

    return $ForgotPasswordResponseModelCopyWith<$Res>(_value.sendOtpResponse!,
        (value) {
      return _then(_value.copyWith(sendOtpResponse: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ForgotPasswordResponseModelCopyWith<$Res>? get resetPasswordResponse {
    if (_value.resetPasswordResponse == null) {
      return null;
    }

    return $ForgotPasswordResponseModelCopyWith<$Res>(
        _value.resetPasswordResponse!, (value) {
      return _then(_value.copyWith(resetPasswordResponse: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginResponseModelCopyWith<$Res>? get validateLoginOtp {
    if (_value.validateLoginOtp == null) {
      return null;
    }

    return $LoginResponseModelCopyWith<$Res>(_value.validateLoginOtp!, (value) {
      return _then(_value.copyWith(validateLoginOtp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoginResponseModel? loginResponse,
      ForgotPasswordResponseModel? sendOtpResponse,
      ForgotPasswordResponseModel? resetPasswordResponse,
      LoginResponseModel? validateLoginOtp,
      bool isLoading,
      bool? isNumberExists,
      NotifyStatus? notifyStatus,
      bool isOtpSent,
      bool showOtpWidget});

  @override
  $LoginResponseModelCopyWith<$Res>? get loginResponse;
  @override
  $ForgotPasswordResponseModelCopyWith<$Res>? get sendOtpResponse;
  @override
  $ForgotPasswordResponseModelCopyWith<$Res>? get resetPasswordResponse;
  @override
  $LoginResponseModelCopyWith<$Res>? get validateLoginOtp;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginResponse = freezed,
    Object? sendOtpResponse = freezed,
    Object? resetPasswordResponse = freezed,
    Object? validateLoginOtp = freezed,
    Object? isLoading = null,
    Object? isNumberExists = freezed,
    Object? notifyStatus = freezed,
    Object? isOtpSent = null,
    Object? showOtpWidget = null,
  }) {
    return _then(_$AuthStateImpl(
      loginResponse: freezed == loginResponse
          ? _value.loginResponse
          : loginResponse // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
      sendOtpResponse: freezed == sendOtpResponse
          ? _value.sendOtpResponse
          : sendOtpResponse // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordResponseModel?,
      resetPasswordResponse: freezed == resetPasswordResponse
          ? _value.resetPasswordResponse
          : resetPasswordResponse // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordResponseModel?,
      validateLoginOtp: freezed == validateLoginOtp
          ? _value.validateLoginOtp
          : validateLoginOtp // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNumberExists: freezed == isNumberExists
          ? _value.isNumberExists
          : isNumberExists // ignore: cast_nullable_to_non_nullable
              as bool?,
      notifyStatus: freezed == notifyStatus
          ? _value.notifyStatus
          : notifyStatus // ignore: cast_nullable_to_non_nullable
              as NotifyStatus?,
      isOtpSent: null == isOtpSent
          ? _value.isOtpSent
          : isOtpSent // ignore: cast_nullable_to_non_nullable
              as bool,
      showOtpWidget: null == showOtpWidget
          ? _value.showOtpWidget
          : showOtpWidget // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {this.loginResponse,
      this.sendOtpResponse,
      this.resetPasswordResponse,
      this.validateLoginOtp,
      this.isLoading = false,
      this.isNumberExists,
      this.notifyStatus,
      this.isOtpSent = false,
      this.showOtpWidget = false});

  @override
  final LoginResponseModel? loginResponse;
  @override
  final ForgotPasswordResponseModel? sendOtpResponse;
  @override
  final ForgotPasswordResponseModel? resetPasswordResponse;
  @override
  final LoginResponseModel? validateLoginOtp;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final bool? isNumberExists;
  @override
  final NotifyStatus? notifyStatus;
  @override
  @JsonKey()
  final bool isOtpSent;
  @override
  @JsonKey()
  final bool showOtpWidget;

  @override
  String toString() {
    return 'AuthState(loginResponse: $loginResponse, sendOtpResponse: $sendOtpResponse, resetPasswordResponse: $resetPasswordResponse, validateLoginOtp: $validateLoginOtp, isLoading: $isLoading, isNumberExists: $isNumberExists, notifyStatus: $notifyStatus, isOtpSent: $isOtpSent, showOtpWidget: $showOtpWidget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.loginResponse, loginResponse) ||
                other.loginResponse == loginResponse) &&
            (identical(other.sendOtpResponse, sendOtpResponse) ||
                other.sendOtpResponse == sendOtpResponse) &&
            (identical(other.resetPasswordResponse, resetPasswordResponse) ||
                other.resetPasswordResponse == resetPasswordResponse) &&
            (identical(other.validateLoginOtp, validateLoginOtp) ||
                other.validateLoginOtp == validateLoginOtp) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isNumberExists, isNumberExists) ||
                other.isNumberExists == isNumberExists) &&
            (identical(other.notifyStatus, notifyStatus) ||
                other.notifyStatus == notifyStatus) &&
            (identical(other.isOtpSent, isOtpSent) ||
                other.isOtpSent == isOtpSent) &&
            (identical(other.showOtpWidget, showOtpWidget) ||
                other.showOtpWidget == showOtpWidget));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loginResponse,
      sendOtpResponse,
      resetPasswordResponse,
      validateLoginOtp,
      isLoading,
      isNumberExists,
      notifyStatus,
      isOtpSent,
      showOtpWidget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final LoginResponseModel? loginResponse,
      final ForgotPasswordResponseModel? sendOtpResponse,
      final ForgotPasswordResponseModel? resetPasswordResponse,
      final LoginResponseModel? validateLoginOtp,
      final bool isLoading,
      final bool? isNumberExists,
      final NotifyStatus? notifyStatus,
      final bool isOtpSent,
      final bool showOtpWidget}) = _$AuthStateImpl;

  @override
  LoginResponseModel? get loginResponse;
  @override
  ForgotPasswordResponseModel? get sendOtpResponse;
  @override
  ForgotPasswordResponseModel? get resetPasswordResponse;
  @override
  LoginResponseModel? get validateLoginOtp;
  @override
  bool get isLoading;
  @override
  bool? get isNumberExists;
  @override
  NotifyStatus? get notifyStatus;
  @override
  bool get isOtpSent;
  @override
  bool get showOtpWidget;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
