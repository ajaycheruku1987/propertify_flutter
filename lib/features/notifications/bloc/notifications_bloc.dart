import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/notification_model.dart';

part 'notifications_bloc.freezed.dart';
part 'notifications_bloc.g.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends HydratedBloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(const NotificationsState()) {
    on<_AddNotification>((event, emit) {
      final updatedList = [event.notification, ...state.notifications];
      emit(state.copyWith(notifications: updatedList));
    });

    on<_MarkAsRead>((event, emit) {
      final updatedList = state.notifications.map((n) {
        if (n.id == event.notificationId) {
          return n.copyWith(isRead: true);
        }
        return n;
      }).toList();
      emit(state.copyWith(notifications: updatedList));
    });

    on<_MarkAllAsRead>((event, emit) {
      final updatedList = state.notifications.map((n) => n.copyWith(isRead: true)).toList();
      emit(state.copyWith(notifications: updatedList));
    });

    on<_ClearNotifications>((event, emit) {
      emit(state.copyWith(notifications: []));
    });
  }

  @override
  NotificationsState? fromJson(Map<String, dynamic> json) => NotificationsState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(NotificationsState state) => state.toJson();
}
