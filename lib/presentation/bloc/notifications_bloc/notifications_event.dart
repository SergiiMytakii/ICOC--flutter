part of 'notifications_bloc.dart';

@immutable
sealed class NotificationsEvent {}

class NotificationsListRequested extends NotificationsEvent {
  final String locale;
  NotificationsListRequested(this.locale);
}

class NotificationMarkAsReadRequested extends NotificationsEvent {
  final String title;
  final List<NotificationsModel> notifications;
  NotificationMarkAsReadRequested(this.title, this.notifications);
}
