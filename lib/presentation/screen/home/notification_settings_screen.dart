import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/domain/model/notifications/notification_topic.dart';
import 'package:icoc/presentation/bloc/notification_settings/notification_settings_bloc.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/core/notifications/push_notification_service.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  late final NotificationSettingsBloc _bloc;
  final topics = const [
    NotificationTopic.songbook,
    NotificationTopic.insights,
    NotificationTopic.biblestudy,
  ];

  @override
  void initState() {
    super.initState();
    _bloc = NotificationSettingsBloc(getIt<PushNotificationService>())
      ..add(const NotificationSettingsEvent.loadRequested());
  }

  @override
  void dispose() {
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
                        enabled: topicStates[t.topic] ?? true,
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
    return SwitchListTile.adaptive(
      activeThumbColor: AdaptiveTheme.of(context).theme.focusColor,
      title: Text(
        topic.labelKey.tr(),
        style: AdaptiveTheme.of(context).theme.textTheme.bodyLarge,
      ),
      value: enabled,
      onChanged: (val) {
        context.read<NotificationSettingsBloc>().add(
              NotificationSettingsEvent.toggleRequested(
                topic: topic.topic,
                enabled: val,
              ),
            );
      },
      secondary: Icon(
        _iconForTopic(topic),
        color: AdaptiveTheme.of(context).theme.iconTheme.color,
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
    }
  }
}
