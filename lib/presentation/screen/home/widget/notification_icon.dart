import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/model/notifications_model.dart';
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:icoc/presentation/routes/app_routes.dart';

class NotificationIcon extends StatelessWidget {
  NotificationIcon({super.key});

  int countUnreadNotifications(List<NotificationsModel> notifications) {
    return notifications.where((element) => element.isRead == false).length;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        int unreadNotificationsCount = 0;
        if (state is GetNotificationsListSuccessState) {
          unreadNotificationsCount =
              countUnreadNotifications(state.notifications);
          if (unreadNotificationsCount > 0) {
            // FlutterAppBadger.updateBadgeCount(unreadNotificationsCount);
            // AppBadgePlus.updateBadge(unreadNotificationsCount);
          } else {
            // AppBadgePlus.updateBadge(0);
          }
        }
        return Stack(alignment: AlignmentDirectional.center, children: [
          state is GetNotificationsListSuccessState &&
                  unreadNotificationsCount > 0
              ? Positioned(
                  left: 13,
                  bottom: 20,
                  width: 26,
                  height: 20,
                  child: Container(
                    color: Colors.red,
                    child: FittedBox(
                      child: Text(unreadNotificationsCount.toString()),
                    ),
                  ),
                )
              : Container(),
          IconButton(
            icon: const Icon(
              Icons.messenger_outline,
              color: Colors.white,
              size: 36,
            ),
            onPressed: () => context.go('/$NOTIFICATIONS_SCREEN'),
          ),
        ]);
      },
    );
  }
}
