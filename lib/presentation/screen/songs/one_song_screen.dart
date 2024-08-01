import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/data_sources/local/local_cache.dart';
import 'package:icoc/core/helpers/convert_languages_enum.dart';
import 'package:icoc/core/model/songs/song_model.dart';
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
import 'package:icoc/presentation/widget/font_size_adjust_bottom_sheet.dart';
import 'package:icoc/presentation/screen/songs/widget/song_version_tab.dart';
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
  late TabController tabController;

  @override
  void initState() {
    getIt<FavoriteSongStatusBloc>().add(
        FavoriteSongStatusEvent.statusRequested(id: int.parse(widget.songId)));

    tabController = TabController(length: widget.tabsCount, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
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
            final SongModel song = _receiveAndPrepareSong(songs);

            return DefaultTabController(
              length: song.songVersions.length,
              child: Scaffold(
                appBar: _buildAppBar(context, song),
                body: _tabBarBuilder(song),
              ),
            );
          },
          error: (_) => const Scaffold(body: ErrorTextOnScreen()),
          orElse: () => const SizedBox.shrink(),
        );
      }),
    );
  }

  SongModel _receiveAndPrepareSong(List<SongModel> songs) {
    final SongModel song = songs.firstWhere(
      (item) => item.id.toString() == widget.songId,
      orElse: SongModel.defaultSong,
    );
    //if song came from   from searchResult we need to put search language to the first place in the maps title, text, descr to show them in the first tab

    if (widget.lang != null &&
        widget.lang != song.songVersions.first.lang.name) {
      //here we handle case when received song from a deep link has a lang which is not active in app
      if (!song.getAllLangs().contains(languagesToEnumMap[widget.lang])) {
        final allLanguages =
            getIt<LocalCache>().getMap(StorageKeys.allSongsLanguages) ?? {};
        allLanguages[widget.lang!] = true;
        //save this lang in cache to make it active

        getIt<LocalCache>()
            .saveMap(StorageKeys.allSongsLanguages, allLanguages);
        return song;
      } else {
        //todo open specific tab
        // put the lang from the deep link to the first place
        // final result = song.songVersions.remove(languagesToEnumMap[widget.lang]);
        // song.songVersions.insert(0, result);
      }
    }
    //in case new screen invoked from a deep link but app was opened on another song
    if (tabController.length != song.songVersions.length) {
      tabController = TabController(length: widget.tabsCount, vsync: this);
    }
    return song;
  }

  AppBar _buildAppBar(
    BuildContext context,
    SongModel song,
  ) {
    final fontSizeAdjust = FontSizeAdjustBottomSheet(
        context: context, color: ScreenColors.songBook);

    return AppBar(
      bottom: TabBar(isScrollable: true, controller: tabController, tabs: [
        for (var songVersion in song.songVersions)
          Tab(
              text: songVersion.isChords
                  ? '${'chords'.tr()} ${songVersion.lang.name.tr().substring(0, 3)}'
                  : songVersion.lang.name.tr().substring(0, 3))
      ]),
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

  TabBarView _tabBarBuilder(SongModel song) {
    return TabBarView(
      controller: tabController,
      children: [
        for (final songVersion in song.songVersions)
          SongVersionTab(
            songVersion: songVersion,
          ),
      ],
    );
  }

  void shareSong(SongModel song) {
    final index = tabController.index;
    String text = song.songVersions[index].text;
    final String title = song.songVersions[index].title;
    final String description = song.songVersions[index].description ?? '';
    final String lang = song.songVersions[index].lang.name;

    text = FormatTextHelper.extractFormattedText(text);

    final link =
        '$ICOC_WEB_PAGE/$SONGBOOK/$ONE_SONG_SCREEN/${widget.songId}/${tabController.length}?lang=$lang';
    final hint = 'Open in ICOC app:'.tr();
    text = '$title\n$description\n\n$text\n\n$hint\n$link';

    Share.share(text);
  }
}
