import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/core/model/songs/song_model.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';
import 'package:icoc/presentation/screen/songs/widget/song_card_highlighting.dart';
import 'package:icoc/presentation/screen/songs/widget/app_bar_song_book_screen.dart';
import 'package:icoc/presentation/screen/songs/widget/slide_actions.dart';
import 'package:icoc/presentation/screen/songs/widget/song_card.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/no_content_warning.dart';

class SongBookScreen extends StatefulWidget {
  const SongBookScreen({super.key});

  @override
  State<SongBookScreen> createState() => _SongBookScreenState();
}

class _SongBookScreenState extends State<SongBookScreen> {
  String query = '';
  late ScrollController _scrollController;

  @override
  void initState() {
    FirebaseAnalytics.instance.logScreenView(screenName: 'Song Book');
    _getSongs();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: RefreshIndicator.adaptive(
        color: Colors.transparent,
        edgeOffset: 130,
        onRefresh: _onRefresh,
        child: CustomScrollView(
          controller: _scrollController,
          cacheExtent: 0,
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SongBookAppbar(
              _handleQuery,
            ),
            BlocBuilder<SongsBloc, SongsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SliverToBoxAdapter(),
                  loading: () => _buildLoading(),
                  success: (songs) => _buildSongList(songs),
                  empty: () => _buildEmptyWarning(context),
                  searchSuccess: (songVersions) =>
                      _buildSearchResult(songVersions),
                  error: (message) => SliverToBoxAdapter(
                    child: ErrorTextOnScreen(
                      message: message,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      return; // Do not refresh when scrolling up
    }
    if (query.isNotEmpty) {
      _getSongs();
      await Future.delayed(const Duration(milliseconds: 1000));
      _handleQuery(query);
    } else {
      _getSongs();
    }
  }

  SliverToBoxAdapter _buildLoading() {
    return SliverToBoxAdapter(
        child: CustomRefreshIndicator(
            onRefresh: () =>
                getIt<SongsBloc>().add(const SongsEvent.songsRequested())));
  }

  SliverToBoxAdapter _buildEmptyWarning(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const NoContentWarning()),
    );
  }

  SliverList _buildSongList(List<SongModel> songs) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return SongCard(
            song: songs[index],
            dividerColor: getDividerColor(index),
            slideActions: [
              AddToFavorites(songId: songs[index].id),
            ],
          );
        },
        childCount: songs.length,
      ),
    );
  }

  SliverList _buildSearchResult(List<SongVersionLocal> songs) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return SongCardWithHighlighting(
            song: songs[index],
            dividerColor: getDividerColor(index),
          );
        },
        childCount: songs.length,
      ),
    );
  }

  Future<void> _getSongs() async {
    getIt<SongsBloc>().add(const SongsEvent.songsRequested());
  }

  Future<void> _handleQuery(String val) async {
    query = val;
    if (query.isEmpty) _getSongs();
    if (query.length > 1 &&
        query.length < 4 &&
        query.contains(RegExp(r'[0-9]'))) {
      getIt<SongsBloc>().add(SongsEvent.searchByNumber(query));
    } else if (query.length > 2) {
      getIt<SongsBloc>().add(SongsEvent.searchByText(query));
    }
  }
}
