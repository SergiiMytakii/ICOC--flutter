import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/core/data_sources/remote/http_client.dart';
import 'package:injectable/injectable.dart';

import 'package:icoc/constants.dart';
import 'package:icoc/core/data_sources/remote/firebase_data_source.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/model/resources.dart';
import 'package:icoc/core/model/video.dart';
import 'package:icoc/core/repository/video_repository.dart';

@dev
@prod
@Injectable(as: VideoRepository)
class VideoRepositoryImpl extends VideoRepository {
  final FirebaseDataSource firebaseDataSource;
  final HttpClient httpClient;
  VideoRepositoryImpl(this.firebaseDataSource, this.httpClient);
  @override
  Future<List<Video>> getVideoList() async {
    final QuerySnapshot snapshot = await firebaseDataSource
        .getFromFirebase(FirebaseCollections.Video.name);
    final List<Video> videos = _listFromSnapshot(snapshot);
    return videos;
  }

  @override
  Future<List<Resources>?> fetchVideosFromPlaylist(String playlistId) async {
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

        // Fetch first eight videos from uploads playlist
        final List<Resources> videos = [];
        videosJson.forEach(
          (json) => videos.add(
            Resources.fromJsonYoutobePlaylists(json['snippet']),
          ),
        );
        return videos;
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

List<Video> _listFromSnapshot(QuerySnapshot snapshot) {
  final List<Video> videos = snapshot.docs.map((doc) {
    return Video(
      id: doc.id,
      description: doc.get('description') ?? '',
      lang: doc.get('lang') ?? '',
      playlistId: doc.get('playlistId') ?? '',
    );
  }).toList();
  return videos;
}
