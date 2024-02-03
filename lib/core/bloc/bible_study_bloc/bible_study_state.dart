part of 'bible_study_bloc.dart';

@immutable
sealed class BibleStudyState {}

final class BibleStudyInitial extends BibleStudyState {}

final class BibleStudyLoadingState extends BibleStudyState {}

final class GetBibleStudyListSuccessState extends BibleStudyState {
  final List<BibleStudy> topics;

  GetBibleStudyListSuccessState(this.topics);
}

final class BibleStudyErrorState extends BibleStudyState {
  final String message;

  BibleStudyErrorState(this.message);
}
