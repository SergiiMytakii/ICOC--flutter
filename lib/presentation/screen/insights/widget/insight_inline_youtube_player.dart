import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class InsightInlineYoutubePlayer extends StatefulWidget {
  const InsightInlineYoutubePlayer({
    super.key,
    required this.videoId,
    required this.aspectRatio,
    required this.thumbnailUrl,
    required this.isActive,
    required this.onTap,
  });

  final String videoId;
  final double aspectRatio;
  final String? thumbnailUrl;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<InsightInlineYoutubePlayer> createState() =>
      _InsightInlineYoutubePlayerState();
}

class _InsightInlineYoutubePlayerState
    extends State<InsightInlineYoutubePlayer> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _syncController();
  }

  @override
  void didUpdateWidget(covariant InsightInlineYoutubePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoId != widget.videoId) {
      _disposeController();
    }
    _syncController();
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (widget.thumbnailUrl != null)
              Image.network(
                widget.thumbnailUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _placeholder(context),
              )
            else
              _placeholder(context),
            if (_controller != null)
              IgnorePointer(
                child: YoutubePlayer(
                  controller: _controller!,
                  aspectRatio: widget.aspectRatio,
                ),
              ),
            Positioned(
              right: 12,
              bottom: 12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Text(
                    'Tap to expand',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _syncController() {
    if (!widget.isActive) {
      _disposeController();
      return;
    }
    _controller ??= YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(
        mute: true,
        showControls: false,
        showFullscreenButton: false,
        strictRelatedVideos: true,
        showVideoAnnotations: false,
        enableCaption: false,
        loop: true,
        pointerEvents: PointerEvents.none,
      ),
    );
  }

  void _disposeController() {
    _controller?.close();
    _controller = null;
  }

  Widget _placeholder(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
