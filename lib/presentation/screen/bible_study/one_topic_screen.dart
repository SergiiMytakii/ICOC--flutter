import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/presentation/widget/animation_wrapper.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';

class OneTopicScreen extends StatelessWidget {
  final String topicId;
  OneTopicScreen({super.key, required this.topicId});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BibleStudyBloc, BibleStudyState>(
      builder: (context, state) {
        if (state is GetBibleStudyListSuccessState) {
          final bibleStudy =
              state.topics.firstWhere((item) => item.id == int.parse(topicId));

          return Scaffold(
            appBar: AppBar(
              title: Text(
                bibleStudy.topic,
                style: const TextStyle(fontSize: 14),
              ),
              centerTitle: true,
            ),
            body: ListView.builder(
                cacheExtent: 0,
                itemCount: bibleStudy.lessons.length,
                itemBuilder: (context, index) {
                  return AnimationWrapper(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text(' ${bibleStudy.lessons[index].id + 1}',
                              style: Theme.of(context).textTheme.titleLarge),
                          title: Text(
                            bibleStudy.lessons[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () => context.go(
                            '/$BIBLE_STUDY/$ONE_TOPIC_SCREEN/$topicId/$ONE_LESSON_SCREEN/${bibleStudy.lessons[index].id}',
                          ),
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
        } else if (state is BibleStudyErrorState) {
          return const Scaffold(body: ErrorTextOnScreen());
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
