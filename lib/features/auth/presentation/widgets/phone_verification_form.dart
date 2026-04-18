import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/features/auth/presentation/widgets/country_code_picker.dart';

import '../../../../utils/common_widgets/common_custom_button.dart';
import '../../../../utils/common_widgets/common_textfield.dart';
import '../../bloc/auth_bloc.dart';

class PhoneVerificationForm extends StatefulWidget {
  final Function(String) onPhoneVerified;

  const PhoneVerificationForm({super.key, required this.onPhoneVerified});

  @override
  State<PhoneVerificationForm> createState() => _PhoneVerificationFormState();
}

class _PhoneVerificationFormState extends State<PhoneVerificationForm> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedCountryCode = '+91'; // Default to India

  final List<Map<String, String>> _countryCodes = [
    {'code': '+91', 'country': 'IN', 'name': 'India'},
    {'code': '+1', 'country': 'US', 'name': 'United States'},
    {'code': '+44', 'country': 'GB', 'name': 'United Kingdom'},
    {'code': '+971', 'country': 'AE', 'name': 'UAE'},
    {'code': '+966', 'country': 'SA', 'name': 'Saudi Arabia'},
    {'code': '+65', 'country': 'SG', 'name': 'Singapore'},
    {'code': '+60', 'country': 'MY', 'name': 'Malaysia'},
  ];

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _verifyPhoneNumber() {
    if (_formKey.currentState!.validate()) {
      final phoneNumber = _selectedCountryCode + _phoneController.text.trim();
      context.read<AuthBloc>().add(
        AuthEvent.verifyPhoneNumber(mobileNumber: phoneNumber),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isNumberExists != null) {
          widget.onPhoneVerified(
            _selectedCountryCode + _phoneController.text.trim(),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter Phone Number',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'We\'ll send you a verification code',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 32),

                // Phone Number Field with Country Code
                Row(
                  children: [
                    Expanded(
                      child: CommonTextFormField(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                            left: 1,
                            bottom: 1,
                            top: 1,
                          ),
                          child: CountryCodePicker(
                            initialCountryCode: _selectedCountryCode,
                            onCountryCodeChanged: (code) {
                              setState(() {
                                _selectedCountryCode = code;
                              });
                            },
                          ),
                        ),
                        controller: _phoneController,

                        hintText: 'Enter phone number',
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        textInputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (value.length < 10) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: CommonCustomButton(
                    buttonLabel: 'Continue',
                    onTap: state.isLoading ? () {} : _verifyPhoneNumber,
                    isEnable: !state.isLoading,
                  ),
                ),

                const Spacer(),

                // Terms and Privacy
                const Center(
                  child: Text(
                    'By continuing, you agree to our Terms of Service\nand Privacy Policy',
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
