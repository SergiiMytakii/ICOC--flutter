import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    FirebaseAnalytics.instance.logScreenView(screenName: 'Song Book');
    getSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: RefreshIndicator.adaptive(
        color: Colors.transparent,
        edgeOffset: 130,
        onRefresh: () async {
          if (query.isNotEmpty) {
            getSongs(useCache: false);
            await Future.delayed(const Duration(milliseconds: 1000));
            _handleQuery(query);
          } else
            getSongs(useCache: false);
        },
        child: CustomScrollView(
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

  Future<void> getSongs({bool useCache = true}) async {
    getIt<SongsBloc>().add(SongsRequested(useCache: useCache));
  }

  Future<void> _handleQuery(String val) async {
    setState(() {
      query = val;
      if (query == '') {
        getSongs();
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
