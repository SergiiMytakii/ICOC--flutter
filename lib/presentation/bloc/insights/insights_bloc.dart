import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/repository/insights_repository.dart';
import 'package:icoc/presentation/bloc/insights/insights_event.dart';
import 'package:icoc/presentation/bloc/insights/insights_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class InsightsBloc extends Bloc<InsightsEvent, InsightsState> {
  final InsightsRepository _insightsRepository;
  final InsightsUserLanguagesHandler _userLanguagesHandler;

  InsightsBloc(this._insightsRepository, this._userLanguagesHandler)
      : super(const InsightsState.initial()) {
    on<InsightsEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const InsightsState.loading());
          final languages = _userLanguagesHandler.getActiveLanguages();
          final result = await _insightsRepository.getPosts(languages: languages);
          result.fold(
            (failure) => emit(InsightsState.error(failure.toUserFriendlyMessage())),
            (posts) => emit(InsightsState.loaded(posts)),
          );
        },
      );
    });
  }
}
