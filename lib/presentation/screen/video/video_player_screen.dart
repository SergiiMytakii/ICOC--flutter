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
import 'package:icoc/core/constants.dart';

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
                        if (iosWebController != null)
                          SizedBox(
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.width / 16 * 9,
                            child: WebViewWidget(controller: iosWebController!),
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
    return YoutubePlayerScaffold(
        controller: youtubePlayerController!,
        autoFullScreen: false,
        builder: (BuildContext context, Widget player) {
          return SafeArea(
            top: false,
            child: BlocBuilder<VideoBloc, VideoState>(
              builder: (context, state) {
                return state.maybeWhen(
                  getVideosFromPlaylistSuccess: (youtubeVideos) {
                    final youtubeVideo = youtubeVideos.firstWhere(
                        (item) => item.link.contains(widget.videoId));
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
                          children: [player, currentVideoInfo(youtubeVideo)],
                        ));
                  },
                  error: (message) => const Scaffold(body: ErrorTextOnScreen()),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          );
        });
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
