part of 'songs_bloc.dart';

@freezed
sealed class SongsEvent with _$SongsEvent {
  const factory SongsEvent.songsRequested() = _SongsRequested;
  const factory SongsEvent.searchByNumber(String query) = _SearchSongByNumber;
  const factory SongsEvent.searchByText(String query) = _SearchSongByText;
  const factory SongsEvent.clearSearch() = _SearchSongClear;
  const factory SongsEvent.screenOpened() = _SongsScreenOpened;
  const factory SongsEvent.songOpened(int songId) = _SongOpened;
}
