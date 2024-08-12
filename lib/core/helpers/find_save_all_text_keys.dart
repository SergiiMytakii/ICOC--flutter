import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/domain/model/song_detail.dart';
import 'package:icoc/injection.dart';
import 'package:logger/logger.dart';

Future<void> findAndSaveAllTextKeys(List<SongDetail> songs) async {
  final Set<String> allTextKeys = {};
  songs.forEach((song) {
    //chek if some keys in text are corrupted i.e. without number in the end (we meed it for search)
    final keys = song.text.keys;
    keys.forEach((key) {
      if (key.toString().substring(2).isEmpty) {
        Logger().e('Wrong key in text, songId ${song.id}');
        FirebaseAnalytics.instance
            .logEvent(name: 'Wrong key in text, songId ${song.id}');
      }
    });

    allTextKeys.addAll(song.getAllTextKeys());
  });
  await getIt<LocalCache>()
      .saveList(StorageKeys.allSongsTextKeys, allTextKeys.toList());
}
