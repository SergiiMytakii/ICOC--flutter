part of 'songs_bloc.dart';

@freezed
class SongsState with _$SongsState {
  const factory SongsState.initial() = SongsInitial;
  const factory SongsState.loading() = SongsLoadingState;
  const factory SongsState.success(List<SongDetail> songs) =
      GetSongsSuccessState;
  const factory SongsState.error(String message) = SongsErrorState;
}
