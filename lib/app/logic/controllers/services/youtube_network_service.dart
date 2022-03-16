import '/index.dart';

class YoutubeNetworkService extends GetConnect {
  static const _apiUrl = 'https://www.googleapis.com/youtube/v3/';

  GetHttpClient httpClient = GetHttpClient(baseUrl: _apiUrl);
}
