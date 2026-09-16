import '../models/notification_model.dart';

class NotificationsState {
  final List<NotificationModel> notifications;

  const NotificationsState({
    this.notifications = const [],
  });

  NotificationsState copyWith({
    List<NotificationModel>? notifications,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
    );
  }

  List<NotificationModel> get unreadNotifications =>
      notifications.where((n) => !n.isRead).toList();

  List<NotificationModel> get readNotifications =>
      notifications.where((n) => n.isRead).toList();

  Map<String, dynamic> toJson() {
    return {
      'notifications': notifications.map((n) => n.toJson()).toList(),
    };
  }

  factory NotificationsState.fromJson(Map<String, dynamic> json) {
    return NotificationsState(
      notifications: (json['notifications'] as List<dynamic>?)
              ?.map((n) => NotificationModel.fromJson(n as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
