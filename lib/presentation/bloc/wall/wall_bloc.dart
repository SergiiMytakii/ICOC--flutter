import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/repository/wall_repository.dart';
import 'package:icoc/presentation/bloc/wall/wall_event.dart';
import 'package:icoc/presentation/bloc/wall/wall_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class WallBloc extends Bloc<WallEvent, WallState> {
  final WallRepository _wallRepository;
  final WallUserLanguagesHandler _userLanguagesHandler;

  WallBloc(this._wallRepository, this._userLanguagesHandler)
      : super(const WallState.initial()) {
    on<WallEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const WallState.loading());
          final languages = _userLanguagesHandler.getActiveLanguages();
          final result = await _wallRepository.getPosts(languages: languages);
          result.fold(
            (failure) => emit(WallState.error(failure.toUserFriendlyMessage())),
            (posts) => emit(WallState.loaded(posts)),
          );
        },
      );
    });
  }
}
