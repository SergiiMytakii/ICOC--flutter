part of 'favorite_songs_bloc.dart';

@immutable
sealed class FavoriteSongStatusState {}

final class FavoriteSongStatusInitial extends FavoriteSongStatusState {}

final class FavoriteSongStatusLoadingState extends FavoriteSongStatusState {}

final class GetFavoriteSongStatusSuccessState extends FavoriteSongStatusState {
  GetFavoriteSongStatusSuccessState(this.isFavorite);
  final bool isFavorite;
}
// final class SetFavoriteSongStatusSuccessState extends FavoriteSongsState {
//   SetFavoriteSongStatusSuccessState(this.isFavorite);
//   final bool isFavorite;
// }

final class FavoriteSongStatusErrorState extends FavoriteSongStatusState {
  FavoriteSongStatusErrorState(this.message);
  final String message;
}
