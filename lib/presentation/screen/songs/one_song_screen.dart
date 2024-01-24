import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/bloc/favorite_song_status_bloc/favorite_songs_bloc.dart';
import 'package:icoc/core/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart';
import 'package:logger/logger.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wakelock/wakelock.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../constants.dart';
import '../../../core/model/resources.dart';
import '../../../core/model/song_detail.dart';
import '../../widget/font_size_adjust_bottom_sheet.dart';
import 'widget/song_text_on_song_screen.dart';
import 'widget/video_card.dart';

class OneSongScreen extends StatefulWidget {
  OneSongScreen() {
    Wakelock.enable();
  }
  // final SongDetail song;

  // final String? prefferedLangFromSearch;

  @override
  State<OneSongScreen> createState() => _OneSongScreenState();
}

class _OneSongScreenState extends State<OneSongScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final log = Logger();
  bool showVideos = false;
  bool miniPlayerOpened = true;
  bool videoIsPlaying = false;
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    _controller = AnimationController(
        duration:
            Duration(milliseconds: 500), // Set the duration of the animation
        vsync: this,
        lowerBound: 0.4);

    // Create a curved animation
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.addListener(() {
      setState(() {}); // Trigger a rebuild on each animation frame
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  countTabs(SongDetail song) {
    final tabs =
        song.text.length + (song.chords != null ? song.chords!.length : 0);
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    final SongDetail song =
        ModalRoute.of(context)!.settings.arguments as SongDetail;
    context.read<FavoriteSongStatusBloc>().add(FavoriteSongStatusRequested(
          id: song.id,
        ));
    return SafeArea(
      child: DefaultTabController(
        length: countTabs(song),
        child: Scaffold(
          appBar: appBar(context, song),
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              //adjust size text screen and player dynamicly
              _tabBarBuilder(song),
              if (song.resources != null && song.resources!.isNotEmpty)
                _buldVideoPreview(song),
              if (videoIsPlaying) _miniPlayerBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(
    BuildContext context,
    SongDetail song,
  ) {
    var fontSizeAdjust = FontSizeAdjustBottomSheet(
        context: context, color: ScreenColors.songBook);
    return AppBar(
      bottom: TabBar(
        isScrollable: true,
        tabs: [
          for (final item in song.text.keys) Tab(text: item),
          if (song.chords != null && song.chords!.isNotEmpty)
            for (final item in song.chords!.keys)
              Tab(
                  text: item == 'v1'
                      ? 'chords_1'
                      : item == 'v2'
                          ? 'chords_2'
                          : item),
        ],
      ),
      elevation: 0,
      actions: [
        BlocBuilder<FavoriteSongStatusBloc, FavoriteSongStatusState>(
          builder: (context, state) {
            if (state is GetFavoriteSongStatusSuccessState) {
              return IconButton(
                tooltip: "to favorite".tr(),
                icon: Icon(
                  state.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () {
                  context.read<FavoriteSongStatusBloc>().add(
                      SetFavoriteSongStatusRequested(
                          id: song.id, isFavorite: !state.isFavorite));
                  context
                      .read<FavoriteSongsListBloc>()
                      .add(FavoriteSongsListRequested());
                },
              );
            } else {
              return Icon(Icons.favorite_border);
            }
          },
        ),
        IconButton(
            tooltip: 'Font size'.tr(),
            icon: Icon(
              Icons.text_fields_outlined,
            ),
            onPressed: () => fontSizeAdjust.bottomSheet()),
      ],
    );
  }

  void _startPlayVideo(Resources resources, String videoId) async {
    youtubePlayerController = YoutubePlayerController();
    youtubePlayerController.loadVideoById(videoId: videoId);
    setState(() {
      videoIsPlaying = true;
    });
    youtubePlayerController.playVideo();
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
              onPressed: () {
                youtubePlayerController.stopVideo();
                youtubePlayerController.close();
                _controller.reverse().then((value) => setState(() {
                      videoIsPlaying = false;
                      miniPlayerOpened = true;
                    }));
              },
              icon: Icon(Icons.close_outlined)),
        ],
      ),
      AnimatedContainer(
        duration: Duration(seconds: 1),
        child: Container(
          width: double.maxFinite,
          height: _animation.value * screenSize.width / 16 * 9,
          child: YoutubePlayer(
            controller: youtubePlayerController,
          ),
        ),
      )
    ]);
  }

  TabBarView _tabBarBuilder(SongDetail song) {
    (song.text.removeWhere((key, value) => key == 'id_song'));
    return TabBarView(
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
          height: 80,
          width: double.maxFinite,
          color: AdaptiveTheme.of(context).theme.colorScheme.background,
        ),
        Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: song.resources!
                  .map((resource) =>
                      VideoCard(resource: resource, onTap: _startPlayVideo))
                  .toList(),
            )),
      ],
    );
  }
}
