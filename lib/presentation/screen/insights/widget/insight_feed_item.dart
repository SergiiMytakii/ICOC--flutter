import 'dart:io';

import 'package:flutter/material.dart';
import 'package:icoc/core/helpers/youtube_thumbnail_helper.dart';
import 'package:icoc/domain/model/insights/post.dart';
import 'package:icoc/domain/model/insights/post_type.dart';
import 'package:icoc/presentation/screen/insights/widget/insight_actions_row.dart';
import 'package:icoc/presentation/screen/insights/widget/insight_inline_youtube_player.dart';

class InsightFeedItem extends StatefulWidget {
  const InsightFeedItem({
    super.key,
    this.mediaKey,
    required this.post,
    required this.isLiked,
    required this.isBusy,
    required this.onLike,
    required this.onComment,
    required this.onShare,
    required this.onOpenDetails,
    required this.onPlayVideo,
    this.expandCaption = false,
    this.showCommentPreview = true,
    this.autoplayVideo = false,
    this.prepareVideo = false,
  });

  final Key? mediaKey;
  final Post post;
  final bool isLiked;
  final bool isBusy;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;
  final VoidCallback onOpenDetails;
  final VoidCallback onPlayVideo;
  final bool expandCaption;
  final bool showCommentPreview;
  final bool autoplayVideo;
  final bool prepareVideo;

  @override
  State<InsightFeedItem> createState() => _InsightFeedItemState();
}

class _InsightFeedItemState extends State<InsightFeedItem> {
  late final PageController _pageController;
  int _currentMediaIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void didUpdateWidget(covariant InsightFeedItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.post.id != widget.post.id) {
      _currentMediaIndex = 0;
      if (_pageController.hasClients) {
        _pageController.jumpToPage(0);
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color dividerColor = theme.dividerColor.withValues(alpha: 0.18);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: dividerColor),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 10),
          _buildMedia(context),
          const SizedBox(height: 4),
          InsightActionsRow(
            isLiked: widget.isLiked,
            isBusy: widget.isBusy,
            onLike: widget.onLike,
            onComment: widget.onComment,
            onShare: widget.onShare,
            showCommentButton: widget.post.allowComments,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCounts(context),
                if ((widget.post.title ?? '').isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    widget.post.title!,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
                if ((widget.post.content ?? '').isNotEmpty) ...[
                  const SizedBox(height: 6),
                  _buildCaption(context),
                ],
                if (widget.showCommentPreview &&
                    widget.post.allowComments &&
                    widget.post.commentsCount > 0) ...[
                  const SizedBox(height: 6),
                  InkWell(
                    onTap: widget.onComment,
                    child: Text(
                      'View all ${widget.post.commentsCount} comments',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 6),
                Text(
                  _formatDate(widget.post.createdAt),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String avatarUrl = widget.post.author.avatarUrl.trim();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.12),
            backgroundImage:
                avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
            child: avatarUrl.isEmpty
                ? Text(
                    widget.post.author.name.isNotEmpty
                        ? widget.post.author.name.characters.first.toUpperCase()
                        : '?',
                    style: theme.textTheme.titleSmall,
                  )
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post.author.name,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.post.language.toUpperCase(),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: widget.onOpenDetails,
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }

  Widget _buildMedia(BuildContext context) {
    return KeyedSubtree(
      key: widget.mediaKey,
      child: switch (widget.post.type) {
        PostType.video => _buildVideo(context),
        PostType.image => _buildImageCarousel(context),
      },
    );
  }

  Widget _buildVideo(BuildContext context) {
    final bool isShorts = YoutubeThumbnailHelper.isShortsUrl(
      widget.post.articleUrl,
    );
    final String? videoId = YoutubeThumbnailHelper.resolveVideoId(
      youtubeId: widget.post.youtubeId,
      articleUrl: widget.post.articleUrl,
    );
    final String? thumbnailUrl = YoutubeThumbnailHelper.resolveThumbnailUrl(
      thumbnailUrl: widget.post.thumbnailUrl,
      youtubeId: widget.post.youtubeId,
      articleUrl: widget.post.articleUrl,
    );
    final double aspectRatio = widget.post.aspectRatioForIndex(
      0,
      fallback: isShorts ? (9 / 16) : (16 / 9),
    );

    if (videoId == null || videoId.isEmpty) {
      return AspectRatio(
        aspectRatio: aspectRatio,
        child: _mediaPlaceholder(context),
      );
    }

    if (!Platform.isAndroid &&
        isShorts &&
        (widget.autoplayVideo || widget.prepareVideo)) {
      return InsightInlineYoutubePlayer(
        videoId: videoId,
        aspectRatio: aspectRatio,
        thumbnailUrl: thumbnailUrl,
        isActive: widget.autoplayVideo,
        shouldPrepare: widget.prepareVideo || widget.autoplayVideo,
        onTap: widget.onPlayVideo,
      );
    }

    return GestureDetector(
      onTap: widget.onPlayVideo,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (thumbnailUrl != null)
              Image.network(
                thumbnailUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _mediaPlaceholder(context),
              )
            else
              _mediaPlaceholder(context),
            Container(color: Colors.black.withValues(alpha: 0.12)),
            const Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xAA000000),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    size: 34,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel(BuildContext context) {
    final List<String> mediaUrls = widget.post.mediaUrls;
    final double aspectRatio = widget.post.aspectRatioForIndex(
      _currentMediaIndex,
    );

    return Stack(
      children: [
        AspectRatio(
          aspectRatio: aspectRatio,
          child: PageView.builder(
            controller: _pageController,
            itemCount: mediaUrls.length,
            onPageChanged: (int index) {
              if (_currentMediaIndex == index) {
                return;
              }
              setState(() => _currentMediaIndex = index);
            },
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: widget.onOpenDetails,
                child: Image.network(
                  mediaUrls[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _mediaPlaceholder(context),
                ),
              );
            },
          ),
        ),
        if (mediaUrls.length > 1)
          Positioned(
            top: 12,
            right: 12,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Text(
                  '${_currentMediaIndex + 1}/${mediaUrls.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        if (mediaUrls.length > 1)
          Positioned(
            left: 0,
            right: 0,
            bottom: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                mediaUrls.length,
                (int index) => Container(
                  width: 7,
                  height: 7,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: index == _currentMediaIndex
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCaption(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return RichText(
      maxLines: widget.expandCaption ? null : 4,
      overflow:
          widget.expandCaption ? TextOverflow.visible : TextOverflow.ellipsis,
      text: TextSpan(
        style: theme.textTheme.bodyMedium,
        children: [
          TextSpan(
            text: '${widget.post.author.name} ',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(text: widget.post.content ?? ''),
        ],
      ),
    );
  }

  Widget _buildCounts(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final List<String> counters = <String>[];
    if (widget.post.likes > 0) {
      counters.add('${widget.post.likes} likes');
    }
    if (widget.post.shares > 0) {
      counters.add('${widget.post.shares} shares');
    }
    if (counters.isEmpty) {
      return const SizedBox.shrink();
    }
    return Text(
      counters.join('  •  '),
      style: theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _mediaPlaceholder(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Center(
        child: Icon(Icons.image_not_supported_outlined),
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    final DateTime local = dateTime.toLocal();
    return '${local.year.toString().padLeft(4, '0')}-'
        '${local.month.toString().padLeft(2, '0')}-'
        '${local.day.toString().padLeft(2, '0')}';
  }
}
