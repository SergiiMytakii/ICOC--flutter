import 'package:flutter_html/flutter_html.dart' as html;

import '../../index.dart';

class OneLessonScreen extends StatelessWidget {
  OneLessonScreen() {
    Wakelock.enable();
  }
  final BibleStudyController bibleStudyController =
      Get.find<BibleStudyController>();

  String parseHtml(String text) {
    var document = parse(text);
    return parse(document.body!.text).documentElement!.text;
  }

  @override
  Widget build(BuildContext context) {
    var fontSozeAdjust = FontSizeAdjustBottomSheet(
        context: context,
        controller: bibleStudyController,
        color: 'firstPrinciples');
    int indexTopic = Get.arguments[0];
    int indexLesson = Get.arguments[1];
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            bibleStudyController.topics[indexTopic].lessons[indexLesson].title,
            style: TextStyle(fontSize: 14),
          ),
          backgroundColor: screensColors['firstPrinciples']!.withOpacity(0.8),
          centerTitle: true,
          actions: [
            IconButton(
              tooltip: 'Share'.tr,
              icon: Icon(
                Icons.share,
              ),
              onPressed: () {
                Share.share(parseHtml(
                  bibleStudyController
                      .topics[indexTopic].lessons[indexLesson].text,
                ));
              },
            ),
            IconButton(
                icon: Icon(
                  Icons.text_fields_outlined,
                ),
                onPressed: () => fontSozeAdjust.bottomSheet()),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: html.SelectableHtml(
                data: bibleStudyController
                    .topics[indexTopic].lessons[indexLesson].text,
                style: {
                  "body": html.Style(
                    fontSize:
                        html.FontSize(bibleStudyController.fontSize.value),
                  ),
                  "h5": html.Style(
                    fontSize:
                        html.FontSize(bibleStudyController.fontSize.value),
                  ),
                  "p": html.Style(
                    fontSize:
                        html.FontSize(bibleStudyController.fontSize.value),
                  ),
                }),
          ),
        ),
      ),
    );
  }
}
