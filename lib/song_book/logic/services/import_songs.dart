import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import '/index.dart';

class ImportSongs {
  List<SongDetail> songsFromJson = [];

  Future<String> loadSongsAsset() async {
    return await rootBundle.loadString('assets/songs.json');
  }

  Future<List<SongDetail>> loadSongsFromJson() async {
    print('start parsing');
    String jsonString = await loadSongsAsset();
    //print(jsonString);
    final jsonResponse = json.decode(jsonString);
    //print(jsonResponse);
    for (Map<String, dynamic> item in jsonResponse) {
      SongDetail song = new SongDetail.fromJson(item);
      //print(song.id);
      songsFromJson.add(song);
    }
    return songsFromJson;
  }
}
