import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/domain/data_sources/remote/http_client.dart';
import 'package:injectable/injectable.dart';

import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/model/youtube_video/youtube_video.dart';
import 'package:icoc/domain/model/playlist/playlist.dart';
import 'package:icoc/domain/repository/video_repository.dart';

@dev
@prod
@Injectable(as: VideoRepository)
class VideoRepositoryImpl extends VideoRepository {
  final FirebaseDataSource firebaseDataSource;
  final HttpClient httpClient;
  VideoRepositoryImpl(this.firebaseDataSource, this.httpClient);
  @override
  Future<List<Playlist>> getVideoList() async {
    final QuerySnapshot snapshot = await firebaseDataSource
        .getFromFirebase(FirebaseCollections.Video.name);
    final List<Playlist> playlists = _listFromSnapshot(snapshot);
    return playlists;
  }

  @override
  Future<List<YoutubeVideo>?> fetchVideosFromPlaylist(String playlistId) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=$playlistId&key=$YOUTUBE_API_KEY&maxResults=40');
    // Get Playlist Videos
    try {
      final response = await httpClient.get(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> videosJson = data['items'];

        // Fetch first eight playlists from uploads playlist
        final List<YoutubeVideo> playlists = [];
        videosJson.forEach(
          (json) => playlists.add(
            YoutubeVideo.fromJsonYoutubePlaylists(json['snippet']),
          ),
        );
        return playlists;
      } else {
        logError(
            json.decode(response.body)['error']['message'] ??
                'youtube api error',
            null);
        return [];
      }
    } on Exception catch (e, stackTrace) {
      logError(e, stackTrace);
    }
    return null;
  }
}

List<Playlist> _listFromSnapshot(QuerySnapshot snapshot) {
  final List<Playlist> playlists = snapshot.docs.map((doc) {
    return Playlist.fromJson(doc.data() as Map<String, dynamic>);
  }).toList();
  return playlists;
}
