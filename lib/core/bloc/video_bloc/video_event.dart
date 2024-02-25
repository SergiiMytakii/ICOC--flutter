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
      if (videos.isNotEmpty) {
        final List<Video> filteredVideos = await filterByLanguages(videos);
        yield GetVideoListSuccessState(filteredVideos);
      } else {
        yield VideoErrorState(
            "Can't  load data... Please, check your internet connection and pull down to refresh!"
                .tr());
      }
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
      if (resources != null || resources!.isNotEmpty)
        yield GetVideosFromPlaylistSuccessState(resources);
      else
        yield VideoErrorState(
            "Can't  load data... Please, check your internet connection and pull down to refresh!"
                .tr());
    } catch (_, stackTrace) {
      logError(_, stackTrace);
      yield VideoErrorState(_.toString());
    }
  }
}

Future<List<Video>> filterByLanguages(List<Video> videos) async {
  final locale = SharedPreferencesHelper.getString(
        StorageKeys.locale,
      ) ??
      'en';
  final Map<String, dynamic> storedLanguages =
      SharedPreferencesHelper.getMap(StorageKeys.videosAllLanguages) ?? {};
//set keeps only unique values
  Set<String> allKeys = {};
  videos.forEach((video) => allKeys.add(video.lang));

  putDeviceLangToFirstPlace(allKeys.toList(), locale);

  allKeys.forEach((String lang) {
    if (!storedLanguages.containsKey(lang)) {
      storedLanguages[lang] = lang == locale;
    }
  });
  SharedPreferencesHelper.saveMap(
      StorageKeys.videosAllLanguages, storedLanguages);
  final filteredVideos = videos.where((topic) {
    return storedLanguages.entries
        .any((element) => element.value == true && element.key == topic.lang);
  }).toList();

  filteredVideos.sort((a, b) {
    if (a.lang == locale && b.lang != locale) {
      return -1; // 'en' should come before any other lang
    } else if (a.lang != locale && b.lang == locale) {
      return 1; // Any other lang should come after 'en'
    } else {
      return a.lang.compareTo(b.lang); // Sort other langs alphabetically
    }
  });
  return filteredVideos;
}
