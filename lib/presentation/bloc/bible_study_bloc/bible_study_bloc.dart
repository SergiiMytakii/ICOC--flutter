import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/core/helpers/error_logger.dart';
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
    try {
      emit(const BibleStudyState.loading());
      allTopics = await bibleStudyRepository.getBibleStudyList();
      if (allTopics.isNotEmpty) {
        await updateStoredLanguages(allTopics, bibleStudyUserLanguagesHandler);
        final List<BibleStudy> filteredTopics =
            await filterByLanguages(allTopics, bibleStudyUserLanguagesHandler);
        emit(BibleStudyState.success(filteredTopics));
      } else {
        emit(BibleStudyState.error(
            "Can't  load data... Please, check your internet connection and pull down to refresh!"
                .tr()));
      }
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(BibleStudyState.error(error.toString()));
    }
  }
}

Future<void> updateStoredLanguages(List<BibleStudy> bibleStudies,
    BibleStudyUserLanguagesHandler bibleStudyUserLanguagesHandler) async {
  final List<Languages> allLangsFrombibleStudies =
      bibleStudies.map((bibleStudy) => bibleStudy.lang).toSet().toList();

//add all new langs and set all new langs to false and locale lang to true
  allLangsFrombibleStudies.forEach((Languages lang) async {
    if (!bibleStudyUserLanguagesHandler.languages.containsKey(lang.name)) {
      await bibleStudyUserLanguagesHandler.addLanguage(
          lang.name, lang.name == locale);
    }
  });
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
