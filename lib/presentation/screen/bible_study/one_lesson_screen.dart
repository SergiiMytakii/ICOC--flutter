import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/model/bible_study/bible_study.dart';
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart';
import 'package:icoc/core/helpers/extract_text_from_html.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/font_size_adjust_bottom_sheet.dart';
import 'package:icoc/presentation/widget/scale_text.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class OneLessonScreen extends StatefulWidget {
  final String lessonId;
  final String topicId;

  OneLessonScreen({super.key, required this.lessonId, required this.topicId}) {
    WakelockPlus.enable();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
  }

  @override
  State<OneLessonScreen> createState() => _OneLessonScreenState();
}

class _OneLessonScreenState extends State<OneLessonScreen> {
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fontSozeAdjust = FontSizeAdjustBottomSheet(
        context: context, color: ScreenColors.bibleStudy);

    return BlocBuilder<BibleStudyBloc, BibleStudyState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Scaffold(body: SizedBox()),
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          success: (topics) {
            final lesson = _receiveLesson(topics);

            return Scaffold(
              appBar: AppBar(
                title: Text(
                  lesson.title,
                  style: const TextStyle(fontSize: 14),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    tooltip: 'Share'.tr(),
                    icon: const Icon(Icons.share),
                    onPressed: () => _share(lesson),
                  ),
                  IconButton(
                    icon: const Icon(Icons.text_fields_outlined),
                    onPressed: () => fontSozeAdjust.bottomSheet(),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: SelectionArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: BlocBuilder<FontSizeBloc, FontSizeState>(
                      builder: (context, fontState) {
                        return fontState.maybeWhen(
                          success: (fontSize) => ScaleText(
                            fontSize: fontSize ?? 14,
                            child: html.Html(
                              data: lesson.text,
                              onLinkTap: (url, __, ___) {
                                launchUrl(Uri.parse(url ?? ''));
                              },
                              style: {
                                'body': html.Style(
                                    fontSize: html.FontSize(fontSize ?? 14)),
                                'h5': html.Style(
                                    fontSize: html.FontSize(fontSize ?? 14)),
                                'p': html.Style(
                                    fontSize: html.FontSize(fontSize ?? 14)),
                              },
                            ),
                          ),
                          orElse: () => const SizedBox(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
          error: (message) => Scaffold(
            body: ErrorTextOnScreen(message: message),
          ),
        );
      },
    );
  }

  void _share(Lesson lesson) {
    final link =
        '$ICOC_WEB_PAGE/$BIBLE_STUDY/$ONE_TOPIC_SCREEN/${widget.topicId}/$ONE_LESSON_SCREEN/${lesson.id}';
    final hint = 'Open in ICOC app:'.tr();

    final text =
        '${lesson.title}\n\n${FormatTextHelper.extractFormattedText(lesson.text)}\n\n$hint\n$link';

    Share.share(text);
  }

  Lesson _receiveLesson(List<BibleStudy> topics) {
    final topic = topics.firstWhere(
      (item) => item.id == int.parse(widget.topicId),
      orElse: () => BibleStudy.defaultBibleStudy,
    );
    return topic.lessons.firstWhere(
      (item) => item.id == int.parse(widget.lessonId),
      orElse: () => Lesson.defaultLesson,
    );
  }
}
