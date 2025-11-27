import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:icoc/domain/repository/songs_repository.dart';
import 'package:icoc/core/errors/failures.dart';

void main() {
  setUpAll(() {});

  group('SonngsRepository', () {
    test('test fetch songs', () async {
      // Arrange
      final expectedSongs = [
        const SongModel(id: 1, songVersions: []),
        const SongModel(id: 2, songVersions: []),
      ];
      final mockSongsRepository = _FakeSongsRepository(expectedSongs);
      

      // Act
      final result = await mockSongsRepository.getSongs();

      // Assert
      expect(result, equals(Right(expectedSongs)));
    });
  });
}

class _FakeSongsRepository implements SongsRepository {
  _FakeSongsRepository(this._songs);
  final List<SongModel> _songs;

  @override
  Future<Either<Failure, List<SongModel>>> getSongs() async {
    return Right(_songs);
  }

  @override
  Future<Either<Failure, Set<int>>> getFavoriteSongs() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> getFavoriteSongStatus(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> insertAllSongsToLocalTable(
      List<SongModel> songs) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> setFavoriteSong(int id, bool isFavorite) async {
    return Right(true);
  }

  @override
  Future<Either<Failure, List<SongVersionLocal>>> getSearchResult(String query) {
    throw UnimplementedError();
  }
}
