import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:icoc/domain/data_sources/remote/http_client.dart';
import 'package:injectable/injectable.dart';

import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/model/youtube_video/youtube_video.dart';
import 'package:icoc/domain/model/playlist/playlist.dart';
import 'package:icoc/domain/repository/video_repository.dart';
import 'package:icoc/core/errors/failures.dart';

@dev
@prod
@Injectable(as: VideoRepository)
class VideoRepositoryImpl extends VideoRepository {
  final FirebaseDataSource firebaseDataSource;
  final HttpClient httpClient;
  VideoRepositoryImpl(this.firebaseDataSource, this.httpClient);

  @override
  Future<Either<Failure, List<Playlist>>> getVideoList() async {
    try {
      final QuerySnapshot snapshot = await firebaseDataSource
          .getFromFirebase(FirebaseCollections.Video.name);
      final List<Playlist> playlists = _listFromSnapshot(snapshot);
      return Right(playlists);
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, List<YoutubeVideo>>> fetchVideosFromPlaylist(
      String playlistId) async {
    try {
      final url = Uri.parse(
          'https://www.youtube.com/playlist?list=$playlistId');
      final response = await httpClient.get(url);

      if (response.statusCode == 200) {
        final videos = _parsePlaylistPage(response.body, playlistId);
        if (videos.isNotEmpty) {
          return Right(videos);
        }
      }
      logError('YouTube playlist scraping failed: ${response.statusCode}', null);
      return const Left(Failure.networkError());
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.networkError());
    }
  }

  List<YoutubeVideo> _parsePlaylistPage(String html, String playlistId) {
    final List<YoutubeVideo> videos = [];
    final seen = <String>{};

    // YouTube embeds playlist data as JSON inside ytInitialData
    final dataMatch = RegExp(r'var ytInitialData\s*=\s*(\{.+?\});\s*</script>')
        .firstMatch(html);

    if (dataMatch != null) {
      try {
        final jsonStr = dataMatch.group(1)!;
        final data = jsonDecode(jsonStr) as Map<String, dynamic>;
        _extractVideosFromJson(data, playlistId, videos, seen);
        if (videos.isNotEmpty) return videos;
      } catch (_) {
        // fall through to regex fallback
      }
    }

    // Regex fallback: extract videoId + title pairs from the HTML
    final videoIdRegex = RegExp(r'"videoId"\s*:\s*"([a-zA-Z0-9_-]{11})"');
    final titleRegex = RegExp(r'"title"\s*:\s*\{"runs"\s*:\s*\[\{"text"\s*:\s*"([^"]+)"');

    final idMatches = videoIdRegex.allMatches(html).toList();
    final titleMatches = titleRegex.allMatches(html).toList();

    for (int i = 0; i < idMatches.length; i++) {
      final videoId = idMatches[i].group(1)!;
      if (seen.contains(videoId)) continue;
      seen.add(videoId);

      final title = i < titleMatches.length ? titleMatches[i].group(1) : null;
      videos.add(YoutubeVideo(
        lang: Languages.defaultLang,
        title: title,
        link: videoId,
        thumbnail: 'https://i.ytimg.com/vi/$videoId/hqdefault.jpg',
        playlistId: playlistId,
      ));
    }

    return videos;
  }

  void _extractVideosFromJson(
    dynamic node,
    String playlistId,
    List<YoutubeVideo> videos,
    Set<String> seen,
  ) {
    if (node is Map) {
      // A playlistVideoRenderer contains videoId + title
      if (node.containsKey('playlistVideoRenderer')) {
        final renderer = node['playlistVideoRenderer'] as Map<String, dynamic>;
        final videoId = renderer['videoId'] as String?;
        if (videoId != null && !seen.contains(videoId)) {
          seen.add(videoId);
          final title = (renderer['title']?['runs'] as List?)
              ?.firstOrNull?['text'] as String?;
          final thumbnail = ((renderer['thumbnail']?['thumbnails'] as List?)
                  ?.lastOrNull)?['url'] as String?;
          videos.add(YoutubeVideo(
            lang: Languages.defaultLang,
            title: title,
            link: videoId,
            thumbnail: thumbnail ??
                'https://i.ytimg.com/vi/$videoId/hqdefault.jpg',
            playlistId: playlistId,
          ));
        }
        return;
      }
      for (final value in node.values) {
        _extractVideosFromJson(value, playlistId, videos, seen);
      }
    } else if (node is List) {
      for (final item in node) {
        _extractVideosFromJson(item, playlistId, videos, seen);
      }
    }
  }
}

List<Playlist> _listFromSnapshot(QuerySnapshot snapshot) {
  final List<Playlist> playlists = snapshot.docs.map((doc) {
    return Playlist.fromJson(doc.data() as Map<String, dynamic>);
  }).toList();
  return playlists;
}
