import 'package:flutter_test/flutter_test.dart';
import 'package:icoc/core/model/song_detail.dart';
import 'package:icoc/core/repository/songs_repository.dart';
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
        SongDetail(id: 1, title: {'en': 'Song 1'}, text: {'en1': 'Lyrics 1'}),
        SongDetail(id: 2, title: {'en': 'Song 2'}, text: {'en1': 'Lyrics 2'}),
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
