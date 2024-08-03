import 'package:icoc/core/model/songs/song_model.dart';

abstract class SongsRepository {
  Future<List<SongModel>> getSongs();
  Future<List<int>> getFavoriteSongs();
  Future<bool> setFavoriteSong(int id, bool isFavorite);
  Future<bool> getFavoriteSongStatus(int id);
  Future<bool> insertAllSongsToLocalTable(List<SongModel> songs);
  Future<List<SongVersionLocal>> getSearchResult(
    String query,
  );
}
