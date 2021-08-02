import 'package:Projects/shared/constants.dart';
import 'package:Projects/shared/loading.dart';
import 'package:Projects/song_book/logic/controllers/order_lang_controller.dart';
import 'package:Projects/song_book/logic/controllers/songs_controller.dart';
import 'package:Projects/song_book/views/widgets/song_card.dart';
import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';

class SongList extends GetView<SongsController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SongsController());

    int i = 0;

    return Obx(() {
      return controller.loaded.value
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
                    builder: (orLangController) {
                      return SongCard(
                        song: controller.songs[index],
                        orderLang: orLangController.orderLang,
                        dividerColor: Constants.dividerColors[i],
                      );
                    },
                  );
                },
                childCount: controller.songs.length,
              ),
            )
          : SliverToBoxAdapter(child: Loading());
    });
  }
}