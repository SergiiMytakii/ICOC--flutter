part of 'q&a_bloc.dart';

@immutable
sealed class QandAEvent {
  Stream<QandAState> applyAsync({QandAState currentState, QandABloc bloc});
}

class QandARequested extends QandAEvent {
  final String? query;
  final QandARepositoryImpl qAndARepositoryImpl = QandARepositoryImpl();

  QandARequested({this.query});
  @override
  Stream<QandAState> applyAsync(
      {QandAState? currentState, QandABloc? bloc}) async* {
    try {
      if (query != null) yield QandALoadingState();
      final List<QandAModel> articles = await qAndARepositoryImpl.getArticles();
      if (articles.isNotEmpty) if (query != null) {
        final filteredArticles = articles
            .where((element) => element.title.contains(query!))
            .toList();
        yield GetQandASuccessState(filteredArticles);
      } else
        yield GetQandASuccessState(articles);
      else
        yield QandAErrorState('');
    } catch (_, stackTrace) {
      logError(_, stackTrace);
      yield QandAErrorState(_.toString());
    }
  }
}
