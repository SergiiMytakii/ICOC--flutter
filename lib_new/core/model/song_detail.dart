import 'dart:collection';

import 'resources.dart';

class SongDetail {
  final int id;
  final Map? description;
  final Map title;
  final Map text;
  final List<Resources>? resources;
  final Map? chords;
  String? searchTitle;
  String? searchText;
  String? searchLang;

  SongDetail(
      {required this.id,
      required this.title,
      this.description,
      required this.text,
      this.chords,
      this.resources,
      this.searchLang,
      this.searchText,
      this.searchTitle});

  factory SongDetail.fromJson(Map<String, dynamic> parsedJson) {
    // log.d(parsedJson);
    return SongDetail(
      id: parsedJson['Id'] ?? 0,
      title: parsedJson['title'] ?? '',
      text: parsedJson['text'] ?? '',
      description: parsedJson['description'] ?? '',
      resources: parsedJson['resourses'] ?? [],
      chords: parsedJson['chords'] ?? '',
    );
  }

//provide list with all languages
  List<String> getAllTitleKeys() {
    Set<String> allKeys = {};

    void collectKeys(Map? map) {
      if (map != null) {
        map.keys.forEach((key) {
          // Remove numbers and duplicates
          String cleanKey = key.replaceAll(RegExp(r'[0-9]'), '');
          allKeys.add(cleanKey);
        });
      }
    }

    collectKeys(this.title);
    // collectKeys(this.description);
    //collectKeys(this.chords);
//todo replace in db all keys in shords to 'ru1', 'uk1' and so on Than uncomment line above to filter chords as well.  And than filter resourses as well
    return allKeys.toList();
  }

  List<String> getAllTextKeys() {
    Set<String> allKeys = {};

    void collectKeys(Map? map) {
      if (map != null) {
        map.keys.forEach((key) {
          allKeys.add(key);
        });
      }
    }

    collectKeys(this.text);
    return allKeys.toList();
  }

  SongDetail removeKeys(List<String> keysToRemove) {
    return SongDetail(
      id: this.id,
      title: _removeKeysFromMap(this.title, keysToRemove),
      description: _removeKeysFromMap(this.description, keysToRemove),
      text: _removeKeysFromMap(this.text, keysToRemove),
      chords: _removeKeysFromMap(this.chords, keysToRemove),
      resources: this.resources,
    );
  }

  Map _removeKeysFromMap(Map? map, List<String> keysToRemove) {
    if (map == null) {
      return {};
    }
    map.removeWhere((key, value) =>
        keysToRemove.contains(key.replaceAll(RegExp(r'[0-9]'), '')));
    return map;
  }

  SongDetail orderByLanguage(List<String> orderLanguages) {
    return SongDetail(
      id: this.id,
      title: _orderByLanguageInMap(this.title, orderLanguages),
      description: _orderByLanguageInMap(this.description, orderLanguages),
      text: _orderByLanguageInMap(this.text, orderLanguages),
      chords: _orderByLanguageInMap(this.chords, orderLanguages),
      resources: this.resources,
    );
  }

  _orderByLanguageInMap(Map? map, List<String> orderLanguages) {
    if (map == null) {
      return {};
    }
    if (map.entries.toList().length == 1) {
      return map;
    }
    // Create a LinkedHashMap to maintain insertion order:
    var sortedMap = LinkedHashMap();

    // Iterate through the desired language order:
    for (var language in orderLanguages) {
      for (MapEntry entry in map.entries) {
        if (entry.key.toString().contains(language)) {
          sortedMap[entry.key] = map[entry.key];
        }
      }
    }
    sortedMap.addAll(map);

    return sortedMap;
  }

  static defaultSong() {}
}
