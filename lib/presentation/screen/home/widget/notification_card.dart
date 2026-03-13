import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/domain/model/notifications/notifications_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationsModel notification;
  final int index;
  final Function(String?) onMarkAsRead;
  static final String _appHost = Uri.parse(ICOC_WEB_PAGE).host;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.index,
    required this.onMarkAsRead,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => onMarkAsRead(notification.id),
          contentPadding: const EdgeInsets.all(8),
          leading: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: CircleAvatar(
              backgroundColor: !notification.isRead
                  ? ScreenColors.songBook
                  : Colors.transparent,
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: !notification.isRead
                            ? ScreenColors.songBook
                            : Theme.of(context).primaryColor),
                  ),
                  child: const Center(child: Text('i'))),
            ),
          ),
          title: Text(
            notification.notifications.first.title,
            style: AdaptiveTheme.of(context)
                .theme
                .textTheme
                .bodyLarge!
                .copyWith(
                    color: getDividerColor(index)
                        .withValues(alpha: notification.isRead ? 0.7 : 1)),
          ),
          subtitle:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            notification.notifications.first.text.trim().startsWith('<')
                ? Html(data: notification.notifications.first.text)
                : Text(
                    notification.notifications.first.text,
                    style: AdaptiveTheme.of(context)
                        .theme
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                            color: AdaptiveTheme.of(context)
                                .theme
                                .colorScheme
                                .onSecondary
                                .withValues(
                                    alpha: notification.isRead ? 0.6 : 1)),
                  ),
            if (notification.notifications.first.link != null &&
                notification.notifications.first.link!.isNotEmpty)
              TextButton(
                  onPressed: () {
                    final link = notification.notifications.first.link!;
                    final uri = Uri.tryParse(link);
                    String? target;

                    if (uri != null &&
                        (uri.scheme == 'http' || uri.scheme == 'https')) {
                      // Treat app-domain URLs as internal routes.
                      final isAppHost = uri.host == _appHost;
                      if (isAppHost) {
                        target = uri.path.isEmpty ? '/' : uri.path;
                        if (uri.hasQuery) {
                          target = '$target?${uri.query}';
                        }
                      } else {
                        context.go('/$WEBVIEW_SCREEN', extra: link);
                        return;
                      }
                    } else {
                      target = link.startsWith('/') ? link : '/$link';
                    }

                    final segments = Uri.parse(target).pathSegments;
                    if (segments.isEmpty) {
                      context.go(target);
                      return;
                    }
                    if (segments.isNotEmpty) {
                      final first = segments.first;
                      final known = {
                        SONGBOOK,
                        Q_AND_ANSVERS,
                        VIDEO,
                        BIBLE_STUDY,
                        INSIGHTS,
                        NOTIFICATIONS_SCREEN,
                        SETTINGS,
                        SHARE_APP_SCREEN,
                        TERMS_OF_USE,
                        ABOUT_APP_SCREEN,
                      };
                      if (known.contains(first)) {
                        context.go(target);
                        return;
                      }
                    }
                    context.go('/$WEBVIEW_SCREEN', extra: link);
                  },
                  child: Text('Open'.tr(),
                      style: const TextStyle(color: Colors.blue)))
          ]),
          isThreeLine: true,
        ),
        Divider(
          indent: 50,
          color: getDividerColor(index),
          thickness: 1.2,
        ),
      ],
    );
  }
}
