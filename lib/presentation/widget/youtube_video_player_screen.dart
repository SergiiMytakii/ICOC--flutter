import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'package:icoc/core/helpers/youtube_thumbnail_helper.dart';
import 'package:icoc/presentation/widget/youtube/youtube_embedded_player.dart';

class YoutubeVideoPlayerScreen extends StatefulWidget {
  const YoutubeVideoPlayerScreen({
    required this.videoId,
    super.key,
  });

  final String videoId;

  @override
  State<YoutubeVideoPlayerScreen> createState() =>
      _YoutubeVideoPlayerScreenState();
}

class _YoutubeVideoPlayerScreenState extends State<YoutubeVideoPlayerScreen>
    with WidgetsBindingObserver {
  Orientation? _lastOrientation;
  bool _isManualLandscape = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WakelockPlus.enable();
    _enterVideoScreenMode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scheduleSystemUiSync();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _scheduleSystemUiSync();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _restoreAppScreenMode();
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = AdaptiveTheme.of(context).theme;
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final double aspectRatio = isLandscape && screenSize.height > 0
        ? screenSize.width / screenSize.height
        : 16 / 9;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: YoutubeEmbeddedPlayer(
              videoId: widget.videoId,
              aspectRatio: aspectRatio,
              thumbnailUrl:
                  YoutubeThumbnailHelper.thumbnailForVideoId(widget.videoId),
              showControls: !Platform.isAndroid,
              showFullscreenButton: false,
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withValues(alpha: 0.45),
                  foregroundColor: theme.colorScheme.onPrimary,
                ),
                icon: const Icon(Icons.arrow_back_rounded),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: IconButton(
                  onPressed: _toggleManualRotation,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withValues(alpha: 0.45),
                    foregroundColor: theme.colorScheme.onPrimary,
                  ),
                  icon: Icon(
                    isLandscape
                        ? Icons.stay_current_portrait_rounded
                        : Icons.screen_rotation_alt_rounded,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _enterVideoScreenMode() async {
    await SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _scheduleSystemUiSync();
  }

  Future<void> _restoreAppScreenMode() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
  }

  Future<void> _toggleManualRotation() async {
    if (_isManualLandscape) {
      _isManualLandscape = false;
      await SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
        DeviceOrientation.portraitUp,
      ]);
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    } else {
      _isManualLandscape = true;
      await SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    }
    if (mounted) {
      setState(() {});
    }
  }

  void _scheduleSystemUiSync() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      final Orientation orientation = MediaQuery.orientationOf(context);
      if (_lastOrientation == orientation) {
        return;
      }
      _lastOrientation = orientation;
      _isManualLandscape = orientation == Orientation.landscape;
      if (orientation == Orientation.landscape) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      }
    });
  }
}
