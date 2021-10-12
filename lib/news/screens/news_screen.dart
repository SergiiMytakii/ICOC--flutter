import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:icoc/news/logic/controllers/news_controller.dart';

import '../../index.dart';

class NewsScreen extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
              itemBuilder: (context) => newsController.allCategories
                  .map(
                    (e) => PopupMenuItem(
                      child: Text(e),
                      onTap: () {
                        newsController.filterNews(e);
                      },
                    ),
                  )
                  .toList(),
            ),
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
                  return Card(
                    elevation: 8,
                    margin: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Html(
                          data: newsController.news[index].title,
                        ),
                        Image.network(newsController.news[index].imageUrl!),
                        Html(data: newsController.news[index].excerpt),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Категории новостей:',
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.topRight,
                          child: Column(
                              children: categorysDescript
                                  .map((e) => Text('$e'))
                                  .toList()),
                        )
                      ],
                    ),
                  );
                })
            : Loading(),
      ),
    );
  }
}
