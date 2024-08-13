import 'package:icoc/domain/model/youtube_video/youtube_video.dart';
import 'package:icoc/domain/model/playlist/playlist.dart';

abstract class VideoRepository {
  Future<List<Playlist>> getVideoList();
  Future<List<YoutubeVideo>?> fetchVideosFromPlaylist(String playlistId);
}
