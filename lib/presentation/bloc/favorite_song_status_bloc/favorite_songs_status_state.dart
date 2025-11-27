part of 'favorite_songs_status_bloc.dart';

@freezed
class FavoriteSongStatusState with _$FavoriteSongStatusState {
  const factory FavoriteSongStatusState.initial() = FavoriteSongStatusInitial;
  const factory FavoriteSongStatusState.loading() =
      FavoriteSongStatusLoadingState;
  const factory FavoriteSongStatusState.success({required bool isFavorite}) =
      GetFavoriteSongStatusSuccessState;
  const factory FavoriteSongStatusState.error({required String message}) =
      FavoriteSongStatusErrorState;
}
