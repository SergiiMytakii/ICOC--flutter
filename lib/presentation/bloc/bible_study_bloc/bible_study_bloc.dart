import 'package:bloc/bloc.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/core/user_state/new_items_local_store.dart';
import 'package:icoc/domain/model/bible_study/bible_study.dart';
import 'package:icoc/domain/repository/bible_study_repository.dart';
import 'package:icoc/main.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bible_study_event.dart';
part 'bible_study_state.dart';
part 'bible_study_bloc.freezed.dart';

@singleton
class BibleStudyBloc extends Bloc<BibleStudyEvent, BibleStudyState> {
  final BibleStudyRepository bibleStudyRepository;
  final BibleStudyUserLanguagesHandler bibleStudyUserLanguagesHandler;
  final NewItemsLocalStore _newItemsStore;
  List<BibleStudy> allTopics = [];
  BibleStudyBloc(
    this.bibleStudyRepository,
    this.bibleStudyUserLanguagesHandler,
    this._newItemsStore,
  ) : super(const BibleStudyState.initial()) {
    on<BibleStudyEvent>((event, emit) async {
      await event.map(
        listRequested: (event) => _onBibleStudyListRequested(event, emit),
        screenOpened: (event) => _onScreenOpened(emit),
        topicOpened: (event) => _onTopicOpened(event.topicId, emit),
        lessonOpened: (event) => _onLessonOpened(event.lessonId, emit),
      );
    });
  }

  Future<void> _onTopicOpened(
      int topicId, Emitter<BibleStudyState> emit) async {
    final s = state.maybeMap(success: (s) => s, orElse: () => null);
    if (s == null || !s.newTopicIds.contains(topicId)) return;

    final updatedTopicIds = Set<int>.from(s.newTopicIds)..remove(topicId);
    final known = _newItemsStore.getKnownTopicIds()..add(topicId);
    await _newItemsStore.saveKnownTopicIds(known);
    emit(s.copyWith(
      unreadCount: updatedTopicIds.length + s.newLessonIds.length,
      newTopicIds: updatedTopicIds,
    ));
  }

  Future<void> _onLessonOpened(
      int lessonId, Emitter<BibleStudyState> emit) async {
    final s = state.maybeMap(success: (s) => s, orElse: () => null);
    if (s == null || !s.newLessonIds.contains(lessonId)) return;

    final updatedLessonIds = Set<int>.from(s.newLessonIds)..remove(lessonId);
    final known = _newItemsStore.getKnownLessonIds()..add(lessonId);
    await _newItemsStore.saveKnownLessonIds(known);
    emit(s.copyWith(
      unreadCount: s.newTopicIds.length + updatedLessonIds.length,
      newLessonIds: updatedLessonIds,
    ));
  }

  Future<void> _onScreenOpened(Emitter<BibleStudyState> emit) async {
    final loadedState = state.maybeMap(
      success: (s) => s,
      orElse: () => null,
    );
    if (loadedState == null) return;

    final allTopicIds = loadedState.topics.map((t) => t.id).toSet();
    final allLessonIds =
        loadedState.topics.expand((t) => t.lessons).map((l) => l.id).toSet();
    await _newItemsStore.saveKnownTopicIds(allTopicIds);
    await _newItemsStore.saveKnownLessonIds(allLessonIds);

    if (loadedState.unreadCount == 0) return;
    emit(loadedState.copyWith(unreadCount: 0));
  }

  Future<void> _onBibleStudyListRequested(
    BibleStudyListRequested event,
    Emitter<BibleStudyState> emit,
  ) async {
    emit(const BibleStudyState.loading());
    final result = await bibleStudyRepository.getBibleStudyList();
    return result.fold(
      (failure) => emit(BibleStudyState.error(failure.toUserFriendlyMessage())),
      (topics) async {
        allTopics = topics;
        await updateStoredLanguages(allTopics, bibleStudyUserLanguagesHandler);
        final List<BibleStudy> filteredTopics =
            await filterByLanguages(allTopics, bibleStudyUserLanguagesHandler);
        if (filteredTopics.isNotEmpty) {
          final currentTopicIds = filteredTopics.map((t) => t.id).toSet();
          final currentLessonIds =
              filteredTopics.expand((t) => t.lessons).map((l) => l.id).toSet();
          final (:newTopicIds, :newLessonIds) =
              _newItemsStore.computeNewBibleStudyIds(
            currentTopicIds: currentTopicIds,
            currentLessonIds: currentLessonIds,
          );
          emit(BibleStudyState.success(
            topics: filteredTopics,
            unreadCount: newTopicIds.length + newLessonIds.length,
            newTopicIds: newTopicIds,
            newLessonIds: newLessonIds,
          ));
        } else {
          emit(const BibleStudyState.empty());
        }
      },
    );
  }
}

Future<void> updateStoredLanguages(List<BibleStudy> bibleStudies,
    BibleStudyUserLanguagesHandler bibleStudyUserLanguagesHandler) async {
  final List<Languages> allLangsFrombibleStudies =
      bibleStudies.map((bibleStudy) => bibleStudy.lang).toSet().toList();

  // Get the set of available language names from the database
  final Set<String> availableLangNames =
      allLangsFrombibleStudies.map((lang) => lang.name).toSet();

  // Create a new languages map with only available languages
  final Map<String, dynamic> updatedLanguages = <String, dynamic>{};

  // Add languages that are available in the database
  for (final langName in availableLangNames) {
    // Keep the existing active state if the language was already present
    final bool wasActive =
        bibleStudyUserLanguagesHandler.languages[langName] ?? false;
    updatedLanguages[langName] = wasActive || langName == locale;
  }

  // Ensure at least one language is active if none are currently active
  if (updatedLanguages.isNotEmpty &&
      !updatedLanguages.values.any((isActive) => isActive == true)) {
    // Activate the first available language or the user's locale if available
    final String firstLang = updatedLanguages.keys.first;
    updatedLanguages[firstLang] = true;
  }

  // Update the handler with only available languages
  await bibleStudyUserLanguagesHandler.saveAllLanguages(updatedLanguages);
}

Future<List<BibleStudy>> filterByLanguages(List<BibleStudy> topics,
    BibleStudyUserLanguagesHandler bibleStudyUserLanguagesHandler) async {
  final activeLanguages = bibleStudyUserLanguagesHandler.getActiveLanguages();

  final filteredTopics = topics
      .where((topic) => activeLanguages.contains(topic.lang.name))
      .toList();

  filteredTopics.sort((a, b) {
    if (a.lang.name == locale && b.lang.name != locale) {
      return -1; // put primary lang first
    } else if (a.lang.name != locale && b.lang.name == locale) {
      return 1;
    } else {
      return a.lang.name
          .compareTo(b.lang.name); // Sort other langs alphabetically
    }
  });
  return filteredTopics;
}
