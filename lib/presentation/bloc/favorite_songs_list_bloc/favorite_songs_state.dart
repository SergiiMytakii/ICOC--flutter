part of 'favorite_songs_bloc.dart';

@freezed
class FavoriteSongsState with _$FavoriteSongsState {
  const factory FavoriteSongsState.initial() = FavoriteSongsInitial;
  const factory FavoriteSongsState.loading() = FavoriteSongsLoadingState;
  const factory FavoriteSongsState.success(List<SongDetail> songs) =
      GetFavoriteSongsSuccessState;
  const factory FavoriteSongsState.error(String message) =
      FavoriteSongsErrorState;
}
