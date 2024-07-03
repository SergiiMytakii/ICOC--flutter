import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/model/q&a_model.dart';
import 'package:icoc/core/repository/q&a_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'q&a_event.dart';
part 'q&a_state.dart';

@singleton
class QandABloc extends Bloc<QandAEvent, QandAState> {
  final QandARepository qandARepository;

  QandABloc(this.qandARepository) : super(QandAInitial()) {
    on<QandARequested>(_onQandARequested);
  }

  Future<void> _onQandARequested(
    QandARequested event,
    Emitter<QandAState> emit,
  ) async {
    try {
      if (event.query != null) emit(QandALoadingState());
      final List<QandAModel> articles = await qandARepository.getArticles();
      if (articles.isNotEmpty) {
        if (event.query != null) {
          final filteredArticles = articles
              .where((element) => element.title.contains(event.query!))
              .toList();
          emit(GetQandASuccessState(filteredArticles));
        } else {
          emit(GetQandASuccessState(articles));
        }
      } else {
        emit(QandAErrorState(''));
      }
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(QandAErrorState(error.toString()));
    }
  }
}
