import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:icoc/core/errors/failures.dart';
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
    emit(const FavoriteSongStatusState.loading());
    final Either<Failure, bool> result =
        await songsRepositoryImpl.getFavoriteSongStatus(event.id);
    return result.fold(
      (failure) => emit(FavoriteSongStatusState.error(
          message: failure.toUserFriendlyMessage())),
      (isFavorite) =>
          emit(FavoriteSongStatusState.success(isFavorite: isFavorite)),
    );
  }

  Future<void> _onSetFavoriteSongStatusRequested(
    SetFavoriteSongStatusRequested event,
    Emitter<FavoriteSongStatusState> emit,
  ) async {
    emit(const FavoriteSongStatusState.loading());
    final Either<Failure, bool> result =
        await songsRepositoryImpl.setFavoriteSong(event.id, event.isFavorite);
    return result.fold(
      (failure) => emit(FavoriteSongStatusState.error(
          message: failure.toUserFriendlyMessage())),
      (success) {
        emit(FavoriteSongStatusState.success(isFavorite: event.isFavorite));
      },
    );
  }
}
