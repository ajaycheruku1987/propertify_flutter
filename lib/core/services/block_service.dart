import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../service_locator.dart';

class BlockService {
  final SharedPreferences _prefs;

  static const String _blockedUsersKey = 'blocked_user_ids';
  static const String _blockedUsersDetailsKey = 'blocked_user_details';
  static const String _blockedPostsKey = 'blocked_post_ids';

  BlockService([SharedPreferences? prefs])
      : _prefs = prefs ?? serviceLocator<SharedPreferences>();

  /// Check if a user is blocked
  bool isUserBlocked(String? userId) {
    if (userId == null || userId.isEmpty) return false;
    final blockedUsers = getBlockedUserIds();
    return blockedUsers.contains(userId);
  }

  /// Get list of blocked user IDs
  List<String> getBlockedUserIds() {
    return _prefs.getStringList(_blockedUsersKey) ?? [];
  }

  /// Get map of blocked user details {userId: userName}
  Map<String, String> getBlockedUsersMap() {
    final rawJson = _prefs.getString(_blockedUsersDetailsKey);
    if (rawJson == null || rawJson.isEmpty) return {};
    try {
      final decoded = jsonDecode(rawJson) as Map<String, dynamic>;
      return decoded.map((key, value) => MapEntry(key, value.toString()));
    } catch (_) {
      return {};
    }
  }

  /// Block a user
  Future<bool> blockUser({
    required String userId,
    String? userName,
  }) async {
    if (userId.isEmpty) return false;

    final blockedUsers = getBlockedUserIds();
    if (!blockedUsers.contains(userId)) {
      blockedUsers.add(userId);
      await _prefs.setStringList(_blockedUsersKey, blockedUsers);
    }

    final details = getBlockedUsersMap();
    details[userId] = userName ?? 'Blocked User';
    await _prefs.setString(_blockedUsersDetailsKey, jsonEncode(details));

    return true;
  }

  /// Unblock a user
  Future<bool> unblockUser(String userId) async {
    if (userId.isEmpty) return false;

    final blockedUsers = getBlockedUserIds();
    if (blockedUsers.contains(userId)) {
      blockedUsers.remove(userId);
      await _prefs.setStringList(_blockedUsersKey, blockedUsers);
    }

    final details = getBlockedUsersMap();
    details.remove(userId);
    await _prefs.setString(_blockedUsersDetailsKey, jsonEncode(details));

    return true;
  }

  /// Check if a post is blocked/hidden
  bool isPostBlocked(String? postId) {
    if (postId == null || postId.isEmpty) return false;
    final blockedPosts = getBlockedPostIds();
    return blockedPosts.contains(postId);
  }

  /// Get list of blocked post IDs
  List<String> getBlockedPostIds() {
    return _prefs.getStringList(_blockedPostsKey) ?? [];
  }

  /// Block/Hide a post
  Future<bool> blockPost(String postId) async {
    if (postId.isEmpty) return false;

    final blockedPosts = getBlockedPostIds();
    if (!blockedPosts.contains(postId)) {
      blockedPosts.add(postId);
      await _prefs.setStringList(_blockedPostsKey, blockedPosts);
    }
    return true;
  }

  /// Unblock/Unhide a post
  Future<bool> unblockPost(String postId) async {
    if (postId.isEmpty) return false;

    final blockedPosts = getBlockedPostIds();
    if (blockedPosts.contains(postId)) {
      blockedPosts.remove(postId);
      await _prefs.setStringList(_blockedPostsKey, blockedPosts);
    }
    return true;
  }
}
