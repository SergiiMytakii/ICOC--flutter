part of 'notifications_bloc.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = NotificationsInitial;
  const factory NotificationsState.loading() = NotificationsLoadingState;
  const factory NotificationsState.success(
          List<NotificationsModel> notifications) =
      GetNotificationsListSuccessState;
  const factory NotificationsState.error(String message) =
      NotificationsErrorState;
}
