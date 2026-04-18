import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/common_widgets/common_textfield.dart';
import '../../../../utils/common_widgets/common_custom_button.dart';
import '../../../../utils/common_widgets/custom_date_picker.dart';
import '../../../../utils/screen_config.dart';
import 'country_code_picker.dart';
import 'package:propertify/utils/custom_toast.dart';

class SignUpTab extends StatefulWidget {
  const SignUpTab({super.key});

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _selectedCountryCode = '+91';
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    birthDateController.dispose();
    _phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  DateTime? _parseDate(String dateString) {
    try {
      final parts = dateString.split('/');
      if (parts.length == 3) {
        final day = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final year = int.parse(parts[2]);
        return DateTime(year, month, day);
      }
    } catch (e) {
      // Return null if parsing fails
    }
    return null;
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
            // First Name and Last Name Row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFormField(
                        label: 'First Name',
                        controller: firstNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFormField(
                        label: 'Last Name',
                        controller: lastNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter last name';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Email
            CommonTextFormField(
              label: 'Email (Optional)',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                // if (value == null || value.isEmpty) {
                //   return 'Please enter email';
                // }
                if (value != null &&
                    !RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$',
                    ).hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Birth Date
            CustomDatePicker(
              label: 'Birth of date',
              hintText: 'Select your birth date',
              selectedDate: birthDateController.text.isNotEmpty
                  ? _parseDate(birthDateController.text)
                  : null,
              onDateSelected: (DateTime date) {
                birthDateController.text =
                    '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
              },
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              isRequired: true,
            ),
            const SizedBox(height: 20),

            // Phone Number
            Row(
              children: [
                Expanded(
                  child: CommonTextFormField(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        top: 1.0,
                        bottom: 1,
                        left: 1,
                        right: 12,
                      ),
                      child: CountryCodePicker(
                        initialCountryCode: _selectedCountryCode,
                        onCountryCodeChanged: (countryCode) {
                          setState(() {
                            _selectedCountryCode = countryCode;
                          });
                        },
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    label: 'Phone Number',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Password
            CommonTextFormField(
              label: 'Set Password',
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
                buttonColor: Theme.of(context).primaryColor,
                labelColor: Colors.white,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    // Handle registration
                    CustomToast.showInfoToast(
                      msg: 'Registration functionality to be implemented',
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
