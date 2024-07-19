part of 'bible_study_bloc.dart';

@freezed
class BibleStudyState with _$BibleStudyState {
  const factory BibleStudyState.initial() = BibleStudyInitial;
  const factory BibleStudyState.loading() = BibleStudyLoadingState;
  const factory BibleStudyState.success(List<BibleStudy> topics) =
      GetBibleStudyListSuccessState;
  const factory BibleStudyState.error(String message) = BibleStudyErrorState;
}
