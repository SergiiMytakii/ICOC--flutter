import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/model/notifications/notifications_model.dart';
import 'package:icoc/domain/repository/notifications_repository.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/main.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icoc/core/errors/failures.dart';

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
    emit(const NotificationsState.loading());
    final Either<Failure, List<NotificationsModel>> result =
        await notificationsRepository.getNotifications();
    return result.fold(
      (failure) =>
          emit(NotificationsState.error(failure.toUserFriendlyMessage())),
      (allNotifications) {
        final List<NotificationsModel> filteredNotifications =
            filterNotificationsByLang(allNotifications.reversed.toList());
        checkAndMarkWhatIsRead(filteredNotifications)
            .then((markedNotifications) {
          notifications = markedNotifications;
          emit(NotificationsState.success(notifications));
        });
      },
    );
  }

  Future<void> _onNotificationMarkAsReadRequested(
    NotificationMarkAsReadRequested event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(const NotificationsState.loading());
    try {
      if (event.id != null) {
        final List<String> isRead =
            await getIt<LocalCache>().getList(StorageKeys.notifications) ?? [];
        isRead.add(event.id!);
        getIt<LocalCache>().saveList(StorageKeys.notifications, isRead);

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
        getIt<LocalCache>().saveList(StorageKeys.notifications, isRead);

        notifications = notifications.map((notification) {
          notification.isRead = true;

          return notification;
        }).toList();
      }
      emit(NotificationsState.success(notifications));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(NotificationsState.error(
          const Failure.unknown().toUserFriendlyMessage()));
    }
  }
}

List<NotificationsModel> filterNotificationsByLang(
    List<NotificationsModel> notifications) {
  final List<NotificationsModel> filteredNotifications = [];

  notifications.forEach((notif) {
    final engNotification = notif.notifications
        .where((notificationVersion) => notificationVersion.lang == 'en');

    notif.notifications.removeWhere((item) => item.lang != locale);
    //if no notifications on the current language exists then show english notifications
    if (notif.notifications.isEmpty && engNotification.isNotEmpty) {
      notif.notifications.add(engNotification.first);
    }
    if (notif.notifications.isNotEmpty) {
      filteredNotifications.add(notif);
    }
  });

  return filteredNotifications;
}

Future<List<NotificationsModel>> checkAndMarkWhatIsRead(
    List<NotificationsModel> notifications) async {
  final List<String> isRead =
      await getIt<LocalCache>().getList(StorageKeys.notifications) ?? [];
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
