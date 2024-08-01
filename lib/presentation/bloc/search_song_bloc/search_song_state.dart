part of 'search_song_bloc.dart';

@freezed
class SearchSongState with _$SearchSongState {
  const factory SearchSongState.initial() = _SearchSongInitial;
  const factory SearchSongState.loading() = _SearchSongLoading;
  const factory SearchSongState.success(List songs) = _SearchSongSuccess;
  const factory SearchSongState.error(String message) = _SearchSongError;
}
