part of 'notification_settings_bloc.dart';

@freezed
class NotificationSettingsState with _$NotificationSettingsState {
  const factory NotificationSettingsState.initial() =
      NotificationSettingsInitial;
  const factory NotificationSettingsState.loading() =
      NotificationSettingsLoading;
  const factory NotificationSettingsState.loaded(
      Map<String, bool> topicStates) = NotificationSettingsLoaded;
  const factory NotificationSettingsState.error(String message) =
      NotificationSettingsError;
}

