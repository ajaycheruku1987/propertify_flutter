part of 'auth_bloc.dart';

@Freezed()
class AuthState with _$AuthState {
  const factory AuthState({
    LoginResponseModel? loginResponse,
    ForgotPasswordResponseModel? sendOtpResponse,
    ForgotPasswordResponseModel? resetPasswordResponse,
    LoginResponseModel? validateLoginOtp,
    @Default(false) bool isLoading,
    bool? isNumberExists,
    NotifyStatus? notifyStatus,
    @Default(false) bool isOtpSent,
    @Default(false) bool showOtpWidget,
  }) = _AuthState;
}
