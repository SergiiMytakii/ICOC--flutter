import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/helpers/app_toast.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/domain/model/youtube_video/youtube_video.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({
    super.key,
    required this.youtubeVideos,
  });

  final YoutubeVideo youtubeVideos;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  String videoId = '';
  @override
  void initState() {
    super.initState();
  }

  void getVideoId(BuildContext context) {
    if (widget.youtubeVideos.link.isNotEmpty &&
        widget.youtubeVideos.link.contains('yout')) {
      try {
        videoId =
            YoutubePlayerController.convertUrlToId(widget.youtubeVideos.link) ??
                '';
      } on Exception catch (e, stackTrace) {
        AppToast.show(context,
            title: 'Error'.tr(), body: 'Can not play video'.tr());
        logError(e, stackTrace);
      }
    } else {
      videoId = widget.youtubeVideos.link;
      // log.v(videoId);
    }
  }

  @override
  Widget build(BuildContext context) {
    getVideoId(context);
    // log.i('with to lirics  ' + widget.withToLyrics.toString());
    return widget.youtubeVideos.thumbnail != null
        ? Column(
            children: [
              InkWell(
                onTap: () {
                  context.go(
                    '/$VIDEO/$LIST_VIDEOS_SCREEN/${widget.youtubeVideos.playlistId}/$VIDEO_PLAYER/$videoId',
                  );
                },
                child: Container(
                  width: double.maxFinite,
                  child: Image.network(
                    widget.youtubeVideos.thumbnail!,
                    height: MediaQuery.of(context).size.width / 16 * 9,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(widget.youtubeVideos.title ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium!),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Container();
  }
}
