import 'package:icoc/song_book/screens/video_list_screen.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../index.dart';

class SongScreen extends StatefulWidget {
  SongScreen() {
    Wakelock.enable();
  }

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  final FavoritesController favoritesController = Get.find();
  bool showVideos = false;
  final log = Logger();
  String videoId = '';
  final ValueNotifier<double> playerExpandProgress = ValueNotifier(80);
  final SlidesController slidesController = Get.put(SlidesController());
  final SongDetail song = Get.arguments[0];
  late String? prefferedLangFromSearch;
  late final SongScreenController songScreenController;

  @override
  void initState() {
    prefferedLangFromSearch = Get.arguments != null && Get.arguments.length > 1
        ? Get.arguments[1]
        : null;
    songScreenController = Get.put(SongScreenController(
        songDetail: song, prefferedLangFromSearch: prefferedLangFromSearch));
    favoritesController.getFavoriteStatus(song.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //log.w(prefferedLangFromSearch);

    return Obx(() {
      return DefaultTabController(
        length: songScreenController.amountOfTabs.value,
        child: Scaffold(
          appBar: appBar(context, songScreenController, slidesController, song),
          body: Column(
            children: [
              //adjust size text screen and player dynamicly
              ValueListenableBuilder(
                  valueListenable: playerExpandProgress,
                  builder:
                      (BuildContext context, double height, Widget? child) {
                    // log.w(showVideos);
                    double? height = Scaffold.of(context).appBarMaxHeight;
                    // log.w(height);

                    return SizedBox(
                      height: Get.size.height -
                          height! -
                          (showVideos ? playerExpandProgress.value : 0),
                      child: child,
                    );
                  },
                  child: _tabBarBuilder(songScreenController)),
              if (showVideos)
                Container(
                  width: Get.width,
                  //bottom: 0,
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
                  await Get.to(() => VideoListScreen(), arguments: song)
                      ?.then((value) {
                    setState(() {
                      if (value != null) {
                        videoId = value;
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
          valueNotifier: playerExpandProgress,
          minHeight: 80,
          maxHeight: Get.size.height / 3,
          builder: (height, percentage) {
            print(videoId);
            return YoutubePlayer(
              bottomActions: [
                CurrentPosition(),
                //ProgressBar(isExpanded: true),
              ],
              width: Get.width,
              controller: YoutubePlayerController(
                initialVideoId: videoId,
                flags: YoutubePlayerFlags(
                  //controlsVisibleAtStart: true,
                  mute: false,
                ),
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
      )
    ]);
  }

  TabBarView _tabBarBuilder(SongScreenController controller) {
    return TabBarView(
      children: [
        for (final item in controller.tabItemsSongs)
          SongTextOnSongScreen(
            title: song.title[item.substring(0, 2)] ?? '',
            textVersion: song.text[item] ?? '',
            description: song.description != null
                ? song.description![item.substring(0, 2)] ?? ''
                : '',
            controller: controller,
          ),
        if (song.chords != null)
          for (final item in controller.tabItemsChords)
            SongTextOnSongScreen(
              title: '',
              description: '',
              textVersion: song.chords![item],
              controller: controller,
            ),
      ],
    );
  }
}
