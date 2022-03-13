import '../../../../../index.dart';

class VideoCardTeaching extends StatefulWidget {
  const VideoCardTeaching({
    Key? key,
    required this.resources,
  }) : super(key: key);

  final Resources resources;

  @override
  State<VideoCardTeaching> createState() => _VideoCardTeachingState();
}

class _VideoCardTeachingState extends State<VideoCardTeaching> {
  final PlaylistPlayerController controller = Get.find();

  String videoId = '';
  @override
  void initState() {
    super.initState();
  }

  void getVideoId() {
    if (widget.resources.link.isNotEmpty &&
        widget.resources.link.contains('yout')) {
      try {
        videoId =
            YoutubePlayerController.convertUrlToId(widget.resources.link) ?? '';
      } on Exception catch (e) {
        showSnackbar('Error'.tr, 'Can not play video'.tr);
        print(e);
      }
    } else {
      videoId = widget.resources.link;
      // log.v(videoId);
    }
  }

  @override
  Widget build(BuildContext context) {
    getVideoId();
    // log.i('with to lirics  ' + widget.withToLyrics.toString());
    return widget.resources.thumbnail != null
        ? Column(
            children: [
              InkWell(
                onTap: () async {
                  if (controller.selectedVideo.value.link.isEmpty) {
                    controller.miniplayerController.animateToHeight(
                        state: PanelState.MAX, duration: Duration(seconds: 1));
                  } else {
                    controller.selectedVideo.value =
                        Resources(lang: '', title: '', link: '');
                    Get.appUpdate();
                    await Future.delayed(Duration(milliseconds: 300));
                  }

                  controller.selectedVideo.value = widget.resources;
                  // controller.shiftWaitingList(
                  //     selectedV: controller.selectedVideo.value);
                  // controller.myVideoPlayerController.play();
                  // controller.youtubePlayerController
                  //     .updateValue(YoutubePlayerValue(isPlaying: true));
                },
                child: Container(
                  width: double.maxFinite,
                  child: Image.network(
                    widget.resources.thumbnail!,
                    height: Get.width / 16 * 9,
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
                          style: Theme.of(context).textTheme.bodyText1!),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Container();
  }
}
