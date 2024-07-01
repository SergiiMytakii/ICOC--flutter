import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/helpers/set_device_lang_as_primary.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/core/model/bible_study.dart';
import 'package:icoc/core/repository/bible_study_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'bible_study_event.dart';
part 'bible_study_state.dart';

@singleton
class BibleStudyBloc extends Bloc<BibleStudyEvent, BibleStudyState> {
  final BibleStudyRepository bibleStudyRepository;

  BibleStudyBloc(this.bibleStudyRepository) : super(BibleStudyInitial()) {
    on<BibleStudyListRequested>(_onBibleStudyListRequested);
  }

  Future<void> _onBibleStudyListRequested(
    BibleStudyListRequested event,
    Emitter<BibleStudyState> emit,
  ) async {
    try {
      emit(BibleStudyLoadingState());
      final List<BibleStudy> topics =
          await bibleStudyRepository.getBibleStudyList();
      if (topics.isNotEmpty) {
        final List<BibleStudy> filteredTopics = await filterByLanguages(topics);
        emit(GetBibleStudyListSuccessState(filteredTopics));
      } else {
        emit(BibleStudyErrorState(
            "Can't  load data... Please, check your internet connection and pull down to refresh!"
                .tr()));
      }
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(BibleStudyErrorState(error.toString()));
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
