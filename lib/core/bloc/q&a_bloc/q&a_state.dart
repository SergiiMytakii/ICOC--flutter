part of 'q&a_bloc.dart';

@immutable
sealed class QandAState {}

final class QandAInitial extends QandAState {}

final class QandALoadingState extends QandAState {}

final class GetQandASuccessState extends QandAState {
  final List<QandAModel> articles;

  GetQandASuccessState(this.articles);
}

final class QandAErrorState extends QandAState {
  final String message;

  QandAErrorState(this.message);
}
