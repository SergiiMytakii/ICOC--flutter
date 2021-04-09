import 'package:Projects/services/import_songs.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/models/song_from_json.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  bool? _en;
  bool? _ru;
  bool? _ukr;

  //get access to database
  final CollectionReference songCollection =
      FirebaseFirestore.instance.collection('Songs');

  //just to check how we can write to DB
  Future updateSongTest() async {
    List<SongFromJson> songJ =  await ImportSongs().loadSongsFromJson();

for(SongFromJson song in songJ) {
      Song songNew = convertToSong(song);
      //print(" new song ${songNew.title}");
      await songCollection.doc(songNew.id).set({
        'text': songNew.text ?? null,
        'title': songNew.title ?? null,
        'description': songNew.description ?? null,
      });
    }
  }

  //converting  snapshot to song list
  List<Song?> _songListFromSnapshot(QuerySnapshot snapshot) {
    List<Song?> songs = snapshot.docs.map((doc) {
      return Song(
          id: doc.id,
          description: doc.data()['description'] ?? {},
          text: doc.data()['text'] ?? {},
          title: doc.data()['title'] ?? {},
          createdAt: doc.data()['created_at'] ?? '',
          chords: doc.data()['chords'] ?? {},
          resources: doc.data()['resources'] ?? []);
    }).toList();
    //get rid from nullable songs
    songs.removeWhere((song) => song == null);
    return songs;
  }

  //get songs stream
  Stream<List<Song?>> get songs {
    //updateSongTest();
    return songCollection.orderBy('title').snapshots().map(_songListFromSnapshot);
  }

  Song convertToSong(SongFromJson songFromJson) {
    return  Song(
      id: songFromJson.id,
      title: {'ru': songFromJson.title},
      text: {'ru1': songFromJson.text},
      description: {'ru': songFromJson.description}

    );
  }
}


