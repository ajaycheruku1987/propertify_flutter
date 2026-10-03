import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewService {
  static const String _actionCountKey = 'user_happy_actions_count';
  static const String _reviewRequestedKey = 'review_requested_flag';
  
  final InAppReview _inAppReview = InAppReview.instance;
  final SharedPreferences _prefs;

  ReviewService(this._prefs);

  /// Call this when the user completes a happy path action (e.g., saving a property,
  /// contacting an agent, posting an ad, etc.)
  Future<void> recordHappyAction() async {
    final bool alreadyRequested = _prefs.getBool(_reviewRequestedKey) ?? false;
    if (alreadyRequested) return;

    int count = _prefs.getInt(_actionCountKey) ?? 0;
    count++;
    await _prefs.setInt(_actionCountKey, count);

    // Prompt after 3 successful happy path actions
    if (count >= 3) {
      await requestReview();
    }
  }

  Future<void> requestReview() async {
    try {
      if (await _inAppReview.isAvailable()) {
        await _inAppReview.requestReview();
        await _prefs.setBool(_reviewRequestedKey, true);
      }
    } catch (e) {
      // Fallback or ignore if review fails
    }
  }
}
