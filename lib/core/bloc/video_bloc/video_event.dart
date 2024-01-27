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
    try {
      yield VideoLoadingState();
      final List<Video> videos = await videoRepositoryImpl.getVideoList();
      // we need all languages  for filtering

      final List<Video> filteredVideos = await filterByLanguages(videos);
      yield GetVideoListSuccessState(filteredVideos);
    } catch (_, stackTrace) {
      logError(_, stackTrace);
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
    try {
      yield VideoLoadingState();
      final List<Resources>? resources =
          await videoRepositoryImpl.fetchVideosFromPlaylist(playlistId);

      yield GetVideosFromPlaylistSuccessState(resources ?? []);
    } catch (_, stackTrace) {
      logError(_, stackTrace);
      yield VideoErrorState(_.toString());
    }
  }
}

Future<List<Video>> filterByLanguages(List<Video> videos) async {
  final Map<String, dynamic> storedLanguages =
      SharedPreferencesHelper.getMap(StorageKeys.videosAllLanguages) ?? {};
//set keeps only unique values
  Set<String> allKeys = {};
  videos.forEach((video) => allKeys.add(video.lang));
  allKeys.forEach((String lang) {
    if (!storedLanguages.containsKey(lang)) {
      storedLanguages[lang] = true;
    }
  });
  SharedPreferencesHelper.saveMap(
      StorageKeys.videosAllLanguages, storedLanguages);
  return videos.where((topic) {
    return storedLanguages.entries
        .any((element) => element.value == true && element.key == topic.lang);
  }).toList();
}
