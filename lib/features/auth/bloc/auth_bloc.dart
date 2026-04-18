import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propertify/core/api_request/api_request.dart';
import 'package:propertify/core/app_cache_service.dart';

import '../../../core/failure.dart';
import '../../../core/notify_message.dart';
import '../../../core/service_locator.dart';
import '../models/forgot_password_response_model.dart';
import '../models/login_response_model.dart';
import '../repo/auth_repo.dart';
import '../../../core/notification_service.dart';
part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo = AuthRepo();
  final AppCacheService _appCacheService = serviceLocator<AppCacheService>();
  final ApiRequest _apiRequest = serviceLocator<ApiRequest>();

  AuthBloc() : super(const AuthState()) {
    on<_LoginEvent>(_onLoginEvent);
    on<_LogoutEvent>(_onLogoutEvent);
    on<_IsLoading>(_onIsLoading);
    on<_SignupEvent>(_onSignupEvent);
    on<_VerifyPhoneNumberEvent>(_onVerifyPhoneNumberEvent);
    on<_GetOtpEvent>(_onGetOtpEvent);
    on<_ClearShowOtpWidgetEvent>(_onClearShowOtpWidgetEvent);
    on<_ClearAllAuthEvent>(_onClearAllAuthEvent);
    on<_SendForgotPasswordOtpEvent>(_onSendForgotPasswordOtpEvent);
    on<_ConfirmForgotPasswordEvent>(_onConfirmForgotPasswordEvent);
    on<_UpdateFcmTokenEvent>(_onUpdateFcmTokenEvent);
  }

  void _onUpdateFcmTokenEvent(
    _UpdateFcmTokenEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authRepo.updateFcmToken(fcmToken: event.fcmToken);
    } catch (e) {
      print("Error updating FCM token: $e");
    }
  }

  void _onClearAllAuthEvent(_ClearAllAuthEvent event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        showOtpWidget: false,
        isOtpSent: false,
        loginResponse: null,
        notifyStatus: null,
        isNumberExists: null,
      ),
    );
  }

  void _onClearShowOtpWidgetEvent(
    _ClearShowOtpWidgetEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(showOtpWidget: false, isOtpSent: false));
  }

  void _onLoginEvent(_LoginEvent event, Emitter<AuthState> emit) async {
    // Simulate a login process
    try {
      emit(state.copyWith(isLoading: true));

      // Get FCM Token before login
      final fcmToken = await NotificationService().getToken();

      Either<Failure, LoginResponseModel> loginResponseEither = await _authRepo
          .login(
            mobile: event.mobileNummber,
            password: event.password,
            fcmToken: fcmToken,
          );
      loginResponseEither.fold(
        (failure) {
          // Handle failure case
          emit(
            state.copyWith(
              loginResponse: null,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (response) async {
          _appCacheService.saveToken(response.accessToken!);
          if (response.role != null) {
            _appCacheService.saveRole(response.role!);
          }
          _apiRequest.updateAuthorization(accessToken: response.accessToken!);

          emit(state.copyWith(loginResponse: response));
        },
      );
    } catch (e) {
      print("The error in login is: $e");
      emit(
        state.copyWith(
          notifyStatus: NotifyStatus(message: 'Error during login'),
        ),
      );
    } finally {
      emit(state.copyWith(isLoading: false, notifyStatus: null));
    }
  }

  void _onSignupEvent(_SignupEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      // Get FCM Token before signup
      final fcmToken = await NotificationService().getToken();

      Either<Failure, LoginResponseModel> signupResponseEither = await _authRepo
          .signup(
            phoneNumber: event.mobileNumber,
            password: event.password,
            username: event.name,
            email: event.email,
            otp: event.otp,
            fcmToken: fcmToken,
          );

      signupResponseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              loginResponse: null,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (response) async {
          _appCacheService.saveToken(response.accessToken!);
          if (response.role != null) {
            _appCacheService.saveRole(response.role!);
          }
          _apiRequest.updateAuthorization(accessToken: response.accessToken!);

          emit(state.copyWith(loginResponse: response));
        },
      );
    } catch (e) {
      print("The error in signup is: $e");
      emit(
        state.copyWith(
          notifyStatus: NotifyStatus(message: 'Error during signup'),
        ),
      );
    } finally {
      emit(state.copyWith(isLoading: false, notifyStatus: null));
    }
  }

  void _onLogoutEvent(_LogoutEvent event, Emitter<AuthState> emit) async {
    // Clear all auth data
    await _appCacheService.clearAll();
    await _apiRequest.updateAuthorization(clearToken: true);
    emit(const AuthState());
  }

  void _onIsLoading(_IsLoading event, Emitter<AuthState> emit) {
    emit(state.copyWith(isLoading: event.flag));
  }

  void _onVerifyPhoneNumberEvent(
    _VerifyPhoneNumberEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      // For now, simulate API call to check if number exists
      // In real implementation, you would call an API endpoint
      Either<Failure, Map<String, dynamic>> verifyPhoneNumberEither =
          await _authRepo.verifyPhoneNumber(mobile: event.mobileNumber);

      verifyPhoneNumberEither.fold(
        (failure) {
          if (failure.message == 'Phone number already registered') {
            emit(state.copyWith(isNumberExists: true));
          } else {
            emit(
              state.copyWith(
                notifyStatus: NotifyStatus(message: failure.message),
              ),
            );
          }
        },
        (response) {
          bool isNumberExists =
              response['message'].toLowerCase() != 'phone number is available';
          emit(state.copyWith(isNumberExists: isNumberExists));
        },
      );

      // Mock logic: numbers starting with '9' exist, others don't

      // emit(
      //   state.copyWith(
      //     isNumberExists: numberExists,
      //     notifyStatus: NotifyStatus(
      //       message: numberExists
      //           ? 'Number found. Please enter your password.'
      //           : 'New number. Please complete registration.',
      //     ),
      //   ),
      // );
    } catch (e) {
      print("The error in verify phone number is: $e");
      emit(
        state.copyWith(
          notifyStatus: NotifyStatus(message: 'Error verifying phone number'),
        ),
      );
    } finally {
      emit(state.copyWith(isLoading: false, notifyStatus: null));
    }
  }

  void _onGetOtpEvent(_GetOtpEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      Either<Failure, Map<String, dynamic>> getOtpEither = await _authRepo
          .getOtp(phoneNumber: event.phoneNumber);

      getOtpEither.fold(
        (failure) {
          emit(
            state.copyWith(
              notifyStatus: NotifyStatus(message: failure.message),
              isOtpSent: false,
              showOtpWidget: false,
            ),
          );
          if (failure.message == 'Phone number already registered') {
            emit(state.copyWith(isNumberExists: null));
          }
        },
        (response) {
          emit(state.copyWith(isOtpSent: true, showOtpWidget: true));
        },
      );
    } catch (e) {
      print("The error in get OTP is: $e");
      emit(
        state.copyWith(
          notifyStatus: NotifyStatus(message: 'Error sending OTP'),
          isOtpSent: false,
          showOtpWidget: false,
        ),
      );
    } finally {
      emit(state.copyWith(isLoading: false, notifyStatus: null));
    }
  }

  void _onSendForgotPasswordOtpEvent(
    _SendForgotPasswordOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, notifyStatus: null));
      final result = await _authRepo.sendForgotPasswordOtp(
        phoneNumber: event.phoneNumber,
      );
      result.fold(
        (failure) => emit(
          state.copyWith(
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        ),
        (response) => emit(
          state.copyWith(
            isOtpSent: true,
            sendOtpResponse: const ForgotPasswordResponseModel(
              message: 'OTP sent successfully',
            ),
            notifyStatus: NotifyStatus(
              message: response['message'] ?? 'OTP sent successfully',
              type: NotifyType.success,
            ),
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          notifyStatus: NotifyStatus(
            message: 'Error sending OTP',
            type: NotifyType.error,
          ),
        ),
      );
    } finally {
      emit(state.copyWith(isLoading: false, notifyStatus: null));
    }
  }

  void _onConfirmForgotPasswordEvent(
    _ConfirmForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, notifyStatus: null));
      final result = await _authRepo.confirmForgotPassword(
        phoneNumber: event.phoneNumber,
        newPassword: event.newPassword,
        otp: event.otp,
      );
      result.fold(
        (failure) => emit(
          state.copyWith(
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        ),
        (response) => emit(
          state.copyWith(
            resetPasswordResponse: const ForgotPasswordResponseModel(
              message: 'Password reset successfully',
            ),
            notifyStatus: NotifyStatus(
              message: response['message'] ?? 'Password reset successfully',
              type: NotifyType.success,
            ),
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          notifyStatus: NotifyStatus(
            message: 'Error resetting password',
            type: NotifyType.error,
          ),
        ),
      );
    } finally {
      emit(state.copyWith(isLoading: false, notifyStatus: null));
    }
  }
}
