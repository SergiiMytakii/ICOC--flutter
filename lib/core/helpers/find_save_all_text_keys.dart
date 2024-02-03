import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/core/model/song_detail.dart';
import 'package:logger/logger.dart';

Future<void> findAndSaveAllTextKeys(List<SongDetail> songs) async {
  Set<String> allTextKeys = {};
  songs.forEach((song) {
    //chek if some keys in text are corrupted i.e. without number in the end (we meed it for search)
    final keys = song.text.keys;
    keys.forEach((key) {
      if (key.toString().substring(2).isEmpty) {
        Logger().e("Wrong key in text, songId ${song.id}");
        FirebaseAnalytics.instance
            .logEvent(name: "Wrong key in text, songId ${song.id}");
      }
    });

    allTextKeys.addAll(song.getAllTextKeys());
  });
  await SharedPreferencesHelper.saveList(
      StorageKeys.allSongsTextKeys, allTextKeys.toList());
}
