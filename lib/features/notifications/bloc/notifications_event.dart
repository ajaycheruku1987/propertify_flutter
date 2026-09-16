import '../models/notification_model.dart';

abstract class NotificationsEvent {
  const NotificationsEvent();
}

class AddNotification extends NotificationsEvent {
  final NotificationModel notification;
  const AddNotification(this.notification);
}

class MarkAsRead extends NotificationsEvent {
  final String notificationId;
  const MarkAsRead(this.notificationId);
}

class MarkAllAsRead extends NotificationsEvent {
  const MarkAllAsRead();
}

class ClearNotifications extends NotificationsEvent {
  const ClearNotifications();
}
