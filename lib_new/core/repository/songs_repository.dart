import '../model/song_detail.dart';

abstract class SongsRepository {
  Future<List<SongDetail>> getSongs();
  Future<void> insertAllSongsToLocalTable(List<SongDetail> songs);
  Future<List<SongDetail>> getListSongs();
  Future<List<SongDetail>> getSearchResultByNumber(String query);
  Future<List<SongDetail>> getSearchResult(String query);
}
