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
      // we need all languages  for filtering

      final List<BibleStudy> filteredTopics = await filterByLanguages(topics);
      yield GetBibleStudyListSuccessState(filteredTopics);
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      yield BibleStudyErrorState(error.toString());
    }
  }
}

Future<List<BibleStudy>> filterByLanguages(List<BibleStudy> topics) async {
  final Map<String, dynamic> storedLanguages =
      SharedPreferencesHelper.getMap(StorageKeys.bibleStudyLanguages) ?? {};
  //set keeps only unique values
  Set<String> allKeys = {};
  topics.forEach((topic) => allKeys.add(topic.lang));

  allKeys.forEach((String lang) {
    if (!storedLanguages.containsKey(lang)) {
      storedLanguages[lang] = true;
    }
  });
  SharedPreferencesHelper.saveMap(
      StorageKeys.bibleStudyLanguages, storedLanguages);

  return topics.where((topic) {
    return storedLanguages.entries
        .any((element) => element.value == true && element.key == topic.lang);
  }).toList();
}
