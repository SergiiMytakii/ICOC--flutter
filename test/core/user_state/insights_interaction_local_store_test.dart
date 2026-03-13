import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_state/insights_interaction_local_store.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';

class _MemoryLocalCache implements LocalCache {
  final Map<String, Object?> _values = <String, Object?>{};

  @override
  bool? getBool(String key) => _values[key] as bool?;

  @override
  double? getDouble(String key) => _values[key] as double?;

  @override
  List<String>? getList(String key) => (_values[key] as List?)?.cast<String>();

  @override
  Map<String, dynamic>? getMap(String key) =>
      (_values[key] as Map?)?.cast<String, dynamic>();

  @override
  String? getString(String key) => _values[key] as String?;

  @override
  Future<void> removeValue(String key) async {
    _values.remove(key);
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    _values[key] = value;
  }

  @override
  Future<void> saveDouble(String key, double value) async {
    _values[key] = value;
  }

  @override
  Future<void> saveList(String key, List<String> value) async {
    _values[key] = value;
  }

  @override
  Future<void> saveMap(String key, Map<String, dynamic> value) async {
    _values[key] = value;
  }

  @override
  Future<void> saveString(String key, String value) async {
    _values[key] = value;
  }
}

void main() {
  late _MemoryLocalCache cache;
  late InsightsInteractionLocalStore store;

  setUp(() {
    cache = _MemoryLocalCache();
    store = InsightsInteractionLocalStore(cache);
  });

  test('creates and reuses a device id', () {
    final String first = store.getOrCreateDeviceId();
    final String second = store.getOrCreateDeviceId();

    expect(first, isNotEmpty);
    expect(second, first);
    expect(cache.getString(StorageKeys.deviceId), first);
  });

  test('stores and trims display name', () async {
    await store.saveDisplayName('  Alex  ');

    expect(store.getDisplayName(), 'Alex');
    expect(cache.getString(StorageKeys.insightsDisplayName), 'Alex');
  });

  test('persists liked post ids', () async {
    await store.setLikedPostState('post-1', true);
    await store.setLikedPostState('post-2', true);
    await store.setLikedPostState('post-1', false);

    expect(store.getLikedPostIds(), <String>{'post-2'});
    expect(cache.getList(StorageKeys.insightsLikedPosts), <String>['post-2']);
  });
}
