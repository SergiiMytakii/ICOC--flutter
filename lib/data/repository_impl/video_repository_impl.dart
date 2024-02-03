import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/model/resources.dart';
import 'package:icoc/core/model/video.dart';
import 'package:icoc/core/repository/video_repository.dart';
import 'package:icoc/data/api/http_service.dart';
import 'package:icoc/data/firebase/database_firebase_service.dart';

class VideoRepositoryImpl extends VideoRepository {
  @override
  Future<List<Video>> getVideoList() async {
    DatabaseServiceFirebase databaseServiceFirebase = DatabaseServiceFirebase();
    final QuerySnapshot snapshot = await databaseServiceFirebase.getVideos();
    List<Video> videos = _listFromSnapshot(snapshot);
    return videos;
  }

  @override
  Future<List<Resources>?> fetchVideosFromPlaylist(String playlistId) async {
    final httpClient = HttpService.client;
    Map<String, String> headers = {
      "Content-Type": 'application/json',
    };
    final url = Uri.parse(
        "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=$playlistId&key=$YOUTUBE_API_KEY&maxResults=40");
    // Get Playlist Videos
    try {
      var response = await httpClient.get(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<dynamic> videosJson = data['items'];

        // Fetch first eight videos from uploads playlist
        List<Resources> videos = [];
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
  List<Video> videos = snapshot.docs.map((doc) {
    return Video(
      id: doc.id,
      description: doc.get('description') ?? '',
      lang: doc.get('lang') ?? '',
      playlistId: doc.get('playlistId') ?? '',
    );
  }).toList();
  return videos;
}
