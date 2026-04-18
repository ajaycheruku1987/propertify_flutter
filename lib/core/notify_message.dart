enum NotifyType { success, error, info, warning }

class NotifyStatus {
  final String message;
  final NotifyType type;

  NotifyStatus({required this.message, this.type = NotifyType.info});
}
