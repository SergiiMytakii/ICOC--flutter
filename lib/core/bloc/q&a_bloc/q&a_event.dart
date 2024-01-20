part of 'q&a_bloc.dart';

@immutable
sealed class QandAEvent {
  Stream<QandAState> applyAsync({QandAState currentState, QandABloc bloc});
}

class QandARequested extends QandAEvent {
  final QandARepositoryImpl qAndARepositoryImpl = QandARepositoryImpl();
  @override
  Stream<QandAState> applyAsync(
      {QandAState? currentState, QandABloc? bloc}) async* {
    final log = Logger();
    try {
      yield QandALoadingState();
      final List<QandAModel> articles = await qAndARepositoryImpl.getArticles();
      // we need all languages  for filtering

      yield GetQandASuccessState(articles);
    } catch (_, stackTrace) {
      log.e('$_', error: _, stackTrace: stackTrace);
      yield QandAErrorState(_.toString());
    }
  }
}
