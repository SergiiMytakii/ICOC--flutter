import 'package:flutter/material.dart';

import 'package:icoc/presentation/widget/youtube_video_player_screen.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({
    required this.videoId,
    super.key,
  });

  final String videoId;

  @override
  Widget build(BuildContext context) {
    return YoutubeVideoPlayerScreen(videoId: videoId);
  }
}
