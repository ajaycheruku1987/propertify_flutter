import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/features/home/bloc/home_bloc.dart';
import 'package:propertify/features/home/presentation/home_screen.dart';
import 'package:propertify/utils/custom_toast.dart';

import '../../../utils/common_widgets/common_custom_button.dart';
import '../../../utils/common_widgets/common_textfield.dart';
import '../../../utils/device_info.dart';
import '../../../utils/screen_config.dart';
import '../bloc/auth_bloc.dart';
import 'widgets/phone_verification_form.dart';
import 'widgets/login_form.dart';
import 'widgets/registration_form.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String? verifiedPhoneNumber;

  @override
  void initState() {
    context.read<HomeBloc>().add(const HomeEvent.checkToken());
    context.read<AuthBloc>().add(const AuthEvent.clearAllAuth());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.notifyStatus != null) {
          CustomToast.showErrorToast(msg: state.notifyStatus?.message);
        }
      },
      builder: (context, state) {
        return BlurryModalProgressHUD(
          inAsyncCall: state.isLoading,
          child: Scaffold(
            backgroundColor: Colors.white,

            body: SafeArea(
              child: SingleChildScrollView(
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // Top Section with Background
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.go(HomeScreen.routeName);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              margin: const EdgeInsets.only(top: 16, right: 24),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          // Background SVG
                          Positioned.fill(
                            child: SvgPicture.asset(
                              'assets/images/auth_bg.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Content
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const SizedBox(height: 32),

                                  // Logo and Text
                                  Center(
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/logo.svg',
                                          height: 60,
                                          width: 60,
                                        ),
                                        const SizedBox(height: 16),
                                        const Text(
                                          'Welcome!',
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          _getWelcomeMessage(state),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            // color: Colors.white70,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Dynamic Form Content
                      Flexible(child: _buildFormContent(state)),
                      const SizedBox(height: 24),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Powered by',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SvgPicture.asset(
                            'assets/images/soho_logo.svg',
                            height: 32,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _getWelcomeMessage(AuthState state) {
    if (verifiedPhoneNumber == null) {
      return 'Enter your phone number to get started';
    } else if (state.isNumberExists != null && state.isNumberExists!) {
      return 'Welcome back! Please enter your password';
    } else {
      return 'Create your account to explore our app';
    }
  }

  Widget _buildFormContent(AuthState state) {
    if (verifiedPhoneNumber == null) {
      // Show phone verification form
      return PhoneVerificationForm(
        onPhoneVerified: (phoneNumber) {
          setState(() {
            verifiedPhoneNumber = phoneNumber;
          });
        },
      );
    } else if (state.isNumberExists != null && state.isNumberExists!) {
      // Show login form
      return LoginForm(
        phoneNumber: verifiedPhoneNumber!,
        onBackPressed: () {
          setState(() {
            verifiedPhoneNumber = null;
          });
          context.read<AuthBloc>().add(const AuthEvent.logout());
        },
      );
    } else {
      // Show registration form
      return RegistrationForm(
        phoneNumber: verifiedPhoneNumber!,
        onBackPressed: () {
          setState(() {
            verifiedPhoneNumber = null;
          });
          context.read<AuthBloc>().add(const AuthEvent.logout());
        },
      );
    }
  }
}
