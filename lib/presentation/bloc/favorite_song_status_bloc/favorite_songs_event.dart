part of 'favorite_songs_bloc.dart';

@immutable
sealed class FavoriteSongStatusEvent {}

class FavoriteSongStatusRequested extends FavoriteSongStatusEvent {
  final int id;

  FavoriteSongStatusRequested({required this.id});
}

class SetFavoriteSongStatusRequested extends FavoriteSongStatusEvent {
  final int id;
  final bool isFavorite;

  SetFavoriteSongStatusRequested({required this.id, required this.isFavorite});
}
