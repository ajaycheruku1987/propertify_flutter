import 'package:flutter/material.dart';
import 'package:propertify/core/app_theme.dart';
import 'package:propertify/core/content_type.dart';

/// A reusable success screen shown after creating posts, reels, sales, or experts
///
/// Usage:
/// ```dart
/// Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (context) => PostSuccessScreen(
///       title: 'Posted Successfully!',
///       message: 'Your Post has been created Successfully\nwould You Like to boost Your Post',
///       onBoostNow: () {
///         // Navigate to boost screen
///       },
///       onSkip: () {
///         // Navigate back or to home
///       },
///     ),
///   ),
/// );
/// ```
class PostSuccessScreen extends StatefulWidget {
  static const String routeName = '/post-success-screen';

  final String? title;
  final String? message;
  final String boostButtonText;
  final String skipButtonText;
  final VoidCallback onBoostNow;
  final VoidCallback onSkip;
  final ContentType contentType;

  const PostSuccessScreen({
    super.key,
    this.title,
    this.message,
    this.boostButtonText = 'Boost Now',
    this.skipButtonText = 'Skip & Continue',
    required this.onBoostNow,
    required this.onSkip,
    this.contentType = ContentType.FEED,
  });

  @override
  State<PostSuccessScreen> createState() => _PostSuccessScreenState();
}

class _PostSuccessScreenState extends State<PostSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [
                    const Color(0xFF1E1B29),
                    const Color(0xFF121212),
                    const Color(0xFF1A1625),
                  ]
                : [
                    const Color(0xFFF0E6FF),
                    Colors.white,
                    const Color(0xFFF5F0FF),
                  ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Status bar simulation (optional, can be removed if not needed)

              // Main content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),

                    // Success animation
                    _buildSuccessAnimation(primaryColor, isDark),

                    const SizedBox(height: 32),

                    // Title
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        widget.title ??
                            '${widget.contentType.displayName} Created Successfully!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Message
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          widget.message ??
                              'Your ${widget.contentType.displayName} has been created successfully.\nWould you like to boost your ${widget.contentType.displayName}?',
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark
                                ? const Color(0xFF9CA3AF)
                                : const Color(0xFF6B7280),
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Buttons
                    _buildButtons(primaryColor, isDark),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessAnimation(Color primaryColor, bool isDark) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Outer pulsing ring
            Container(
              width: 192,
              height: 192,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor.withOpacity(isDark ? 0.2 : 0.1),
              ),
            ),

            // Middle ring
            Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark
                    ? primaryColor.withOpacity(0.3)
                    : AppTheme.introductionCardLightThemeColor,
              ),
            ),

            // Checkmark with scale animation
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark
                      ? primaryColor.withOpacity(0.15)
                      : Colors.transparent,
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 84,
                  color: isDark
                      ? AppTheme.introductionCardLightThemeColor
                      : primaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildButtons(Color primaryColor, bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Boost Now button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.onBoostNow,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                shadowColor: primaryColor.withOpacity(0.3),
              ),
              child: Text(
                widget.boostButtonText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Skip & Continue button
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: widget.onSkip,
              style: TextButton.styleFrom(
                foregroundColor: isDark
                    ? const Color(0xFF9CA3AF)
                    : const Color(0xFF6B7280),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                widget.skipButtonText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Bottom indicator
          Container(
            width: 128,
            height: 6,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF4B5563) : const Color(0xFFD1D5DB),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    );
  }
}
