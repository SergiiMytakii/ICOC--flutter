import 'package:flutter/material.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/model/bible_study.dart';
import 'package:icoc/presentation/screen/routes/app_routes.dart';

class OneTopicScreen extends StatelessWidget {
  OneTopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BibleStudy topic =
        ModalRoute.of(context)!.settings.arguments as BibleStudy;
    int i = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          topic.topic,
          style: TextStyle(fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: topic.lessons.length,
          itemBuilder: (context, index) {
            if (i < 4) {
              i++;
            } else {
              i = 0;
            }
            return Column(
              children: [
                ListTile(
                  leading: Text(' ${topic.lessons[index].id + 1}',
                      style: Theme.of(context).textTheme.titleLarge),
                  title: Text(
                    topic.lessons[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => Navigator.of(context).pushNamed(
                      Routes.ONE_LESSON_SCREEN,
                      arguments: topic.lessons[index]),
                ),
                Divider(
                  indent: 50,
                  color: dividerColors[i],
                  thickness: 1.2,
                ),
              ],
            );
          }),
    );
  }
}
