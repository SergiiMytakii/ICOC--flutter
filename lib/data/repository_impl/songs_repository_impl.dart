import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/local/local_db_data_source.dart';
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:injectable/injectable.dart';
import 'package:icoc/domain/repository/songs_repository.dart';

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
  Future<List<SongModel>> getSongs() async {
    final QuerySnapshot snapshot = await firebaseDataSource
        .getFromFirebase(FirebaseCollections.SongsV2.name);
    // .getFromFirebase('Songs');
    final List<SongModel> songs = snapshot.docs.map(
      (doc) {
        return SongModel.fromJson(doc.data() as Map<String, dynamic>);
      },
    ).toList();

    // insert into SongsV2
    // _convertSongsToV2(snapshot, firebaseDataSource);

    return songs;
  }

  @override
  Future<bool> insertAllSongsToLocalTable(List<SongModel> songs) async {
    return await localDB.insertAllSongs(songs);
  }

  @override
  Future<List<SongVersionLocal>> getSearchResult(
    String query,
  ) async {
    return localDB.getSearchResult(query);
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
