import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

export 'notifications_event.dart';
export 'notifications_state.dart';

class NotificationsBloc extends HydratedBloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(const NotificationsState()) {
    on<AddNotification>((event, emit) {
      // The same push can arrive in the foreground and again when it is tapped.
      if (state.notifications.any((n) => n.id == event.notification.id)) return;
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

    on<MarkCommentsAsRead>((event, emit) {
      final updatedMap = Map<String, int>.from(state.readCommentCounts);
      updatedMap[event.id] = event.count;

      final updatedNotifications = state.notifications.map((n) {
        if (n.referenceId == event.id ||
            n.data?['post_id'] == event.id ||
            n.data?['reel_id'] == event.id) {
          return n.copyWith(isRead: true);
        }
        return n;
      }).toList();

      emit(state.copyWith(
        readCommentCounts: updatedMap,
        notifications: updatedNotifications,
      ));
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
