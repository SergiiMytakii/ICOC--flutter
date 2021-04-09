import 'dart:async' show Future;

import 'package:Projects/song_book/models/song_from_json.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


class ImportSongs{

  List<SongFromJson> songsFromJson = [];


  Future<String> loadSongsAsset() async {

    return await rootBundle.loadString('assets/songs.json');
  }


  Future <List<SongFromJson>> loadSongsFromJson() async {
    //print('start parsing');
    String jsonString = await loadSongsAsset();
    //print(jsonString);
    final jsonResponse = json.decode(jsonString);
    for(Map<String, dynamic> item in jsonResponse) {

      if(item.values.contains('russian')) {

        SongFromJson songFromJson = new SongFromJson.fromJson(item);

        print(songFromJson.title);
        songsFromJson.add(songFromJson);
      }

    }
    return songsFromJson;
    // print(songsFromJson.first.title);
    // print(songsFromJson.first.description);
    // print(songsFromJson.first.text);
    // print(songsFromJson.first.language);


  }

// List<SongFromJson> get songsFromJ{
//     return songsFromJson;
// }

}