import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:icoc/core/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:icoc/core/model/notifications_model.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';

import '../../../constants.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
  }

// placeholders

  bool checkIsRead(String text) {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'.tr()),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<NotificationsBloc, NotificationsState>(
          builder: (context, state) {
            if (state is GetNotificationsListSuccessState) {
              return ListView.builder(
                  itemCount: state.notifications.length,
                  itemBuilder: (BuildContext context, index) {
                    if (i < 4) {
                      i++;
                    } else {
                      i = 0;
                    }
                    Future.delayed(Duration(seconds: 10)).then((value) =>
                        _markAsRead(state.notifications[index].title,
                            state.notifications));

                    return Column(
                      children: [
                        ListTile(
                          onTap: () => _markAsRead(
                              state.notifications[index].title,
                              state.notifications),
                          contentPadding: EdgeInsets.all(8),
                          leading: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            child: CircleAvatar(
                              backgroundColor:
                                  !state.notifications[index].isRead
                                      ? ScreenColors.songBook
                                      : Colors.transparent,
                              child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: !state
                                                .notifications[index].isRead
                                            ? ScreenColors.songBook
                                            : Theme.of(context).primaryColor),
                                  ),
                                  child: Center(child: Text('i'))),
                            ),
                          ),
                          title: Text(state.notifications[index].title),
                          subtitle: state.notifications[index].text
                                  .trim()
                                  .startsWith('<')
                              ? Html(data: state.notifications[index].text)
                              : Text(
                                  state.notifications[index].text,
                                ),
                        ),
                        Divider(
                          indent: 50,
                          color: dividerColors[i],
                          thickness: 1.2,
                        ),
                      ],
                    );
                  });
            } else if (state is NotificationsLoadingState) {
              return Loading();
            } else if (state is NotificationsErrorState) {
              return ErrorTextOnScreen(message: state.message);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  _markAsRead(String title, List<NotificationsModel> notifications) async {
    context
        .read<NotificationsBloc>()
        .add(NotificationMarkAsReadRequested(title, notifications));
  }
}
