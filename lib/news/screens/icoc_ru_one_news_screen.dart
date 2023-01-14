import '../../index.dart';
import 'package:flutter_html/flutter_html.dart' as html;

class OneNewsScreen extends StatelessWidget {
  final NewsController newsController = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    final int index = Get.arguments;
    final fontSizeAdjust = FontSizeAdjustBottomSheet(
      context: context,
      controller: newsController,
      color: 'news',
    );
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
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(
                () => html.SelectableHtml(
                  data: newsController.news[index].title,
                  style: {
                    "body": html.Style(
                        fontWeight: FontWeight.w700,
                        fontSize: html.FontSize(newsController.fontSize.value)),
                  },
                ),
              ),
              Image.network(
                newsController.news[index].imageUrl!,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator.adaptive(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
              Obx(
                () =>
                    html.Html(data: newsController.news[index].content, style: {
                  "body": html.Style(
                      fontSize: html.FontSize(newsController.fontSize.value)),
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
