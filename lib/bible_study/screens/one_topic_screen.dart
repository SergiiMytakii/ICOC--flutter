import 'package:icoc/bible_study/logic/bible_study_controller.dart';

import '../../index.dart';

class OneTopicScreen extends StatelessWidget {
  OneTopicScreen({Key? key}) : super(key: key);
  BibleStudyController bibleStudyController = Get.find<BibleStudyController>();

  @override
  Widget build(BuildContext context) {
    int indexTopic = Get.arguments;
    int i = 0;
    return Obx(
      () => bibleStudyController.topics.isNotEmpty
          ? Scaffold(
              appBar: AppBar(
                title: Text(
                  bibleStudyController.topics[indexTopic].topic,
                ),
                backgroundColor:
                    screensColors['firstPrinciples']!.withOpacity(0.8),
                centerTitle: true,
              ),
              body: ListView.builder(
                  itemCount:
                      bibleStudyController.topics[indexTopic].lessons.length,
                  itemBuilder: (context, index) {
                    if (i < 4) {
                      i++;
                    } else {
                      i = 0;
                    }
                    return Column(
                      children: [
                        ListTile(
                          leading: Container(
                            width: 60,
                          ),
                          title: Text(
                            bibleStudyController
                                .topics[indexTopic].lessons[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          subtitle: Text(
                            '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () => Get.toNamed(Routes.ONE_LESSON_SCREEN,
                              arguments: [indexTopic, index]),
                        ),
                        Divider(
                          indent: 50,
                          color: dividerColors[i],
                          thickness: 1.2,
                        ),
                      ],
                    );
                  }),
            )
          : Loading(),
    );
  }
}
