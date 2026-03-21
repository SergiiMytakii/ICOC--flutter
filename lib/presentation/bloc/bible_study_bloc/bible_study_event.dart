part of 'bible_study_bloc.dart';

@freezed
sealed class BibleStudyEvent with _$BibleStudyEvent {
  const factory BibleStudyEvent.listRequested() = BibleStudyListRequested;
  const factory BibleStudyEvent.screenOpened() = BibleStudyScreenOpened;
  const factory BibleStudyEvent.topicOpened(int topicId) = _TopicOpened;
  const factory BibleStudyEvent.lessonOpened(int lessonId) = _LessonOpened;
}
