import 'package:icoc/core/repository/songs_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

// @test
// @Injectable(as: SongsRepository)
class MockSongsRepository extends Mock implements SongsRepository {}
