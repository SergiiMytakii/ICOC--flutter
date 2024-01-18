import 'dart:convert';

import 'youtube_network_service.dart';
import '../../../index.dart';

class YoutubeService extends YoutubeNetworkService {
  // List<News> newsFromJson(String? str) =>
  //     List<News>.from(json.decode(str!).map((x) => News.fromJson(x)));
  int queryCount = 0;
  Future<List<Resources>> fetchRelatedVideos(String videoId) async {
    Map<String, String> data = {
      'part': 'snippet',
      'key': YOUTUBE_API_KEY,
      'relatedToVideoId': videoId,
      'type': 'video'
    };
    var response = await httpClient.get('search',
        headers: {
          "Content-Type": "application/json",
        },
        query: data);
    queryCount += 100;
    print('queryCount $queryCount');
    //log.i(response.body);
    if (response.statusCode == 200) {
      List data = response.body['items'];
      List<Resources> relatedVideos = List.generate(
          data.length,
          (index) => Resources(
              lang: '',
              title: data[index]["snippet"] != null
                  ? data[index]["snippet"]["title"]
                  : '',
              thumbnail: data[index]["snippet"] != null
                  ? data[index]["snippet"]["thumbnails"]["standard"] != null
                      ? data[index]["snippet"]["thumbnails"]["standard"]["url"]
                      : null
                  : null,
              link: data[index]["id"]["videoId"]));

      // relatedVideos.forEach((element) {
      //   print(element.thumbnail);
      // });
      relatedVideos.removeWhere((element) => element.title.isEmpty);
      return relatedVideos;
    } else
      return [];
  }

  Future<List<Resources>> fetchVideosFromPlaylist(String playlistId) async {
    Map<String, String> data = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '30',
      'key': YOUTUBE_API_KEY,
    };

    Map<String, String> headers = {
      "Content-Type": 'application/json',
    };

    // Get Playlist Videos
    var response =
        await httpClient.get('playlistItems', headers: headers, query: data);
    if (response.statusCode == 200) {
      var data = response.body;
      queryCount += 1;
      print('queryCount $queryCount');
      List<dynamic> videosJson = data['items'];
      //log.d(videosJson);

      // Fetch first eight videos from uploads playlist
      List<Resources> videos = [];
      videosJson.forEach(
        (json) => videos.add(
          Resources.fromJsonYoutobePlaylists(json['snippet']),
        ),
      );
      return videos;
    } else {
      log.e(json.decode(response.body)['error']['message']);
      return [];
    }
  }
}
