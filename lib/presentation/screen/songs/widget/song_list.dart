import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import '../../../../constants.dart';
import '../../../../core/bloc/songs_bloc/songs_bloc.dart';
import 'slide_actions.dart';
import 'song_card.dart';

class SongList extends StatelessWidget {
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
          return SliverList(
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
          );
        } else if (state is SongsErrorState) {
          return SliverToBoxAdapter(
            child: ErrorTextOnScreen(
              message: state.message,
            ),
          );
        } else {
          return SliverToBoxAdapter();
        }
      },
    );
  }

  Future<void> getSongs(BuildContext context) async {
    context.read<SongsBloc>().add(SongsRequested());
  }
}
