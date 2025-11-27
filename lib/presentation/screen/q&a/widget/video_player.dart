// ignore_for_file: deprecated_member_use

import 'package:adaptive_theme/adaptive_theme.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:icoc/core/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class QandAVideoPlayer extends StatefulWidget {
  QandAVideoPlayer({
    required this.videoId,
    super.key,
  }) {
    WakelockPlus.enable();
  }

  final String videoId;

  @override
  State<QandAVideoPlayer> createState() => _QandAVideoPlayerState();
}

class _QandAVideoPlayerState extends State<QandAVideoPlayer> {
  YoutubePlayerController? youtubePlayerController;
  WebViewController? iosWebController;
  WebViewController? androidWebController;
  bool iosWebFailed = false;
  bool androidWebFailed = false;
  @override
  void initState() {
    if (Platform.isIOS) {
      late final PlatformWebViewControllerCreationParams params;
      if (WebViewPlatform.instance is WebKitWebViewPlatform) {
        params = WebKitWebViewControllerCreationParams(
          allowsInlineMediaPlayback: true,
          mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
        );
      } else {
        params = const PlatformWebViewControllerCreationParams();
      }
      final controller = WebViewController.fromPlatformCreationParams(params)
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setUserAgent(
            'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1')
        ..setNavigationDelegate(NavigationDelegate(onWebResourceError: (e) {
          setState(() {
            iosWebFailed = true;
          });
        }))
        ..loadRequest(
          Uri.parse(
              'https://www.youtube.com/embed/${widget.videoId}?playsinline=1&autoplay=1&rel=0&modestbranding=1'),
          headers: const {
            'Referer': ICOC_WEB_PAGE,
            'Referrer-Policy': 'strict-origin-when-cross-origin',
          },
        );
      iosWebController = controller;
    } else {
      final params = const PlatformWebViewControllerCreationParams();
      final controller = WebViewController.fromPlatformCreationParams(params)
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setUserAgent(
            'Mozilla/5.0 (Linux; Android 14; Mobile) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36')
        ..setNavigationDelegate(NavigationDelegate(onWebResourceError: (e) {
          setState(() {
            androidWebFailed = true;
          });
        }));
      if (controller.platform is AndroidWebViewController) {
        (controller.platform as AndroidWebViewController)
            .setMediaPlaybackRequiresUserGesture(false);
      }
      controller.loadRequest(
        Uri.parse(
            'https://www.youtube.com/embed/${widget.videoId}?playsinline=1&autoplay=1&rel=0&modestbranding=1'),
        headers: const {
          'Referer': ICOC_WEB_PAGE,
          'Referrer-Policy': 'strict-origin-when-cross-origin',
        },
      );
      androidWebController = controller;
    }
    super.initState();
  }

  @override
  void dispose() {
    if (youtubePlayerController != null) {
      youtubePlayerController!.close();
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Platform.isIOS && iosWebController != null) {
      iosWebController!.setBackgroundColor(
          AdaptiveTheme.of(context).theme.colorScheme.surface);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AdaptiveTheme.of(context).theme.colorScheme.surface,
          appBar: AppBar(),
          body: iosWebController != null && !iosWebFailed
              ? WebViewWidget(controller: iosWebController!)
              : Center(
                  child: ElevatedButton(
                    onPressed: () {
                      final uri = Uri.parse(
                          'https://www.youtube.com/watch?v=${widget.videoId}');
                      launchUrl(uri, mode: LaunchMode.externalApplication);
                    },
                    child: const Text('Open in YouTube'),
                  ),
                ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: AdaptiveTheme.of(context).theme.colorScheme.surface,
        appBar: AppBar(),
        body: androidWebController != null && !androidWebFailed
            ? WebViewWidget(controller: androidWebController!)
            : Center(
                child: ElevatedButton(
                  onPressed: () {
                    final uri = Uri.parse(
                        'https://www.youtube.com/watch?v=${widget.videoId}');
                    launchUrl(uri, mode: LaunchMode.externalApplication);
                  },
                  child: const Text('Open in YouTube'),
                ),
              ),
      ),
    );
  }
}
