import 'package:icoc/core/model/resources.dart';
import 'package:icoc/core/model/playlist.dart';

abstract class VideoRepository {
  Future<List<Playlist>> getVideoList();
  Future<List<Resources>?> fetchVideosFromPlaylist(String playlistId);
}
