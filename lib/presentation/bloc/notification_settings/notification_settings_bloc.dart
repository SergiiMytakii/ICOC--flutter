import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:icoc/core/notifications/push_notification_service.dart';

part 'notification_settings_event.dart';
part 'notification_settings_state.dart';
part 'notification_settings_bloc.freezed.dart';

@injectable
class NotificationSettingsBloc
    extends Bloc<NotificationSettingsEvent, NotificationSettingsState> {
  NotificationSettingsBloc(this._pushService)
      : super(const NotificationSettingsState.initial()) {
    on<NotificationSettingsLoadRequested>(_onLoadRequested);
    on<NotificationTopicToggleRequested>(_onToggleRequested);
  }

  final PushNotificationService _pushService;

  Future<void> _onLoadRequested(
    NotificationSettingsLoadRequested event,
    Emitter<NotificationSettingsState> emit,
  ) async {
    emit(const NotificationSettingsState.loading());
    try {
      final Map<String, bool> states = await _pushService.getTopicStates();
      emit(NotificationSettingsState.loaded(states));
    } catch (e) {
      emit(const NotificationSettingsState.error(
          'Unable to load notification preferences'));
    }
  }

  Future<void> _onToggleRequested(
    NotificationTopicToggleRequested event,
    Emitter<NotificationSettingsState> emit,
  ) async {
    final current = state.maybeWhen(
      loaded: (s) => s,
      orElse: () => <String, bool>{},
    );
    final next = Map<String, bool>.from(current);
    next[event.topic] = event.enabled;
    emit(NotificationSettingsState.loaded(next));
    try {
      await _pushService.updateTopicSubscription(
          topic: event.topic, enabled: event.enabled);
    } catch (e) {
      // Revert on error
      final reverted = Map<String, bool>.from(current);
      emit(NotificationSettingsState.loaded(reverted));
      emit(const NotificationSettingsState.error(
          'Failed to update notification topic'));
    }
  }
}
