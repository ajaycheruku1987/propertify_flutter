import 'package:flutter/material.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Or login with',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _SocialButton(
              icon: Icons.g_mobiledata,
              label: 'Google',
              onTap: () => _handleGoogleLogin(context),
            ),
            _SocialButton(
              icon: Icons.facebook,
              label: 'Facebook',
              onTap: () => _handleFacebookLogin(context),
            ),
            _SocialButton(
              icon: Icons.apple,
              label: 'Apple',
              onTap: () => _handleAppleLogin(context),
            ),
            _SocialButton(
              icon: Icons.phone,
              label: 'Phone',
              onTap: () => _handlePhoneLogin(context),
            ),
          ],
        ),
      ],
    );
  }

  void _handleGoogleLogin(BuildContext context) {
    // TODO: Implement Google login
    CustomToast.showInfoToast(
      msg: 'Google login not implemented yet',
    );
  }

  void _handleFacebookLogin(BuildContext context) {
    // TODO: Implement Facebook login
    CustomToast.showInfoToast(
      msg: 'Facebook login not implemented yet',
    );
  }

  void _handleAppleLogin(BuildContext context) {
    // TODO: Implement Apple login
    CustomToast.showInfoToast(
      msg: 'Apple login not implemented yet',
    );
  }

  void _handlePhoneLogin(BuildContext context) {
    // TODO: Implement Phone login
    CustomToast.showInfoToast(
      msg: 'Phone login not implemented yet',
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SocialButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: _getIconColor(),
            ),
          ],
        ),
      ),
    );
  }

  Color _getIconColor() {
    switch (icon) {
      case Icons.g_mobiledata:
        return const Color(0xFF4285F4);
      case Icons.facebook:
        return const Color(0xFF1877F2);
      case Icons.apple:
        return Colors.black;
      case Icons.phone:
        return const Color(0xFF7B68EE);
      default:
        return Colors.grey;
    }
  }
}