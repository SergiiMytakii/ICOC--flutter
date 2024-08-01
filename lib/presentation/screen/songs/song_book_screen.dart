import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';
import 'package:icoc/presentation/screen/songs/widget/data_search.dart';
import 'package:icoc/presentation/screen/songs/widget/app_bar_song_book_screen.dart';
import 'package:icoc/presentation/screen/songs/widget/song_list.dart';

class SongBookScreen extends StatefulWidget {
  const SongBookScreen({super.key});

  @override
  State<SongBookScreen> createState() => _SongBookScreenState();
}

class _SongBookScreenState extends State<SongBookScreen> {
  String query = '';
  bool showSearchResults = false;
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
        onRefresh: () async {
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
        },
        child: CustomScrollView(
          controller: _scrollController,
          cacheExtent: 0,
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SongBookAppbar(
              _handleQuery,
            ),
            showSearchResults ? DataSearchResults(query) : const SongList()
          ],
        ),
      ),
    );
  }

  Future<void> _getSongs() async {
    getIt<SongsBloc>().add(const SongsEvent.songsRequested());
  }

  Future<void> _handleQuery(String val) async {
    setState(() {
      query = val;
      if (query == '') {
        _getSongs();
      }
      if (query.length > 1 && query.contains(RegExp(r'[0-9]'))) {
        showSearchResults = true;
      } else if (query.length < 3) {
        showSearchResults = false;
      } else {
        showSearchResults = true;
      }
    });
  }
}
