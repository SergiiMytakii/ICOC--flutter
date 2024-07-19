import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/data_sources/local/local_db_data_source.dart';
import 'package:icoc/core/data_sources/remote/firebase_data_source.dart';
import 'package:injectable/injectable.dart';

import 'package:icoc/core/model/song_detail.dart';
import 'package:icoc/core/repository/songs_repository.dart';

@dev
@prod
@Injectable(as: SongsRepository)
class SongsRepositoryImpl implements SongsRepository {
  final FirebaseDataSource firebaseDataSource;
  final LocalSongsDB localDB;

  SongsRepositoryImpl({
    required this.firebaseDataSource,
    required this.localDB,
  });
  @override
  Future<List<SongDetail>> getSongs() async {
    final QuerySnapshot snapshot = await firebaseDataSource
        .getFromFirebase(FirebaseCollections.Songs.name);
    final List<SongDetail> songList = _songListFromSnapshot(snapshot);
    return songList;
  }

  @override
  Future<void> insertAllSongsToLocalTable(List<SongDetail> songs) async {
    await localDB.insertAllSongs(songs);
  }

  @override
  Future<List<SongDetail>> getSearchResult(
      String query, List<String> orderLang) async {
    return localDB.getSearchResult(query, orderLang);
  }

  @override
  Future<List<int>> getFavoriteSongs() {
    return localDB.getListFavorites();
  }

  @override
  Future<bool> setFavoriteSong(int id, bool isFavorite) {
    if (isFavorite)
      return localDB.addToFavorites(id);
    else
      return localDB.deleteFromFavorites(id);
  }

  @override
  Future<bool> getFavoriteSongStatus(int id) {
    return localDB.getFavoriteStatus(id);
  }
}

//converting  snapshot to song list
List<SongDetail> _songListFromSnapshot(QuerySnapshot snapshot) {
  final List<SongDetail> songs = snapshot.docs.map(
    (doc) {
      final Map data = doc.data() as Map;
      final song = SongDetail.fromJson(data, int.parse(doc.id));
      return song;
    },
  ).toList();
  songs.removeWhere((song) => song.text.isEmpty);
  songs.removeWhere((song) => song.title.isEmpty);
  return songs;
}
