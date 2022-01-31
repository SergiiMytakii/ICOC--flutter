import 'package:icoc/song_book/logic/services/youtube_network_service.dart';
import '../../../index.dart';

class YoutubeService extends YoutubeNetworkService {
  // List<News> newsFromJson(String? str) =>
  //     List<News>.from(json.decode(str!).map((x) => News.fromJson(x)));

  Future<List<Resources>?> fetchRelatedVideos(String videoId) async {
    Map<String, String> data = {
      'part': 'snippet',
      'key': YOUTUBE_API_KEY,
      'relatedToVideoId': videoId,
      'type': 'video'
    };
    var response = await httpClient.get('',
        headers: {
          "Content-Type": "application/json",
        },
        query: data);
    if (response.statusCode == 200) {
      List data = response.body['items'];
      //log.i(data);
      List<Resources> relatedVideos = List.generate(
          data.length,
          (index) => Resources(
              lang: '',
              title: data[index]["snippet"] != null
                  ? data[index]["snippet"]["title"]
                  : '',
              thumbnail: data[index]["snippet"] != null
                  ? data[index]["snippet"]["thumbnails"]["standard"]["url"]
                  : null,
              link: data[index]["id"]["videoId"]));

      relatedVideos.forEach((element) {
        print(element.thumbnail);
      });
      relatedVideos.removeWhere((element) => element.title.isEmpty);
      return relatedVideos;
    }
  }
}
