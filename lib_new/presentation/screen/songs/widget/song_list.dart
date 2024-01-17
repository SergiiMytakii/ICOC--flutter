import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants.dart';
import '../../../../core/bloc/songs_bloc/songs_bloc.dart';
import '../../../widget/loading.dart';
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
              child: Column(
            children: [
              Loading(
                color: screensColors['songBook'],
              ),
              TextButton(
                onPressed: () {}, //todo refresh
                child: AnimatedDefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: screensColors['songBook'],
                    fontWeight: FontWeight.bold,
                  ),
                  duration: Duration(seconds: 2),
                  child: Text(
                    'Loading songs'.tr(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ));
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
        } else {
          context.read<SongsBloc>().add(SongsRequested());
          return SliverToBoxAdapter();
        }
      },
    );
  }
}
