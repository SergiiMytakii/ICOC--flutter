part of 'bible_study_bloc.dart';

@freezed
sealed class BibleStudyEvent with _$BibleStudyEvent {
  const factory BibleStudyEvent.listRequested() = BibleStudyListRequested;
}
