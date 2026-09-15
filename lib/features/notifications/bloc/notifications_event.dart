part of 'notifications_bloc.dart';

@freezed
class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.addNotification(NotificationModel notification) = _AddNotification;
  const factory NotificationsEvent.markAsRead(String notificationId) = _MarkAsRead;
  const factory NotificationsEvent.markAllAsRead() = _MarkAllAsRead;
  const factory NotificationsEvent.clearNotifications() = _ClearNotifications;
}
