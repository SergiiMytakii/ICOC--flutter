part of 'notification_settings_bloc.dart';

@freezed
class NotificationSettingsEvent with _$NotificationSettingsEvent {
  const factory NotificationSettingsEvent.loadRequested() =
      NotificationSettingsLoadRequested;

  const factory NotificationSettingsEvent.toggleRequested({
    required String topic,
    required bool enabled,
  }) = NotificationTopicToggleRequested;
}

