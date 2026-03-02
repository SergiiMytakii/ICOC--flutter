import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    this.onFullscreenChanged,
  });

  final String videoId;
  final double aspectRatio;
  final bool autoPlay;
  final bool mute;
  final bool showControls;
  final bool showFullscreenButton;
  final ValueChanged<bool>? onFullscreenChanged;

  @override
  State<YoutubeEmbeddedPlayer> createState() => _YoutubeEmbeddedPlayerState();
}

class _YoutubeEmbeddedPlayerState extends State<YoutubeEmbeddedPlayer> {
  static const String _fullscreenChannelName = 'YoutubeEmbedFullscreen';

  WebViewController? _controller;
  bool _hasLoadError = false;
  bool _didInitialize = false;

  @override
  void initState() {
    super.initState();
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
        oldWidget.showFullscreenButton != widget.showFullscreenButton) {
      _initializeController();
    }
  }

  Future<void> _initializeController() async {
    final ThemeData theme = Theme.of(context);
    final WebViewController controller = await createYoutubeWebViewController(
      backgroundColor: theme.colorScheme.surface,
      onWebResourceError: (_) {
        if (!mounted) {
          return;
        }
        setState(() => _hasLoadError = true);
      },
      onPageFinished: widget.onFullscreenChanged == null
          ? null
          : (WebViewController controller) {
              return attachYoutubeFullscreenListener(
                controller,
                channelName: _fullscreenChannelName,
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
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _controller = controller;
      _hasLoadError = false;
    });
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
}
