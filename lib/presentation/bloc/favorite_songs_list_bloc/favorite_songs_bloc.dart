import 'package:bloc/bloc.dart';
import 'package:icoc/core/helpers/filter_songs_halper.dart';
import 'package:icoc/core/helpers/order_song_helper.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/repository/songs_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_songs_event.dart';
part 'favorite_songs_state.dart';
part 'favorite_songs_bloc.freezed.dart';

@singleton
class FavoriteSongsListBloc
    extends Bloc<FavoriteSongsEvent, FavoriteSongsState> {
  final SongsRepository songsRepositoryImpl;
  final SongsUserLanguagesHandler songsUserLanguagesHandler;

  FavoriteSongsListBloc(
      this.songsRepositoryImpl, this.songsUserLanguagesHandler)
      : super(const FavoriteSongsState.initial()) {
    on<FavoriteSongsEvent>((event, emit) async {
      await event.map(
        getRequested: (event) => _onFavoriteSongsListRequested(event, emit),
      );
    });
  }

  Future<void> _onFavoriteSongsListRequested(
    FavoriteSongsListRequested event,
    Emitter<FavoriteSongsState> emit,
  ) async {
    emit(const FavoriteSongsState.loading());
    final favoriteSongsResult = await songsRepositoryImpl.getFavoriteSongs();
    favoriteSongsResult.fold(
      (failure) {
        emit(FavoriteSongsState.error(failure.toUserFriendlyMessage()));
      },
      (favoriteSongsIds) async {
        if (favoriteSongsIds.isNotEmpty) {
          final songsResult = await songsRepositoryImpl.getSongs();

          songsResult.fold(
            (failure) {
              emit(FavoriteSongsState.error(failure.toUserFriendlyMessage()));
            },
            (songs) async {
              final favoriteSongs = songs
                  .where((song) => favoriteSongsIds.contains(song.id))
                  .toList();
              final filteredSongs = await filterSongsByLang(
                  favoriteSongs, songsUserLanguagesHandler);
              final orderedSongs =
                  await orderSongs(filteredSongs, songsUserLanguagesHandler);
              emit(FavoriteSongsState.success(orderedSongs));
            },
          );
        } else {
          emit(const FavoriteSongsState.success([]));
        }
      },
    );
  }
}
