part of 'video_bloc.dart';

@immutable
sealed class VideoEvent {
  Stream<VideoState> applyAsync({VideoState currentState, VideoBloc bloc});
}

class VideoListRequested extends VideoEvent {
  final VideoRepositoryImpl videoRepositoryImpl = VideoRepositoryImpl();
  @override
  Stream<VideoState> applyAsync(
      {VideoState? currentState, VideoBloc? bloc}) async* {
    final log = Logger();
    try {
      yield VideoLoadingState();
      final List<Video> videos = await videoRepositoryImpl.getVideoList();
      // we need all languages  for filtering

      final List<Video> filteredVideos = await filterByLanguages(videos);
      yield GetVideoListSuccessState(filteredVideos);
    } catch (_, stackTrace) {
      log.e('$_', error: _, stackTrace: stackTrace);
      yield VideoErrorState(_.toString());
    }
  }
}

class GetVideosFromPlaylist extends VideoEvent {
  final String playlistId;
  GetVideosFromPlaylist(this.playlistId);
  final VideoRepositoryImpl videoRepositoryImpl = VideoRepositoryImpl();

  @override
  Stream<VideoState> applyAsync(
      {VideoState? currentState, VideoBloc? bloc}) async* {
    final log = Logger();
    try {
      yield VideoLoadingState();
      final List<Resources> resources =
          await videoRepositoryImpl.fetchVideosFromPlaylist(playlistId);

      yield GetVideosFromPlaylistSuccessState(resources);
    } catch (_, stackTrace) {
      log.e('$_', error: _, stackTrace: stackTrace);
      yield VideoErrorState(_.toString());
    }
  }
}

Future<List<Video>> filterByLanguages(List<Video> videos) async {
  final List<String>? storedLanguages = await SharedPreferencesHelper.getList(
      SharedPreferencesKeys.videosLanguages);
  //if this the first run we store languages
  // we need all languages  for filtering
  Set<String> allKeys = {};
  videos.forEach((video) => allKeys.add(video.lang));
  SharedPreferencesHelper.saveList(
      SharedPreferencesKeys.videosAllLanguages, allKeys.toList());
  if (storedLanguages == null) {
    SharedPreferencesHelper.saveList(
        SharedPreferencesKeys.videosLanguages, allKeys.toList());
    return videos;
  } else {
    return videos
        .where((video) => storedLanguages.contains(video.lang))
        .toList();
  }
}
