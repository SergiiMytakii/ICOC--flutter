part of 'notifications_bloc.dart';

@freezed
sealed class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.listRequested() = NotificationsListRequested;

  const factory NotificationsEvent.markAsReadRequested({
    String? id,
  }) = NotificationMarkAsReadRequested;
}
