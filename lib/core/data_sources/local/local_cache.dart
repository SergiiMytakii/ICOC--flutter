import 'dart:async';

abstract class LocalCache {
  FutureOr<void> saveString(String key, String value);
  String? getString(String key);
  FutureOr<void> saveMap(String key, Map<String, dynamic> value);
  Map<String, dynamic>? getMap(String key);
  FutureOr<double?> getDouble(String key);
  FutureOr<void> saveDouble(String key, double value);
  FutureOr<void> saveList(String key, List<String> value);
  FutureOr<List<String>?> getList(String key);
  FutureOr<void> saveBool(String key, bool value);
  FutureOr<bool?> getBool(String key);
  FutureOr<void> removeValue(String key);
}
