part of 'songs_bloc.dart';

@freezed
sealed class SongsEvent with _$SongsEvent {
  const factory SongsEvent.songsRequested({@Default(true) bool useCache}) =
      SongsRequested;
  const factory SongsEvent.searchSongRequested(String query) =
      SearchSongRequested;
}
