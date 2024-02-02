import 'package:flutter/material.dart';
import 'package:icoc/core/model/resources.dart';
import 'package:wakelock/wakelock.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer(
    this.resource, {
    Key? key,
  }) : super(key: key) {
    Wakelock.enable();
  }

  final Resources resource;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final YoutubePlayerController youtubePlayerController;
  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
      params: YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
      ),
    );
    youtubePlayerController.loadVideoById(videoId: widget.resource.link);
    super.initState();
  }

  @override
  void dispose() {
    youtubePlayerController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        Future.delayed(Duration.zero)
            .then((value) => Navigator.of(context).pop());
      },
      child: YoutubePlayerScaffold(
          controller: youtubePlayerController,
          builder: (BuildContext context, Widget player) {
            return SafeArea(
                top: false,
                child: Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      title: Text(
                        widget.resource.title ?? '',
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    body: Column(
                      children: [player, currentVideoInfo()],
                    )));
          }),
    );
  }

  Widget currentVideoInfo() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(widget.resource.description ?? '',
              style: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
    );
  }
}
