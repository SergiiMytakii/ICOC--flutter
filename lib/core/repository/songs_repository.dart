import '../model/song_detail.dart';

abstract class SongsRepository {
  Future<List<SongDetail>> getSongs();
  Future<List<int>> getFavoriteSongs();
  Future<bool> setFavoriteSong(int id, bool isFavorite);
  Future<bool> getFavoriteSongStatus(int id);
  Future<void> insertAllSongsToLocalTable(List<SongDetail> songs);
  Future<List<SongDetail>> getSearchResult(
      String query, List<String> orderLang);
}
