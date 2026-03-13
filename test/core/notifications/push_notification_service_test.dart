import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/notifications/push_notification_service.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/injection.dart';

class _MemoryCache implements LocalCache {
  final Map<String, dynamic> _store = <String, dynamic>{};

  @override
  bool? getBool(String key) => _store[key] as bool?;

  @override
  double? getDouble(String key) => _store[key] as double?;

  @override
  List<String>? getList(String key) => _store[key] as List<String>?;

  @override
  Map<String, dynamic>? getMap(String key) =>
      _store[key] as Map<String, dynamic>?;

  @override
  String? getString(String key) => _store[key] as String?;

  @override
  Future<void> removeValue(String key) async {
    _store.remove(key);
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    _store[key] = value;
  }

  @override
  Future<void> saveDouble(String key, double value) async {
    _store[key] = value;
  }

  @override
  Future<void> saveList(String key, List<String> value) async {
    _store[key] = value;
  }

  @override
  Future<void> saveMap(String key, Map<String, dynamic> value) async {
    _store[key] = Map<String, dynamic>.from(value);
  }

  @override
  Future<void> saveString(String key, String value) async {
    _store[key] = value;
  }
}

class _RecordingPushNotificationService extends PushNotificationService {
  _RecordingPushNotificationService(super.localCache);

  final List<String> subscribedTopics = <String>[];
  final List<String> unsubscribedTopics = <String>[];

  @override
  Future<void> subscribeTopicSafe(String topic) async {
    subscribedTopics.add(topic);
  }

  @override
  Future<void> unsubscribeTopicSafe(String topic) async {
    unsubscribedTopics.add(topic);
  }
}

void main() {
  late _MemoryCache cache;
  late _RecordingPushNotificationService service;

  setUp(() async {
    cache = _MemoryCache();
    service = _RecordingPushNotificationService(cache);

    await cache.saveString(StorageKeys.locale, 'uk');
    await cache.saveMap(StorageKeys.notificationTopics, <String, dynamic>{
      'video': false,
    });
    await cache.saveMap(StorageKeys.videosAllLanguages, <String, dynamic>{
      'uk': true,
      'en': false,
    });

    await getIt.reset();
    getIt.registerSingleton<VideosUserLanguagesHandler>(
      VideosUserLanguagesHandler(cache),
    );
  });

  tearDown(() async {
    await getIt.reset();
  });

  test('enabling video topic subscribes to base and active language topics',
      () async {
    await service.updateTopicSubscription(topic: 'video', enabled: true);

    expect(service.subscribedTopics, contains('video'));
    expect(service.subscribedTopics, contains('video-lang-uk'));
    expect(service.unsubscribedTopics, contains('video-lang-en'));

    final topicStates = await service.getTopicStates();
    expect(topicStates['video'], isTrue);
  });

  test('disabling video topic unsubscribes from base and language topics',
      () async {
    await cache.saveMap(StorageKeys.notificationTopics, <String, dynamic>{
      'video': true,
    });

    await service.updateTopicSubscription(topic: 'video', enabled: false);

    expect(service.unsubscribedTopics, contains('video'));
    expect(service.unsubscribedTopics, contains('video-lang-uk'));
    expect(service.unsubscribedTopics, contains('video-lang-en'));

    final topicStates = await service.getTopicStates();
    expect(topicStates['video'], isFalse);
  });
}
