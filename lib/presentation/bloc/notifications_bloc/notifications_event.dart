part of 'notifications_bloc.dart';

@freezed
sealed class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.listRequested({
    required String locale,
  }) = NotificationsListRequested;

  const factory NotificationsEvent.markAsReadRequested({
    required String title,
    required List<NotificationsModel> notifications,
  }) = NotificationMarkAsReadRequested;
}
