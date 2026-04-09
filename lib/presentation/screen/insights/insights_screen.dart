import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:async';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/helpers/app_toast.dart';
import 'package:icoc/core/helpers/insights_share_helper.dart';
import 'package:icoc/core/helpers/youtube_thumbnail_helper.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/core/user_state/insights_interaction_local_store.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/domain/model/insights/insight_comment.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/model/insights/post_type.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/insights/insights_bloc.dart';
import 'package:icoc/presentation/bloc/insights/insights_event.dart';
import 'package:icoc/presentation/bloc/insights/insights_state.dart';
import 'package:icoc/presentation/bloc/insights_comments/insights_comments_bloc.dart';
import 'package:icoc/presentation/bloc/insights_comments/insights_comments_event.dart';
import 'package:icoc/presentation/bloc/insights_comments/insights_comments_state.dart';
import 'package:icoc/presentation/screen/insights/widget/bottom_sheet_insights_filter.dart';
import 'package:icoc/presentation/screen/insights/widget/insight_comment_input.dart';
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
  final Map<String, GlobalKey> _mediaKeys = <String, GlobalKey>{};
  InsightsCommentsBloc? _commentsBloc;
  String? _commentsPostId;
  String? _lastSubmittedCommentId;
  List<Post> _renderedPosts = const <Post>[];
  bool _centerDetectionScheduled = false;
  String? _activeVideoPostId;
  String? _preparedVideoPostId;
  Timer? _videoActivationTimer;
  String? _pendingVideoPostId;
  bool _showLikedOnly = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scheduleCenteredVideoDetection);
    _ensureInsightsLoaded();
    // Fire for re-entry when posts are already loaded
    context.read<InsightsBloc>().state.maybeWhen(
          loaded: (_, __, ___, ____, _____, ______, _______) => context
              .read<InsightsBloc>()
              .add(const InsightsEvent.screenOpened()),
          orElse: () {},
        );
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _silentRefreshIfLoaded());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scheduleCenteredVideoDetection);
    _videoActivationTimer?.cancel();
    _commentsBloc?.close();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    context
        .read<InsightsBloc>()
        .add(const InsightsEvent.fetchAvailableLanguagesAndPosts());
  }

  void _ensureInsightsLoaded() {
    final InsightsState state = context.read<InsightsBloc>().state;
    state.maybeWhen(
      initial: () => _refresh(),
      orElse: () {},
    );
  }

  void _silentRefreshIfLoaded() {
    final InsightsState state = context.read<InsightsBloc>().state;
    state.maybeWhen(
      loaded: (List<Post> posts, List<String> _, Map<String, bool> __,
              Set<String> ___, Set<String> ____, int _____, String? ______) =>
          context.read<InsightsBloc>().add(
                const InsightsEvent.fetchAvailableLanguagesAndPosts(
                  silent: true,
                ),
              ),
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'.tr()),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => setState(() {
              _showLikedOnly = !_showLikedOnly;
            }),
            tooltip: _showLikedOnly
                ? 'insights_show_all_posts'.tr()
                : 'insights_show_liked_only'.tr(),
            icon: Icon(
              _showLikedOnly ? Icons.favorite : Icons.favorite_border,
              color: _showLikedOnly ? Colors.redAccent : ScreenColors.general,
            ),
          ),
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
              List<Post> posts,
              List<String> __,
              Map<String, bool> ___,
              Set<String> ____,
              Set<String> _____,
              int ______,
              String? actionMessage,
            ) {
              context
                  .read<InsightsBloc>()
                  .add(const InsightsEvent.screenOpened());
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
            initial: () {
              if (_showLikedOnly) {
                return CustomRefreshIndicator(
                  onRefresh: _refresh,
                  child: _InsightsEmptyState(
                    title: 'insights_no_liked_title'.tr(),
                    subtitle: 'insights_no_liked_subtitle'.tr(),
                    actionLabel: 'insights_show_all_posts'.tr(),
                    onAction: () => setState(() => _showLikedOnly = false),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator.adaptive());
            },
            loading: () {
              if (_showLikedOnly) {
                return CustomRefreshIndicator(
                  onRefresh: _refresh,
                  child: _InsightsEmptyState(
                    title: 'insights_no_liked_title'.tr(),
                    subtitle: 'insights_no_liked_subtitle'.tr(),
                    actionLabel: 'insights_show_all_posts'.tr(),
                    onAction: () => setState(() => _showLikedOnly = false),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator.adaptive());
            },
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
              int unreadCount,
              String? _,
            ) {
              assert(unreadCount >= 0);
              final List<Post> visiblePosts = _showLikedOnly
                  ? posts
                      .where((Post post) => likedPostIds.contains(post.id))
                      .toList()
                  : posts;

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
                _setPreparedVideoPostId(null);
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

              if (_showLikedOnly && visiblePosts.isEmpty) {
                _setPreparedVideoPostId(null);
                _setActiveVideoPostId(null);
                return CustomRefreshIndicator(
                  onRefresh: _refresh,
                  child: _InsightsEmptyState(
                    title: 'insights_no_liked_title'.tr(),
                    subtitle: 'insights_no_liked_subtitle'.tr(),
                    actionLabel: 'insights_show_all_posts'.tr(),
                    onAction: () => setState(() => _showLikedOnly = false),
                  ),
                );
              }

              _syncRenderedPosts(visiblePosts);
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
                    itemCount: visiblePosts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Post post = visiblePosts[index];
                      return InsightFeedItem(
                        mediaKey: _mediaKeys[post.id],
                        post: post,
                        isLiked: likedPostIds.contains(post.id),
                        isBusy: busyPostIds.contains(post.id),
                        autoplayVideo: _activeVideoPostId == post.id,
                        prepareVideo: _preparedVideoPostId == post.id ||
                            _activeVideoPostId == post.id,
                        onLike: () => context
                            .read<InsightsBloc>()
                            .add(InsightsEvent.toggleLike(post.id)),
                        onComment: () =>
                            _openCommentsBottomSheet(context, post),
                        onShare: () => _sharePost(post),
                        onOpenDetails: () => _openPost(post),
                        onPlayVideo: () => _playVideo(post),
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

  String _formatDate(DateTime dateTime) {
    final DateTime local = dateTime.toLocal();
    return '${local.year.toString().padLeft(4, '0')}-'
        '${local.month.toString().padLeft(2, '0')}-'
        '${local.day.toString().padLeft(2, '0')}';
  }

  void _openCommentsBottomSheet(BuildContext context, Post post) {
    _ensureCommentsBloc(post.id);

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext modalContext) {
        final ThemeData theme = Theme.of(modalContext);
        return DraggableScrollableSheet(
          expand: false,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (BuildContext context, ScrollController controller) {
            return BlocProvider<InsightsCommentsBloc>.value(
              value: _commentsBloc!,
              child: BlocListener<InsightsCommentsBloc, InsightsCommentsState>(
                listener: (BuildContext context, InsightsCommentsState state) {
                  state.maybeWhen(
                    loaded: (
                      String _postId,
                      List<InsightComment> _comments,
                      bool _isSubmitting,
                      String? actionMessage,
                      String? lastSubmittedCommentId,
                    ) {
                      if (actionMessage != null && actionMessage.isNotEmpty) {
                        AppToast.show(
                          context,
                          title: 'comments_title'.tr(),
                          body: actionMessage,
                        );
                      }
                      if (lastSubmittedCommentId != null &&
                          lastSubmittedCommentId != _lastSubmittedCommentId) {
                        _lastSubmittedCommentId = lastSubmittedCommentId;
                        this
                            .context
                            .read<InsightsBloc>()
                            .add(InsightsEvent.refreshSinglePost(post.id));
                      }
                    },
                    orElse: () {},
                  );
                },
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          width: 36,
                          height: 4,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.outlineVariant,
                            borderRadius: BorderRadius.circular(99),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              'comments_title'.tr(),
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () => modalContext
                                  .read<InsightsCommentsBloc>()
                                  .add(InsightsCommentsEvent.refresh(post.id)),
                              icon: const Icon(Icons.refresh_rounded),
                              tooltip: 'comments_refresh'.tr(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: BlocBuilder<InsightsCommentsBloc,
                            InsightsCommentsState>(
                          builder: (BuildContext context,
                              InsightsCommentsState state) {
                            return state.maybeWhen(
                              initial: () => const Center(
                                  child: CircularProgressIndicator.adaptive()),
                              loading: () => const Center(
                                  child: CircularProgressIndicator.adaptive()),
                              error: (String message) => Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      message,
                                      textAlign: TextAlign.center,
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        color:
                                            theme.colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    FilledButton.icon(
                                      onPressed: () => context
                                          .read<InsightsCommentsBloc>()
                                          .add(InsightsCommentsEvent.refresh(
                                              post.id)),
                                      icon: const Icon(Icons.refresh),
                                      label: Text('comments_retry'.tr()),
                                    ),
                                  ],
                                ),
                              ),
                              loaded: (
                                String _postId,
                                List<InsightComment> comments,
                                bool _isSubmitting,
                                String? _actionMessage,
                                String? _lastSubmittedCommentId,
                              ) {
                                if (comments.isEmpty) {
                                  return ListView(
                                    controller: controller,
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 12, 16, 16),
                                    children: [
                                      Text(
                                        'comments_empty'.tr(),
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          color: theme
                                              .colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  );
                                }

                                return ListView.separated(
                                  controller: controller,
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 12, 16, 16),
                                  itemCount: comments.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 12),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final InsightComment comment =
                                        comments[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: theme.textTheme.bodyMedium,
                                            children: [
                                              TextSpan(
                                                text: '${comment.displayName} ',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              TextSpan(text: comment.text),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          _formatDate(comment.createdAt),
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                            color: theme
                                                .colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              orElse: () => const SizedBox.shrink(),
                            );
                          },
                        ),
                      ),
                      if (post.allowComments)
                        BlocBuilder<InsightsCommentsBloc,
                            InsightsCommentsState>(
                          builder: (BuildContext context,
                              InsightsCommentsState state) {
                            final bool isSubmitting = state.maybeWhen(
                              loaded: (
                                String _postId,
                                List<InsightComment> _comments,
                                bool isSubmitting,
                                String? _actionMessage,
                                String? _lastSubmittedCommentId,
                              ) =>
                                  isSubmitting,
                              orElse: () => false,
                            );
                            return InsightCommentInput(
                              isSubmitting: isSubmitting,
                              onSubmit: (String text) =>
                                  _submitComment(modalContext, post.id, text),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _ensureCommentsBloc(String postId) {
    if (_commentsPostId == postId && _commentsBloc != null) {
      return;
    }
    _commentsBloc?.close();
    _commentsPostId = postId;
    _commentsBloc = getIt<InsightsCommentsBloc>()
      ..add(InsightsCommentsEvent.fetch(postId));
  }

  Future<void> _submitComment(
    BuildContext context,
    String postId,
    String text,
  ) async {
    final String? displayName = await _ensureDisplayName(context);
    if (displayName == null || displayName.isEmpty) {
      return;
    }
    _commentsBloc?.add(
      InsightsCommentsEvent.submit(
        postId: postId,
        text: text,
        displayName: displayName,
      ),
    );
  }

  Future<String?> _ensureDisplayName(BuildContext context) async {
    final InsightsInteractionLocalStore localStore =
        getIt<InsightsInteractionLocalStore>();
    final String? cached = localStore.getDisplayName();
    if (cached != null && cached.isNotEmpty) {
      return cached;
    }

    final TextEditingController controller = TextEditingController();
    final String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Your name'.tr()),
          content: TextField(
            controller: controller,
            autofocus: true,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: 'Please enter your name'.tr(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text('Cancel'.tr()),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(controller.text.trim());
              },
              child: Text('Save'.tr()),
            ),
          ],
        );
      },
    );
    controller.dispose();
    if (result == null || result.trim().isEmpty) {
      return null;
    }
    final String trimmedResult = result.trim();
    await localStore.saveDisplayName(trimmedResult);
    return trimmedResult;
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
    return InsightsShareHelper.buildShareContent(post);
  }

  void _syncRenderedPosts(List<Post> posts) {
    _renderedPosts = posts;
    final Set<String> postIds = posts.map((Post post) => post.id).toSet();
    _mediaKeys
        .removeWhere((String key, GlobalKey value) => !postIds.contains(key));
    for (final Post post in posts) {
      _mediaKeys.putIfAbsent(post.id, GlobalKey.new);
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
    final double activationBand = viewportHeight * 0.18;
    final double preparationBand = viewportHeight * 0.34;
    String? bestPostId;
    String? preparedPostId;
    double bestDistance = double.infinity;
    double bestPreparationDistance = double.infinity;

    for (final Post post in _renderedPosts.where(
      (Post value) =>
          value.type == PostType.video &&
          YoutubeThumbnailHelper.isShortsUrl(value.articleUrl),
    )) {
      final BuildContext? itemContext = _mediaKeys[post.id]?.currentContext;
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
      final double visibleRatio = visibleHeight / itemRenderObject.size.height;
      if (visibleRatio < 0.6) {
        continue;
      }

      final double itemMidpoint = itemTop + (itemRenderObject.size.height / 2);
      final double distance = (itemMidpoint - viewportCenterY).abs();
      if (distance <= preparationBand && distance < bestPreparationDistance) {
        bestPreparationDistance = distance;
        preparedPostId = post.id;
      }
      if (distance > activationBand) {
        continue;
      }
      if (distance < bestDistance) {
        bestDistance = distance;
        bestPostId = post.id;
      }
    }

    _setPreparedVideoPostId(preparedPostId);
    _scheduleVideoActivation(bestPostId);
  }

  void _scheduleVideoActivation(String? postId) {
    if (postId == null) {
      _pendingVideoPostId = null;
      _videoActivationTimer?.cancel();
      _setActiveVideoPostId(null);
      return;
    }
    if (_activeVideoPostId == postId) {
      _pendingVideoPostId = null;
      _videoActivationTimer?.cancel();
      return;
    }
    if (_pendingVideoPostId == postId) {
      return;
    }
    _pendingVideoPostId = postId;
    _videoActivationTimer?.cancel();
    _videoActivationTimer = Timer(
      const Duration(milliseconds: 220),
      () {
        if (!mounted || _pendingVideoPostId != postId) {
          return;
        }
        _setActiveVideoPostId(postId);
      },
    );
  }

  void _setActiveVideoPostId(String? postId) {
    if (_activeVideoPostId == postId) {
      return;
    }
    setState(() {
      _activeVideoPostId = postId;
    });
  }

  void _setPreparedVideoPostId(String? postId) {
    if (_preparedVideoPostId == postId) {
      return;
    }
    setState(() {
      _preparedVideoPostId = postId;
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
