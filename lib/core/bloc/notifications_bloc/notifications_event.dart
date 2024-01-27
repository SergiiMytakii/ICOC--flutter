part of 'notifications_bloc.dart';

@immutable
sealed class NotificationsEvent {
  Stream<NotificationsState> applyAsync(
      {NotificationsState currentState, NotificationsBloc bloc});
}

class NotificationsListRequested extends NotificationsEvent {
  final String locale;
  NotificationsListRequested(this.locale);

  final NotificationsRepositoryImpl notificationsRepositoryImpl =
      NotificationsRepositoryImpl();

  @override
  Stream<NotificationsState> applyAsync(
      {NotificationsState? currentState, NotificationsBloc? bloc}) async* {
    try {
      yield NotificationsLoadingState();
      final List<Map<String, NotificationsModel>> notifications =
          await notificationsRepositoryImpl.getNotifications();
      final List<NotificationsModel> filteredNotifications =
          filterNotificationsByLang(locale, notifications);
      final List<NotificationsModel> markedNotifications =
          await checkAndMarkWhatIsRead(filteredNotifications);
      yield GetNotificationsListSuccessState(markedNotifications);
    } catch (_, stackTrace) {
      logError(_, stackTrace);
      yield NotificationsErrorState(_.toString());
    }
  }
}

class NotificationMarkAsReadRequested extends NotificationsEvent {
  final String title;
  final List<NotificationsModel> notifications;
  NotificationMarkAsReadRequested(this.title, this.notifications);

  @override
  Stream<NotificationsState> applyAsync(
      {NotificationsState? currentState, NotificationsBloc? bloc}) async* {
    try {
      final List<String> isRead =
          await SharedPreferencesHelper.getList(StorageKeys.notifications) ??
              [];
      isRead.add(title);
      SharedPreferencesHelper.saveList(StorageKeys.notifications, isRead);

      notifications.forEach((notification) {
        if (notification.title == title) {
          notification.isRead = true;
        }
      });
      yield GetNotificationsListSuccessState(notifications);
    } catch (_, stackTrace) {
      logError(_, stackTrace);
      yield NotificationsErrorState(_.toString());
    }
  }
}

List<NotificationsModel> filterNotificationsByLang(
    String locale, List<Map<String, NotificationsModel>> notifications) {
  final List<NotificationsModel> filteredNotifications = [];
  notifications.map((notificationMap) {
    if (notificationMap.keys.first == locale) {
      filteredNotifications.add(notificationMap.values.first);
    }
  }).toList();
  return filteredNotifications;
}

Future<List<NotificationsModel>> checkAndMarkWhatIsRead(
    List<NotificationsModel> notifications) async {
  final List<String> isRead =
      await SharedPreferencesHelper.getList(StorageKeys.notifications) ?? [];
  if (isRead.isNotEmpty) {
    notifications.forEach((notification) {
      if (isRead.contains(notification.title)) {
        notification.isRead = true;
      }
    });
  }
  return notifications;
}
