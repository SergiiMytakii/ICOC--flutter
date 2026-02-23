// ignore_for_file: deprecated_member_use

import 'package:adaptive_theme/adaptive_theme.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/domain/model/youtube_video/youtube_video.dart';
import 'package:icoc/presentation/bloc/video_bloc/video_bloc.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:icoc/core/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({
    required this.videoId,
    super.key,
  }) {
    WakelockPlus.enable();
  }

  final String videoId;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
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
        top: false,
        child: BlocBuilder<VideoBloc, VideoState>(
          builder: (context, state) {
            return state.maybeWhen(
              getVideosFromPlaylistSuccess: (youtubeVideos) {
                final youtubeVideo = youtubeVideos
                    .firstWhere((item) => item.link.contains(widget.videoId));
                return Scaffold(
                    backgroundColor:
                        AdaptiveTheme.of(context).theme.colorScheme.surface,
                    appBar: AppBar(
                      centerTitle: true,
                      title: Text(
                        youtubeVideo.title ?? '',
                        maxLines: 2,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    body: Column(
                      children: [
                        if (!iosWebFailed && iosWebController != null)
                          SizedBox(
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.width / 16 * 9,
                            child: WebViewWidget(controller: iosWebController!),
                          ),
                        if (iosWebFailed)
                          SizedBox(
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.width / 16 * 9,
                            child: Card(
                              margin: const EdgeInsets.all(8),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      size: 48,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Video player failed to load',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'The video could not be played in the app. Please try opening it in YouTube.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        final uri = Uri.parse(
                                            'https://www.youtube.com/watch?v=${widget.videoId}');
                                        launchUrl(uri,
                                            mode:
                                                LaunchMode.externalApplication);
                                      },
                                      icon: const Icon(Icons.play_arrow),
                                      label: const Text('Open in YouTube'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        currentVideoInfo(youtubeVideo)
                      ],
                    ));
              },
              error: (message) => const Scaffold(body: ErrorTextOnScreen()),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      );
    }
    return SafeArea(
      top: false,
      child: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          return state.maybeWhen(
            getVideosFromPlaylistSuccess: (youtubeVideos) {
              final youtubeVideo = youtubeVideos
                  .firstWhere((item) => item.link.contains(widget.videoId));
              return Scaffold(
                  backgroundColor:
                      AdaptiveTheme.of(context).theme.colorScheme.surface,
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                      youtubeVideo.title ?? '',
                      maxLines: 2,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  body: Column(
                    children: [
                      if (!androidWebFailed && androidWebController != null)
                        SizedBox(
                          width: double.maxFinite,
                          height: MediaQuery.of(context).size.width / 16 * 9,
                          child:
                              WebViewWidget(controller: androidWebController!),
                        ),
                      if (androidWebFailed)
                        SizedBox(
                          width: double.maxFinite,
                          height: MediaQuery.of(context).size.width / 16 * 9,
                          child: Card(
                            margin: const EdgeInsets.all(8),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 48,
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Video player failed to load',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'The video could not be played in the app. Please try opening it in YouTube.',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      final uri = Uri.parse(
                                          'https://www.youtube.com/watch?v=${widget.videoId}');
                                      launchUrl(uri,
                                          mode: LaunchMode.externalApplication);
                                    },
                                    icon: const Icon(Icons.play_arrow),
                                    label: const Text('Open in YouTube'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      currentVideoInfo(youtubeVideo)
                    ],
                  ));
            },
            error: (message) => const Scaffold(body: ErrorTextOnScreen()),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget currentVideoInfo(YoutubeVideo youtubeVideo) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(youtubeVideo.description ?? '',
              style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium),
        ),
      ),
    );
  }
}
