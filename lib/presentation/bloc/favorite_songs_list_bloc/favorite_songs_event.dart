part of 'favorite_songs_bloc.dart';

@immutable
sealed class FavoriteSongsListEvent {}

class FavoriteSongsListRequested extends FavoriteSongsListEvent {}
