import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/core/model/bible_study.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/presentation/widget/animation_wrapper.dart';

class OneTopicScreen extends StatelessWidget {
  final BibleStudy topic;
  OneTopicScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          topic.topic,
          style: const TextStyle(fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          cacheExtent: 0,
          itemCount: topic.lessons.length,
          itemBuilder: (context, index) {
            return AnimationWrapper(
              child: Column(
                children: [
                  ListTile(
                    leading: Text(' ${topic.lessons[index].id + 1}',
                        style: Theme.of(context).textTheme.titleLarge),
                    title: Text(
                      topic.lessons[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => context.push(Routes.ONE_LESSON_SCREEN,
                        extra: topic.lessons[index]),
                  ),
                  Divider(
                    indent: 50,
                    color: getDividerColor(index),
                    thickness: 1.2,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
