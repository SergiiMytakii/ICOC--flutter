import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/presentation/bloc/notification_settings/notification_settings_bloc.dart';
import 'package:icoc/core/notifications/push_notification_service.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';

class _FakePushService extends PushNotificationService {
  _FakePushService() : super(_FakeCache());
  final Map<String, bool> _topics = {
    'songbook': true,
    'insights': true,
    'biblestudy': true,
    'video': true,
  };

  @override
  Future<Map<String, bool>> getTopicStates() async => _topics;

  @override
  Future<void> updateTopicSubscription({
    required String topic,
    required bool enabled,
  }) async {
    _topics[topic] = enabled;
  }
}

class _FakeCache implements LocalCache {
  @override
  String? getString(String key) => null;
  @override
  Map<String, dynamic>? getMap(String key) => null;
  @override
  bool? getBool(String key) => null;
  @override
  double? getDouble(String key) => null;
  @override
  List<String>? getList(String key) => null;
  @override
  Future<void> saveString(String key, String value) async {}
  @override
  Future<void> saveMap(String key, Map<String, dynamic> value) async {}
  @override
  Future<void> saveBool(String key, bool value) async {}
  @override
  Future<void> saveDouble(String key, double value) async {}
  @override
  Future<void> saveList(String key, List<String> value) async {}
  @override
  Future<void> removeValue(String key) async {}
}

void main() {
  group('NotificationSettingsBloc', () {
    late NotificationSettingsBloc bloc;

    setUp(() {
      bloc = NotificationSettingsBloc(_FakePushService());
    });

    test('loads initial topic states', () async {
      bloc.add(const NotificationSettingsEvent.loadRequested());
      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<NotificationSettingsLoading>(),
          isA<NotificationSettingsLoaded>(),
        ]),
      );
    });

    test('toggle updates state', () async {
      bloc.add(const NotificationSettingsEvent.loadRequested());
      await bloc.stream.firstWhere((s) => s is NotificationSettingsLoaded);
      bloc.add(
        const NotificationSettingsEvent.toggleRequested(
            topic: 'insights', enabled: false),
      );
      final state =
          await bloc.stream.firstWhere((s) => s is NotificationSettingsLoaded)
              as NotificationSettingsLoaded;
      expect(state.topicStates['insights'], false);
    });
  });
}
