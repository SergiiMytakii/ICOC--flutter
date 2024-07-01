import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/repository/songs_repository.dart';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'favorite_songs_event.dart';
part 'favorite_songs_state.dart';

@singleton
class FavoriteSongStatusBloc
    extends Bloc<FavoriteSongStatusEvent, FavoriteSongStatusState> {
  final SongsRepository songsRepositoryImpl;

  FavoriteSongStatusBloc(this.songsRepositoryImpl)
      : super(FavoriteSongStatusInitial()) {
    on<FavoriteSongStatusRequested>(_onFavoriteSongStatusRequested);
    on<SetFavoriteSongStatusRequested>(_onSetFavoriteSongStatusRequested);
  }

  Future<void> _onFavoriteSongStatusRequested(
    FavoriteSongStatusRequested event,
    Emitter<FavoriteSongStatusState> emit,
  ) async {
    try {
      emit(FavoriteSongStatusLoadingState());
      final bool isFavorite =
          await songsRepositoryImpl.getFavoriteSongStatus(event.id);
      emit(GetFavoriteSongStatusSuccessState(isFavorite));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(FavoriteSongStatusErrorState(error.toString()));
    }
  }

  Future<void> _onSetFavoriteSongStatusRequested(
    SetFavoriteSongStatusRequested event,
    Emitter<FavoriteSongStatusState> emit,
  ) async {
    try {
      emit(FavoriteSongStatusLoadingState());
      final result =
          await songsRepositoryImpl.setFavoriteSong(event.id, event.isFavorite);
      if (result) {
        emit(GetFavoriteSongStatusSuccessState(event.isFavorite));
      } else {
        emit(FavoriteSongStatusErrorState("Error".tr()));
      }
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(FavoriteSongStatusErrorState(error.toString()));
    }
  }
}
