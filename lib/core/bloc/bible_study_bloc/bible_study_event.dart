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
  final List<String>? storedLanguages = await SharedPreferencesHelper.getList(
      SharedPreferencesKeys.bibleStudyLanguages);
  //if this the first run we store languages
  // we need all languages  for filtering
  Set<String> allKeys = {};
  topics.forEach((topic) => allKeys.add(topic.lang));
  SharedPreferencesHelper.saveList(
      SharedPreferencesKeys.bibleStudyAllLanguages, allKeys.toList());
  if (storedLanguages == null) {
    SharedPreferencesHelper.saveList(
        SharedPreferencesKeys.bibleStudyLanguages, allKeys.toList());
    return topics;
  } else {
    return topics
        .where((topic) => storedLanguages.contains(topic.lang))
        .toList();
  }
}
