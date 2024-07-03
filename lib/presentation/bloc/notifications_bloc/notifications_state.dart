part of 'notifications_bloc.dart';

@immutable
sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoadingState extends NotificationsState {}

final class GetNotificationsListSuccessState extends NotificationsState {
  final List<NotificationsModel> notifications;

  GetNotificationsListSuccessState(this.notifications);
}

final class NotificationsErrorState extends NotificationsState {
  final String message;

  NotificationsErrorState(this.message);
}
