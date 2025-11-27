part of 'favorite_songs_status_bloc.dart';

@freezed
sealed class FavoriteSongStatusEvent with _$FavoriteSongStatusEvent {
  const factory FavoriteSongStatusEvent.statusRequested({required int id}) =
      FavoriteSongStatusRequested;
  const factory FavoriteSongStatusEvent.setStatusRequested(
      {required int id,
      required bool isFavorite}) = SetFavoriteSongStatusRequested;
}
