import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:icoc/core/helpers/youtube_thumbnail_helper.dart';
import 'package:icoc/core/user_state/youtube_watch_progress_store.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/widget/youtube/youtube_embed_helper.dart';

class YoutubeEmbeddedPlayer extends StatefulWidget {
  const YoutubeEmbeddedPlayer({
    super.key,
    required this.videoId,
    required this.aspectRatio,
    this.thumbnailUrl,
    this.autoPlay = true,
    this.mute = false,
    this.showControls = true,
    this.showFullscreenButton = true,
    this.interceptAndroidFullscreen = false,
    this.persistProgress = true,
    this.onFullscreenChanged,
  });

  final String videoId;
  final double aspectRatio;
  final String? thumbnailUrl;
  final bool autoPlay;
  final bool mute;
  final bool showControls;
  final bool showFullscreenButton;
  final bool interceptAndroidFullscreen;
  final bool persistProgress;
  final ValueChanged<bool>? onFullscreenChanged;

  @override
  State<YoutubeEmbeddedPlayer> createState() => _YoutubeEmbeddedPlayerState();
}

class _YoutubeEmbeddedPlayerState extends State<YoutubeEmbeddedPlayer>
    with WidgetsBindingObserver {
  static const String _fullscreenChannelName = 'YoutubeEmbedFullscreen';
  static const Duration _progressSyncInterval = Duration(seconds: 10);

  final YoutubeWatchProgressStore _progressStore =
      YoutubeWatchProgressStore(getIt<LocalCache>());

  WebViewController? _iosController;
  YoutubePlayerController? _androidController;
  bool _hasLoadError = false;
  bool _didInitialize = false;
  bool _pageLoaded = false;
  Timer? _progressTimer;
  int _loadGeneration = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didInitialize) {
      return;
    }
    _didInitialize = true;
    _initializeController();
  }

  @override
  void didUpdateWidget(covariant YoutubeEmbeddedPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoId != widget.videoId ||
        oldWidget.autoPlay != widget.autoPlay ||
        oldWidget.mute != widget.mute ||
        oldWidget.showControls != widget.showControls ||
        oldWidget.showFullscreenButton != widget.showFullscreenButton ||
        oldWidget.persistProgress != widget.persistProgress) {
      _initializeController();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      unawaited(_syncWatchProgress());
    }
  }

  Future<void> _initializeController() async {
    if (Platform.isAndroid) {
      await _initializeAndroidController();
      return;
    }
    await _initializeIosController();
  }

  Future<void> _initializeAndroidController() async {
    final int generation = ++_loadGeneration;
    _pageLoaded = false;
    _progressTimer?.cancel();

    _disposeAndroidController();

    final int? resumeFromSeconds = await _readResumePosition();
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
        mute: widget.mute,
        hideControls: !widget.showControls,
        controlsVisibleAtStart: widget.showControls,
        startAt: resumeFromSeconds ?? 0,
      ),
    )..addListener(_handleAndroidControllerChanged);

    if (!mounted || generation != _loadGeneration) {
      controller.removeListener(_handleAndroidControllerChanged);
      controller.dispose();
      return;
    }

    setState(() {
      _androidController = controller;
      _iosController = null;
      _hasLoadError = false;
    });
  }

  Future<void> _initializeIosController() async {
    final int generation = ++_loadGeneration;
    _pageLoaded = false;
    _progressTimer?.cancel();

    _disposeAndroidController();
    _disposeIosController();

    final ThemeData theme = Theme.of(context);
    final int? resumeFromSeconds = await _readResumePosition();
    final WebViewController controller = await createYoutubeWebViewController(
      backgroundColor: theme.colorScheme.surface,
      onWebResourceError: (_) {
        if (!mounted || generation != _loadGeneration) {
          return;
        }
        setState(() => _hasLoadError = true);
      },
      onPageFinished: widget.onFullscreenChanged == null
          ? (WebViewController controller) => _handleIosPageFinished(
                controller,
                generation: generation,
              )
          : (WebViewController controller) async {
              await attachYoutubeFullscreenListener(
                controller,
                channelName: _fullscreenChannelName,
              );
              await _handleIosPageFinished(
                controller,
                generation: generation,
              );
            },
    );

    if (widget.onFullscreenChanged != null) {
      controller.addJavaScriptChannel(
        _fullscreenChannelName,
        onMessageReceived: (JavaScriptMessage message) {
          widget.onFullscreenChanged!(message.message == 'enter');
        },
      );
    }

    await loadYoutubeEmbed(
      controller,
      videoId: widget.videoId,
      autoplay: widget.autoPlay,
      mute: widget.mute,
      showControls: widget.showControls,
      showFullscreenButton: widget.showFullscreenButton,
      startSeconds: resumeFromSeconds,
    );

    if (!mounted || generation != _loadGeneration) {
      unawaited(_releaseIosController(controller));
      return;
    }

    setState(() {
      _iosController = controller;
      _hasLoadError = false;
    });
  }

  void _handleAndroidControllerChanged() {
    final YoutubePlayerController? controller = _androidController;
    if (controller == null || !mounted) {
      return;
    }

    final YoutubePlayerValue value = controller.value;

    if (value.isReady && !_pageLoaded) {
      _pageLoaded = true;
      _startProgressTimer();
    }

    if (_hasLoadError != value.hasError) {
      setState(() {
        _hasLoadError = value.hasError;
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _progressTimer?.cancel();
    unawaited(_syncWatchProgress());
    _disposeAndroidController();
    _disposeIosController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: _hasLoadError ? _fallback(context) : _player(),
    );
  }

  Widget _player() {
    if (Platform.isAndroid) {
      return _buildAndroidPlayer();
    }
    return _buildIosPlayer();
  }

  Widget _buildAndroidPlayer() {
    final YoutubePlayerController? controller = _androidController;
    if (controller == null) {
      return const ColoredBox(
        color: Colors.black,
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    }

    return ColoredBox(
      color: Colors.black,
      child: YoutubePlayer(
        controller: controller,
        aspectRatio: widget.aspectRatio,
        thumbnail: _buildThumbnail(),
        bottomActions: _buildAndroidBottomActions(controller),
        onReady: () {
          if (!_pageLoaded) {
            _pageLoaded = true;
            _startProgressTimer();
          }
        },
      ),
    );
  }

  Widget _buildIosPlayer() {
    final WebViewController? controller = _iosController;
    if (controller == null) {
      return const ColoredBox(
        color: Colors.black,
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    }
    return WebViewWidget(controller: controller);
  }

  Widget _buildThumbnail() {
    final String posterUrl = widget.thumbnailUrl?.trim().isNotEmpty == true
        ? widget.thumbnailUrl!.trim()
        : YoutubeThumbnailHelper.thumbnailForVideoId(widget.videoId);

    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(
          color: Colors.black,
          child: Image.network(
            posterUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const SizedBox.shrink(),
          ),
        ),
        Container(color: Colors.black.withValues(alpha: 0.12)),
        const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ],
    );
  }

  List<Widget>? _buildAndroidBottomActions(YoutubePlayerController controller) {
    if (!widget.showControls) {
      return null;
    }
    if (!widget.interceptAndroidFullscreen) {
      return null;
    }
    return <Widget>[
      const SizedBox(width: 14),
      const CurrentPosition(),
      const SizedBox(width: 8),
      const ProgressBar(isExpanded: true),
      const RemainingDuration(),
      ValueListenableBuilder<YoutubePlayerValue>(
        valueListenable: controller,
        builder: (BuildContext context, YoutubePlayerValue value, _) {
          return IconButton(
            onPressed: () => widget.onFullscreenChanged?.call(true),
            icon: Icon(
              value.isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
              color: Colors.white,
            ),
          );
        },
      ),
    ];
  }

  Widget _fallback(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 40,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 12),
            Text(
              'Video player failed to load',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'The video could not be played in the app. Please try opening it in YouTube.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _openExternally,
              icon: const Icon(Icons.open_in_new_rounded),
              label: const Text('Open in YouTube'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openExternally() {
    final Uri uri =
        Uri.parse('https://www.youtube.com/watch?v=${widget.videoId}');
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<int?> _readResumePosition() async {
    if (!widget.persistProgress) {
      return null;
    }
    final double? progressSeconds =
        await _progressStore.getProgressSeconds(widget.videoId);
    if (progressSeconds == null) {
      return null;
    }
    return progressSeconds.floor();
  }

  Future<void> _handleIosPageFinished(
    WebViewController controller, {
    required int generation,
  }) async {
    if (!mounted || generation != _loadGeneration) {
      return;
    }

    _pageLoaded = true;
    _startProgressTimer();
  }

  void _startProgressTimer() {
    _progressTimer?.cancel();
    if (!widget.persistProgress) {
      return;
    }

    _progressTimer = Timer.periodic(_progressSyncInterval, (_) {
      unawaited(_syncWatchProgress());
    });
  }

  Future<void> _syncWatchProgress() async {
    if (!widget.persistProgress || !_pageLoaded) {
      return;
    }

    if (Platform.isAndroid) {
      try {
        final YoutubePlayerController? controller = _androidController;
        if (controller == null || !controller.value.isReady) {
          return;
        }
        final double positionSeconds =
            controller.value.position.inSeconds.toDouble();
        if (positionSeconds <= 0) {
          return;
        }
        final Duration duration = controller.metadata.duration;
        await _progressStore.saveProgress(
          widget.videoId,
          positionSeconds,
          duration.inSeconds <= 0 ? null : duration.inSeconds.toDouble(),
        );
      } catch (_) {
        // Ignore transient controller errors during teardown or reloads.
      }
      return;
    }

    final WebViewController? controller = _iosController;
    if (controller == null) {
      return;
    }

    try {
      final double? positionSeconds = await youtubeCurrentTime(controller);
      if (positionSeconds == null || positionSeconds <= 0) {
        return;
      }

      final double? durationSeconds = await youtubeDuration(controller);
      await _progressStore.saveProgress(
        widget.videoId,
        positionSeconds,
        durationSeconds,
      );
    } catch (_) {
      // Ignore transient WebView/JS errors during teardown or page reloads.
    }
  }

  void _disposeAndroidController() {
    final YoutubePlayerController? controller = _androidController;
    if (controller == null) {
      return;
    }
    controller.removeListener(_handleAndroidControllerChanged);
    controller.dispose();
    _androidController = null;
  }

  void _disposeIosController() {
    final WebViewController? controller = _iosController;
    if (controller == null) {
      return;
    }
    _iosController = null;
    unawaited(_releaseIosController(controller));
  }

  Future<void> _releaseIosController(WebViewController controller) async {
    try {
      await youtubeStopAutoplayAttempts(controller);
      await youtubePause(controller);
      await controller.loadHtmlString('<html><body></body></html>');
    } catch (_) {
      // Ignore WebView teardown errors during disposal or controller swaps.
    }
  }
}
