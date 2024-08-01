part of 'search_song_bloc.dart';

@freezed
class SearchSongEvent with _$SearchSongEvent {
  const factory SearchSongEvent.searchByNumber(String query) =
      _SearchSongByNumber;
  const factory SearchSongEvent.searchByText(String query) = _SearchSongByText;
  const factory SearchSongEvent.clearSearch() = _SearchSongClear;
}
