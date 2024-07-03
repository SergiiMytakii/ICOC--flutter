import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';

import 'package:icoc/constants.dart';
import 'package:icoc/presentation/screen/songs/widget/slide_actions.dart';
import 'package:icoc/presentation/screen/songs/widget/song_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    getFavoriteSongs(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bottom_navigation_bar_favorites'.tr()),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () => getFavoriteSongs(context),
        child: BlocBuilder<FavoriteSongsListBloc, FavoriteSongsState>(
          builder: (context, state) {
            if (state is GetFavoriteSongsListSuccessState) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.songs.length,
                itemBuilder: (BuildContext context, int index) {
                  return SongCard(
                    song: state.songs[index],
                    dividerColor: getDividerColor(index),
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
              return const ErrorTextOnScreen();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Future<void> getFavoriteSongs(BuildContext context) async {
    getIt<FavoriteSongsListBloc>().add(FavoriteSongsListRequested());
  }
}
