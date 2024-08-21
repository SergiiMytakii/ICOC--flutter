import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/convert_languages_enum.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/model/q&a/q&a_model.dart';
import 'package:icoc/domain/repository/q&a_repository.dart';
import 'package:icoc/main.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'q&a_event.dart';
part 'q&a_state.dart';
part 'q&a_bloc.freezed.dart';

@singleton
class QandABloc extends Bloc<QandAEvent, QandAState> {
  final QandARepository qandARepository;
  final QandAUserLanguagesHandler qandAUserLanguagesHandler;
  List<Languages> langs = [];

  QandABloc(this.qandARepository, this.qandAUserLanguagesHandler)
      : super(const QandAState.initial()) {
    print('QandABloc initialized');
    on<QandAEvent>((event, emit) async {
      await event.when(
        getLangs: () => _onGetLangs(emit),
        requested: (query) => _onQandARequested(query, emit),
      );
    });
  }

  Future<void> _onQandARequested(
    String? query,
    Emitter<QandAState> emit,
  ) async {
    try {
      if (query != null) emit(const QandAState.loading());
      Languages lang = Languages.defaultLang;
      if (qandAUserLanguagesHandler.getActiveLanguages().isNotEmpty) {
        lang = convertLanguagesEnum(
            qandAUserLanguagesHandler.getActiveLanguages().first);
      }
      final List<QandAModel> articles = await qandARepository.getArticles(
        lang: lang,
      );

      if (query != null) {
        final filteredArticles =
            articles.where((element) => element.title.contains(query)).toList();
        emit(QandAState.success(filteredArticles));
      } else {
        emit(QandAState.success(articles));
      }
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(QandAState.error(error.toString()));
    }
  }

  Future<void> _onGetLangs(
    Emitter<QandAState> emit,
  ) async {
    try {
      langs = await qandARepository.getAllLangs();
      for (final lang in langs) {
        //add all new langs and set all new langs to false and locale lang to true

        if (!qandAUserLanguagesHandler.languages.containsKey(lang.name)) {
          await qandAUserLanguagesHandler.addLanguage(
              lang.name, lang.name == locale);
        }
      }
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(QandAState.error(error.toString()));
    }
  }
}
