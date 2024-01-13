import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../../core/model/resources.dart';
import '../../../../theme.dart';
import '../../../widget/snackbar.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({Key? key, required this.resource, required this.onTap})
      : super(key: key);

  final Resources resource;
  final Function onTap;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  final log = Logger();
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
      child: InkWell(
        onTap: () => widget.onTap(widget.resource, videoId),
        child: Image.network(
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
          height: 76,
          width: 76 * 16 / 9,
          fit: BoxFit.fitWidth,
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
      } on Exception catch (e) {
        showSnackbar(context, 'Error'.tr(), 'Can not play video'.tr());
        log.e(e);
        return '';
      }
    } else {
      return link;
      // log.v(videoId);
    }
  }
}
