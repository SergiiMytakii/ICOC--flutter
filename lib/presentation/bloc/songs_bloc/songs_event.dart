part of 'songs_bloc.dart';

@freezed
sealed class SongsEvent with _$SongsEvent {
  const factory SongsEvent.songsRequested() = SongsRequested;
}
