// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:icoc/core/constants.dart';

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

class _YoutubeVideoPlayerScreenState extends State<YoutubeVideoPlayerScreen> {
  WebViewController? _iosController;
  WebViewController? _androidController;
  bool _iosFailed = false;
  bool _androidFailed = false;

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();
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
      _iosController = WebViewController.fromPlatformCreationParams(params)
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setUserAgent(
          'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1',
        )
        ..setNavigationDelegate(
          NavigationDelegate(
            onWebResourceError: (_) {
              if (mounted) {
                setState(() => _iosFailed = true);
              }
            },
          ),
        )
        ..loadRequest(
          Uri.parse(
            'https://www.youtube.com/embed/${widget.videoId}?playsinline=1&autoplay=1&rel=0&modestbranding=1',
          ),
          headers: const <String, String>{
            'Referer': ICOC_WEB_PAGE,
            'Referrer-Policy': 'strict-origin-when-cross-origin',
          },
        );
    } else {
      final PlatformWebViewControllerCreationParams params =
          const PlatformWebViewControllerCreationParams();
      _androidController = WebViewController.fromPlatformCreationParams(params)
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setUserAgent(
          'Mozilla/5.0 (Linux; Android 14; Mobile) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Mobile Safari/537.36',
        )
        ..setNavigationDelegate(
          NavigationDelegate(
            onWebResourceError: (_) {
              if (mounted) {
                setState(() => _androidFailed = true);
              }
            },
          ),
        );
      if (_androidController!.platform is AndroidWebViewController) {
        (_androidController!.platform as AndroidWebViewController)
            .setMediaPlaybackRequiresUserGesture(false);
      }
      _androidController!.loadRequest(
        Uri.parse(
          'https://www.youtube.com/embed/${widget.videoId}?playsinline=1&autoplay=1&rel=0&modestbranding=1',
        ),
        headers: const <String, String>{
          'Referer': ICOC_WEB_PAGE,
          'Referrer-Policy': 'strict-origin-when-cross-origin',
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = AdaptiveTheme.of(context).theme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(),
        body: Platform.isIOS
            ? (_iosController != null && !_iosFailed)
                ? WebViewWidget(controller: _iosController!)
                : _fallbackButton()
            : (_androidController != null && !_androidFailed)
                ? WebViewWidget(controller: _androidController!)
                : _fallbackButton(),
      ),
    );
  }

  Widget _fallbackButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final Uri uri =
              Uri.parse('https://www.youtube.com/watch?v=${widget.videoId}');
          launchUrl(uri, mode: LaunchMode.externalApplication);
        },
        child: const Text('Open in YouTube'),
      ),
    );
  }
}
