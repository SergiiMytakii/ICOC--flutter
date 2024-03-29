import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/songs_bloc/songs_bloc.dart';
import 'widget/data_search.dart';
import 'widget/app_bar_song_book_screen.dart';
import 'widget/song_list.dart';

class SongBookScreen extends StatefulWidget {
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
    Future.delayed(Duration.zero)
        .then((value) => getSongs(context, useCache: true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: RefreshIndicator.adaptive(
        edgeOffset: 130,
        onRefresh: () => getSongs(context, useCache: false),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            IosAppbar(
              'app_bar_title'.tr(),
              _handleQuery,
            )
            //in case its android platform
            ,
            showSearchResults ? DataSearchResults(query) : SongList()
          ],
        ),
      ),
    );
  }

  Future<void> getSongs(BuildContext context, {bool? useCache}) async {
    context.read<SongsBloc>().add(SongsRequested(useCache: useCache));
  }

  _handleQuery(String val) {
    setState(() {
      query = val;
      if (query == '') {
        getSongs(context);
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
