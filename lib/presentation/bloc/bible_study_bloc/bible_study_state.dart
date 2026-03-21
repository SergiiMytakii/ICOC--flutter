part of 'bible_study_bloc.dart';

@freezed
class BibleStudyState with _$BibleStudyState {
  const factory BibleStudyState.initial() = BibleStudyInitial;
  const factory BibleStudyState.loading() = BibleStudyLoadingState;
  const factory BibleStudyState.empty() = BibleStudyEmptyState;
  const factory BibleStudyState.success({
    required List<BibleStudy> topics,
    @Default(0) int unreadCount,
    @Default(<int>{}) Set<int> newTopicIds,
    @Default(<int>{}) Set<int> newLessonIds,
  }) = GetBibleStudyListSuccessState;
  const factory BibleStudyState.error(String message) = BibleStudyErrorState;
}
