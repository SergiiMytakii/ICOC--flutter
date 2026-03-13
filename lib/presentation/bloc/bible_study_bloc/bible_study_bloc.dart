import 'package:bloc/bloc.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_languages.dart';
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
  List<BibleStudy> allTopics = [];
  BibleStudyBloc(this.bibleStudyRepository, this.bibleStudyUserLanguagesHandler)
      : super(const BibleStudyState.initial()) {
    on<BibleStudyEvent>((event, emit) async {
      await event.map(
        listRequested: (event) => _onBibleStudyListRequested(event, emit),
      );
    });
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
          emit(BibleStudyState.success(filteredTopics));
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
