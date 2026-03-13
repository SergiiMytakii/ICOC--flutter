import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
  static const Duration _androidRevealPosition = Duration(milliseconds: 300);

  WebViewController? _iosController;
  YoutubePlayerController? _androidController;
  Timer? _activationTimer;
  int _controllerToken = 0;
  bool _isInitializing = false;
  bool _isReady = false;
  bool _isVideoVisible = false;
  bool _isMuted = true;
  bool _hasLoadError = false;
  bool _isPlaying = false;
  bool _androidAutoplayRequested = false;

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
      onTap: _handleTap,
      child: AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildThumbnail(context),
            if (_iosController != null)
              AnimatedOpacity(
                opacity: _isVideoVisible ? 1 : 0,
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeOutCubic,
                child: WebViewWidget(controller: _iosController!),
              ),
            if (_androidController != null)
              AnimatedOpacity(
                opacity: _isVideoVisible ? 1 : 0,
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeOutCubic,
                child: YoutubePlayer(
                  controller: _androidController!,
                  aspectRatio: widget.aspectRatio,
                  thumbnail: const SizedBox.shrink(),
                ),
              ),
            // AnimatedOpacity(
            //   opacity: _isVideoVisible ? 0 : 1,
            //   duration: const Duration(milliseconds: 220),
            //   curve: Curves.easeOutCubic,
            //   child: IgnorePointer(
            //     child: DecoratedBox(
            //       decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //           begin: Alignment.topCenter,
            //           end: Alignment.bottomCenter,
            //           colors: [
            //             Colors.transparent,
            //             Colors.black.withValues(alpha: 0.08),
            //             Colors.black.withValues(alpha: 0.26),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
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
                    _statusLabel(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            if ((_iosController != null || _androidController != null) &&
                widget.isActive &&
                !_hasLoadError)
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

  String _statusLabel() {
    if (Platform.isAndroid) {
      if (_isPlaying) {
        return 'Playing';
      }
      return widget.isActive ? 'Tap to play' : 'Ready';
    }
    return widget.isActive ? 'Playing' : 'Tap to expand';
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

  void _handleTap() {
    if (Platform.isAndroid) {
      unawaited(_togglePlayPause());
      return;
    }
    widget.onTap();
  }

  void _syncPlayback() {
    _activationTimer?.cancel();
    if (!widget.shouldPrepare) {
      _disposePlayer();
      return;
    }
    if (_iosController == null && _androidController == null) {
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
    if (!mounted || !widget.shouldPrepare) {
      return;
    }
    if (Platform.isAndroid) {
      await _initializeAndroidPlayer();
      return;
    }
    await _initializeIosPlayer();
  }

  Future<void> _initializeAndroidPlayer() async {
    if (_androidController != null) {
      return;
    }

    final int token = ++_controllerToken;
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        hideControls: true,
        hideThumbnail: true,
        disableDragSeek: true,
        loop: true,
        enableCaption: false,
      ),
    )..addListener(_handleAndroidControllerChanged);

    if (!mounted || _controllerToken != token) {
      controller.removeListener(_handleAndroidControllerChanged);
      controller.dispose();
      return;
    }

    setState(() {
      _androidController = controller;
      _iosController = null;
      _isInitializing = true;
      _isReady = false;
      _isVideoVisible = false;
      _isMuted = true;
      _hasLoadError = false;
      _isPlaying = false;
      _androidAutoplayRequested = false;
    });
  }

  Future<void> _initializeIosPlayer() async {
    if (_iosController != null) {
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
          await youtubeEnsureAutoplayMuted(controller);
        } else {
          await youtubeStopAutoplayAttempts(controller);
          await youtubePause(controller);
        }
        if (!mounted || _controllerToken != token) {
          return;
        }
        setState(() {
          _isInitializing = false;
          _isVideoVisible = widget.isActive && !_hasLoadError;
          _isPlaying = widget.isActive && !_hasLoadError;
        });
      },
    );

    if (!mounted || _controllerToken != token) {
      unawaited(_releaseIosController(controller));
      return;
    }

    setState(() {
      _iosController = controller;
      _androidController = null;
      _isInitializing = true;
      _isReady = false;
      _isVideoVisible = false;
      _isMuted = true;
      _hasLoadError = false;
      _isPlaying = false;
      _androidAutoplayRequested = false;
    });

    await loadYoutubeInlineShortsEmbed(
      controller,
      videoId: widget.videoId,
      autoPlay: widget.isActive,
    );
  }

  void _handleAndroidControllerChanged() {
    final YoutubePlayerController? controller = _androidController;
    if (controller == null || !mounted) {
      return;
    }
    final YoutubePlayerValue value = controller.value;
    final bool nextReady = value.isReady || _isReady;
    final bool nextHasError = value.hasError;
    final bool nextIsPlaying = value.isPlaying;
    final bool nextVisible = widget.isActive &&
        !nextHasError &&
        value.position >= _androidRevealPosition;

    if (nextReady &&
        widget.isActive &&
        !_androidAutoplayRequested &&
        !nextHasError) {
      _androidAutoplayRequested = true;
      if (_isMuted) {
        controller.mute();
      } else {
        controller.unMute();
      }
      controller.play();
    }

    if (_isReady == nextReady &&
        _hasLoadError == nextHasError &&
        _isPlaying == nextIsPlaying &&
        _isVideoVisible == nextVisible &&
        _isInitializing == (!nextReady && !nextHasError)) {
      return;
    }

    setState(() {
      _isReady = nextReady;
      _hasLoadError = nextHasError;
      _isPlaying = nextIsPlaying;
      _isVideoVisible = nextVisible;
      _isInitializing = !nextReady && !nextHasError;
    });
  }

  Future<void> _resumePlayback() async {
    if (Platform.isAndroid) {
      await _resumeAndroidPlayback();
      return;
    }

    final WebViewController? controller = _iosController;
    if (controller == null || !_isReady || _hasLoadError) {
      return;
    }
    if (_isMuted) {
      await youtubeMute(controller);
    } else {
      await youtubeUnmute(controller);
    }
    if (_isMuted) {
      await youtubeEnsureAutoplayMuted(controller);
    } else {
      await youtubePlay(controller);
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _isVideoVisible = !_hasLoadError;
      _isPlaying = !_hasLoadError;
    });
  }

  Future<void> _resumeAndroidPlayback() async {
    final YoutubePlayerController? controller = _androidController;
    if (controller == null || !_isReady || _hasLoadError) {
      return;
    }
    _androidAutoplayRequested = true;
    if (_isMuted) {
      controller.mute();
    } else {
      controller.unMute();
    }
    controller.play();
    if (!mounted) {
      return;
    }
    setState(() {
      _isVideoVisible = true;
      _isPlaying = true;
    });
  }

  Future<void> _pausePreparedPlayback() async {
    if (Platform.isAndroid) {
      final YoutubePlayerController? controller = _androidController;
      if (controller == null) {
        return;
      }
      controller.pause();
      controller.mute();
      _androidAutoplayRequested = false;
      if (!mounted) {
        return;
      }
      setState(() {
        _isVideoVisible = false;
        _isMuted = true;
        _isPlaying = false;
      });
      return;
    }

    final WebViewController? controller = _iosController;
    if (controller == null || !_isReady) {
      return;
    }
    _isMuted = true;
    await youtubeStopAutoplayAttempts(controller);
    await youtubeMute(controller);
    await youtubePause(controller);
    if (!mounted) {
      return;
    }
    setState(() {
      _isVideoVisible = false;
      _isMuted = true;
      _isPlaying = false;
    });
  }

  Future<void> _toggleMute() async {
    if (Platform.isAndroid) {
      final YoutubePlayerController? controller = _androidController;
      if (controller == null || !_isReady || _hasLoadError) {
        return;
      }
      final bool nextMuted = !_isMuted;
      if (nextMuted) {
        controller.mute();
      } else {
        controller.unMute();
        controller.play();
      }
      if (!mounted) {
        return;
      }
      setState(() => _isMuted = nextMuted);
      return;
    }

    final WebViewController? controller = _iosController;
    if (controller == null || !_isReady || _hasLoadError) {
      return;
    }
    final bool nextMuted = !_isMuted;
    if (nextMuted) {
      await youtubeMute(controller);
    } else {
      await youtubeUnmute(controller);
      await youtubePlay(controller);
    }
    if (!mounted) {
      return;
    }
    setState(() => _isMuted = nextMuted);
  }

  Future<void> _togglePlayPause() async {
    if (!Platform.isAndroid) {
      return;
    }
    final YoutubePlayerController? controller = _androidController;
    if (controller == null || !_isReady || _hasLoadError) {
      return;
    }
    if (_isPlaying) {
      controller.pause();
      _androidAutoplayRequested = false;
      if (!mounted) {
        return;
      }
      setState(() => _isPlaying = false);
      return;
    }
    if (_isMuted) {
      controller.mute();
    } else {
      controller.unMute();
    }
    _androidAutoplayRequested = true;
    controller.play();
    if (!mounted) {
      return;
    }
    setState(() {
      _isPlaying = true;
      _isVideoVisible = true;
    });
  }

  void _disposePlayer({bool notify = true}) {
    final WebViewController? iosController = _iosController;
    if (iosController != null) {
      unawaited(_releaseIosController(iosController));
    }
    final YoutubePlayerController? androidController = _androidController;
    if (androidController != null) {
      androidController.removeListener(_handleAndroidControllerChanged);
      androidController.dispose();
    }
    _androidController = null;
    _iosController = null;
    _controllerToken++;
    _activationTimer?.cancel();
    if (!notify || !mounted) {
      _isInitializing = false;
      _isReady = false;
      _isVideoVisible = false;
      _isMuted = true;
      _hasLoadError = false;
      _isPlaying = false;
      _androidAutoplayRequested = false;
      return;
    }
    setState(() {
      _isInitializing = false;
      _isReady = false;
      _isVideoVisible = false;
      _isMuted = true;
      _hasLoadError = false;
      _isPlaying = false;
      _androidAutoplayRequested = false;
    });
  }

  Future<void> _releaseIosController(WebViewController controller) async {
    try {
      await youtubeStopAutoplayAttempts(controller);
      await youtubePause(controller);
      await controller.loadHtmlString('<html><body></body></html>');
    } catch (_) {
      // Ignore WebView teardown errors during rapid widget disposal/rebuilds.
    }
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
