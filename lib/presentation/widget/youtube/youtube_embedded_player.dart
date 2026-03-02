import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:icoc/core/user_state/youtube_watch_progress_store.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/widget/youtube/youtube_embed_helper.dart';

class YoutubeEmbeddedPlayer extends StatefulWidget {
  const YoutubeEmbeddedPlayer({
    super.key,
    required this.videoId,
    required this.aspectRatio,
    this.autoPlay = true,
    this.mute = false,
    this.showControls = true,
    this.showFullscreenButton = true,
    this.persistProgress = true,
    this.onFullscreenChanged,
  });

  final String videoId;
  final double aspectRatio;
  final bool autoPlay;
  final bool mute;
  final bool showControls;
  final bool showFullscreenButton;
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
  WebViewController? _controller;
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
    final int generation = ++_loadGeneration;
    final ThemeData theme = Theme.of(context);
    _pageLoaded = false;
    _progressTimer?.cancel();

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
          ? (WebViewController controller) => _handlePageFinished(
                controller,
                generation: generation,
              )
          : (WebViewController controller) async {
              await attachYoutubeFullscreenListener(
                controller,
                channelName: _fullscreenChannelName,
              );
              await _handlePageFinished(
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
      return;
    }

    setState(() {
      _controller = controller;
      _hasLoadError = false;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _progressTimer?.cancel();
    unawaited(_syncWatchProgress());
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
    final WebViewController? controller = _controller;
    if (controller == null) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    return WebViewWidget(controller: controller);
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

  Future<void> _handlePageFinished(
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

    final WebViewController? controller = _controller;
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
}
