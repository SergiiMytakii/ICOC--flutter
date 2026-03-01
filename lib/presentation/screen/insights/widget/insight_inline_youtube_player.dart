import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:y_player/y_player.dart';

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
  static const double _mutedVolume = 0;
  static const double _unmutedVolume = 100;

  YPlayerController? _controller;
  VideoController? _videoController;
  Timer? _activationTimer;
  final Set<YPlayerController> _releasedControllers = <YPlayerController>{};
  final List<StreamSubscription<dynamic>> _controllerSubscriptions =
      <StreamSubscription<dynamic>>[];
  int _controllerToken = 0;
  bool _isInitializing = false;
  bool _isVideoVisible = false;
  bool _hasRenderedFrame = false;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _syncPlayback();
  }

  @override
  void didUpdateWidget(covariant InsightInlineYoutubePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoId != widget.videoId) {
      _disposePlayer(notify: false, release: true);
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
    _disposePlayer(notify: false, release: true);
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
            if (_videoController != null)
              AnimatedOpacity(
                opacity: _isVideoVisible ? 1 : 0,
                duration: const Duration(milliseconds: 260),
                curve: Curves.easeOutCubic,
                child: Video(
                  controller: _videoController!,
                  fit: BoxFit.cover,
                  fill: Colors.transparent,
                  controls: (_) => const SizedBox.shrink(),
                  wakelock: false,
                ),
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
            if (_videoController != null && widget.isActive)
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
      _hideVideo();
      unawaited(_pausePreparedPlayback());
      return;
    }
    if (_controller != null) {
      if (widget.isActive) {
        _resumePlayback();
      } else {
        _pausePreparedPlayback();
      }
      return;
    }
    _activationTimer = Timer(
      widget.isActive ? _activationDelay : Duration.zero,
      _initializePlayer,
    );
  }

  Future<void> _initializePlayer() async {
    if (!mounted || !widget.shouldPrepare || _controller != null) {
      return;
    }

    final YPlayerController controller = YPlayerController();
    final VideoController videoController = VideoController(controller.player);
    final int controllerToken = ++_controllerToken;

    setState(() {
      _controller = controller;
      _videoController = videoController;
      _isInitializing = true;
      _isVideoVisible = false;
      _hasRenderedFrame = false;
    });

    _bindControllerFrameState(controller, controllerToken);

    try {
      await controller.initialize(
        'https://www.youtube.com/watch?v=${widget.videoId}',
        autoPlay: false,
        chooseBestQuality: false,
      );
      await _applyVolume(controller);

      if (!_isCurrentController(controller, controllerToken) ||
          !widget.shouldPrepare) {
        _releaseController(controller);
        return;
      }

      if (widget.isActive) {
        await controller.play();
      } else {
        await controller.pause();
      }

      if (!_isCurrentController(controller, controllerToken)) {
        _releaseController(controller);
        return;
      }

      setState(() {
        _isInitializing = false;
        _isVideoVisible = widget.isActive && _hasRenderedFrame;
      });
    } catch (_) {
      if (!_isCurrentController(controller, controllerToken)) {
        _releaseController(controller);
        return;
      }
      _disposePlayer(release: true);
    }
  }

  Future<void> _resumePlayback() async {
    final YPlayerController? controller = _controller;
    if (controller == null) {
      return;
    }
    if (!controller.isInitialized) {
      return;
    }
    await _applyVolume(controller);
    await controller.play();
    if (!mounted) {
      return;
    }
    setState(() => _isVideoVisible = _hasRenderedFrame);
  }

  Future<void> _pausePreparedPlayback() async {
    final YPlayerController? controller = _controller;
    if (controller == null) {
      return;
    }
    if (!controller.isInitialized) {
      return;
    }
    _isMuted = true;
    await controller.player.setVolume(_mutedVolume);
    await controller.pause();
    if (!mounted) {
      return;
    }
    setState(() {
      _isVideoVisible = false;
      _isMuted = true;
    });
  }

  bool _isCurrentController(YPlayerController controller, int token) =>
      mounted &&
      identical(_controller, controller) &&
      _controllerToken == token;

  void _disposePlayer({bool notify = true, bool release = false}) {
    _controllerToken++;
    _clearControllerSubscriptions();
    final YPlayerController? controller = _controller;
    _controller = null;
    _videoController = null;
    if (release) {
      _releaseController(controller);
    }
    if (notify && mounted) {
      setState(() {
        _isInitializing = false;
        _isVideoVisible = false;
        _hasRenderedFrame = false;
      });
    } else {
      _isInitializing = false;
      _isVideoVisible = false;
      _hasRenderedFrame = false;
    }
  }

  void _hideVideo() {
    if (!mounted) {
      _isVideoVisible = false;
      _isInitializing = false;
      _isMuted = true;
      return;
    }
    setState(() {
      _isVideoVisible = false;
      _isInitializing = false;
      _isMuted = true;
    });
  }

  Future<void> _toggleMute() async {
    final YPlayerController? controller = _controller;
    if (controller == null || !controller.isInitialized) {
      return;
    }
    final bool nextMuted = !_isMuted;
    await controller.player.setVolume(
      nextMuted ? _mutedVolume : _unmutedVolume,
    );
    if (!mounted) {
      return;
    }
    setState(() => _isMuted = nextMuted);
  }

  Future<void> _applyVolume(YPlayerController controller) {
    return controller.player.setVolume(
      _isMuted ? _mutedVolume : _unmutedVolume,
    );
  }

  void _bindControllerFrameState(YPlayerController controller, int token) {
    _clearControllerSubscriptions();
    int width = controller.player.state.width ?? 0;
    int height = controller.player.state.height ?? 0;

    void markReadyIfPossible() {
      if (width <= 0 || height <= 0) {
        return;
      }
      if (!_isCurrentController(controller, token)) {
        return;
      }
      if (_hasRenderedFrame) {
        return;
      }
      if (!mounted) {
        _hasRenderedFrame = true;
        return;
      }
      setState(() {
        _hasRenderedFrame = true;
        if (widget.isActive) {
          _isVideoVisible = true;
        }
      });
    }

    _controllerSubscriptions.addAll([
      controller.player.stream.width.listen((int? value) {
        width = value ?? 0;
        markReadyIfPossible();
      }),
      controller.player.stream.height.listen((int? value) {
        height = value ?? 0;
        markReadyIfPossible();
      }),
    ]);

    markReadyIfPossible();
  }

  void _clearControllerSubscriptions() {
    for (final StreamSubscription<dynamic> subscription
        in _controllerSubscriptions) {
      subscription.cancel();
    }
    _controllerSubscriptions.clear();
  }

  void _releaseController(YPlayerController? controller) {
    if (controller == null || _releasedControllers.contains(controller)) {
      return;
    }
    _releasedControllers.add(controller);
    try {
      controller.dispose();
    } catch (_) {}
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
