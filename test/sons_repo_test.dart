import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:icoc/domain/repository/songs_repository.dart';
import 'package:icoc/injection.dart';
import 'package:injectable/injectable.dart' as i;
import 'package:mockito/mockito.dart';

void main() {
  setUpAll(() {
    configureDependencies(i.Environment.test);
  });

  group('SonngsRepository', () {
    test('test fetch songs', () async {
      final mockSongsRepository = getIt<SongsRepository>();
      // Arrange
      final expectedSongs = [
        const SongModel(id: 1, songVersions: []),
        const SongModel(id: 2, songVersions: []),
      ];
      when(mockSongsRepository.getSongs())
          .thenAnswer((_) async => Future.value(expectedSongs));

      // Act
      final songs = await mockSongsRepository.getSongs();

      // Assert
      expect(songs, equals(expectedSongs));
    });
  });
}
