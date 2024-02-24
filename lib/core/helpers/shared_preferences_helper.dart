import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class SharedPreferencesHelper {
  // Save a string value to SharedPreferences
  static Future<void> saveString(String key, String value) async {
    await GetStorage().write(key, value);
  }

  // Get a string value from SharedPreferences
  static String? getString(String key) {
    return GetStorage().read<String>(key);
  }

  static Future<void> saveMap(String key, Map<String, dynamic> value) async {
    final str = json.encode(value);
    await GetStorage().write(key, str);
  }

  // Get a string value from SharedPreferences
  static Map<String, dynamic>? getMap(String key) {
    final value = GetStorage().read(key);
    if (value is! String) {
      GetStorage().remove(key);
      return null;
    }
    final map = json.decode(value);
    return map as Map<String, dynamic>?;
  }

  // Get a string value from SharedPreferences
  static double? getDouble(String key) {
    return GetStorage().read<double>(key);
  }

  static Future<void> saveDouble(String key, double value) async {
    await GetStorage().write(key, value);
  }

  static Future<void> saveList(String key, List<String> value) async {
    await GetStorage().write(key, value);
  }

  static List<String>? getList(String key) {
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

  static Future<void> saveBool(String key, bool value) async {
    await GetStorage().write(key, value);
  }

  static bool? getBool(String key) {
    return GetStorage().read<bool>(key);
  }

  // Remove a value from SharedPreferences
  static Future<void> removeValue(String key) async {
    await GetStorage().remove(key);
  }
}
