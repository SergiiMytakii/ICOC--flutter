import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:icoc/core/helpers/app_toast.dart';
import 'package:icoc/core/helpers/youtube_thumbnail_helper.dart';
import 'package:icoc/core/user_state/insights_interaction_local_store.dart';
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
import 'package:icoc/presentation/screen/insights/widget/insight_comment_input.dart';
import 'package:icoc/presentation/screen/insights/widget/insight_comments_section.dart';
import 'package:icoc/presentation/screen/insights/widget/insight_feed_item.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/youtube_video_player_screen.dart';

class OneInsightScreen extends StatefulWidget {
  const OneInsightScreen({super.key, this.post, this.postId, this.lang});

  final Post? post;
  final String? postId;
  final String? lang;

  @override
  State<OneInsightScreen> createState() => _OneInsightScreenState();
}

class _OneInsightScreenState extends State<OneInsightScreen> {
  InsightsCommentsBloc? _commentsBloc;
  String? _commentsPostId;
  bool _attemptedLangActivation = false;
  bool _attemptedSinglePostRefresh = false;
  String? _lastSubmittedCommentId;

  @override
  void initState() {
    super.initState();
    _ensureInsightsLoaded();
  }

  @override
  void dispose() {
    _commentsBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights'.tr()),
        centerTitle: true,
        actions: [],
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
          final Post? immediatePost =
              state.maybeWhen(loaded: _resolvePost, orElse: () => widget.post);

          if (immediatePost != null) {
            final likedPostIds = state.maybeWhen(
              loaded: (
                List<Post> _,
                List<String> __,
                Map<String, bool> ___,
                Set<String> likedPostIds,
                Set<String> ____,
                String? _____,
              ) =>
                  likedPostIds,
              orElse: () =>
                  getIt<InsightsInteractionLocalStore>().getLikedPostIds(),
            );
            final busyPostIds = state.maybeWhen(
              loaded: (
                List<Post> _,
                List<String> __,
                Map<String, bool> ___,
                Set<String> ____,
                Set<String> busyPostIds,
                String? _____,
              ) =>
                  busyPostIds,
              orElse: () => <String>{},
            );

            return _buildLoadedBody(
              context,
              immediatePost,
              isLiked: likedPostIds.contains(immediatePost.id),
              isBusy: busyPostIds.contains(immediatePost.id),
            );
          }

          return state.when(
            initial: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
            error: (String message) => CustomRefreshIndicator(
              onRefresh: _refresh,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            loaded: (
              List<Post> posts,
              List<String> availableLanguages,
              Map<String, bool> selectedLanguages,
              Set<String> _,
              Set<String> __,
              String? ___,
            ) {
              _maybeActivateLanguage(selectedLanguages, availableLanguages);
              _maybeRefreshSinglePost(posts);
              return CustomRefreshIndicator(
                onRefresh: _refresh,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'Post is not available in the current feed yet.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    final DateTime local = dateTime.toLocal();
    return '${local.year.toString().padLeft(4, '0')}-'
        '${local.month.toString().padLeft(2, '0')}-'
        '${local.day.toString().padLeft(2, '0')}';
  }

  void _openCommentsBottomSheet(BuildContext context, Post post) {
    if (_commentsBloc == null) {
      _ensureCommentsBloc(post.id);
    }

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
          initialChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (BuildContext sheetContext, ScrollController controller) {
            final EdgeInsets viewInsets = MediaQuery.viewInsetsOf(sheetContext);
            return Padding(
              padding: EdgeInsets.only(bottom: viewInsets.bottom),
              child: BlocProvider<InsightsCommentsBloc>.value(
                value: _commentsBloc!,
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
                                bool isSubmitting,
                                String? actionMessage,
                                String? lastSubmittedCommentId,
                              ) {
                                if (comments.isEmpty) {
                                  return ListView(
                                    controller: controller,
                                    padding: const EdgeInsets.fromLTRB(
                                      16,
                                      12,
                                      16,
                                      16,
                                    ),
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
                                  padding: const EdgeInsets.fromLTRB(
                                    16,
                                    12,
                                    16,
                                    16,
                                  ),
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
                                                    fontWeight:
                                                        FontWeight.w700),
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
                              onSubmit: (String text) => _submitComment(
                                modalContext,
                                post.id,
                                text,
                              ),
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

  Future<void> _refresh() async {
    context
        .read<InsightsBloc>()
        .add(const InsightsEvent.fetchAvailableLanguagesAndPosts());
    if (_commentsPostId != null) {
      _commentsBloc?.add(InsightsCommentsEvent.refresh(_commentsPostId!));
    }
  }

  void _ensureInsightsLoaded() {
    final InsightsState state = context.read<InsightsBloc>().state;
    state.maybeWhen(
      initial: () => _refresh(),
      orElse: () {},
    );
  }

  void _maybeActivateLanguage(
    Map<String, bool> selectedLanguages,
    List<String> availableLanguages,
  ) {
    final String? lang = widget.lang;
    if (_attemptedLangActivation || lang == null || lang.isEmpty) {
      return;
    }
    if (selectedLanguages[lang] == true) {
      _attemptedLangActivation = true;
      return;
    }
    if (!availableLanguages.contains(lang) &&
        !selectedLanguages.containsKey(lang)) {
      return;
    }
    _attemptedLangActivation = true;
    final Map<String, bool> nextSelected =
        Map<String, bool>.from(selectedLanguages);
    nextSelected[lang] = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      context
          .read<InsightsBloc>()
          .add(InsightsEvent.languagesChanged(nextSelected));
    });
  }

  void _maybeRefreshSinglePost(List<Post> posts) {
    if (_attemptedSinglePostRefresh ||
        widget.postId == null ||
        widget.postId!.isEmpty ||
        posts.any((Post post) => post.id == widget.postId)) {
      return;
    }
    _attemptedSinglePostRefresh = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      context
          .read<InsightsBloc>()
          .add(InsightsEvent.refreshSinglePost(widget.postId!));
    });
  }

  Post? _resolvePost(
    List<Post> posts, [
    List<String>? _availableLanguages,
    Map<String, bool>? _selectedLanguages,
    Set<String>? _likedPostIds,
    Set<String>? _busyPostIds,
    String? _actionMessage,
  ]) {
    if (widget.post != null) {
      return posts.firstWhere(
        (Post item) => item.id == widget.post!.id,
        orElse: () => widget.post!,
      );
    }
    if (widget.postId == null || widget.postId!.isEmpty) {
      return null;
    }
    try {
      return posts.firstWhere((Post item) => item.id == widget.postId);
    } catch (_) {
      return null;
    }
  }

  Widget _buildLoadedBody(
    BuildContext context,
    Post post, {
    required bool isLiked,
    required bool isBusy,
  }) {
    _ensureCommentsBloc(post.id);

    return BlocProvider<InsightsCommentsBloc>.value(
      value: _commentsBloc!,
      child: BlocConsumer<InsightsCommentsBloc, InsightsCommentsState>(
        listener: (BuildContext context, InsightsCommentsState state) {
          state.maybeWhen(
            loaded: (
              String _postId,
              List<dynamic> _comments,
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
                context
                    .read<InsightsBloc>()
                    .add(InsightsEvent.refreshSinglePost(post.id));
              }
            },
            orElse: () {},
          );
        },
        builder: (BuildContext context, InsightsCommentsState commentsState) {
          final List<InsightComment> comments = commentsState.maybeWhen(
            loaded: (
              String _postId,
              List<InsightComment> comments,
              bool _isSubmitting,
              String? _actionMessage,
              String? _lastSubmittedCommentId,
            ) =>
                comments,
            orElse: () => const <InsightComment>[],
          );
          final bool isSubmitting = commentsState.maybeWhen(
            loaded: (
              String _postId,
              List<dynamic> _comments,
              bool isSubmitting,
              String? _actionMessage,
              String? _lastSubmittedCommentId,
            ) =>
                isSubmitting,
            orElse: () => false,
          );
          final bool isLoading = commentsState.maybeWhen(
            initial: () => true,
            loading: () => true,
            error: (_) => true,
            orElse: () => false,
          );

          return Column(
            children: [
              Expanded(
                child: RefreshIndicator.adaptive(
                  onRefresh: () async => _refresh(),
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      InsightFeedItem(
                        post: post,
                        isLiked: isLiked,
                        isBusy: isBusy,
                        autoplayVideo: post.type == PostType.video &&
                            YoutubeThumbnailHelper.isShortsUrl(
                              post.articleUrl,
                            ),
                        onLike: () => context
                            .read<InsightsBloc>()
                            .add(InsightsEvent.toggleLike(post.id)),
                        onComment: () =>
                            _openCommentsBottomSheet(context, post),
                        onShare: () => _sharePost(post),
                        onOpenDetails: () {},
                        onPlayVideo: () => _playVideo(post),
                        expandCaption: true,
                        showCommentPreview: false,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
                        child: InsightCommentsSection(
                          comments: comments,
                          isLoading: isLoading,
                          onRetry: () => context
                              .read<InsightsCommentsBloc>()
                              .add(InsightsCommentsEvent.refresh(post.id)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (post.allowComments)
                InsightCommentInput(
                  isSubmitting: isSubmitting,
                  onSubmit: (String text) =>
                      _submitComment(context, post.id, text),
                ),
            ],
          );
        },
      ),
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
          title: const Text('Your name'),
          content: TextField(
            controller: controller,
            autofocus: true,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              hintText: 'Enter your name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(controller.text.trim());
              },
              child: const Text('Save'),
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
}
