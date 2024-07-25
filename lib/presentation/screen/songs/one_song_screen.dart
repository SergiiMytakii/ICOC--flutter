import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/data_sources/local/local_cache.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/favorite_song_status_bloc/favorite_songs_status_bloc.dart';
import 'package:icoc/presentation/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart';
import 'package:icoc/core/helpers/extract_text_from_html.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';
import 'package:icoc/presentation/routes/app_routes.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:logger/logger.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/model/song_detail.dart';
import 'package:icoc/presentation/widget/font_size_adjust_bottom_sheet.dart';
import 'package:icoc/presentation/screen/songs/widget/song_text_on_song_screen.dart';
import 'package:icoc/presentation/screen/songs/widget/video_card.dart';

class OneSongScreen extends StatefulWidget {
  OneSongScreen(
      {super.key, required this.songId, this.tabsCount = 1, this.lang}) {
    WakelockPlus.enable();
  }
  final String songId;
  final String?
      lang; //we need lang to open song from a deep link on a sertain tab
  final int tabsCount;

  @override
  State<OneSongScreen> createState() => _OneSongScreenState();
}

class _OneSongScreenState extends State<OneSongScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final log = Logger();
  bool showVideos = false;
  bool miniPlayerOpened = true;
  bool videoIsPlaying = false;
  YoutubePlayerController? youtubePlayerController;
  late TabController tabController;

  List<String> tabsKeys = [];

  @override
  void initState() {
    getIt<FavoriteSongStatusBloc>().add(
        FavoriteSongStatusEvent.statusRequested(id: int.parse(widget.songId)));
    _controller = AnimationController(
        duration: const Duration(
            milliseconds: 500), // Set the duration of the animation
        vsync: this,
        lowerBound: 0.48);
    // Create a curved animation
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.addListener(() {
      setState(() {}); // Trigger a rebuild on each animation frame
    });
    tabController = TabController(length: widget.tabsCount, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocBuilder<SongsBloc, SongsState>(builder: (context, state) {
        return state.maybeWhen(
          success: (songs) {
            final SongDetail? song = _receiveAndPrepareSong(songs);
            if (song != null) {
              return DefaultTabController(
                length: tabsKeys.length,
                child: Scaffold(
                  appBar: _buildAppBar(context, song),
                  body: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      //adjust size text screen and player dynamicly
                      _tabBarBuilder(song),
                      if (song.youtubeVideos != null &&
                          song.youtubeVideos!.isNotEmpty &&
                          !videoIsPlaying)
                        _buldVideoPreview(song),
                      if (videoIsPlaying) _miniPlayerBuilder(),
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          error: (_) => const Scaffold(body: ErrorTextOnScreen()),
          orElse: () => const SizedBox.shrink(),
        );
      }),
    );
  }

  SongDetail? _receiveAndPrepareSong(List<SongDetail> songs) {
    SongDetail song = songs.firstWhere(
      (item) => item.id.toString() == widget.songId,
      orElse: SongDetail.defaultSong,
    );
    //if song came from   from searchResult we need to put search language to the first place in the maps title, text, descr to show them in the first tab
    if (song.searchLang != null) {
      song = song.orderByLanguage([song.searchLang!]);
    }
    tabsKeys = getAllKeys(song);

    if (widget.lang != null && widget.lang != tabsKeys.first) {
      //here we handle case when received song from a deep link has a lang which is not active in app
      if (!tabsKeys.contains(widget.lang)) {
        final allLanguages =
            getIt<LocalCache>().getMap(StorageKeys.allSongsLanguages) ?? {};
        allLanguages[widget.lang!] = true;
        //save this lang in cache to make it active

        getIt<LocalCache>()
            .saveMap(StorageKeys.allSongsLanguages, allLanguages);
        return null;
      } else {
        // put the lang from the deep link to the first place
        song = song.orderByLanguage([widget.lang!]);
        tabsKeys.remove(widget.lang!);
        tabsKeys.insert(0, widget.lang!);
      }
    }
    //in case new screen invoked from a deep link but app was opened on another song
    if (tabController.length != tabsKeys.length) {
      tabController = TabController(length: widget.tabsCount, vsync: this);
    }
    return song;
  }

  AppBar _buildAppBar(
    BuildContext context,
    SongDetail song,
  ) {
    final fontSizeAdjust = FontSizeAdjustBottomSheet(
        context: context, color: ScreenColors.songBook);

    return AppBar(
      bottom: TabBar(
          isScrollable: true,
          controller: tabController,
          tabs: List.generate(
              tabsKeys.length, (index) => Tab(text: tabsKeys[index]))),
      elevation: 0,
      actions: [
        BlocBuilder<FavoriteSongStatusBloc, FavoriteSongStatusState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (isFavorite) => IconButton(
                tooltip: 'to favorite'.tr(),
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () {
                  getIt<FavoriteSongStatusBloc>().add(
                      FavoriteSongStatusEvent.setStatusRequested(
                          id: song.id, isFavorite: !isFavorite));
                  getIt<FavoriteSongsListBloc>()
                      .add(const FavoriteSongsEvent.getRequested());
                },
              ),
              orElse: () => const Icon(Icons.favorite_border),
            );
          },
        ),
        IconButton(
          tooltip: 'Share'.tr(),
          icon: const Icon(
            Icons.share,
          ),
          onPressed: () {
            shareSong(song);
          },
        ),
        IconButton(
            tooltip: 'Font size'.tr(),
            icon: const Icon(
              Icons.text_fields_outlined,
            ),
            onPressed: () => fontSizeAdjust.bottomSheet()),
      ],
    );
  }

  void _startPlayVideo(String videoId) async {
    youtubePlayerController = YoutubePlayerController();
    setState(() {
      videoIsPlaying = true;
    });
    youtubePlayerController!.loadVideoById(videoId: videoId);
    _controller.forward();
  }

  Widget _miniPlayerBuilder() {
    final screenSize = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: ScreenColors.songBook,
            onPressed: () {
              if (miniPlayerOpened) {
                _controller.reverse();
                setState(() {
                  miniPlayerOpened = false;
                });
              } else {
                _controller.forward();
                setState(() {
                  miniPlayerOpened = true;
                });
              }
            },
            icon: Icon(
                miniPlayerOpened ? Icons.arrow_downward : Icons.arrow_upward),
          ),
          IconButton(
              color: ScreenColors.songBook,
              onPressed: () async {
                _controller.reverse().then((value) => setState(() {
                      videoIsPlaying = false;
                      miniPlayerOpened = true;
                    }));
                await youtubePlayerController!.stopVideo();
                youtubePlayerController!.close();
              },
              icon: const Icon(Icons.close_outlined)),
        ],
      ),
      AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: Container(
          width: double.maxFinite,
          height: _animation.value * screenSize.width / 16 * 9,
          child: YoutubePlayer(
            controller: youtubePlayerController!,
          ),
        ),
      )
    ]);
  }

  TabBarView _tabBarBuilder(SongDetail song) {
    (song.text.removeWhere((key, value) => key == 'id_song'));
    return TabBarView(
      controller: tabController,
      children: [
        for (final item in song.text.keys)
          SongTextOnSongScreen(
            title: song.title[item.substring(0, 2)] ?? '',
            textVersion: song.text[item] ?? '',
            description: song.description != null
                ? song.description![item.substring(0, 2)] ?? ''
                : '',
          ),
        if (song.chords != null)
          for (final item in song.chords!.keys)
            SongTextOnSongScreen(
              title: '',
              description: '',
              textVersion: song.chords![item] ?? '',
            ),
      ],
    );
  }

  Widget _buldVideoPreview(SongDetail song) {
    return Stack(
      children: [
        Container(
          height: 110,
          width: double.maxFinite,
          color: AdaptiveTheme.of(context).theme.colorScheme.surface,
        ),
        Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: song.youtubeVideos!
                  .map((youtubeVideo) =>
                      VideoCard(resource: youtubeVideo, onTap: _startPlayVideo))
                  .toList(),
            )),
      ],
    );
  }

  String cleanKeys(String key) {
    if (key == 'v1')
      return 'chords';
    else if (key.endsWith('1'))
      return key.replaceFirst('1', '');
    else if (key == 'v2')
      return 'chords2';
    else
      return key;
  }

  List<String> getAllKeys(SongDetail song) {
    final songsKeys = song.text.keys.map((key) => cleanKeys(key)).toList();
    List<String> chordsKeys = [];
    if (song.chords != null && song.chords!.isNotEmpty) {
      chordsKeys = song.chords!.keys.map((key) => cleanKeys(key)).toList();
    }
    return songsKeys + chordsKeys;
  }

  void shareSong(SongDetail song) {
    final index = tabController.index;
    String text = '';
    String title = '';
    String description = '';
    String lang = '';
    if (index < song.text.values.length) {
      //because titles could be common for several texts (en1, en2 have the same title) we need to get key first
      final entry = song.text.entries.elementAt(index);
      lang = entry.key.toString().substring(0, 2);
      title = song.title[lang];
      description =
          song.description != null && song.description!.keys.contains(lang)
              ? song.description![entry.key.toString().substring(0, 2)]
              : '';
      text = entry.value;
    } else {
      text = song.chords!.values.elementAt(index - song.text.values.length);
    }
    text = FormatTextHelper.extractFormattedText(text);

    final link =
        '$ICOC_WEB_PAGE/$SONGBOOK/$ONE_SONG_SCREEN/${widget.songId}/${tabController.length}?lang=$lang';
    final hint = 'Open in ICOC app:'.tr();
    text = '$title\n$description\n\n$text\n\n$hint\n$link';

    Share.share(text);
  }
}
