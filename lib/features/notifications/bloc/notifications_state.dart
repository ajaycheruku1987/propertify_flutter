import '../models/notification_model.dart';

class NotificationsState {
  final List<NotificationModel> notifications;
  final Map<String, int>? _readCommentCounts;

  const NotificationsState({
    this.notifications = const [],
    Map<String, int>? readCommentCounts,
  }) : _readCommentCounts = readCommentCounts;

  Map<String, int> get readCommentCounts => _readCommentCounts ?? const {};

  NotificationsState copyWith({
    List<NotificationModel>? notifications,
    Map<String, int>? readCommentCounts,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      readCommentCounts: readCommentCounts ?? this.readCommentCounts,
    );
  }

  List<NotificationModel> get unreadNotifications =>
      notifications.where((n) => !n.isRead).toList();

  List<NotificationModel> get readNotifications =>
      notifications.where((n) => n.isRead).toList();

  Map<String, dynamic> toJson() {
    return {
      'notifications': notifications.map((n) => n.toJson()).toList(),
      'readCommentCounts': readCommentCounts,
    };
  }

  factory NotificationsState.fromJson(Map<String, dynamic> json) {
    Map<String, int> readCounts = {};
    if (json['readCommentCounts'] is Map) {
      (json['readCommentCounts'] as Map).forEach((key, value) {
        if (value is num) {
          readCounts[key.toString()] = value.toInt();
        }
      });
    }
    return NotificationsState(
      notifications: (json['notifications'] as List<dynamic>?)
              ?.map((n) => NotificationModel.fromJson(n as Map<String, dynamic>))
              .toList() ??
          [],
      readCommentCounts: readCounts,
    );
  }
}
