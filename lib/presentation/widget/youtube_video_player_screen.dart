import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

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
    final bool isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: YoutubeEmbeddedPlayer(
              videoId: widget.videoId,
              aspectRatio: 16 / 9,
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
          if (!isLandscape)
            const IgnorePointer(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 18),
                  child: Icon(
                    Icons.screen_rotation_alt_rounded,
                    color: Colors.white54,
                    size: 20,
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
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _scheduleSystemUiSync();
  }

  Future<void> _restoreAppScreenMode() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
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
      if (orientation == Orientation.landscape) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      }
    });
  }
}
