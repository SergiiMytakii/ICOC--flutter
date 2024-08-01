import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/data_sources/local/local_db_data_source.dart';
import 'package:icoc/core/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/core/helpers/convert_languages_enum.dart';
import 'package:icoc/core/model/songs/song_model.dart';
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
  Future<void> insertAllSongsToLocalTable(List<SongDetail> songs) async {
    await localDB.insertAllSongs(songs);
  }

  @override
  Future<List<SongVersionLocal>> getSearchResult(
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

List<SongModel> songmodels = [];
void _convertSongsToV2(
    QuerySnapshot snapshot, FirebaseDataSource firebaseDataSource) async {
  final List<SongDetail> songs = snapshot.docs.map(
    (doc) {
      final Map data = doc.data() as Map;
      final song = SongDetail.fromJson(data, int.parse(doc.id));

      song.text.removeWhere((key, value) => value.isEmpty);
      song.title.removeWhere((key, value) => value.isEmpty);
      song.description?.removeWhere((key, value) => value.isEmpty);

      final List<SongVersion> versions = [];

      for (MapEntry x in song.text.entries) {
        versions.add(SongVersion(
            id: song.id,
            lang: languagesToEnumMap[x.key.toString().substring(0, 2)]!,
            text: x.value ?? '',
            title: song.title[x.key.toString().substring(0, 2)] ?? '',
            description:
                song.description?[x.key.toString().substring(0, 2)] ?? '',
            youtubeVideos: song.youtubeVideos
                ?.where((item) => item.lang == x.key.toString().substring(0, 2))
                .toList()));
      }
      if (song.chords != null) {
        for (MapEntry x in song.chords!.entries) {
          versions.add(SongVersion(
              id: song.id,
              lang: Languages.en,
              text: x.value,
              title: '',
              isChords: true));
        }
      }
      final SongModel songModel = SongModel(
        id: int.parse(doc.id),
        songVersions: versions,
      );

      songmodels.add(songModel);

      return song;
    },
  ).toList();

  for (final song in songmodels) {
    final data = song.toJson();
    firebaseDataSource.postToFirebase('SongsV2', data);
  }
}
