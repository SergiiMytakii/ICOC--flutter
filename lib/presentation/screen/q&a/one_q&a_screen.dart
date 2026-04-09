import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/bible_reference_link_handler.dart';
import 'package:icoc/core/helpers/convert_languages_enum.dart';
import 'package:icoc/core/helpers/qanda_share_helper.dart';
import 'package:icoc/core/helpers/youtube_thumbnail_helper.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/domain/model/q&a/q&a_model.dart';
import 'package:icoc/domain/repository/q&a_repository.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart';
import 'package:icoc/presentation/bloc/q&a_bloc/one_q&a/one_q&a_bloc.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/font_size_adjust_bottom_sheet.dart';
import 'package:icoc/presentation/widget/loading.dart';
import 'package:icoc/presentation/widget/scale_text.dart';

class OneQandAScreen extends StatefulWidget {
  const OneQandAScreen({
    super.key,
    this.article,
    this.articleId,
    this.langCode,
  });

  final QandAModel? article;
  final int? articleId;
  final String? langCode;

  @override
  State<OneQandAScreen> createState() => _OneQandAScreenState();
}

class _OneQandAScreenState extends State<OneQandAScreen>
    with WidgetsBindingObserver {
  static const TextStyle fontStyle =
      TextStyle(color: ScreenColors.QandA, fontWeight: FontWeight.bold);

  late final ScrollController _scrollController;
  double _lastOffset = 0;
  bool _restored = false;
  String? _lastRawHtml;
  String? _lastLinkedHtml;
  String? _lastLangHint;
  bool _isResolvingArticle = false;
  String? _resolveErrorMessage;
  QandAModel? _resolvedArticle;

  QandAModel? get _currentArticle => _resolvedArticle ?? widget.article;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _lastOffset = _scrollController.offset;
    });
    WidgetsBinding.instance.addObserver(this);
    _getArticle();
  }

  @override
  void dispose() {
    _saveReadingPosition();
    WidgetsBinding.instance.removeObserver(this);
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

  Future<void> _getArticle() async {
    setState(() {
      _isResolvingArticle = true;
      _resolveErrorMessage = null;
    });

    final QandAModel? article = await _resolveArticleForOpen();
    if (!mounted) {
      return;
    }
    if (article == null) {
      setState(() {
        _isResolvingArticle = false;
        _resolveErrorMessage = 'Article content not found'.tr();
      });
      return;
    }

    _resolvedArticle = article;
    setState(() {
      _isResolvingArticle = false;
      _resolveErrorMessage = null;
    });

    getIt<OneQandABloc>().add(OneQandAEvent.requested(article));
  }

  Future<QandAModel?> _resolveArticleForOpen() async {
    if (widget.article != null) {
      return widget.article;
    }

    final int? articleId = widget.articleId;
    if (articleId == null) {
      return null;
    }

    final QandARepository repository = getIt<QandARepository>();
    final Languages preferredLang = convertLanguagesEnum(
      (widget.langCode ?? context.locale.languageCode).toLowerCase(),
    );

    final primaryResult = await repository.getArticles(lang: preferredLang);
    final QandAModel? primaryMatch = primaryResult.fold(
      (_) => null,
      (List<QandAModel> articles) => _findById(articles, articleId),
    );
    if (primaryMatch != null) {
      return primaryMatch;
    }

    final fallbackResult = await repository.getArticles();
    return fallbackResult.fold(
      (_) => null,
      (List<QandAModel> articles) => _findById(articles, articleId),
    );
  }

  QandAModel? _findById(List<QandAModel> articles, int articleId) {
    for (final QandAModel article in articles) {
      if (article.id == articleId) {
        return article;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final FontSizeAdjustBottomSheet fontSozeAdjust = FontSizeAdjustBottomSheet(
      context: context,
      color: ScreenColors.QandA,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('drawer_q_and_a'.tr()),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _currentArticle == null
                ? null
                : () => _shareArticle(_currentArticle!),
          ),
          IconButton(
            icon: const Icon(Icons.text_fields_outlined),
            onPressed: () => fontSozeAdjust.bottomSheet(),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isResolvingArticle) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    if (_resolveErrorMessage != null) {
      return RefreshIndicator.adaptive(
        onRefresh: _getArticle,
        child: ListView(
          children: [
            ErrorTextOnScreen(message: _resolveErrorMessage!),
          ],
        ),
      );
    }

    return BlocBuilder<OneQandABloc, OneQandAState>(
      builder: (BuildContext context, OneQandAState state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => CustomRefreshIndicator(onRefresh: _getArticle),
          translating: () => Container(
            padding: const EdgeInsets.all(16),
            height: 700,
            child: Column(
              children: [
                Loading(),
                Text(
                  'We are translating the article... It takes a bit more time'
                      .tr(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          success: (QandAModel article) {
            _resolvedArticle = article;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              controller: _scrollController,
              child: BlocBuilder<FontSizeBloc, FontSizeState>(
                builder: (BuildContext context, FontSizeState state) {
                  _tryRestore();
                  return state.maybeWhen(
                    success: (double? fontSize) => ScaleText(
                      fontSize: fontSize ?? 14,
                      child: SelectionArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Question:'.tr(),
                              style: fontStyle.copyWith(fontSize: fontSize),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              article.question,
                              style: TextStyle(fontSize: fontSize),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Answer:'.tr(),
                              style: fontStyle.copyWith(fontSize: fontSize),
                            ),
                            const SizedBox(height: 10),
                            if (article.answer.startsWith('<'))
                              html.Html(
                                data: _prepareAnswerHtml(
                                  article.answer,
                                  langHint: article.lang.name,
                                ),
                                onLinkTap: (String? url, __, ___) async {
                                  final bool handled =
                                      await BibleReferenceLinkHandler
                                          .handleLinkTap(
                                    context,
                                    url: url,
                                    langHint: article.lang.name,
                                  );
                                  if (handled) {
                                    return;
                                  }
                                  final Uri? uri = Uri.tryParse(url ?? '');
                                  if (uri != null) {
                                    launchUrl(uri);
                                  }
                                },
                                style: {
                                  'body': html.Style(
                                    fontSize: html.FontSize(fontSize ?? 14),
                                  ),
                                  'h5': html.Style(
                                    fontSize: html.FontSize(fontSize ?? 14),
                                  ),
                                  'p': html.Style(
                                    fontSize: html.FontSize(fontSize ?? 14),
                                  ),
                                },
                              )
                            else
                              Text(
                                article.answer,
                                style: TextStyle(fontSize: fontSize),
                              ),
                            if (article.youtubeLink != null)
                              _buildYoutubeLink(article, context, fontSize),
                            const SizedBox(height: 20),
                            if (article.date != null)
                              Text(
                                '${'Date:'.tr()} ${article.date}',
                                style: fontStyle.copyWith(fontSize: fontSize),
                              ),
                            if (article.author != null)
                              Text(
                                '${'Author:'.tr()} ${article.author}',
                                style: fontStyle.copyWith(fontSize: fontSize),
                              ),
                            if (article.translatedBy != null)
                              Text(
                                '${'Translated by:'.tr()} ${article.translatedBy}',
                                style: fontStyle.copyWith(fontSize: fontSize),
                              ),
                            if (article.source != null)
                              _buildActiveLink(
                                fontSize: fontSize,
                                label: 'Source:'.tr(),
                                url: article.source!,
                              ),
                          ],
                        ),
                      ),
                    ),
                    orElse: () => Container(),
                  );
                },
              ),
            );
          },
          error: (String message) => RefreshIndicator.adaptive(
            onRefresh: _getArticle,
            child: ListView(
              children: [
                ErrorTextOnScreen(message: message),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _shareArticle(QandAModel article) async {
    final String shareContent = QandAShareHelper.buildShareContent(article);
    await SharePlus.instance.share(ShareParams(text: shareContent));
  }

  String _prepareAnswerHtml(String rawHtml, {required String langHint}) {
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

  GestureDetector _buildYoutubeLink(
      QandAModel article, BuildContext context, double? fontSize) {
    return GestureDetector(
      onTap: () {
        final String videoId =
            YoutubeThumbnailHelper.videoIdFromInput(article.youtubeLink!) ?? '';
        context.go('/$Q_AND_ANSVERS/$Q_AND_A_VIDEO_PLAYER/$videoId');
      },
      child: Text(
        article.youtubeLink!,
        style: fontStyle.copyWith(
          fontSize: fontSize! - 5,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  GestureDetector _buildActiveLink({
    double? fontSize,
    required String label,
    required String url,
  }) {
    return GestureDetector(
      onTap: () async {
        final String urlString = url.toLowerCase();
        final Uri uri = urlString.startsWith('http')
            ? Uri.parse(urlString)
            : Uri.parse('https://$urlString');

        if (await canLaunchUrl(uri)) {
          launchUrl(uri);
        }
      },
      child: Row(
        children: [
          Text(
            label,
            style: fontStyle.copyWith(fontSize: fontSize),
          ),
          Expanded(
            child: Text(
              url,
              style: fontStyle.copyWith(
                decoration: TextDecoration.underline,
                fontSize: fontSize,
                color: Colors.blue,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _saveReadingPosition() {
    final QandAModel? article = _currentArticle;
    if (article == null) {
      return;
    }
    getIt<LocalCache>().saveMap(StorageKeys.qAndAReadPosition, {
      'articleId': article.id,
      'offset': _lastOffset,
      'ts': DateTime.now().millisecondsSinceEpoch,
    });
  }

  void _tryRestore() {
    if (_restored) {
      return;
    }
    final QandAModel? article = _currentArticle;
    if (article == null) {
      return;
    }
    final Map<String, dynamic>? map =
        getIt<LocalCache>().getMap(StorageKeys.qAndAReadPosition);
    final dynamic articleId = map?['articleId'];
    final double offset =
        (map?['offset'] is num) ? (map?['offset'] as num).toDouble() : 0.0;
    if (articleId == article.id) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(offset);
          _restored = true;
        }
      });
    }
  }
}
