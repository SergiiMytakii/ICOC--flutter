part of 'songs_bloc.dart';

@immutable
sealed class SongsState {}

final class SongsInitial extends SongsState {}

final class SongsLoadingState extends SongsState {}

final class GetSongsSuccessState extends SongsState {
  GetSongsSuccessState(this.songs);
  final List<SongDetail> songs;
}

final class SearchSongsSuccessState extends SongsState {
  SearchSongsSuccessState(this.songs);
  final List<SongDetail> songs;
}

final class SongsErrorState extends SongsState {
  SongsErrorState(this.message);
  final String message;
}
