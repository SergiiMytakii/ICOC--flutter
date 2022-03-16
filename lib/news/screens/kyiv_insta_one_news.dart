import '../../index.dart';

class KyivInstaOneNewsScreen extends StatefulWidget {
  final Post post;

  KyivInstaOneNewsScreen({Key? key, required this.post}) : super(key: key);

  @override
  State<KyivInstaOneNewsScreen> createState() => _KyivInstaOneNewsScreenState();
}

class _KyivInstaOneNewsScreenState extends State<KyivInstaOneNewsScreen> {
  int currentIndex = 0;

  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    if (widget.post.videoUrl != null) {
      init();
    }
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  void init() {
    videoPlayerController =
        VideoPlayerController.network(widget.post.videoUrl!);

    videoPlayerController.addListener(() {
      setState(() {});
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'drawer_news'.tr,
        ),
        backgroundColor: screensColors['news']!.withOpacity(0.8),
        centerTitle: true,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Column(
            children: [
              if (widget.post.hasNestedImages)
                Column(
                  children: [
                    SizedBox(
                      height: Get.width,
                      width: Get.width,
                      child: PageView(
                        children: List.generate(
                            widget.post.images!.length,
                            (index) => Image.network(
                                widget.post.images![index].displayUrl!)),
                        onPageChanged: (i) {
                          setState(() {
                            currentIndex = i;
                          });
                        },
                      ),
                    ),
                    Center(
                      // alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 10),
                        child: DotBuilder(
                          currentIndex: currentIndex,
                          imagesLength: widget.post.images!.length,
                        ),
                      ),
                    ),
                  ],
                ),
              if (widget.post.videoUrl != null)
                AspectRatio(
                  aspectRatio: videoPlayerController.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(videoPlayerController),
                      _playPauseOverlay(),
                      VideoProgressIndicator(
                        videoPlayerController,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                            playedColor: screensColors['news']!),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(widget.post.caption ?? ''),
              )
            ],
          ),
        ),
      ),
    );
  }

  _playPauseOverlay() {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 100),
          reverseDuration: Duration(milliseconds: 200),
          child: videoPlayerController.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            videoPlayerController.value.isPlaying
                ? videoPlayerController.pause()
                : videoPlayerController.play();
          },
        ),
      ],
    );
  }
}

class DotBuilder extends StatelessWidget {
  final int currentIndex;
  final int imagesLength;

  const DotBuilder(
      {Key? key, required this.currentIndex, required this.imagesLength})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [];
    for (var i = 0; i < imagesLength; i++) {
      myList.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: currentIndex == i
                  ? Colors.black
                  : Colors.black.withOpacity(0.16),
              //border: Border.all(),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      );
    }
    return Row(
      children: myList,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
