part of 'favorite_songs_bloc.dart';

@freezed
class FavoriteSongsEvent with _$FavoriteSongsEvent {
  const factory FavoriteSongsEvent.getRequested() = FavoriteSongsListRequested;
}
