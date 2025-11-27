import 'package:dartz/dartz.dart';
import 'package:icoc/core/errors/failures.dart';
import 'package:icoc/domain/model/youtube_video/youtube_video.dart';
import 'package:icoc/domain/model/playlist/playlist.dart';

abstract class VideoRepository {
  Future<Either<Failure, List<Playlist>>> getVideoList();
  Future<Either<Failure, List<YoutubeVideo>>> fetchVideosFromPlaylist(
      String playlistId);
}
