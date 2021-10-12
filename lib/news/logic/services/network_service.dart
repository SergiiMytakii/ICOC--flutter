import '/index.dart';

class NetworkService extends GetConnect {
  static const _apiUrl = 'https://icocnews.ru/wp-json/wp/v2/';

  GetHttpClient httpClient = GetHttpClient(baseUrl: _apiUrl);
}
