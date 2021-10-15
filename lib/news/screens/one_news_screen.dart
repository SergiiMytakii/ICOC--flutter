import 'package:icoc/news/logic/controllers/news_controller.dart';

import '../../index.dart';
import 'package:flutter_html/flutter_html.dart' as html;

class OneNewsScreen extends StatelessWidget {
  final NewsController newsController = Get.find<NewsController>();
  @override
  Widget build(BuildContext context) {
    final int index = Get.arguments[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'drawer_news'.tr,
        ),
        backgroundColor: screensColors['news']!.withOpacity(0.8),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              html.Html(data: newsController.news[index].title, style: {
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
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
              html.Html(
                data: newsController.news[index].content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
