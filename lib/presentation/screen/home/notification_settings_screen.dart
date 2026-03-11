import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/domain/model/notifications/notification_topic.dart';
import 'package:icoc/presentation/bloc/notification_settings/notification_settings_bloc.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/core/notifications/push_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  static const Color _enabledTileBorder = Color(0xFF4CAF50);

  late final NotificationSettingsBloc _bloc;
  final topics = const [
    NotificationTopic.songbook,
    NotificationTopic.insights,
    NotificationTopic.biblestudy,
    NotificationTopic.video,
  ];
  bool _notificationsDenied = false;

  @override
  void initState() {
    super.initState();
    _bloc = NotificationSettingsBloc(getIt<PushNotificationService>())
      ..add(const NotificationSettingsEvent.loadRequested());
    _checkSystemNotificationsStatus();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'.tr()),
          centerTitle: true,
        ),
        body: BlocBuilder<NotificationSettingsBloc, NotificationSettingsState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (topicStates) => ListView(
                children: [
                  const SizedBox(height: 8),
                  if (_notificationsDenied)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Notifications are disabled at the system level.'
                                .tr(),
                            style: AdaptiveTheme.of(context)
                                .theme
                                .textTheme
                                .bodyLarge,
                          ),
                          const SizedBox(height: 8),
                          TextButton.icon(
                            onPressed: _openSystemSettings,
                            icon: const Icon(Icons.settings),
                            label: Text('Open Settings'.tr()),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'notification_choose_topics'.tr(),
                      style:
                          AdaptiveTheme.of(context).theme.textTheme.bodyLarge,
                    ),
                  ),
                  ...topics.map((t) => _buildToggle(
                        context: context,
                        topic: t,
                        enabled: _notificationsDenied
                            ? false
                            : (topicStates[t.topic] ?? true),
                      )),
                ],
              ),
              error: (m) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    m,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildToggle({
    required BuildContext context,
    required NotificationTopic topic,
    required bool enabled,
  }) {
    final theme = AdaptiveTheme.of(context).theme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: Icon(
          _iconForTopic(topic),
          color: theme.iconTheme.color,
        ),
        title: Text(
          topic.labelKey.tr(),
          style: theme.textTheme.bodyLarge,
        ),
        trailing: Switch.adaptive(
          value: enabled,
          activeTrackColor: _enabledTileBorder,
          inactiveTrackColor: Colors.grey.shade400,
          onChanged: (val) {
            if (_notificationsDenied && val) {
              _showEnableSystemDialog();
              return;
            }
            context.read<NotificationSettingsBloc>().add(
                  NotificationSettingsEvent.toggleRequested(
                    topic: topic.topic,
                    enabled: val,
                  ),
                );
          },
        ),
      ),
    );
  }

  IconData _iconForTopic(NotificationTopic t) {
    switch (t) {
      case NotificationTopic.songbook:
        return Icons.music_note;
      case NotificationTopic.insights:
        return Icons.article;
      case NotificationTopic.biblestudy:
        return Icons.import_contacts;
      case NotificationTopic.video:
        return Icons.play_circle_fill_rounded;
    }
  }

  Future<void> _checkSystemNotificationsStatus() async {
    final settings = await FirebaseMessaging.instance.getNotificationSettings();
    if (!mounted) {
      return;
    }
    setState(() {
      _notificationsDenied =
          settings.authorizationStatus == AuthorizationStatus.denied;
    });
  }

  Future<void> _openSystemSettings() async {
    final uri = Uri.parse('app-settings:');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showEnableSystemDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Enable Notifications'.tr()),
        content: Text(
            'Notifications are disabled in system settings. Please enable them to turn on topics here.'
                .tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Cancel'.tr()),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _openSystemSettings();
            },
            child: Text('Open Settings'.tr()),
          ),
        ],
      ),
    );
  }
}
