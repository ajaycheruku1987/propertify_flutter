part of 'auth_bloc.dart';

@Freezed()
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.logout() = _LogoutEvent;

  const factory AuthEvent.isLoading(bool flag) = _IsLoading;

  const factory AuthEvent.login({
    required String mobileNummber,
    required String password,
  }) = _LoginEvent;

  const factory AuthEvent.signup({
    required String name,
    String? email,
    required String mobileNumber,
    required String password,
    required String otp,
  }) = _SignupEvent;

  const factory AuthEvent.verifyPhoneNumber({required String mobileNumber}) =
      _VerifyPhoneNumberEvent;

  const factory AuthEvent.getOtp({required String phoneNumber}) = _GetOtpEvent;

  const factory AuthEvent.clearShowOtpWidget() = _ClearShowOtpWidgetEvent;

  const factory AuthEvent.clearAllAuth() = _ClearAllAuthEvent;

  const factory AuthEvent.sendForgotPasswordOtp({required String phoneNumber}) =
      _SendForgotPasswordOtpEvent;

  const factory AuthEvent.confirmForgotPassword({
    required String phoneNumber,
    required String newPassword,
    required String otp,
  }) = _ConfirmForgotPasswordEvent;

  const factory AuthEvent.updateFcmToken({required String fcmToken}) =
      _UpdateFcmTokenEvent;
}
