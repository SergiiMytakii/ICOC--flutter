import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;

import 'package:go_router/go_router.dart';

import 'package:icoc/core/constants.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/domain/model/q&a/q&a_model.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart';
import 'package:icoc/presentation/bloc/q&a_bloc/one_q&a/one_q&a_bloc.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/font_size_adjust_bottom_sheet.dart';
import 'package:icoc/presentation/widget/scale_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class OneQandAScreen extends StatefulWidget {
  final QandAModel article;
  OneQandAScreen({
    super.key,
    required this.article,
  });
  static const fontStyle =
      TextStyle(color: ScreenColors.QandA, fontWeight: FontWeight.bold);

  @override
  State<OneQandAScreen> createState() => _OneQandAScreenState();
}

class _OneQandAScreenState extends State<OneQandAScreen> {
  @override
  void initState() {
    _getArticle();
    super.initState();
  }

  Future<void> _getArticle() async {
    getIt<OneQandABloc>().add(OneQandAEvent.requested(widget.article));
  }

  @override
  Widget build(BuildContext context) {
    final fontSozeAdjust =
        FontSizeAdjustBottomSheet(context: context, color: ScreenColors.QandA);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'drawer_q_and_a'.tr(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.text_fields_outlined,
              ),
              onPressed: () => fontSozeAdjust.bottomSheet()),
        ],
      ),
      body: BlocBuilder<OneQandABloc, OneQandAState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => CustomRefreshIndicator(onRefresh: _getArticle),
            success: (article) => SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<FontSizeBloc, FontSizeState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (fontSize) => ScaleText(
                      fontSize: fontSize ?? 14,
                      child: SelectionArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Question:'.tr(),
                              style: OneQandAScreen.fontStyle
                                  .copyWith(fontSize: fontSize),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              article.question,
                              style: TextStyle(fontSize: fontSize),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Answer:'.tr(),
                              style: OneQandAScreen.fontStyle
                                  .copyWith(fontSize: fontSize),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (article.answer.startsWith('<'))
                              html.Html(
                                data: article.answer,
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
                              )
                            else
                              Text(
                                article.answer,
                                style: TextStyle(fontSize: fontSize),
                              ),
                            if (article.youtubeLink != null)
                              _buildYoutubeLink(article, context, fontSize),
                            const SizedBox(
                              height: 20,
                            ),
                            if (article.date != null)
                              Text(
                                '${'Date:'.tr()} ${article.date}',
                                style: OneQandAScreen.fontStyle
                                    .copyWith(fontSize: fontSize),
                              ),
                            if (article.author != null)
                              Text(
                                '${'Author:'.tr()} ${article.author}',
                                style: OneQandAScreen.fontStyle
                                    .copyWith(fontSize: fontSize),
                              ),
                            if (article.translatedBy != null)
                              Text(
                                '${'Translated by:'.tr()} ${article.translatedBy}',
                                style: OneQandAScreen.fontStyle
                                    .copyWith(fontSize: fontSize),
                              ),
                            if (article.source != null)
                              _buildActiveLink(
                                fontSize: fontSize,
                                label: 'Source:'.tr(),
                                url: article.source!,
                              )
                          ],
                        ),
                      ),
                    ),
                    orElse: () => Container(),
                  );
                },
              ),
            ),
            error: (message) => RefreshIndicator.adaptive(
              onRefresh: _getArticle,
              child: ListView(
                children: [
                  ErrorTextOnScreen(message: message),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  GestureDetector _buildYoutubeLink(
      QandAModel article, BuildContext context, double? fontSize) {
    return GestureDetector(
        onTap: () {
          final videoId =
              YoutubePlayerController.convertUrlToId(article.youtubeLink!) ??
                  '';
          context.go('/$Q_AND_ANSVERS/$Q_AND_A_VIDEO_PLAYER/$videoId');
        },
        child: Text(
          article.youtubeLink!,
          style: OneQandAScreen.fontStyle.copyWith(
            fontSize: fontSize! - 5,
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ));
  }

  GestureDetector _buildActiveLink({
    double? fontSize,
    required String label,
    required String url,
  }) {
    return GestureDetector(
      onTap: () async {
        final urlString = url.toLowerCase();
        final uri = urlString.startsWith('http')
            ? Uri.parse(urlString)
            : Uri.parse('https://$urlString');

        if (await canLaunchUrl(uri)) {
          launchUrl(
            uri,
          );
        }
      },
      child: Row(
        children: [
          Text(
            label,
            style: OneQandAScreen.fontStyle.copyWith(fontSize: fontSize),
          ),
          Expanded(
            child: Text(
              url,
              style: OneQandAScreen.fontStyle.copyWith(
                decoration: TextDecoration.underline,
                fontSize: fontSize,
                color: Colors.blue,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
