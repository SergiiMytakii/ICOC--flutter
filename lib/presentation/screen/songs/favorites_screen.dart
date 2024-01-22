import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';

import '../../../constants.dart';
import 'widget/slide_actions.dart';
import 'widget/song_card.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    getFavoriteSongs(context);
    // Future.delayed(Duration.zero).then((value) => getFavoriteSongs(context));
    super.initState();
  }

  // @override
  // void didUpdateWidget(covariant FavoritesScreen oldWidget) {
  //   getFavoriteSongs(context);
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('bottom_navigation_bar_favorites'.tr()),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: () => getFavoriteSongs(context),
        child: BlocBuilder<FavoriteSongsListBloc, FavoriteSongsState>(
          builder: (context, state) {
            if (state is GetFavoriteSongsListSuccessState) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: state.songs.length,
                itemBuilder: (BuildContext context, int index) {
                  //change i to make different colors of divider
                  if (i < 4) {
                    i++;
                  } else {
                    i = 0;
                  }

                  return SongCard(
                    song: state.songs[index],
                    dividerColor: dividerColors[i],
                    slideActions: [
                      DeleteFromFavorites(songId: state.songs[index].id),
                    ],
                  );
                },
              );
            } else if (state is FavoriteSongsLoadingState) {
              return Center(
                child: Loading(
                  color: ScreenColors.songBook,
                ),
              );
            } else if (state is FavoriteSongsErrorState) {
              return ErrorTextOnScreen();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  getFavoriteSongs(BuildContext context) async {
    context.read<FavoriteSongsListBloc>().add(FavoriteSongsListRequested());
  }
}
