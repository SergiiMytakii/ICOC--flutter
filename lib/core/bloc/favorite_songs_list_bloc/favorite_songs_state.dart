part of 'favorite_songs_bloc.dart';

@immutable
sealed class FavoriteSongsState {}

final class FavoriteSongsInitial extends FavoriteSongsState {}

final class FavoriteSongsLoadingState extends FavoriteSongsState {}

final class GetFavoriteSongsListSuccessState extends FavoriteSongsState {
  GetFavoriteSongsListSuccessState(this.songs);
  final List<SongDetail> songs;
}

final class FavoriteSongsErrorState extends FavoriteSongsState {
  FavoriteSongsErrorState(this.message);
  final String message;
}
