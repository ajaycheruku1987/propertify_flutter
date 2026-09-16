import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../models/notification_model.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

export 'notifications_event.dart';
export 'notifications_state.dart';

class NotificationsBloc extends HydratedBloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(const NotificationsState()) {
    on<AddNotification>((event, emit) {
      final updatedList = [event.notification, ...state.notifications];
      emit(state.copyWith(notifications: updatedList));
    });

    on<MarkAsRead>((event, emit) {
      final updatedList = state.notifications.map((n) {
        if (n.id == event.notificationId) {
          return n.copyWith(isRead: true);
        }
        return n;
      }).toList();
      emit(state.copyWith(notifications: updatedList));
    });

    on<MarkAllAsRead>((event, emit) {
      final updatedList = state.notifications.map((n) => n.copyWith(isRead: true)).toList();
      emit(state.copyWith(notifications: updatedList));
    });

    on<ClearNotifications>((event, emit) {
      emit(state.copyWith(notifications: []));
    });
  }

  @override
  NotificationsState? fromJson(Map<String, dynamic> json) => NotificationsState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(NotificationsState state) => state.toJson();
}
