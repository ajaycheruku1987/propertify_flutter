import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/utils/custom_toast.dart';

import '../../../../utils/common_widgets/common_custom_button.dart';
import '../../../../utils/common_widgets/common_textfield.dart';
import '../../../home/presentation/home_screen.dart';
import '../../../home/bloc/home_bloc.dart';
import '../../bloc/auth_bloc.dart';
import 'otp_input_widget.dart';

class RegistrationForm extends StatefulWidget {
  final String phoneNumber;
  final VoidCallback onBackPressed;

  const RegistrationForm({
    super.key,
    required this.phoneNumber,
    required this.onBackPressed,
  });

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _phoneController.text = widget.phoneNumber;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // First call getOtp to send OTP
      context.read<AuthBloc>().add(
        AuthEvent.getOtp(phoneNumber: _phoneController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.notifyStatus != null) {
          if (state.loginResponse != null) {
            CustomToast.showSuccessToast(msg: 'Registration successful').then((
              value,
            ) {
              context.read<HomeBloc>().add(const HomeEvent.checkToken());
              context.go(HomeScreen.routeName);
            });
          } else {
            CustomToast.showErrorToast(msg: state.notifyStatus!.message);
          }
          if (state.isNumberExists == null) {
            widget.onBackPressed();
          }
        }
      },
      builder: (context, state) {
        // Show OTP widget if OTP was sent successfully
        if (state.showOtpWidget) {
          return OtpInputWidget(
            phoneNumber: _phoneController.text,
            name: _usernameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            onBackPressed: () {
              // Reset OTP state and go back to registration form
              context.read<AuthBloc>().add(
                const AuthEvent.clearShowOtpWidget(),
              );
            },
          );
        }

        // Show registration form
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Fill in your details to get started',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 32),

                // Phone Number Field with Change Option
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.phone_outlined, color: Colors.grey),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Phone Number',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.phoneNumber,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.onBackPressed,
                        child: Text(
                          'Change',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Username Field
                CommonTextFormField(
                  controller: _usernameController,
                  label: 'Username',
                  hintText: 'Enter your username',
                  prefixIcon: const Icon(Icons.person_outline),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    if (value.length < 3) {
                      return 'Username must be at least 3 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Email Field
                // CommonTextFormField(
                //   controller: _emailController,
                //   label: 'Email (Optional)',
                //   hintText: 'Enter your email',
                //   keyboardType: TextInputType.emailAddress,
                //   prefixIcon: const Icon(Icons.email_outlined),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter your email';
                //     }
                //     if (!RegExp(
                //       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                //     ).hasMatch(value)) {
                //       return 'Please enter a valid email';
                //     }
                //     return null;
                //   },
                // ),
                const SizedBox(height: 20),

                // Password Field
                CommonTextFormField(
                  controller: _passwordController,
                  label: 'Password',
                  hintText: 'Enter your password',
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
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: CommonCustomButton(
                    buttonLabel: 'Register',
                    onTap: state.isLoading ? () {} : _register,
                    isEnable: !state.isLoading,
                  ),
                ),

                const SizedBox(height: 24),

                // Terms and Privacy
                const Center(
                  child: Text(
                    'By creating an account, you agree to our\nTerms of Service and Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
