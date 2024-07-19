import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:icoc/core/model/notifications_model.dart';
import 'package:icoc/presentation/widget/animation_wrapper.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';

import 'package:icoc/constants.dart';

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
                  Future.delayed(const Duration(seconds: 6)).then((value) =>
                      _markAsRead(notifications[index].title, notifications));

                  return AnimationWrapper(
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () => _markAsRead(
                              notifications[index].title, notifications),
                          contentPadding: const EdgeInsets.all(8),
                          leading: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            child: CircleAvatar(
                              backgroundColor: !notifications[index].isRead
                                  ? ScreenColors.songBook
                                  : Colors.transparent,
                              child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: !notifications[index].isRead
                                            ? ScreenColors.songBook
                                            : Theme.of(context).primaryColor),
                                  ),
                                  child: const Center(child: Text('i'))),
                            ),
                          ),
                          title: Text(
                            notifications[index].title,
                            style: AdaptiveTheme.of(context)
                                .theme
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: getDividerColor(index).withOpacity(
                                        notifications[index].isRead ? 0.7 : 1)),
                          ),
                          subtitle:
                              notifications[index].text.trim().startsWith('<')
                                  ? Html(data: notifications[index].text)
                                  : Text(
                                      notifications[index].text,
                                    ),
                        ),
                        Divider(
                          indent: 50,
                          color: getDividerColor(index),
                          thickness: 1.2,
                        ),
                      ],
                    ),
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

  Future _markAsRead(
      String title, List<NotificationsModel> notifications) async {
    if (mounted) {
      getIt<NotificationsBloc>().add(NotificationsEvent.markAsReadRequested(
          title: title, notifications: notifications));
    }
  }
}
