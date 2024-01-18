part of 'favorite_songs_bloc.dart';

@immutable
sealed class FavoriteSongStatusEvent {
  Stream<FavoriteSongStatusState> applyAsync(
      {FavoriteSongStatusState currentState, FavoriteSongStatusBloc bloc});
}

class FavoriteSongStatusRequested extends FavoriteSongStatusEvent {
  final int id;
  final SongsRepositoryImpl songsRepositoryImpl = SongsRepositoryImpl();

  FavoriteSongStatusRequested({required this.id});
  @override
  Stream<FavoriteSongStatusState> applyAsync(
      {FavoriteSongStatusState? currentState,
      FavoriteSongStatusBloc? bloc}) async* {
    final log = Logger();
    try {
      yield FavoriteSongStatusLoadingState();
      final bool isFavorite =
          await songsRepositoryImpl.getFavoriteSongStatus(id);
      yield GetFavoriteSongStatusSuccessState(isFavorite);
    } catch (_, stackTrace) {
      log.e('$_', error: _, stackTrace: stackTrace);
      yield FavoriteSongStatusErrorState(_.toString());
    }
  }
}

class SetFavoriteSongStatusRequested extends FavoriteSongStatusEvent {
  final int id;
  final bool isFavorite;
  final SongsRepositoryImpl songsRepositoryImpl = SongsRepositoryImpl();

  SetFavoriteSongStatusRequested({required this.id, required this.isFavorite});
  @override
  Stream<FavoriteSongStatusState> applyAsync(
      {FavoriteSongStatusState? currentState,
      FavoriteSongStatusBloc? bloc}) async* {
    final log = Logger();
    try {
      yield FavoriteSongStatusLoadingState();
      final bool result =
          await songsRepositoryImpl.setFavoriteSong(id, isFavorite);
      if (result) {
        yield GetFavoriteSongStatusSuccessState(isFavorite);
      } else {
        yield FavoriteSongStatusErrorState("Error".tr());
      }
    } catch (_, stackTrace) {
      log.e('$_', error: _, stackTrace: stackTrace);
      yield FavoriteSongStatusErrorState(_.toString());
    }
  }
}
