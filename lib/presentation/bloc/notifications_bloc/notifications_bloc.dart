import 'package:bloc/bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/core/model/notifications_model.dart';
import 'package:icoc/core/repository/notifications_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

@singleton
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsRepository notificationsRepository;

  NotificationsBloc(this.notificationsRepository)
      : super(NotificationsInitial()) {
    on<NotificationsListRequested>(_onNotificationsListRequested);
    on<NotificationMarkAsReadRequested>(_onNotificationMarkAsReadRequested);
  }

  Future<void> _onNotificationsListRequested(
    NotificationsListRequested event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      emit(NotificationsLoadingState());
      final List<Map<String, NotificationsModel>> notifications =
          await notificationsRepository.getNotifications();
      final List<NotificationsModel> filteredNotifications =
          filterNotificationsByLang(event.locale, notifications);
      final List<NotificationsModel> markedNotifications =
          await checkAndMarkWhatIsRead(filteredNotifications);
      emit(GetNotificationsListSuccessState(markedNotifications));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(NotificationsErrorState(error.toString()));
    }
  }

  Future<void> _onNotificationMarkAsReadRequested(
    NotificationMarkAsReadRequested event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      final List<String> isRead =
          SharedPreferencesHelper.getList(StorageKeys.notifications) ?? [];
      isRead.add(event.title);
      SharedPreferencesHelper.saveList(StorageKeys.notifications, isRead);

      event.notifications.forEach((notification) {
        if (notification.title == event.title) {
          notification.isRead = true;
        }
      });
      emit(GetNotificationsListSuccessState(event.notifications));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(NotificationsErrorState(error.toString()));
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
  //if no notifications on the current language then show english notifications
  if (filteredNotifications.isEmpty) {
    final engNotification = notifications.firstWhere(
        (notificationMap) => notificationMap.keys.first == 'en',
        orElse: () => {});
    if (engNotification.isNotEmpty)
      filteredNotifications.add(engNotification['en']!);
  }
  return filteredNotifications;
}

Future<List<NotificationsModel>> checkAndMarkWhatIsRead(
    List<NotificationsModel> notifications) async {
  final List<String> isRead =
      SharedPreferencesHelper.getList(StorageKeys.notifications) ?? [];
  if (isRead.isNotEmpty) {
    notifications.forEach((notification) {
      if (isRead.contains(notification.title)) {
        notification.isRead = true;
      }
    });
  }
  return notifications;
}
