import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/favorite_songs_list_bloc/favorite_songs_bloc.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/loading.dart';

import 'package:icoc/core/constants.dart';
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
    _getFavoriteSongs();
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
        onRefresh: () => _getFavoriteSongs(),
        child: BlocBuilder<FavoriteSongsListBloc, FavoriteSongsState>(
          builder: (context, state) {
            return state.when(
              initial: () => Container(),
              loading: () => Center(
                child: Loading(
                  color: ScreenColors.songBook,
                ),
              ),
              success: (songs) => ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: songs.length,
                itemBuilder: (BuildContext context, int index) {
                  return SongCard(
                    song: songs[index],
                    dividerColor: getDividerColor(index),
                    slideActions: [
                      DeleteFromFavorites(songId: songs[index].id),
                    ],
                  );
                },
              ),
              error: (errorMessage) => const ErrorTextOnScreen(),
            );
          },
        ),
      ),
    );
  }

  Future<void> _getFavoriteSongs() async {
    getIt<FavoriteSongsListBloc>().add(const FavoriteSongsEvent.getRequested());
  }
}
