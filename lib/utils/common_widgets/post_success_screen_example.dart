import 'package:flutter/material.dart';
import 'package:propertify/utils/common_widgets/post_success_screen.dart';

/// Example usage of PostSuccessScreen for different content types
///
/// This file demonstrates how to navigate to the success screen after creating:
/// - Feed posts
/// - Reels
/// - Sales/Products
/// - Expert services

class PostSuccessScreenExamples {
  /// Navigate to success screen after creating a feed post
  static void showFeedPostSuccess(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PostSuccessScreen(
          title: 'Posted Successfully!',
          message:
              'Your Post has been created Successfully\nwould You Like to boost Your Post',
          onBoostNow: () {
            // Navigate to boost/promotion screen for posts
            Navigator.pop(context);
            // TODO: Navigate to boost screen
            // Navigator.push(context, MaterialPageRoute(builder: (context) => BoostPostScreen()));
          },
          onSkip: () {
            // Navigate back to home or feed
            Navigator.pop(context);
            // Or use: Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
    );
  }

  /// Navigate to success screen after creating a reel
  static void showReelSuccess(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PostSuccessScreen(
          title: 'Reel Posted Successfully!',
          message:
              'Your Reel has been created Successfully\nwould You Like to boost Your Reel',
          boostButtonText: 'Boost Now',
          skipButtonText: 'Skip & Continue',
          onBoostNow: () {
            // Navigate to boost/promotion screen for reels
            Navigator.pop(context);
            // TODO: Navigate to boost screen
            // Navigator.push(context, MaterialPageRoute(builder: (context) => BoostReelScreen()));
          },
          onSkip: () {
            // Navigate back to home or reels feed
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  /// Navigate to success screen after creating a sale/product listing
  static void showSaleSuccess(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PostSuccessScreen(
          title: 'Listed Successfully!',
          message:
              'Your Product has been listed Successfully\nwould You Like to boost Your Listing',
          boostButtonText: 'Boost Now',
          skipButtonText: 'Skip & Continue',
          onBoostNow: () {
            // Navigate to boost/promotion screen for products
            Navigator.pop(context);
            // TODO: Navigate to boost screen
            // Navigator.push(context, MaterialPageRoute(builder: (context) => BoostProductScreen()));
          },
          onSkip: () {
            // Navigate back to home or sales catalog
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  /// Navigate to success screen after creating an expert service
  static void showExpertServiceSuccess(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PostSuccessScreen(
          title: 'Service Created Successfully!',
          message:
              'Your Service has been created Successfully\nwould You Like to boost Your Service',
          boostButtonText: 'Boost Now',
          skipButtonText: 'Skip & Continue',
          onBoostNow: () {
            // Navigate to boost/promotion screen for services
            Navigator.pop(context);
            // TODO: Navigate to boost screen
            // Navigator.push(context, MaterialPageRoute(builder: (context) => BoostServiceScreen()));
          },
          onSkip: () {
            // Navigate back to home or services listing
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  /// Generic success screen that can be used for any content type
  static void showGenericSuccess(
    BuildContext context, {
    required String contentType, // 'Post', 'Reel', 'Product', 'Service'
    VoidCallback? onBoost,
    VoidCallback? onSkip,
  }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PostSuccessScreen(
          title: '$contentType Created Successfully!',
          message:
              'Your $contentType has been created Successfully\nwould You Like to boost Your $contentType',
          onBoostNow: onBoost ?? () => Navigator.pop(context),
          onSkip: onSkip ?? () => Navigator.pop(context),
        ),
      ),
    );
  }
}

/// Example: How to use in your BLoC listeners or after API success
/// 
/// ```dart
/// // In your create post/reel/sale/expert screen:
/// 
/// BlocListener<PostBloc, PostState>(
///   listener: (context, state) {
///     if (state is PostCreatedSuccess) {
///       PostSuccessScreenExamples.showFeedPostSuccess(context);
///     }
///   },
///   child: ...
/// )
/// 
/// // Or after direct API call:
/// final response = await createPost(...);
/// if (response.success) {
///   PostSuccessScreenExamples.showFeedPostSuccess(context);
/// }
/// ```
