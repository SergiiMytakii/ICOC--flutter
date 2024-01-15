import '../../core/model/song_detail.dart';
import '../../core/repository/songs_repository.dart';
import '../firebase/database_firebase_service.dart';
import '../local/sqlite_helper_fts4.dart';

class SongsRepositoryImpl implements SongsRepository {
  @override
  Future<List<SongDetail>> getSongs() {
    DatabaseServiceFirebase databaseServiceFirebase = DatabaseServiceFirebase();
    Future<List<SongDetail>> songs = databaseServiceFirebase.getSongs();
    return songs;
  }

  @override
  Future<void> insertAllSongsToLocalTable(List<SongDetail> songs) async {
    DatabaseHelperFTS4 databaseHelperFTS4 = DatabaseHelperFTS4();
    await databaseHelperFTS4.insertAllSongs(songs);
  }

  @override
  Future<List<SongDetail>> getSearchResult(
      String query, List<String> orderLang) async {
    DatabaseHelperFTS4 databaseHelperFTS4 = DatabaseHelperFTS4();
    return databaseHelperFTS4.getSearchResult(query, orderLang);
  }
}
