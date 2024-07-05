import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:icoc/core/model/resources.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/presentation/widget/toast.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({
    super.key,
    required this.resources,
  });

  final Resources resources;

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
    if (widget.resources.link.isNotEmpty &&
        widget.resources.link.contains('yout')) {
      try {
        videoId =
            YoutubePlayerController.convertUrlToId(widget.resources.link) ?? '';
      } on Exception catch (e, stackTrace) {
        showToast(
            context: context,
            title: 'Error'.tr(),
            message: 'Can not play video'.tr());
        logError(e, stackTrace);
      }
    } else {
      videoId = widget.resources.link;
      // log.v(videoId);
    }
  }

  @override
  Widget build(BuildContext context) {
    getVideoId(context);
    // log.i('with to lirics  ' + widget.withToLyrics.toString());
    return widget.resources.thumbnail != null
        ? Column(
            children: [
              InkWell(
                onTap: () {
                  context.go(
                    '/$VIDEO/$LIST_VIDEOS_SCREEN/${widget.resources.playlistId}/$VIDEO_PLAYER/$videoId',
                  );
                },
                child: Container(
                  width: double.maxFinite,
                  child: Image.network(
                    widget.resources.thumbnail!,
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
                      child: Text(widget.resources.title ?? '',
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
