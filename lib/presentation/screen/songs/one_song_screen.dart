import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/core/helpers/convert_languages_enum.dart';
import 'package:icoc/domain/model/songs/song_model.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/favorite_song_status_bloc/favorite_songs_status_bloc.dart';
import 'package:icoc/presentation/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart';
import 'package:icoc/core/helpers/extract_text_from_html.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';
import 'package:icoc/core/routes/app_routes.dart';
import 'package:icoc/presentation/screen/songs/widget/no_chords_tab.dart';
import 'package:icoc/presentation/widget/loading.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/presentation/widget/font_size_adjust_bottom_sheet.dart';
import 'package:icoc/presentation/screen/songs/widget/song_version_tab.dart';

class OneSongScreen extends StatefulWidget {
  OneSongScreen({super.key, required this.songId, required this.primaryLang}) {
    WakelockPlus.enable();
  }
  final String songId;
  final String primaryLang;

  @override
  State<OneSongScreen> createState() => _OneSongScreenState();
}

class _OneSongScreenState extends State<OneSongScreen>
    with TickerProviderStateMixin {
  TabController? tabController;
  SongModel? song;
  bool hasChords = true;
  SongVersion? chords;

  @override
  void initState() {
    getIt<FavoriteSongStatusBloc>().add(
        FavoriteSongStatusEvent.statusRequested(id: int.parse(widget.songId)));
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Builder(builder: (context) {
          final List<SongModel> allSongs = context.watch<SongsBloc>().allSongs;
          song = _receiveAndPrepareSong(allSongs);

          return song != null && tabController != null
              ? Scaffold(
                  appBar: _buildAppBar(context, song!, hasChords),
                  body: _tabBarBuilder(song!, hasChords),
                )
              : _buildEmptyScreen();
        }));
  }

  Scaffold _buildEmptyScreen() {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.text_fields_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Loading(),
    );
  }

  SongModel? _receiveAndPrepareSong(List<SongModel> allSongs) {
    if (allSongs.isEmpty) {
      getIt<SongsBloc>().add(const SongsEvent.songsRequested());
      return null;
    }

    hasChords = true;
    chords = null;

    final SongModel song = allSongs.firstWhere(
      (item) => item.id.toString() == widget.songId,
      orElse: SongModel.defaultSong,
    );
//if no chords in the current language show chords in another language if available
    if (!song.hasChords()) {
      final SongModel rawSong = getIt<SongsBloc>().rawSongs.firstWhere(
            (item) => item.id.toString() == widget.songId,
            orElse: SongModel.defaultSong,
          );
      if (rawSong.hasChords()) {
        hasChords = false;
        chords = rawSong.songVersions.firstWhere((version) => version.isChords);
      }
    }

    //handle case when received song from a deep link has a primaryLang which is not active in app
    if (!song
        .getAllLangs()
        .contains(convertLanguagesEnum(widget.primaryLang))) {
      getIt<SongsUserLanguagesHandler>()
          .addLanguage(widget.primaryLang, true)
          .then(
              (_) => getIt<SongsBloc>().add(const SongsEvent.songsRequested()));
      return null;
    } else {
      final index =
          song.getAllLangs().indexOf(convertLanguagesEnum(widget.primaryLang));
      _ensureTabController(
        tabsCount: song.songVersions.length + (hasChords ? 0 : 1),
        initialIndex: index,
      );
    }

    return song;
  }

  void _ensureTabController({
    required int tabsCount,
    required int initialIndex,
  }) {
    final int boundedIndex = initialIndex.clamp(0, tabsCount - 1);
    final TabController? currentController = tabController;
    final bool shouldRecreate = currentController == null ||
        currentController.length != tabsCount;

    if (!shouldRecreate) {
      return;
    }

    currentController?.dispose();
    tabController = TabController(
      length: tabsCount,
      vsync: this,
      initialIndex: boundedIndex,
    );
  }

  AppBar _buildAppBar(BuildContext context, SongModel song, bool hasChords) {
    final fontSizeAdjust = FontSizeAdjustBottomSheet(
        context: context, color: ScreenColors.songBook);

    return AppBar(
      bottom: TabBar(isScrollable: true, controller: tabController, tabs: [
        for (var songVersion in song.songVersions)
          Tab(
              text: songVersion.isChords
                  ? '${'chords'.tr()} ${songVersion.lang.name.tr().substring(0, 3)}'
                  : songVersion.lang.name.tr().substring(0, 3)),
        //suggest chords tab if no chords versions in current lang
        if (!hasChords)
          Tab(
            text: 'chords'.tr(),
          ),
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

  TabBarView _tabBarBuilder(SongModel song, bool hasChords) {
    return TabBarView(
      controller: tabController,
      children: [
        for (final songVersion in song.songVersions)
          SongVersionTab(
            key: PageStorageKey<String>(
              'song-version-${song.id}-${songVersion.id}-${songVersion.lang.name}',
            ),
            songVersion: songVersion,
          ),
        if (!hasChords && chords != null) ChordsTab(chords: chords!)
      ],
    );
  }

  void shareSong(SongModel song) {
    final int index = tabController!.index;
    String text = song.songVersions[index].text;
    final String title = song.songVersions[index].title;
    final String description = song.songVersions[index].description ?? '';
    final String primaryLang = song.songVersions[index].lang.name;

    text = FormatTextHelper.extractFormattedText(text);

    final link =
        '$ICOC_WEB_PAGE/$SONGBOOK/$ONE_SONG_SCREEN/${widget.songId}?lang=$primaryLang';
    final hint = 'Open in ICOC app:'.tr();
    text = '$title\n$description\n\n$text\n\n$hint\n$link';

    SharePlus.instance.share(ShareParams(text: text));
  }
}
