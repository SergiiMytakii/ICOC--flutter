import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/model/bible_study/bible_study.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/presentation/widget/animation_wrapper.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';

class OneTopicScreen extends StatelessWidget {
  final String topicId;
  OneTopicScreen({super.key, required this.topicId});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BibleStudyBloc, BibleStudyState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => Scaffold(
            body: CustomRefreshIndicator(onRefresh: _getBibleStudyList),
          ),
          success: (topics, unreadCount, newTopicIds, newLessonIds) {
            final bibleStudy = _receiveAndPrepareBibleStudy(topics);

            return bibleStudy != null
                ? Scaffold(
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
                          final lesson = bibleStudy.lessons[index];
                          final isNew = newLessonIds.contains(lesson.id);
                          return AnimationWrapper(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: isNew
                                      ? _NewDot(number: lesson.id + 1)
                                      : Text(' ${lesson.id + 1}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
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
                                  onTap: () {
                                    getIt<BibleStudyBloc>().add(
                                      BibleStudyEvent.lessonOpened(
                                          bibleStudy.lessons[index].id),
                                    );
                                    context.go(
                                      '/$BIBLE_STUDY/$ONE_TOPIC_SCREEN/$topicId/$ONE_LESSON_SCREEN/${bibleStudy.lessons[index].id}',
                                    );
                                  },
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
                  )
                : CustomRefreshIndicator(onRefresh: _getBibleStudyList);
          },
          error: (message) => const Scaffold(body: ErrorTextOnScreen()),
          empty: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Future<void> _getBibleStudyList() async {
    getIt<BibleStudyBloc>().add(const BibleStudyEvent.listRequested());
  }

  BibleStudy? _receiveAndPrepareBibleStudy(List<BibleStudy> topics) {
    final bibleStudy = topics.firstWhere(
      (item) => item.id == int.parse(topicId),
      orElse: () {
        //search in all topics
        return getIt<BibleStudyBloc>().allTopics.firstWhere(
              (item) => item.id == int.parse(topicId),
              orElse: () => BibleStudy.defaultBibleStudy,
            );
      },
    );
    final activeLanguages =
        getIt<BibleStudyUserLanguagesHandler>().getActiveLanguages();
    if (!activeLanguages.contains(bibleStudy.lang.name) &&
        bibleStudy.lang != Languages.defaultLang) {
      getIt<BibleStudyUserLanguagesHandler>()
          .addLanguage(bibleStudy.lang.name, true)
          .then((_) => _getBibleStudyList());
      return null;
    } else {
      final sortedLessons = List<Lesson>.from(bibleStudy.lessons)
        ..sort((a, b) => a.id.compareTo(b.id));
      return bibleStudy.copyWith(lessons: sortedLessons);
    }
  }
}

class _NewDot extends StatelessWidget {
  const _NewDot({required this.number});
  final int number;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(' $number', style: Theme.of(context).textTheme.titleLarge),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.redAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
