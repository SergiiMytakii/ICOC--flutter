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
    on<QandAEvent>((event, emit) async {
      await event.when(
        getLangs: () => _onGetLangs(emit),
        requested: (query, order) => _onQandARequested(query, order, emit),
      );
    });
  }

  Future<void> _onQandARequested(
    String? query,
    OrderEnum? order,
    Emitter<QandAState> emit,
  ) async {
    emit(const QandAState.loading());
    Languages lang = Languages.defaultLang;
    if (qandAUserLanguagesHandler.getActiveLanguages().isNotEmpty) {
      lang = convertLanguagesEnum(
          qandAUserLanguagesHandler.getActiveLanguages().first);
    }
    final result = await qandARepository.getArticles(lang: lang, order: order);

    return result.fold(
        (falure) => emit(QandAState.error(falure.toUserFriendlyMessage())),
        (articles) {
      if (articles.isEmpty) {
        emit(const QandAState.empty());
      } else if (query != null && query.isNotEmpty) {
        final filteredArticles = articles.where((element) {
          if (RegExp(r'^[0-9]+$').hasMatch(query)) {
            return element.id.toString().contains(query.trim());
          } else {
            return element.title
                .toLowerCase()
                .contains(query.toLowerCase().trim());
          }
        }).toList();
        if (order == OrderEnum.random) {
          filteredArticles.shuffle();
        }
        emit(QandAState.success(filteredArticles));
      } else {
        if (order == OrderEnum.random) {
          articles.shuffle();
        }
        emit(QandAState.success(articles));
      }
    });
  }

  Future<void> _onGetLangs(
    Emitter<QandAState> emit,
  ) async {
    final result = await qandARepository.getAllLangs();
    return result.fold(
        (failure) => emit(QandAState.error(failure.toUserFriendlyMessage())),
        (langs) async {
      for (final lang in langs) {
        //add all new langs and set all new langs to false and locale lang to true

        if (!qandAUserLanguagesHandler.languages.containsKey(lang.name)) {
          await qandAUserLanguagesHandler.addLanguage(
              lang.name, lang.name == locale);
        }
      }
    });
  }
}
