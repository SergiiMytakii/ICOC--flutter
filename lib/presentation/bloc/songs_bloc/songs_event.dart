part of 'songs_bloc.dart';

sealed class SongsEvent {}

bool sqliteBDisUpdated = false;
List<SongDetail>? cache;

class SongsRequested extends SongsEvent {
  SongsRequested({this.useCache = true});
  final bool useCache;
}

class SearchSongRequested extends SongsEvent {
  SearchSongRequested(this.query);
  final String query;
}
