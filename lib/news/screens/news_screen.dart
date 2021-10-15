import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:icoc/news/logic/controllers/news_controller.dart';
import 'package:icoc/news/screens/one_news_screen.dart';

import '../../index.dart';

class NewsScreen extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<PopupMenuEntry> categoriesItems = [
            PopupMenuItem(
              enabled: false,
              child: Text(
                'Категории новостей',
                style: TextStyle(color: screensColors['news']),
              ),
            ),
            PopupMenuItem(
              child: Text('All news'),
              onTap: () {
                newsController.clearFilter();
              },
            ),
          ] +
          newsController.allCategories
              .map(
                (e) => PopupMenuItem(
                  child: Text(e),
                  onTap: () {
                    newsController.filterNews(e);
                  },
                ),
              )
              .toList();
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'drawer_news'.tr,
          ),
          backgroundColor: screensColors['news']!.withOpacity(0.8),
          centerTitle: true,
          actions: [
            PopupMenuButton(
                icon: Icon(
                  Icons.filter_alt_outlined,
                ),
                tooltip: 'icon_button_actio)ns_app_bar_filter'.tr,
                itemBuilder: (context) {
                  return categoriesItems;
                }),
          ],
        ),
        body: newsController.allNews.isNotEmpty
            ? ListView.builder(
                itemCount: newsController.news.length,
                itemBuilder: (context, index) {
                  List<String?> categorysDescript = [];
                  newsController.news[index].categories!.forEach((element) {
                    categorysDescript.add(categories[element]);
                  });

                  return GestureDetector(
                    onTap: () =>
                        Get.toNamed(Routes.ONE_NEWS_SCREEN, arguments: [index]),
                    child: Card(
                      elevation: 8,
                      margin: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          html.Html(
                              data: newsController.news[index].title,
                              style: {
                                // tables will have the below background color
                                "body": html.Style(fontWeight: FontWeight.w700),
                              }),
                          Image.network(
                            newsController.news[index].imageUrl!,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                          html.Html(data: newsController.news[index].excerpt),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Категории новостей:',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: screensColors['news']),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.topRight,
                            child: PopupMenuButton(
                                child: Column(
                                    children: categorysDescript
                                        .map((e) => Text(
                                              '$e',
                                              style: TextStyle(
                                                  color: screensColors['news']),
                                            ))
                                        .toList()),
                                tooltip:
                                    'icon_button_actio)ns_app_bar_filter'.tr,
                                itemBuilder: (context) => categoriesItems),
                          )
                        ],
                      ),
                    ),
                  );
                })
            : Loading(),
      );
    });
  }
}
