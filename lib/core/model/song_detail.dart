import 'dart:collection';

import 'package:icoc/core/model/resources.dart';

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
    final Set<String> allKeys = {};

    void collectKeys(Map? map) {
      if (map != null) {
        map.keys.forEach((key) {
          if (key != 'id_song')
          // Remove numbers and duplicates
          {
            final String cleanKey = key.replaceAll(RegExp(r'[0-9]'), '');

            allKeys.add(cleanKey);
          }
        });
      }
    }

    collectKeys(title);
    // collectKeys(this.description);
    //collectKeys(this.chords);
//todo replace in db all keys in shords to 'ru1', 'uk1' and so on Than uncomment line above to filter chords as well.  And than filter resourses as well
    return allKeys.toList();
  }

  List<String> getAllTextKeys() {
    final Set<String> allKeys = {};

    void collectKeys(Map? map) {
      if (map != null) {
        map.keys.forEach((key) {
          allKeys.add(key);
        });
      }
    }

    collectKeys(text);
    return allKeys.toList();
  }

  SongDetail filterAndOrderLanguages(List<String> orderLanguages) {
    final Map filteredTitle = Map.fromEntries(title.entries
        .where((entry) => orderLanguages.contains(entry.key))
        .toList()
      ..sort((a, b) => orderLanguages
          .indexOf(a.key)
          .compareTo(orderLanguages.indexOf(b.key))));

    final Map filteredText = Map.fromEntries(text.entries
        .where((entry) =>
            orderLanguages.contains(entry.key.toString().substring(0, 2)))
        .toList()
      ..sort((a, b) => orderLanguages
          .indexOf(a.key.toString().substring(0, 2))
          .compareTo(
              orderLanguages.indexOf(b.key.toString().substring(0, 2)))));

    return SongDetail(
      id: id,
      title: filteredTitle,
      description: description,
      text: filteredText,
      chords: chords,
      resources: resources,
      searchLang: searchLang,
      searchText: searchText,
      searchTitle: searchTitle,
    );
  }

  SongDetail orderByLanguage(List<String> orderLanguages) {
    return SongDetail(
      id: id,
      title: _orderByLanguageInMap(title, orderLanguages),
      description: _orderByLanguageInMap(description, orderLanguages),
      text: _orderByLanguageInMap(text, orderLanguages),
      chords: _orderByLanguageInMap(chords, orderLanguages),
      resources:
          resources != null ? _sortResources(resources!, orderLanguages) : null,
    );
  }

  List<Resources> _sortResources(
      List<Resources> resources, List<String> orderLanguages) {
    resources.sort((a, b) {
      final int indexA = orderLanguages.indexOf(a.lang);
      final int indexB = orderLanguages.indexOf(b.lang);

      // If either language is not in orderLanguages, move it to the end
      if (indexA == -1) return 1;
      if (indexB == -1) return -1;

      return indexA.compareTo(indexB);
    });
    return resources;
  }

  Map _orderByLanguageInMap(Map? map, List<String> orderLanguages) {
    if (map == null) {
      return {};
    }
    if (map.entries.toList().length == 1) {
      return map;
    }
    // Create a LinkedHashMap to maintain insertion order:
    // ignore: prefer_collection_literals
    final sortedMap = LinkedHashMap();

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

  static SongDetail defaultSong() {
    return SongDetail(
        id: 0, title: {'ru': 'default'}, text: {'ru1': 'default'});
  }
}
