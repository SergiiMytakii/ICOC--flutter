part of 'songs_bloc.dart';

@freezed
class SongsState with _$SongsState {
  const factory SongsState.initial() = SongsInitial;
  const factory SongsState.loading() = SongsLoadingState;
  const factory SongsState.empty() = EmptySongsState;
  const factory SongsState.success(List<SongModel> songs) =
      GetSongsSuccessState;
  const factory SongsState.searchSuccess(List<SongVersionLocal> songVersions) =
      SearchSongsSuccessState;
  const factory SongsState.error(String message) = SongsErrorState;
}
