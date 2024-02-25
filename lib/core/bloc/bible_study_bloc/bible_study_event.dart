part of 'bible_study_bloc.dart';

@immutable
sealed class BibleStudyEvent {
  Stream<BibleStudyState> applyAsync(
      {BibleStudyState currentState, BibleStudyBloc bloc});
}

class BibleStudyListRequested extends BibleStudyEvent {
  final BibleStudyRepositoryImpl bibleStudyRepositoryImpl =
      BibleStudyRepositoryImpl();
  @override
  Stream<BibleStudyState> applyAsync(
      {BibleStudyState? currentState, BibleStudyBloc? bloc}) async* {
    try {
      yield BibleStudyLoadingState();
      final List<BibleStudy> topics =
          await bibleStudyRepositoryImpl.getBibleStudyList();
      if (topics.isNotEmpty) {
        final List<BibleStudy> filteredTopics = await filterByLanguages(topics);
        yield GetBibleStudyListSuccessState(filteredTopics);
      } else {
        yield BibleStudyErrorState(
            "Can't  load data... Please, check your internet connection and pull down to refresh!"
                .tr());
      }
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      yield BibleStudyErrorState(error.toString());
    }
  }
}

Future<List<BibleStudy>> filterByLanguages(List<BibleStudy> topics) async {
  final locale = SharedPreferencesHelper.getString(
        StorageKeys.locale,
      ) ??
      'en';

  final Map<String, dynamic> storedLanguages =
      SharedPreferencesHelper.getMap(StorageKeys.bibleStudyLanguages) ?? {};
  //set keeps only unique values
  Set<String> allKeys = {};
  topics.forEach((topic) => allKeys.add(topic.lang));

  putDeviceLangToFirstPlace(allKeys.toList(), locale);

  allKeys.forEach((String lang) {
    if (!storedLanguages.containsKey(lang)) {
      storedLanguages[lang] = lang == locale;
    }
  });
  SharedPreferencesHelper.saveMap(
      StorageKeys.bibleStudyLanguages, storedLanguages);

  final filteredTopics = topics.where((topic) {
    return storedLanguages.entries
        .any((element) => element.value == true && element.key == topic.lang);
  }).toList();

  filteredTopics.sort((a, b) {
    if (a.lang == locale && b.lang != locale) {
      return -1; // 'en' should come before any other lang
    } else if (a.lang != locale && b.lang == locale) {
      return 1; // Any other lang should come after 'en'
    } else {
      return a.lang.compareTo(b.lang); // Sort other langs alphabetically
    }
  });
  return filteredTopics;
}
