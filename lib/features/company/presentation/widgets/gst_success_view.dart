import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';

import '../../../home/presentation/home_screen.dart';

class GstSuccessView extends StatelessWidget {
  const GstSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // 24 Hours Circle Indicator
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF0E6FF), width: 8),
                  color: Colors.white,
                ),
                child: Center(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '24',
                          style: TextStyle(
                            color: Color(0xFF6C5CE7),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'hrs',
                          style: TextStyle(
                            color: Color(0xFF6C5CE7),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                'GST Details Submitted!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Complete verification to unlock\nproject creation features',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: CommonCustomButton(
                  onTap: () {
                    // Navigate to verification payment screen with skip option
                    // Get company ID from the CompanyBloc if available
                    context.push(
                      '/verification-payment?type=gst&showSkip=true',
                    );
                  },
                  buttonLabel: 'Verify GST Now',
                  buttonColor: const Color(0xFF6C5CE7),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  // Skip and go to home
                  context.go(HomeScreen.routeName);
                },
                child: Text(
                  'Skip for now',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
