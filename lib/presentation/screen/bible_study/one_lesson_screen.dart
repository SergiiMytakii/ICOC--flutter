import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:icoc/constants.dart';
import 'package:icoc/core/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/core/bloc/font_size_bloc/font_size_bloc.dart';
import 'package:icoc/core/helpers/extract_text_from_html.dart';
import 'package:icoc/core/model/bible_study.dart';
import 'package:icoc/presentation/widget/font_size_adjust_bottom_sheet.dart';
import 'package:icoc/presentation/widget/scale_text.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakelock/wakelock.dart';

class OneLessonScreen extends StatefulWidget {
  OneLessonScreen() {
    Wakelock.enable();
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
                  Share.share(FormatTextHelper.extractFormattedText(
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
                    return ScaleText(
                      fontSize: state.fontSize ?? 14,
                      child: html.Html(
                        data: lesson.text,
                        onLinkTap: (url, __, ___) {
                          launchUrl(Uri.parse(url ?? ''));
                        },
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
                      ),
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
