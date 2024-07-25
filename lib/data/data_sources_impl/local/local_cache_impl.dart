import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:icoc/core/data_sources/local/local_cache.dart';
import 'package:injectable/injectable.dart';

@dev
@prod
@Injectable(as: LocalCache)
class LocalCacheImpl implements LocalCache {
  @override
  Future<void> saveString(String key, String value) async {
    await GetStorage().write(key, value);
  }

  @override
  String? getString(String key) {
    return GetStorage().read<String>(key);
  }

  @override
  Future<void> saveMap(String key, Map<String, dynamic> value) async {
    final str = json.encode(value);
    await GetStorage().write(key, str);
  }

  @override
  Map<String, dynamic>? getMap(String key) {
    final value = GetStorage().read(key);
    if (value is! String) {
      GetStorage().remove(key);
      return null;
    }
    final map = json.decode(value);
    return map as Map<String, dynamic>?;
  }

  @override
  double? getDouble(String key) {
    return GetStorage().read<double>(key);
  }

  @override
  Future<void> saveDouble(String key, double value) async {
    await GetStorage().write(key, value);
  }

  @override
  Future<void> saveList(String key, List<String> value) async {
    await GetStorage().write(key, value);
  }

  @override
  List<String>? getList(String key) {
    final value = GetStorage().read(key);
    List<String>? stringList;
    if (value is Map) {
      GetStorage().remove(key);
    }
    if (value is List) {
      stringList = value.cast<String>().toList();
    }
    return stringList;
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    await GetStorage().write(key, value);
  }

  @override
  bool? getBool(String key) {
    return GetStorage().read<bool>(key);
  }

  @override
  Future<void> removeValue(String key) async {
    await GetStorage().remove(key);
  }
}
