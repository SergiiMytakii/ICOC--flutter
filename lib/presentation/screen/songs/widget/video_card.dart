import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/model/youtube_video/youtube_video.dart';
import 'package:icoc/theme.dart';
import 'package:icoc/presentation/widget/toast.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({super.key, required this.youtubeVideo, required this.onTap});

  final YoutubeVideo youtubeVideo;
  final Function onTap;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late bool isFavorite;
  String videoId = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    videoId = getVideoId(context, widget.youtubeVideo.link);
    // log.i('with to lirics  ' + widget.withToLyrics.toString());
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        child: GestureDetector(
          onTap: () => widget.onTap(videoId),
          child: Stack(
            children: [
              Image.network(
                widget.youtubeVideo.thumbnail ??
                    YoutubePlayerController.getThumbnail(
                      videoId: videoId,
                    ),
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: myDarkTheme.scaffoldBackgroundColor,
                    child: Image.asset('assets/images/logo_icoc_drawer.png',
                        fit: BoxFit.fitWidth),
                  );
                },
                height: 96,
                width: 96 * 16 / 9,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  widget.youtubeVideo.lang.name,
                  style: const TextStyle(
                      color: ScreenColors.songBook,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getVideoId(
    BuildContext context,
    String link,
  ) {
    //if you use Youtube_player or youtube iFrame player
    if (link.isNotEmpty && link.contains('yout')) {
      try {
        return YoutubePlayerController.convertUrlToId(link) ?? '';
      } on Exception catch (e, stackTrace) {
        logError(e, stackTrace);
        showToast(
            context: context,
            title: 'Error'.tr(),
            message: 'Can not play video'.tr());
        return '';
      }
    } else {
      return link;
      // log.v(videoId);
    }
  }
}
