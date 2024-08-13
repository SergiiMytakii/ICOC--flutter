import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:icoc/presentation/screen/home/widget/notification_card.dart';
import 'package:icoc/presentation/widget/animation_wrapper.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    FirebaseAnalytics.instance
        .logScreenView(screenName: 'Notifications screen');
    Future.delayed(const Duration(seconds: 4)).then((value) => _markAsRead());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'.tr()),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<NotificationsBloc, NotificationsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => Loading(),
              success: (notifications) => ListView.builder(
                cacheExtent: 0,
                itemCount: notifications.length,
                itemBuilder: (BuildContext context, index) {
                  return AnimationWrapper(
                    child: notifications[index].notifications.isNotEmpty
                        ? NotificationCard(
                            index: index,
                            notification: notifications[index],
                            onMarkAsRead: (String? id) => _markAsRead(id: id),
                          )
                        : const SizedBox.shrink(),
                  );
                },
              ),
              error: (message) => ErrorTextOnScreen(message: message),
            );
          },
        ),
      ),
    );
  }

  Future _markAsRead({String? id}) async {
    getIt<NotificationsBloc>().add(NotificationsEvent.markAsReadRequested(
      id: id,
    ));
  }
}
