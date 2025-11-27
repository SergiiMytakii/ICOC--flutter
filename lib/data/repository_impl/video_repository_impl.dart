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
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=$playlistId&key=$YOUTUBE_API_KEY&maxResults=40');
    try {
      final response = await httpClient.get(
        url,
        headers: headers,
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> videosJson = data['items'];

        final List<YoutubeVideo> playlists = [];
        videosJson.forEach(
          (json) => playlists.add(
            YoutubeVideo.fromJsonYoutubePlaylists(json['snippet']),
          ),
        );
        return Right(playlists);
      } else {
        logError(
            json.decode(response.body)['error']['message'] ??
                'youtube api error',
            null);
        return const Left(Failure.networkError());
      }
    } catch (e, stackTrace) {
      logError(e, stackTrace);
      return const Left(Failure.networkError());
    }
  }
}

List<Playlist> _listFromSnapshot(QuerySnapshot snapshot) {
  final List<Playlist> playlists = snapshot.docs.map((doc) {
    return Playlist.fromJson(doc.data() as Map<String, dynamic>);
  }).toList();
  return playlists;
}
