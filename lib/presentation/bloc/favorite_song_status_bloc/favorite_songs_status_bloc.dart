import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/repository/songs_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favorite_songs_status_event.dart';
part 'favorite_songs_status_state.dart';
part 'favorite_songs_status_bloc.freezed.dart';

@singleton
class FavoriteSongStatusBloc
    extends Bloc<FavoriteSongStatusEvent, FavoriteSongStatusState> {
  final SongsRepository songsRepositoryImpl;

  FavoriteSongStatusBloc(this.songsRepositoryImpl)
      : super(const FavoriteSongStatusState.initial()) {
    on<FavoriteSongStatusEvent>((event, emit) async {
      await event.map(
        statusRequested: (e) => _onFavoriteSongStatusRequested(e, emit),
        setStatusRequested: (e) => _onSetFavoriteSongStatusRequested(e, emit),
      );
    });
  }

  Future<void> _onFavoriteSongStatusRequested(
    FavoriteSongStatusRequested event,
    Emitter<FavoriteSongStatusState> emit,
  ) async {
    try {
      emit(const FavoriteSongStatusState.loading());
      final bool isFavorite =
          await songsRepositoryImpl.getFavoriteSongStatus(event.id);
      emit(FavoriteSongStatusState.success(isFavorite: isFavorite));
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(FavoriteSongStatusState.error(message: error.toString()));
    }
  }

  Future<void> _onSetFavoriteSongStatusRequested(
    SetFavoriteSongStatusRequested event,
    Emitter<FavoriteSongStatusState> emit,
  ) async {
    try {
      emit(const FavoriteSongStatusState.loading());
      final result =
          await songsRepositoryImpl.setFavoriteSong(event.id, event.isFavorite);
      if (result) {
        emit(FavoriteSongStatusState.success(isFavorite: event.isFavorite));
      } else {
        emit(FavoriteSongStatusState.error(message: 'Error'.tr()));
      }
    } catch (error, stackTrace) {
      logError(error, stackTrace);
      emit(FavoriteSongStatusState.error(message: error.toString()));
    }
  }
}
