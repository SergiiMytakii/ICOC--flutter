import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/no_content_warning.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';
import 'package:icoc/presentation/screen/songs/widget/slide_actions.dart';
import 'package:icoc/presentation/screen/songs/widget/song_card.dart';

class SongList extends StatelessWidget {
  const SongList({super.key});

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return BlocBuilder<SongsBloc, SongsState>(
      builder: (context, state) {
        if (state is SongsLoadingState) {
          return SliverToBoxAdapter(
              child:
                  CustomRefreshIndicator(onRefresh: () => getSongs(context)));
        } else if (state is GetSongsSuccessState) {
          return state.songs.isNotEmpty
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      //iterate index of divider color
                      if (i < 4) {
                        i++;
                      } else {
                        i = 0;
                      }
                      return SongCard(
                        song: state.songs[index],
                        dividerColor: dividerColors[i],
                        slideActions: [
                          AddToFavorites(songId: state.songs[index].id),
                        ],
                      );
                    },
                    childCount: state.songs.length,
                  ),
                )
              : SliverToBoxAdapter(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const NoContentWarning()),
                );
        } else if (state is SongsErrorState) {
          return SliverToBoxAdapter(
            child: ErrorTextOnScreen(
              message: state.message,
            ),
          );
        } else {
          return const SliverToBoxAdapter();
        }
      },
    );
  }

  Future<void> getSongs(BuildContext context) async {
    getIt<SongsBloc>().add(SongsRequested());
  }
}
