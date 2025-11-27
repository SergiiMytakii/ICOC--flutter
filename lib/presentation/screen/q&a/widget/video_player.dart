// ignore_for_file: deprecated_member_use

import 'package:adaptive_theme/adaptive_theme.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:icoc/core/constants.dart';

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
      youtubePlayerController = YoutubePlayerController(
        params: const YoutubePlayerParams(
          showFullscreenButton: true,
          playsInline: true,
        ),
      );
      youtubePlayerController!.loadVideoById(videoId: widget.videoId);
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
          body: iosWebController != null
              ? WebViewWidget(controller: iosWebController!)
              : const SizedBox.shrink(),
        ),
      );
    }
    return YoutubePlayerScaffold(
        controller: youtubePlayerController!,
        autoFullScreen: false,
        builder: (BuildContext context, Widget player) {
          return SafeArea(
            child: Scaffold(
                backgroundColor:
                    AdaptiveTheme.of(context).theme.colorScheme.surface,
                appBar: AppBar(),
                body: player),
          );
        });
  }
}
