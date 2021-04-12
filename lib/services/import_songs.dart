import 'dart:async' show Future;
import 'package:Projects/song_book/models/song.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


class ImportSongs{

  List<Song> songsFromJson = [];


  Future<String> loadSongsAsset() async {

    return await rootBundle.loadString('assets/songs.json');
  }


  Future <List<Song>> loadSongsFromJson() async {
    print('start parsing');
    String jsonString = await loadSongsAsset();
    //print(jsonString);
    final jsonResponse = json.decode(jsonString);
    //print(jsonResponse);
    for(Map<String, dynamic> item in jsonResponse) {
        Song song = new Song.fromJson(item);
        //print(song.id);
        songsFromJson.add(song);



    }
    return songsFromJson;



  }


}