import 'package:icoc/core/model/songs/song_model.dart';

abstract class LocalSongsDB {
  Future<bool> insertAllSongs(List<SongModel> songs);
  Future<void> printSongsDBHead();
  Future<bool> addToFavorites(int id);
  Future<bool> deleteFromFavorites(int id);
  Future<bool> getFavoriteStatus(int id);
  Future<List<int>> getListFavorites();
  Future<List<SongVersionLocal>> getSearchResult(
    String query,
  );
}
