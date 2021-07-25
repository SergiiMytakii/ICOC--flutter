import 'package:Projects/shared/constants.dart';
import 'package:Projects/shared/loading.dart';
import 'package:Projects/song_book/logic/controllers/order_lang_controller.dart';
import 'package:Projects/song_book/logic/controllers/song_list_controller.dart';
import 'package:Projects/song_book/presentation/widgets/song_card.dart';
import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';

class SongList extends StatelessWidget {
  final bool slideAction = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SongListController>(
        init: SongListController(),
        builder: (songListController) {
          int i = 0;
          print(songListController.loaded);
          return songListController.loaded
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      //iterate index of divider color
                      if (i < 4) {
                        i++;
                      } else {
                        i = 0;
                      }

                      return GetBuilder<OrderLangController>(
                        init: OrderLangController(),
                        builder: (controller) {
                          return SongCard(
                            song: songListController.songs[index],
                            orderLang: controller.orderLang,
                            slideAction: slideAction,
                            dividerColor: Constants.dividerColors[i],
                          );
                        },
                      );
                    },
                    childCount: songListController.songs.length,
                  ),
                )
              : SliverToBoxAdapter(child: Loading());
        });
  }
}
