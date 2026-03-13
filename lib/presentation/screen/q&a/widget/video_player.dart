import 'package:flutter/material.dart';

import 'package:icoc/presentation/widget/youtube_video_player_screen.dart';

class QandAVideoPlayer extends StatelessWidget {
  const QandAVideoPlayer({
    required this.videoId,
    super.key,
  });

  final String videoId;

  @override
  Widget build(BuildContext context) {
    return YoutubeVideoPlayerScreen(videoId: videoId);
  }
}
