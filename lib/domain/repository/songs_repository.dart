import 'package:dartz/dartz.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:icoc/core/errors/failures.dart';

abstract class SongsRepository {
  Future<Either<Failure, List<SongModel>>> getSongs();
  Future<Either<Failure, List<int>>> getFavoriteSongs();
  Future<Either<Failure, bool>> setFavoriteSong(int id, bool isFavorite);
  Future<Either<Failure, bool>> getFavoriteSongStatus(int id);
  Future<Either<Failure, bool>> insertAllSongsToLocalTable(
      List<SongModel> songs);
  Future<Either<Failure, List<SongVersionLocal>>> getSearchResult(
    String query,
  );
}
