import 'package:bloc/bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/core/model/notifications/notifications_model.dart';
import 'package:icoc/core/repository/notifications_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';
part 'notifications_bloc.freezed.dart';

@singleton
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsRepository notificationsRepository;

  NotificationsBloc(this.notificationsRepository)
      : super(const NotificationsState.initial()) {
    on<NotificationsListRequested>(_onNotificationsListRequested);
    on<NotificationMarkAsReadRequested>(_onNotificationMarkAsReadRequested);
  }
  List<NotificationsModel> notifications = [];
  Future<void> _onNotificationsListRequested(
    NotificationsListRequested event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      emit(const NotificationsState.loading());
      final List<NotificationsModel> allNotifications =
          await notificationsRepository.getNotifications();
      final List<NotificationsModel> filteredNotifications =
          filterNotificationsByLang(
              event.locale, allNotifications.reversed.toList());
      notifications = await checkAndMarkWhatIsRead(filteredNotifications);
      emit(NotificationsState.success(notifications));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(NotificationsState.error(error.toString()));
    }
  }

  Future<void> _onNotificationMarkAsReadRequested(
    NotificationMarkAsReadRequested event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(const NotificationsState.loading());
    try {
      if (event.id != null) {
        final List<String> isRead =
            SharedPreferencesHelper.getList(StorageKeys.notifications) ?? [];
        isRead.add(event.id!);
        SharedPreferencesHelper.saveList(StorageKeys.notifications, isRead);

        notifications = notifications.map((notification) {
          if (notification.id == event.id) {
            notification.isRead = true;
          }
          return notification;
        }).toList();
      } else {
        //mark as read all notifications
        final isRead =
            notifications.map((notification) => notification.id).toList();
        SharedPreferencesHelper.saveList(StorageKeys.notifications, isRead);

        notifications = notifications.map((notification) {
          notification.isRead = true;

          return notification;
        }).toList();
      }
      emit(NotificationsState.success(notifications));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(NotificationsState.error(error.toString()));
    }
  }
}

List<NotificationsModel> filterNotificationsByLang(
    String locale, List<NotificationsModel> notifications) {
  //  notifications.forEach((notification)=> );

  final List<NotificationsModel> filteredNotifications = [];

  notifications.map((notif) {
    final engNotification = notif.notifications
        .where((notificationVersion) => notificationVersion.lang == 'en');

    notif.notifications.removeWhere((item) => item.lang != locale);
    //if no notifications on the current language exists then show english notifications
    if (notif.notifications.isEmpty && engNotification.isNotEmpty) {
      notif.notifications.add(engNotification.first);
    }
    filteredNotifications.add(notif);
  }).toList();

  return filteredNotifications;
}

Future<List<NotificationsModel>> checkAndMarkWhatIsRead(
    List<NotificationsModel> notifications) async {
  final List<String> isRead =
      SharedPreferencesHelper.getList(StorageKeys.notifications) ?? [];
  if (isRead.isNotEmpty) {
    return notifications.map((notification) {
      if (isRead.contains(notification.id)) {
        notification.isRead = true;
      }
      return notification;
    }).toList();
  }
  return notifications;
}
