// ignore_for_file: deprecated_member_use

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/model/youtube_video/youtube_video.dart';
import 'package:icoc/presentation/bloc/video_bloc/video_bloc.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
  late final YoutubePlayerController youtubePlayerController;
  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
      ),
    );
    youtubePlayerController.loadVideoById(videoId: widget.videoId);
    super.initState();
  }

  @override
  void dispose() {
    youtubePlayerController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
        controller: youtubePlayerController,
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
