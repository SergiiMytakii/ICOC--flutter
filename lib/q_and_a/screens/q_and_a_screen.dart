import 'package:icoc/q_and_a/logic/q_and_a_controller.dart';

import '../../index.dart';

class QuestionsAndAnwers extends StatelessWidget {
  QuestionsAndAnwers({Key? key}) : super(key: key);
  final QandAController qandAController = Get.put(QandAController());
  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'drawer_q_and_a'.tr,
        ),
        backgroundColor: screensColors['Q&A']!.withOpacity(0.8),
        centerTitle: true,
      ),
      body: Obx(
        () => qandAController.ansvers.isNotEmpty
            ? ListView.builder(
                itemCount: qandAController.ansvers.length,
                itemBuilder: (context, index) {
                  if (i < 4) {
                    i++;
                  } else {
                    i = 0;
                  }
                  return Column(
                    children: [
                      ListTile(
                        leading: Text(
                          qandAController.ansvers[index].id.toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        title: Text(
                          qandAController.ansvers[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () => Get.toNamed(Routes.ONE_Q_AND_A_SCREEN,
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
