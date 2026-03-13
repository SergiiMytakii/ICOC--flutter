import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/bible_reference_link_handler.dart';
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
import 'package:icoc/injection.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';

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

class _OneLessonScreenState extends State<OneLessonScreen>
    with WidgetsBindingObserver {
  late final ScrollController _scrollController;
  double _lastOffset = 0;
  bool _restored = false;
  String? _lastRawHtml;
  String? _lastLinkedHtml;
  String? _lastLangHint;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _lastOffset = _scrollController.offset;
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _saveReadingPosition();
    WidgetsBinding.instance.removeObserver(this);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      _saveReadingPosition();
    }
  }

  @override
  Widget build(BuildContext context) {
    final fontSozeAdjust = FontSizeAdjustBottomSheet(
        context: context, color: ScreenColors.bibleStudy);

    return BlocBuilder<BibleStudyBloc, BibleStudyState>(
      builder: (context, state) {
        return state.when(
            initial: () => const Scaffold(body: SizedBox()),
            loading: () => const Scaffold(
                body: Center(child: CircularProgressIndicator())),
            success: (topics) {
              final topic = _receiveTopic(topics);
              final lesson = _receiveLesson(topic);
              final lessonHtml = _prepareLessonHtml(
                lesson.text,
                langHint: topic.lang.name,
              );
              _tryRestore();
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
                  controller: _scrollController,
                  child: SelectionArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: BlocBuilder<FontSizeBloc, FontSizeState>(
                        builder: (context, fontState) {
                          return fontState.maybeWhen(
                            success: (fontSize) => ScaleText(
                              fontSize: fontSize ?? 14,
                              child: html.Html(
                                data: lessonHtml,
                                onLinkTap: (url, __, ___) async {
                                  final bool handled =
                                      await BibleReferenceLinkHandler
                                          .handleLinkTap(
                                    context,
                                    url: url,
                                    langHint: topic.lang.name,
                                  );
                                  if (handled) {
                                    return;
                                  }
                                  final Uri? uri = Uri.tryParse(url ?? '');
                                  if (uri != null &&
                                      !uri.scheme.contains('wordhtml.com')) {
                                    launchUrl(uri);
                                  }
                                },
                                extensions: [
                                  html.OnImageTapExtension(
                                    onImageTap: (src, __, ___) {
                                      _showZoomableImage(src);
                                    },
                                  ),
                                ],
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
            error: (message) => ErrorTextOnScreen(message: message),
            empty: () => const SizedBox.shrink());
      },
    );
  }

  void _share(Lesson lesson) {
    final link =
        '$ICOC_WEB_PAGE/$BIBLE_STUDY/$ONE_TOPIC_SCREEN/${widget.topicId}/$ONE_LESSON_SCREEN/${lesson.id}';
    final hint = 'Open in ICOC app:'.tr();

    final text =
        '${lesson.title}\n\n${FormatTextHelper.extractFormattedText(lesson.text)}\n\n$hint\n$link';

    SharePlus.instance.share(ShareParams(text: text));
  }

  BibleStudy _receiveTopic(List<BibleStudy> topics) {
    return topics.firstWhere(
      (item) => item.id == int.tryParse(widget.topicId),
      orElse: () => BibleStudy.defaultBibleStudy,
    );
  }

  Lesson _receiveLesson(BibleStudy topic) {
    return topic.lessons.firstWhere(
      (item) => item.id == int.tryParse(widget.lessonId),
      orElse: () => Lesson.defaultLesson,
    );
  }

  String _prepareLessonHtml(String rawHtml, {required String langHint}) {
    if (_lastRawHtml == rawHtml &&
        _lastLinkedHtml != null &&
        _lastLangHint == langHint) {
      return _lastLinkedHtml!;
    }

    final String linked =
        BibleReferenceLinkHandler.preprocessHtml(rawHtml, langHint: langHint);
    _lastRawHtml = rawHtml;
    _lastLinkedHtml = linked;
    _lastLangHint = langHint;
    return linked;
  }

  void _saveReadingPosition() {
    final position = _lastOffset;
    getIt<LocalCache>().saveMap(StorageKeys.bibleStudyReadPosition, {
      'topicId': widget.topicId,
      'lessonId': widget.lessonId,
      'offset': position,
      'ts': DateTime.now().millisecondsSinceEpoch,
    });
  }

  void _tryRestore() {
    if (_restored) return;
    final map = getIt<LocalCache>().getMap(StorageKeys.bibleStudyReadPosition);
    final topicId = map?['topicId']?.toString();
    final lessonId = map?['lessonId']?.toString();
    final offset =
        (map?['offset'] is num) ? (map?['offset'] as num).toDouble() : 0.0;
    if (topicId == widget.topicId && lessonId == widget.lessonId) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(offset);
          _restored = true;
        }
      });
    }
  }

  void _showZoomableImage(String? source) {
    if (!mounted || source == null || source.isEmpty) return;

    final imageWidget = _buildZoomImageWidget(source);
    if (imageWidget == null) return;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black87,
      builder: (dialogContext) {
        final size = MediaQuery.sizeOf(dialogContext);
        return Scaffold(
          backgroundColor: Colors.black87,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: InteractiveViewer(
                    minScale: 1,
                    maxScale: 8,
                    constrained: false,
                    boundaryMargin: const EdgeInsets.all(120),
                    child: SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Center(child: imageWidget),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget? _buildZoomImageWidget(String source) {
    if (source.startsWith('data:image')) {
      final commaIndex = source.indexOf(',');
      if (commaIndex < 0 || commaIndex + 1 >= source.length) return null;
      final bytes = base64Decode(source.substring(commaIndex + 1));
      return Image.memory(bytes, fit: BoxFit.contain);
    }

    if (source.startsWith('asset:')) {
      final assetPath = source.substring('asset:'.length);
      return Image.asset(assetPath, fit: BoxFit.contain);
    }

    if (source.startsWith('http://') || source.startsWith('https://')) {
      return Image.network(source, fit: BoxFit.contain);
    }

    if (source.startsWith('assets/')) {
      return Image.asset(source, fit: BoxFit.contain);
    }

    return null;
  }
}
