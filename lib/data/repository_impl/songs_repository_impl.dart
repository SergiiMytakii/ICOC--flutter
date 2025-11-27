import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/data_sources/local/local_db_data_source.dart';
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:injectable/injectable.dart';
import 'package:icoc/domain/repository/songs_repository.dart';

@dev
@prod
@Injectable(as: SongsRepository)
class SongsRepositoryImpl implements SongsRepository {
  final FirebaseDataSource firebaseDataSource;
  final LocalSongsDB localDB;

  SongsRepositoryImpl({
    required this.firebaseDataSource,
    required this.localDB,
  });

  @override
  Future<Either<Failure, List<SongModel>>> getSongs() async {
    try {
      final QuerySnapshot snapshot = await firebaseDataSource
          .getFromFirebase(FirebaseCollections.SongsV2.name);
      final List<SongModel> songs = snapshot.docs.map(
        (doc) {
          return SongModel.fromJson(doc.data() as Map<String, dynamic>);
        },
      ).toList();
      return Right(songs);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, bool>> insertAllSongsToLocalTable(
      List<SongModel> songs) async {
    try {
      final result = await localDB.insertAllSongs(songs);
      return Right(result);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.internal());
    }
  }

  @override
  Future<Either<Failure, List<SongVersionLocal>>> getSearchResult(
      String query) async {
    try {
      final result = await localDB.getSearchResult(query);
      return Right(result);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.internal());
    }
  }

  @override
  Future<Either<Failure, Set<int>>> getFavoriteSongs() async {
    try {
      final result = await localDB.getListFavorites();
      return Right(result);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.internal());
    }
  }

  @override
  Future<Either<Failure, bool>> setFavoriteSong(int id, bool isFavorite) async {
    try {
      final result = isFavorite
          ? await localDB.addToFavorites(id)
          : await localDB.deleteFromFavorites(id);
      return Right(result);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.internal());
    }
  }

  @override
  Future<Either<Failure, bool>> getFavoriteSongStatus(int id) async {
    try {
      final result = await localDB.getFavoriteStatus(id);
      return Right(result);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.internal());
    }
  }
}
