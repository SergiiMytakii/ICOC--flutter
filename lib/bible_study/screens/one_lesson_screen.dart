import 'package:flutter_html/flutter_html.dart';
import 'package:icoc/bible_study/logic/bible_study_controller.dart';

import '../../index.dart';

class OneLessonScreen extends StatelessWidget {
  OneLessonScreen() {
    Wakelock.enable();
  }
  BibleStudyController bibleStudyController = Get.find<BibleStudyController>();

  @override
  Widget build(BuildContext context) {
    int indexTopic = Get.arguments[0];
    int indexLesson = Get.arguments[1];
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            bibleStudyController.topics[indexTopic].lessons[indexLesson].title,
          ),
          backgroundColor: screensColors['firstPrinciples']!.withOpacity(0.8),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Html(
              data: bibleStudyController
                  .topics[indexTopic].lessons[indexLesson].text,
            ),
          ),
        ),
      ),
    );
  }
}
