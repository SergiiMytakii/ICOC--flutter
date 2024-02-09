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
    try {
      yield QandALoadingState();
      final List<QandAModel> articles = await qAndARepositoryImpl.getArticles();
      if (articles.isNotEmpty)
        yield GetQandASuccessState(articles);
      else
        yield QandAErrorState('');
    } catch (_, stackTrace) {
      logError(_, stackTrace);
      yield QandAErrorState(_.toString());
    }
  }
}
