import 'dart:math';

import 'package:icoc/news/logic/services/network_service.dart';
import 'package:icoc/news/models/news_model.dart';

import '../../../index.dart';

class NewsService extends NetworkService {
  final log = Logger();
  List<News> news = [];

  Future getNews() async {
    final response = await httpClient.get('posts');

    if (response.statusCode == 200) {
      //log.d(response.body);
      news = newsFromJson(response.bodyString);
      // log.d(news.first.title);
      // log.d(news.first.content);
      return news;
    } else
      log.e(response.statusCode);
    return response.statusCode;
  }

  List<News> newsFromJson(String? str) =>
      List<News>.from(json.decode(str!).map((x) => News.fromJson(x)));
}
