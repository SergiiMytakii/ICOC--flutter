import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:icoc/song_book/screens/videoplayer/video_player_screen.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../index.dart';

class SongScreen extends StatefulWidget {
  final SongDetail song;
  final String? prefferedLangFromSearch;
  SongScreen(this.song, {this.prefferedLangFromSearch}) {
    Wakelock.enable();
  }

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  final FavoritesController favoritesController = Get.find();
  bool showVideos = false;
  bool miniPlayerOpened = false;
  String videoId = '';
  final ValueNotifier<double> playerExpandProgress = ValueNotifier(80);
  final SlidesController slidesController = Get.put(SlidesController());
  final MiniplayerController miniplayerController = MiniplayerController();
  final SongScreenController songScreenController =
      Get.put(SongScreenController());

  @override
  void initState() {
    favoritesController.getFavoriteStatus(widget.song.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    songScreenController.getData(widget.song, widget.prefferedLangFromSearch);
    return Obx(() {
      return DefaultTabController(
        length: songScreenController.amountOfTabs.value,
        child: Scaffold(
          appBar: appBar(
              context, songScreenController, slidesController, widget.song),
          body: Column(
            children: [
              //adjust size text screen and player dynamicly
              ValueListenableBuilder(
                  valueListenable: playerExpandProgress,
                  builder:
                      (BuildContext context, double height, Widget? child) {
                    // log.w(showVideos);
                    double? appBarHeight = Scaffold.of(context).appBarMaxHeight;
                    double iosPadding = Platform.isIOS ? 34 : 0;
                    // log.w(Get.size.height);

                    return SizedBox(
                      height: Get.size.height -
                          appBarHeight! -
                          (showVideos ? playerExpandProgress.value : 0) -
                          50 -
                          iosPadding,
                      child: child,
                    );
                  },
                  child: _tabBarBuilder(songScreenController)),
              if (showVideos)
                Container(
                  width: Get.width,
                  child: _miniPlayerBuilder(),
                ),
            ],
          ),
        ),
      );
    });
  }

  AppBar appBar(
    BuildContext context,
    SongScreenController controller,
    SlidesController slidesController,
    SongDetail song,
  ) {
    var fontSizeAdjust = FontSizeAdjustBottomSheet(
        context: context, controller: songScreenController, color: 'songBook');
    return AppBar(
      backgroundColor: screensColors['songBook'],
      bottom: TabBar(
        isScrollable: true,
        tabs: [
          for (final item in controller.tabItemsSongs) Tab(text: item),
          for (final item in controller.tabItemsChords) Tab(text: item),
        ],
      ),
      elevation: 0,
      actions: [
        song.resources != null
            ? IconButton(
                autofocus: true,
                tooltip: 'Video & audio'.tr,
                icon: Icon(
                  Icons.library_music_outlined,
                ),
                onPressed: () async {
                  await Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return VideoPlayerScreen(
                        song: song,
                        withControlPanel: false,
                        playNextOn: false,
                      );
                    },
                  )).then((value) {
                    log.i('coming back');
                    setState(() {
                      if (value != null) {
                        videoId = value[0];
                        showVideos = !showVideos;
                      }
                    });
                  });
                },
              )
            : Container(),
        IconButton(
          tooltip: 'Share'.tr,
          icon: Icon(
            Icons.share,
          ),
          onPressed: () {
            String song = slidesController.slideTitle.value +
                '\n\n' +
                slidesController.slideText.value;
            Share.share(song);
          },
        ),
        IconButton(
          tooltip: "to favorite".tr,
          icon: Icon(
            favoritesController.favStatus.value
                ? Icons.favorite
                : Icons.favorite_border,
          ),
          onPressed: () => favoritesController.toggleFavStatus(song.id),
        ),
        IconButton(
            tooltip: 'Font size'.tr,
            icon: Icon(
              Icons.text_fields_outlined,
            ),
            onPressed: () => fontSizeAdjust.bottomSheet()),
        IconButton(
          tooltip: 'Slides'.tr,
          icon: Icon(Icons.mobile_screen_share_outlined),
          onPressed: () {
            slidesController.getFirstSlide();
            Get.toNamed(
              Routes.SLIDES_SCREEN,
            );
          },
        ),
      ],
    );
  }

  Stack _miniPlayerBuilder() {
    return Stack(children: [
      Miniplayer(
          controller: miniplayerController,
          valueNotifier: playerExpandProgress,
          minHeight: 80,
          maxHeight: Get.size.height / 3,
          builder: (height, percentage) {
            //print(videoId);

            return YoutubePlayerIFrame(
              controller: YoutubePlayerController(
                initialVideoId: videoId,
              ),
            );
          }),
      Positioned(
        right: 0,
        child: IconButton(
            color: screensColors['songBook'],
            onPressed: () {
              setState(() {
                showVideos = false;
              });
            },
            icon: Icon(Icons.close_outlined)),
      ),
      Positioned(
        left: 0,
        child: IconButton(
            color: screensColors['songBook'],
            onPressed: () {
              if (miniPlayerOpened) {
                log.i(miniPlayerOpened);

                miniplayerController.animateToHeight(state: PanelState.MIN);
              } else {
                miniplayerController.animateToHeight(state: PanelState.MAX);
              }
              setState(() {
                miniPlayerOpened = !miniPlayerOpened;
              });
            },
            icon: Icon(
                miniPlayerOpened ? Icons.arrow_downward : Icons.arrow_upward)),
      )
    ]);
  }

  TabBarView _tabBarBuilder(SongScreenController controller) {
    return TabBarView(
      children: [
        for (final item in controller.tabItemsSongs)
          SongTextOnSongScreen(
            title: widget.song.title[item.substring(0, 2)] ?? '',
            textVersion: widget.song.text[item] ?? '',
            description: widget.song.description != null
                ? widget.song.description![item.substring(0, 2)] ?? ''
                : '',
            controller: controller,
          ),
        if (widget.song.chords != null)
          for (final item in controller.tabItemsChords)
            SongTextOnSongScreen(
              title: '',
              description: '',
              textVersion: widget.song.chords![item] ?? '',
              controller: controller,
            ),
      ],
    );
  }
}
