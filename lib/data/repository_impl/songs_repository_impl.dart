import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import 'package:icoc/core/model/resources.dart';

import 'package:icoc/core/model/song_detail.dart';
import 'package:icoc/core/repository/songs_repository.dart';
import 'package:icoc/data/firebase/database_firebase_service.dart';
import 'package:icoc/data/local/sqlite_helper_fts4.dart';

@dev
@prod
@Injectable(as: SongsRepository)
class SongsRepositoryImpl implements SongsRepository {
  DatabaseServiceFirebase databaseServiceFirebase;
  DatabaseHelperFTS4 databaseHelperFTS4;

  SongsRepositoryImpl({
    required this.databaseServiceFirebase,
    required this.databaseHelperFTS4,
  });
  @override
  Future<List<SongDetail>> getSongs() async {
    final QuerySnapshot snapshot = await databaseServiceFirebase.getSongs();
    final List<SongDetail> songList = _songListFromSnapshot(snapshot);
    return songList;
  }

  @override
  Future<void> insertAllSongsToLocalTable(List<SongDetail> songs) async {
    await databaseHelperFTS4.insertAllSongs(songs);
  }

  @override
  Future<List<SongDetail>> getSearchResult(
      String query, List<String> orderLang) async {
    return databaseHelperFTS4.getSearchResult(query, orderLang);
  }

  @override
  Future<List<int>> getFavoriteSongs() {
    return databaseHelperFTS4.getListFavorites();
  }

  @override
  Future<bool> setFavoriteSong(int id, bool isFavorite) {
    if (isFavorite)
      return databaseHelperFTS4.addToFavorites(id);
    else
      return databaseHelperFTS4.deleteFromFavorites(id);
  }

  @override
  Future<bool> getFavoriteSongStatus(int id) {
    return databaseHelperFTS4.getFavoriteStatus(id);
  }
}

//converting  snapshot to song list
List<SongDetail> _songListFromSnapshot(QuerySnapshot snapshot) {
  final List<SongDetail> songs = snapshot.docs.map(
    (doc) {
      Map data = doc.data() as Map;
      data =
          Map.fromEntries(data.entries.where((entry) => entry.value != null));
      data.forEach(
        (key, value) {
          if (value is Map) {
            data[key] = Map.fromEntries(
                value.entries.where((entry) => entry.value != null));
          }
        },
      );
      final List resourses =
          data['resources'] != null && data['resources'] is Iterable<dynamic>
              ? List.from(doc.get('resources'))
              : [];
      final song = SongDetail(
          id: int.parse(doc.id),
          description: data['description'] ?? {},
          text: data['text'] ?? {},
          title: data['title'] ?? {},
          chords: data['chords'] ?? {},
          resources: resourses.isNotEmpty
              ? resourses.map((item) {
                  //log.e(item);
                  return Resources.fromJson(item);
                }).toList()
              : []);
      return song;
    },
  ).toList();
  //delete nullable values
  songs.removeWhere((song) => song.text.isEmpty);
  songs.removeWhere((song) => song.title.isEmpty);
  return songs;
}
