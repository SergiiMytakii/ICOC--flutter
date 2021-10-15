import 'package:icoc/bible_study/logic/bible_study_controller.dart';

import '../../index.dart';

class BibleStudyScreen extends StatelessWidget {
  BibleStudyScreen({Key? key}) : super(key: key);
  final BibleStudyController bibleStudyController =
      Get.put(BibleStudyController());
  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'drawer_first_principles'.tr,
        ),
        backgroundColor: screensColors['firstPrinciples']!.withOpacity(0.8),
        centerTitle: true,
      ),
      body: Obx(
        () => bibleStudyController.topics.isNotEmpty
            ? ListView.builder(
                itemCount: bibleStudyController.topics.length,
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
                          bibleStudyController.topics[index].topic,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Text(
                          bibleStudyController.topics[index].subtopic,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () => Get.toNamed(Routes.ONE_TOPIC_SCREEN,
                            arguments: index),
                      ),
                      Divider(
                        indent: 50,
                        color: dividerColors[i],
                        thickness: 1.2,
                      ),
                    ],
                  );
                },
              )
            : Loading(),
      ),
    );
  }
}
