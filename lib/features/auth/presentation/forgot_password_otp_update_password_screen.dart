import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/utils/custom_toast.dart';

import '../../../utils/common_widgets/common_custom_button.dart';
import '../../../utils/common_widgets/common_textfield.dart';
import '../bloc/auth_bloc.dart';

class ForgotPasswordOtpUpdatePasswordScreen extends StatefulWidget {
  static const String routeName = '/forgot-password-otp';
  final String phoneNumber;

  const ForgotPasswordOtpUpdatePasswordScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<ForgotPasswordOtpUpdatePasswordScreen> createState() =>
      _ForgotPasswordOtpUpdatePasswordScreenState();
}

class _ForgotPasswordOtpUpdatePasswordScreenState
    extends State<ForgotPasswordOtpUpdatePasswordScreen> {
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthEvent.confirmForgotPassword(
          phoneNumber: widget.phoneNumber,
          newPassword: _passwordController.text,
          otp: _otpController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.resetPasswordResponse != null) {
          CustomToast.showSuccessToast(msg: 'Password Reset Successful').then((
            value,
          ) {
            context.pop(); // Go back to login form
            context.read<AuthBloc>().add(const AuthEvent.clearAllAuth());
          });
        }
        if (state.notifyStatus != null && state.notifyStatus!.message != null) {
          // Toasts are handled in AuthBloc or elsewhere usually, but let's be safe
          // Actually, listener in main auth screen or here can handle it.
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => context.pop(),
            ),
            title: const Text(
              'Reset Password',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Update Password',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'An OTP has been sent to ${widget.phoneNumber}. Please enter it below along with your new password.',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 32),

                  // OTP Field
                  CommonTextFormField(
                    controller: _otpController,
                    label: 'OTP',
                    hintText: 'Enter 6-digit OTP',
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(Icons.pin_outlined),
                    maxLength: 6,
                    textInputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter OTP';
                      }
                      if (value.length != 6) {
                        return 'OTP must be exactly 6 digits';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // New Password Field
                  CommonTextFormField(
                    controller: _passwordController,
                    label: 'New Password',
                    hintText: 'Enter new password',
                    obscureText: !_isPasswordVisible,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter new password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Confirm Password Field
                  CommonTextFormField(
                    controller: _confirmPasswordController,
                    label: 'Confirm Password',
                    hintText: 'Confirm new password',
                    obscureText: !_isConfirmPasswordVisible,
                    prefixIcon: const Icon(Icons.lock_clock_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 48),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: CommonCustomButton(
                      buttonLabel: 'Reset Password',
                      onTap: state.isLoading ? () {} : _submit,
                      isEnable: !state.isLoading,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
