import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/app_toast.dart';
import 'package:icoc/core/helpers/youtube_thumbnail_helper.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/model/insights/post_type.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/insights/insights_bloc.dart';
import 'package:icoc/presentation/bloc/insights/insights_event.dart';
import 'package:icoc/presentation/bloc/insights/insights_state.dart';
import 'package:icoc/presentation/screen/insights/widget/bottom_sheet_insights_filter.dart';
import 'package:icoc/presentation/screen/insights/widget/insight_feed_item.dart';
import 'package:icoc/presentation/widget/animated_filter_button.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';
import 'package:icoc/presentation/widget/youtube_video_player_screen.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _feedViewportKey = GlobalKey();
  final Map<String, GlobalKey> _postKeys = <String, GlobalKey>{};
  List<Post> _renderedPosts = const <Post>[];
  bool _centerDetectionScheduled = false;
  String? _activeVideoPostId;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scheduleCenteredVideoDetection);
    _refresh();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scheduleCenteredVideoDetection);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    context
        .read<InsightsBloc>()
        .add(const InsightsEvent.fetchAvailableLanguagesAndPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'.tr()),
        centerTitle: true,
        actions: [
          AnimatedFilterIconButton(
            shouldAnimate: StorageKeys.shouldWallFilterAnimate,
            shouldAnimateForever: getIt<InsightsUserLanguagesHandler>()
                .getActiveLanguages()
                .isEmpty,
            onTap: () => showLangFilter(context),
            color: ScreenColors.general,
          ),
        ],
      ),
      body: BlocConsumer<InsightsBloc, InsightsState>(
        listener: (BuildContext context, InsightsState state) {
          state.maybeWhen(
            loaded: (
              List<Post> _,
              List<String> __,
              Map<String, bool> ___,
              Set<String> ____,
              Set<String> _____,
              String? actionMessage,
            ) {
              if (actionMessage != null && actionMessage.isNotEmpty) {
                AppToast.show(
                  context,
                  title: 'Insights'.tr(),
                  body: actionMessage,
                );
              }
            },
            orElse: () {},
          );
        },
        builder: (BuildContext context, InsightsState state) {
          return state.when(
            initial: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
            error: (String message) => CustomRefreshIndicator(
              onRefresh: _refresh,
              child: _InsightsEmptyState(
                title: 'Unable to load insights',
                subtitle: message,
              ),
            ),
            loaded: (
              List<Post> posts,
              List<String> availableLanguages,
              Map<String, bool> selectedLanguages,
              Set<String> likedPostIds,
              Set<String> busyPostIds,
              String? _,
            ) {
              if (availableLanguages.isEmpty) {
                return CustomRefreshIndicator(
                  onRefresh: _refresh,
                  child: const _InsightsEmptyState(
                    title: 'No insight content yet',
                    subtitle:
                        'Add published posts to Insights and expose available languages.',
                  ),
                );
              }

              if (posts.isEmpty) {
                _setActiveVideoPostId(null);
                return CustomRefreshIndicator(
                  onRefresh: _refresh,
                  child: _InsightsEmptyState(
                    title: 'No posts for selected languages',
                    subtitle: 'Change the language filter to see more content.',
                    actionLabel: 'Open filters',
                    onAction: () => showLangFilter(context),
                  ),
                );
              }

              _syncRenderedPosts(posts);
              return RefreshIndicator.adaptive(
                onRefresh: () async => _refresh(),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    _scheduleCenteredVideoDetection();
                    return false;
                  },
                  child: ListView.builder(
                    key: _feedViewportKey,
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Post post = posts[index];
                      return Container(
                        key: _postKeys[post.id],
                        child: InsightFeedItem(
                          post: post,
                          isLiked: likedPostIds.contains(post.id),
                          isBusy: busyPostIds.contains(post.id),
                          autoplayVideo: _activeVideoPostId == post.id,
                          onLike: () => context
                              .read<InsightsBloc>()
                              .add(InsightsEvent.toggleLike(post.id)),
                          onComment: () => _openPost(post),
                          onShare: () => _sharePost(post),
                          onOpenDetails: () => _openPost(post),
                          onPlayVideo: () => _playVideo(post),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _openPost(Post post) {
    context.go('/$INSIGHTS/$ONE_INSIGHT_SCREEN', extra: post);
  }

  Future<void> _sharePost(Post post) async {
    final String shareContent = _buildShareContent(post);

    await SharePlus.instance.share(ShareParams(text: shareContent));
    if (!mounted) {
      return;
    }
    context.read<InsightsBloc>().add(InsightsEvent.shareTapped(post.id));
  }

  void _playVideo(Post post) {
    final String? videoId = YoutubeThumbnailHelper.resolveVideoId(
      youtubeId: post.youtubeId,
      articleUrl: post.articleUrl,
    );
    if (videoId == null || videoId.isEmpty) {
      _openPost(post);
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => YoutubeVideoPlayerScreen(videoId: videoId),
      ),
    );
  }

  String _buildShareContent(Post post) {
    final StringBuffer buffer = StringBuffer(post.content?.trim() ?? '');
    final String? videoId = YoutubeThumbnailHelper.resolveVideoId(
      youtubeId: post.youtubeId,
      articleUrl: post.articleUrl,
    );
    final String? shareUrl = switch (post.type) {
      PostType.video => (post.articleUrl ?? '').trim().isNotEmpty
          ? post.articleUrl!.trim()
          : (videoId != null
              ? 'https://www.youtube.com/watch?v=$videoId'
              : null),
      PostType.image => post.primaryMediaUrl,
    };
    if (shareUrl != null && shareUrl.isNotEmpty) {
      if (buffer.isNotEmpty) {
        buffer.writeln();
      }
      buffer.write(shareUrl);
    }
    return buffer.toString().trim();
  }

  void _syncRenderedPosts(List<Post> posts) {
    _renderedPosts = posts;
    final Set<String> postIds = posts.map((Post post) => post.id).toSet();
    _postKeys
        .removeWhere((String key, GlobalKey value) => !postIds.contains(key));
    for (final Post post in posts) {
      _postKeys.putIfAbsent(post.id, GlobalKey.new);
    }
    _scheduleCenteredVideoDetection();
  }

  void _scheduleCenteredVideoDetection() {
    if (_centerDetectionScheduled) {
      return;
    }
    _centerDetectionScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _centerDetectionScheduled = false;
      if (!mounted) {
        return;
      }
      _updateCenteredVideoPost();
    });
  }

  void _updateCenteredVideoPost() {
    final BuildContext? viewportContext = _feedViewportKey.currentContext;
    if (viewportContext == null) {
      _setActiveVideoPostId(null);
      return;
    }
    final RenderObject? viewportRenderObject =
        viewportContext.findRenderObject();
    if (viewportRenderObject is! RenderBox || !viewportRenderObject.attached) {
      _setActiveVideoPostId(null);
      return;
    }

    final double viewportHeight = viewportRenderObject.size.height;
    final double viewportCenterY = viewportHeight / 2;
    String? bestPostId;
    double bestDistance = double.infinity;

    for (final Post post in _renderedPosts.where(
      (Post value) => value.type == PostType.video,
    )) {
      final BuildContext? itemContext = _postKeys[post.id]?.currentContext;
      if (itemContext == null) {
        continue;
      }
      final RenderObject? itemRenderObject = itemContext.findRenderObject();
      if (itemRenderObject is! RenderBox || !itemRenderObject.attached) {
        continue;
      }

      final Offset offset = itemRenderObject.localToGlobal(
        Offset.zero,
        ancestor: viewportRenderObject,
      );
      final double itemTop = offset.dy;
      final double itemBottom = itemTop + itemRenderObject.size.height;
      final double visibleTop = itemTop.clamp(0.0, viewportHeight);
      final double visibleBottom = itemBottom.clamp(0.0, viewportHeight);
      final double visibleHeight = visibleBottom - visibleTop;
      if (visibleHeight <= itemRenderObject.size.height * 0.45) {
        continue;
      }

      final double itemMidpoint = itemTop + (itemRenderObject.size.height / 2);
      final double distance = (itemMidpoint - viewportCenterY).abs();
      if (distance < bestDistance) {
        bestDistance = distance;
        bestPostId = post.id;
      }
    }

    _setActiveVideoPostId(bestPostId);
  }

  void _setActiveVideoPostId(String? postId) {
    if (_activeVideoPostId == postId) {
      return;
    }
    setState(() {
      _activeVideoPostId = postId;
    });
  }
}

Future<dynamic> showLangFilter(BuildContext context) {
  return showModalBottomSheet(
    scrollControlDisabledMaxHeightRatio: 2,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return ModalBottomSheet(
        height: MediaQuery.of(context).size.height / 2.5,
        blurBackground: false,
        child: const BottomSheetInsightsFilter(),
      );
    },
  );
}

class _InsightsEmptyState extends StatelessWidget {
  const _InsightsEmptyState({
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.perm_media_outlined,
              size: 44,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 16),
              FilledButton(
                onPressed: onAction,
                child: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
