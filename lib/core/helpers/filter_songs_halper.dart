import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:icoc/core/user_languages.dart';

Future<List<SongModel>> filterSongsByLang(
    List<SongModel> songs, SongsUserLanguagesHandler songsUserLanguages) async {
  final activeLanguages = songsUserLanguages.getActiveLanguages();
  songs = songs.map((song) {
    final mutableSongVersions = List<SongVersion>.from(song.songVersions);
    mutableSongVersions.removeWhere(
        (songVersion) => !activeLanguages.contains(songVersion.lang.name));
    final primaryLang = songsUserLanguages.primaryLang;
    //order songsVersions put primary language to the first place, chos to the end of list
    mutableSongVersions.sort((a, b) {
      if (a.isChords && !b.isChords) {
        return 1;
      } else if (!a.isChords && b.isChords) {
        return -1;
      } else if (a.lang.name == primaryLang && b.lang.name != primaryLang) {
        return -1;
      } else if (a.lang.name != primaryLang && b.lang.name == primaryLang) {
        return 1;
      } else {
        return 0;
      }
    });
    return song.copyWith(songVersions: mutableSongVersions);
  }).toList();

  songs.removeWhere((song) => song.songVersions.isEmpty);

  return songs;
}
