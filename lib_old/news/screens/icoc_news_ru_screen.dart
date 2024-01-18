import 'package:flutter_html/flutter_html.dart' as html;

import '../../index.dart';

class IcocNewsRuScreen extends StatelessWidget {
  final NewsController newsController = Get.find();

  @override
  Widget build(BuildContext context) {
    var fontSizeAdjust = FontSizeAdjustBottomSheet(
        context: context,
        controller: newsController,
        color: 'news',
        needForce: true);
    return Obx(() {
      List<PopupMenuEntry> categoriesItems = [
            PopupMenuItem(
              enabled: false,
              child: Text(
                'News category'.tr,
                style: TextStyle(color: screensColors['news']),
              ),
            ),
            PopupMenuItem(
              child: Text('All news'.tr),
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
            IconButton(
                icon: Icon(
                  Icons.text_fields_outlined,
                ),
                onPressed: () => fontSizeAdjust.bottomSheet()),
            PopupMenuButton(
                icon: Icon(
                  Icons.filter_alt_outlined,
                ),
                tooltip: 'Filter'.tr,
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
                        Get.toNamed(Routes.ONE_NEWS_SCREEN, arguments: index),
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
                                "body": html.Style(
                                    fontWeight: FontWeight.w700,
                                    fontSize: html.FontSize(
                                        newsController.fontSize.value)),
                              }),
                          Image.network(
                            newsController.news[index].imageUrl!,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator.adaptive(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                          html.Html(
                              data: newsController.news[index].excerpt,
                              style: {
                                "body": html.Style(
                                    fontSize: html.FontSize(
                                        newsController.fontSize.value)),
                              }),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'News category'.tr,
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
                                tooltip: 'Filter'.tr,
                                itemBuilder: (context) => categoriesItems),
                          )
                        ],
                      ),
                    ),
                  );
                })
            : Column(
                children: [
                  Loading(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'use vpn if something not works'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
