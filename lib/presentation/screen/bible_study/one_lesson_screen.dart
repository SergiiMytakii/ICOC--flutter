import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:html/parser.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/core/bloc/font_size_bloc/font_size_bloc.dart';
import 'package:icoc/core/model/bible_study.dart';
import 'package:icoc/presentation/widget/font_size_adjust_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wakelock/wakelock.dart';

class OneLessonScreen extends StatelessWidget {
  OneLessonScreen() {
    Wakelock.enable();
  }

  String parseHtml(String text) {
    var document = parse(text);
    return parse(document.body!.text).documentElement!.text;
  }

  @override
  Widget build(BuildContext context) {
    var fontSozeAdjust = FontSizeAdjustBottomSheet(
        context: context, color: ScreenColors.bibleStudy);
    final lesson = ModalRoute.of(context)!.settings.arguments as Lesson;

    return BlocBuilder<BibleStudyBloc, BibleStudyState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              lesson.title,
              style: TextStyle(fontSize: 14),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                tooltip: 'Share'.tr(),
                icon: Icon(
                  Icons.share,
                ),
                onPressed: () {
                  Share.share(parseHtml(
                    lesson.text,
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
            child: SelectionArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<FontSizeBloc, FontSizeState>(
                    builder: (context, state) {
                  if (state is FontSizeSuccess) {
                    return html.Html(
                      data: lesson.text,
                      style: {
                        "body": html.Style(
                          fontSize: html.FontSize(state.fontSize ?? 14),
                        ),
                        "h5": html.Style(
                          fontSize: html.FontSize(state.fontSize ?? 14),
                        ),
                        "p": html.Style(
                          fontSize: html.FontSize(state.fontSize ?? 14),
                        ),
                      },
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
