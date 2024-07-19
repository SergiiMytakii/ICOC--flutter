import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/helpers/handle_divider_color.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/widget/custom_refresh_indicator.dart';
import 'package:icoc/presentation/widget/error_text_on_screen.dart';
import 'package:icoc/presentation/widget/no_content_warning.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';
import 'package:icoc/presentation/screen/songs/widget/slide_actions.dart';
import 'package:icoc/presentation/screen/songs/widget/song_card.dart';

class SongList extends StatelessWidget {
  const SongList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsBloc, SongsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SliverToBoxAdapter(),
          loading: () => SliverToBoxAdapter(
              child: CustomRefreshIndicator(
                  onRefresh: () => getIt<SongsBloc>()
                      .add(const SongsEvent.songsRequested()))),
          success: (songs) {
            return songs.isNotEmpty
                ? SliverList(
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
                  )
                : SliverToBoxAdapter(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: const NoContentWarning()),
                  );
          },
          error: (message) => SliverToBoxAdapter(
            child: ErrorTextOnScreen(
              message: message,
            ),
          ),
        );
      },
    );
  }
}
