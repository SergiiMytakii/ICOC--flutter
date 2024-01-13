import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

import '../../core/model/resources.dart';
import '../../core/model/song_detail.dart';

class DatabaseServiceFirebase {
  var log = Logger();
  // final SongLangController songLangController = Get.find();
  final db = FirebaseFirestore.instance;
  late CollectionReference songCollection;

  DatabaseServiceFirebase() {
    db.settings = const Settings(persistenceEnabled: true);

    songCollection = db.collection('Songs');
    //print(songCollection.get().);
  }

  //converting  snapshot to song list
  List<SongDetail> _songListFromSnapshot(QuerySnapshot snapshot) {
    List<SongDetail> songs = snapshot.docs.map((doc) {
      Map data = doc.data() as Map;

      data =
          Map.fromEntries(data.entries.where((entry) => entry.value != null));

      data.forEach((key, value) {
        if (value is Map) {
          data[key] = Map.fromEntries(
              value.entries.where((entry) => entry.value != null));
        }
      });

      List resourses =
          data['resources'] != null && data['resources'] is Iterable<dynamic>
              ? List.from(doc.get('resources'))
              : [];

      final song = SongDetail(
          id: data['id'] ?? 0,
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
      // return cleanSong(song);
    }).toList();

    //get rid from nullable values

    songs.removeWhere((song) => song.text.isEmpty);
    songs.removeWhere((song) => song.title.isEmpty);
    return songs;
  }

  //get songs
  Future<List<SongDetail>> getSongs() async {
    QuerySnapshot snapshot = await songCollection.get();
    List<SongDetail> songList = _songListFromSnapshot(snapshot);
    return songList;
  }
}
