import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:icoc/presentation/widget/youtube/youtube_embed_helper.dart';

class InsightInlineYoutubePlayer extends StatefulWidget {
  const InsightInlineYoutubePlayer({
    super.key,
    required this.videoId,
    required this.aspectRatio,
    required this.thumbnailUrl,
    required this.isActive,
    required this.shouldPrepare,
    required this.onTap,
  });

  final String videoId;
  final double aspectRatio;
  final String? thumbnailUrl;
  final bool isActive;
  final bool shouldPrepare;
  final VoidCallback onTap;

  @override
  State<InsightInlineYoutubePlayer> createState() =>
      _InsightInlineYoutubePlayerState();
}

class _InsightInlineYoutubePlayerState
    extends State<InsightInlineYoutubePlayer> {
  static const Duration _activationDelay = Duration(milliseconds: 180);

  WebViewController? _controller;
  Timer? _activationTimer;
  int _controllerToken = 0;
  bool _isInitializing = false;
  bool _isReady = false;
  bool _isVideoVisible = false;
  bool _isMuted = true;
  bool _hasLoadError = false;

  @override
  void initState() {
    super.initState();
    _syncPlayback();
  }

  @override
  void didUpdateWidget(covariant InsightInlineYoutubePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoId != widget.videoId) {
      _disposePlayer(notify: false);
    }
    if (oldWidget.isActive != widget.isActive ||
        oldWidget.shouldPrepare != widget.shouldPrepare ||
        oldWidget.videoId != widget.videoId) {
      _syncPlayback();
    }
  }

  @override
  void dispose() {
    _activationTimer?.cancel();
    _disposePlayer(notify: false);
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
            _buildThumbnail(context),
            if (_controller != null)
              AnimatedOpacity(
                opacity: _isVideoVisible ? 1 : 0,
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeOutCubic,
                child: WebViewWidget(controller: _controller!),
              ),
            AnimatedOpacity(
              opacity: _isVideoVisible ? 0 : 1,
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.08),
                        Colors.black.withValues(alpha: 0.26),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (_isInitializing && !_isVideoVisible)
              const Center(
                child: SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator.adaptive(strokeWidth: 2.4),
                ),
              ),
            Positioned(
              left: 12,
              bottom: 12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Text(
                    widget.isActive ? 'Playing' : 'Tap to expand',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            if (_controller != null && widget.isActive && !_hasLoadError)
              Positioned(
                right: 12,
                bottom: 12,
                child: Material(
                  color: Colors.black.withValues(alpha: 0.55),
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: _toggleMute,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        _isMuted
                            ? Icons.volume_off_rounded
                            : Icons.volume_up_rounded,
                        color: Colors.white,
                        size: 20,
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

  Widget _buildThumbnail(BuildContext context) {
    final String? thumbnailUrl = widget.thumbnailUrl;
    if (thumbnailUrl != null && thumbnailUrl.isNotEmpty) {
      return Image.network(
        thumbnailUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _placeholder(context),
      );
    }
    return _placeholder(context);
  }

  void _syncPlayback() {
    _activationTimer?.cancel();
    if (!widget.shouldPrepare) {
      _disposePlayer();
      return;
    }
    if (_controller == null) {
      _activationTimer = Timer(
        widget.isActive ? _activationDelay : Duration.zero,
        _initializePlayer,
      );
      return;
    }
    if (widget.isActive) {
      unawaited(_resumePlayback());
    } else {
      unawaited(_pausePreparedPlayback());
    }
  }

  Future<void> _initializePlayer() async {
    if (!mounted || !widget.shouldPrepare || _controller != null) {
      return;
    }

    final int token = ++_controllerToken;
    final ThemeData theme = Theme.of(context);
    final WebViewController controller = await createYoutubeWebViewController(
      backgroundColor: theme.colorScheme.surface,
      onWebResourceError: (_) {
        if (_controllerToken != token || !mounted) {
          return;
        }
        setState(() {
          _hasLoadError = true;
          _isInitializing = false;
          _isVideoVisible = false;
        });
      },
      onPageFinished: (WebViewController controller) async {
        if (_controllerToken != token || !mounted) {
          return;
        }
        _isReady = true;
        await youtubeMute(controller);
        if (widget.isActive) {
          await youtubePlay(controller);
        } else {
          await youtubePause(controller);
        }
        if (!mounted || _controllerToken != token) {
          return;
        }
        setState(() {
          _isInitializing = false;
          _isVideoVisible = widget.isActive && !_hasLoadError;
        });
      },
    );

    if (!mounted || _controllerToken != token) {
      return;
    }

    setState(() {
      _controller = controller;
      _isInitializing = true;
      _isReady = false;
      _isVideoVisible = false;
      _isMuted = true;
      _hasLoadError = false;
    });

    await loadYoutubeEmbed(
      controller,
      videoId: widget.videoId,
      autoplay: widget.isActive,
      mute: true,
      showControls: false,
      showFullscreenButton: false,
    );
  }

  Future<void> _resumePlayback() async {
    final WebViewController? controller = _controller;
    if (controller == null || !_isReady || _hasLoadError) {
      return;
    }
    if (_isMuted) {
      await youtubeMute(controller);
    } else {
      await youtubeUnmute(controller);
    }
    await youtubePlay(controller);
    if (!mounted) {
      return;
    }
    setState(() {
      _isVideoVisible = !_hasLoadError;
    });
  }

  Future<void> _pausePreparedPlayback() async {
    final WebViewController? controller = _controller;
    if (controller == null || !_isReady) {
      return;
    }
    _isMuted = true;
    await youtubeMute(controller);
    await youtubePause(controller);
    if (!mounted) {
      return;
    }
    setState(() {
      _isVideoVisible = false;
      _isMuted = true;
    });
  }

  Future<void> _toggleMute() async {
    final WebViewController? controller = _controller;
    if (controller == null || !_isReady || _hasLoadError) {
      return;
    }
    final bool nextMuted = !_isMuted;
    if (nextMuted) {
      await youtubeMute(controller);
    } else {
      await youtubeUnmute(controller);
    }
    if (!mounted) {
      return;
    }
    setState(() => _isMuted = nextMuted);
  }

  void _disposePlayer({bool notify = true}) {
    _controllerToken++;
    _activationTimer?.cancel();
    _controller = null;
    if (!notify || !mounted) {
      _isInitializing = false;
      _isReady = false;
      _isVideoVisible = false;
      _isMuted = true;
      _hasLoadError = false;
      return;
    }
    setState(() {
      _isInitializing = false;
      _isReady = false;
      _isVideoVisible = false;
      _isMuted = true;
      _hasLoadError = false;
    });
  }

  Widget _placeholder(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Center(
        child: Icon(
          Icons.play_circle_outline_rounded,
          size: 44,
        ),
      ),
    );
  }
}
