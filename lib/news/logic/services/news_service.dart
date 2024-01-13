import 'dart:convert';

import 'network_service.dart';
import '../../models/news_model.dart';

import '../../../index.dart';

class NewsService extends NetworkService {
  List<News> news = [];

  Future getNews() async {
    final response = await httpClient.get('posts');

    if (response.statusCode == 200) {
      //log.d(response.body);
      news = newsFromJson(response.bodyString);
      // log.d(news.first.title);

      return news;
    } else
      log.e(response.statusCode);
  }

  List<News> newsFromJson(String? str) =>
      List<News>.from(json.decode(str!).map((x) => News.fromJson(x)));
}
