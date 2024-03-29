import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/core/helpers/error_logger.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../../constants.dart';
import '../../../../core/model/resources.dart';
import '../../../../theme.dart';
import '../../../widget/toast.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({Key? key, required this.resource, required this.onTap})
      : super(key: key);

  final Resources resource;
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
    videoId = getVideoId(context, widget.resource.link);
    // log.i('with to lirics  ' + widget.withToLyrics.toString());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        child: GestureDetector(
          onTap: () => widget.onTap(widget.resource, videoId),
          child: Stack(
            children: [
              Image.network(
                widget.resource.thumbnail ??
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
                  widget.resource.lang,
                  style: TextStyle(
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
