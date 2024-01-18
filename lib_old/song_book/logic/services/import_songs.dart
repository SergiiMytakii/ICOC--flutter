import 'dart:convert';

import '../../../index.dart';
import 'dart:async';

class ImportSongs {
  List<SongDetail> songsFromJson = [];

//когда песни были в отдельном файле
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
