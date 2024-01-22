import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/core/model/resources.dart';
import 'package:icoc/presentation/screen/video/video_player_screen.dart';
import 'package:icoc/presentation/widget/toast.dart';
import 'package:icoc/presentation/widget/vertical_slide_page_route.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({
    Key? key,
    required this.resources,
  }) : super(key: key);

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
      } on Exception catch (e) {
        showToast(
            context: context,
            title: 'Error'.tr(),
            message: 'Can not play video'.tr());
        print(e);
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
                  Navigator.of(context).push(VerticalSlidePageRoute(
                      builder: (context) => VideoPlayer(widget.resources)));
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
                      child: Text(widget.resources.title,
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
