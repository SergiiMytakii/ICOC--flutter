import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:icoc/domain/model/youtube_video/youtube_video.dart';
import 'package:icoc/presentation/screen/songs/widget/video_card.dart';
import 'package:icoc/presentation/widget/scale_text.dart';
import 'package:logger/logger.dart';

import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SongVersionTab extends StatefulWidget {
  SongVersionTab({super.key, required this.songVersion});

  final SongVersion songVersion;

  @override
  State<SongVersionTab> createState() => _SongVersionTabState();
}

class _SongVersionTabState extends State<SongVersionTab>
    with SingleTickerProviderStateMixin {
  final log = Logger();

  late AnimationController _controller;
  late Animation<double> _animation;
  bool showVideos = false;
  bool miniPlayerOpened = true;
  bool videoIsPlaying = false;
  YoutubePlayerController? youtubePlayerController;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(
            milliseconds: 500), // Set the duration of the animation
        vsync: this,
        lowerBound: 0.48);
    // Create a curved animation
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.addListener(() {
      setState(() {}); // Trigger a rebuild on each animation frame
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontSizeBloc, FontSizeState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (fontSize) => ScaleText(
            fontSize: fontSize ?? 14,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: SelectionArea(
                        child: Column(
                          children: [
                            Text(
                              widget.songVersion.title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      fontSize: (fontSize ?? 14) + 5,
                                      fontWeight: FontWeight.bold),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              margin: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(
                                widget.songVersion.description ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: (fontSize ?? 14),
                                        fontStyle: FontStyle.italic),
                              ),
                            ),
                            const SizedBox(height: 10),
                            widget.songVersion.text.startsWith('<')
                                ? html.Html(
                                    data: widget.songVersion.text,
                                    style: {
                                      'body': html.Style(
                                          alignment: Alignment.center,
                                          fontSize:
                                              html.FontSize(fontSize ?? 14)),
                                    },
                                  )
                                : Text(
                                    widget.songVersion.text,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: fontSize ?? 14),
                                  ),
                            const SizedBox(
                              height: 300,
                            )
                          ],
                        ),
                      )),
                ),
                if ((widget.songVersion.youtubeVideos?.isNotEmpty ?? false) &&
                    !videoIsPlaying)
                  _buldVideoPreview(widget.songVersion.youtubeVideos!),
                if (videoIsPlaying) _miniPlayerBuilder(),
              ],
            ),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buldVideoPreview(List<YoutubeVideo> youtubeVideos) {
    return Stack(
      children: [
        Container(
          height: 110,
          width: double.maxFinite,
          color: AdaptiveTheme.of(context).theme.colorScheme.surface,
        ),
        Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: youtubeVideos
                  .map((youtubeVideo) => VideoCard(
                      youtubeVideo: youtubeVideo, onTap: _startPlayVideo))
                  .toList(),
            )),
      ],
    );
  }

  void _startPlayVideo(String videoId) async {
    youtubePlayerController = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
      ),
    );
    setState(() {
      videoIsPlaying = true;
    });
    youtubePlayerController!.loadVideoById(videoId: videoId);
    _controller.forward();
  }

  Widget _miniPlayerBuilder() {
    final screenSize = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: ScreenColors.songBook,
            onPressed: () {
              if (miniPlayerOpened) {
                _controller.reverse();
                setState(() {
                  miniPlayerOpened = false;
                });
              } else {
                _controller.forward();
                setState(() {
                  miniPlayerOpened = true;
                });
              }
            },
            icon: Icon(
                miniPlayerOpened ? Icons.arrow_downward : Icons.arrow_upward),
          ),
          IconButton(
              color: ScreenColors.songBook,
              onPressed: () async {
                _controller.reverse().then((value) => setState(() {
                      videoIsPlaying = false;
                      miniPlayerOpened = true;
                    }));
                await youtubePlayerController!.stopVideo();
                youtubePlayerController!.close();
              },
              icon: const Icon(Icons.close_outlined)),
        ],
      ),
      AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: Container(
          width: double.maxFinite,
          height: _animation.value * screenSize.width / 16 * 9,
          child: YoutubePlayer(
            controller: youtubePlayerController!,
          ),
        ),
      )
    ]);
  }
}
