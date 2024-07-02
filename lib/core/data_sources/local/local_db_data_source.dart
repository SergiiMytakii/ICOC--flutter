import 'package:icoc/core/model/song_detail.dart';

abstract class LocalSongsDB {
  Future<void> insertAllSongs(List<SongDetail> songs);
  Future<void> printSongsDBHead();
  Future<bool> addToFavorites(int id);
  Future<bool> deleteFromFavorites(int id);
  Future<bool> getFavoriteStatus(int id);
  Future<List<int>> getListFavorites();
  Future<List<SongDetail>> getSearchResult(
      String query, List<String> languagesToShow);
}
