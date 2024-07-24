import 'package:icoc/core/model/youtube_video/youtube_video.dart';
import 'package:icoc/core/model/playlist.dart';

abstract class VideoRepository {
  Future<List<Playlist>> getVideoList();
  Future<List<YoutubeVideo>?> fetchVideosFromPlaylist(String playlistId);
}
