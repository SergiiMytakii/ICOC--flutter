import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/domain/model/notifications/notifications_model.dart';
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:icoc/core/routes/app_routes.dart';

class NotificationIcon extends StatelessWidget {
  NotificationIcon({super.key});

  int countUnreadNotifications(List<NotificationsModel> notifications) {
    return notifications
        .where((notification) => notification.isRead == false)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (notifications) {
            final int unreadNotificationsCount =
                countUnreadNotifications(notifications);

            return Stack(
              alignment: AlignmentDirectional.center,
              children: [
                if (unreadNotificationsCount > 0)
                  Positioned(
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
                  ),
                IconButton(
                  icon: const Icon(
                    Icons.messenger_outline,
                    color: Colors.white,
                    size: 36,
                  ),
                  onPressed: () => context.go('/$NOTIFICATIONS_SCREEN'),
                ),
              ],
            );
          },
          orElse: () => IconButton(
            icon: const Icon(
              Icons.messenger_outline,
              color: Colors.white,
              size: 36,
            ),
            onPressed: () => context.go('/$NOTIFICATIONS_SCREEN'),
          ),
        );
      },
    );
  }
}
