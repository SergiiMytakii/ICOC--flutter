import 'package:icoc/core/model/resources.dart';
import 'package:icoc/core/model/video.dart';

abstract class VideoRepository {
  Future<List<Video>> getVideoList();
  Future<List<Resources>> fetchVideosFromPlaylist(String playlistId);
}
