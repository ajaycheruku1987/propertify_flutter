import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/utils/custom_toast.dart';
import '../../../../utils/common_widgets/common_textfield.dart';
import '../../../../utils/common_widgets/common_custom_button.dart';
import '../../../../utils/screen_config.dart';
import '../../../home/presentation/home_screen.dart';
import 'social_login_buttons.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({super.key});

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email
            CommonTextFormField(
              label: 'Email',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$',
                ).hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Password
            CommonTextFormField(
              label: 'Password',
              controller: passwordController,
              obscureText: !isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Remember Me and Forgot Password
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value ?? false;
                    });
                  },
                  activeColor: const Color(0xFF7B68EE),
                ),
                const Text(
                  'Remember me',
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Handle forgot password
                    CustomToast.showInfoToast(
                      msg: 'Forgot password functionality to be implemented',
                    );
                  },
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Login Button
            SizedBox(
              width: double.infinity,
              child: CommonCustomButton(
                buttonLabel: 'Log In',
                buttonColor: Theme.of(context).primaryColor,
                labelColor: Colors.white,
                onTap: () {
                  context.push(HomeScreen.routeName);
                  if (formKey.currentState!.validate()) {
                    // Handle login
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
