import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/model/q&a/q&a_model.dart';
import 'package:icoc/domain/repository/q&a_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:icoc/core/errors/failures.dart';

part 'one_q&a_event.dart';
part 'one_q&a_state.dart';
part 'one_q&a_bloc.freezed.dart';

@singleton
class OneQandABloc extends Bloc<OneQandAEvent, OneQandAState> {
  final QandARepository qandARepository;
  final QandAUserLanguagesHandler qandAUserLanguagesHandler;
  List<Languages> langs = [];

  OneQandABloc(this.qandARepository, this.qandAUserLanguagesHandler)
      : super(const OneQandAState.initial()) {
    on<OneQandAEvent>((event, emit) async {
      await event.when(
        requested: (article) => _onQandARequested(article, emit),
      );
    });
  }

  Future<void> _onQandARequested(
    QandAModel article,
    Emitter<OneQandAState> emit,
  ) async {
    emit(const OneQandAState.loading());
    if (article.question.isNotEmpty && article.answer.isNotEmpty) {
      emit(OneQandAState.success(article));
    } else {
      if (article.link != null) {
        final Either<Failure, QandAModel> result =
            await qandARepository.getArticleContent(article);

        result.fold((failure) => emit(OneQandAState.error(failure.toString())),
            (articleWithContent) async {
          if (article.lang == Languages.en.name) {
            emit(OneQandAState.success(articleWithContent));
          } else {
            emit(const OneQandAState.translating());
            final Either<Failure, QandAModel> translationResult =
                await qandARepository
                    .translateArticleContent(articleWithContent);

            translationResult.fold(
                (failure) => emit(OneQandAState.error(failure.toString())),
                (translatedArticle) =>
                    emit(OneQandAState.success(translatedArticle)));
          }
        });
      } else {
        logError('Article link not provided', null);
        emit(OneQandAState.error('Article content not found'.tr()));
      }
    }
  }
}
