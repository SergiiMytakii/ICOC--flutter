import 'package:Projects/song_book/logic/controllers/song_lang_controller.dart';
import 'package:Projects/song_book/logic/controllers/song_list_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getxfire/getxfire.dart';

class MyCheckboxListTile extends StatelessWidget {
  final ValueKey key;
  final String orderLang;
  final songlistController = Get.put(SongListController());

  MyCheckboxListTile(this.orderLang, this.key);

  @override
  Widget build(BuildContext context) {
    String lang = orderLang;

    return GetBuilder<SongLangController>(
      init: SongLangController(),
      builder: (controller) {
        return Container(
          child: CheckboxListTile(
              activeColor: Theme.of(context).primaryColor,
              key: key,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                lang.tr,
                style: Theme.of(context).textTheme.headline6,
              ),
              value: controller.songLang[lang],
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              secondary: Icon(Icons.reorder),
              onChanged: (val) {
                controller.setSongLang(lang, val!);
                songlistController.fetchSongs();
              }),
        );
      },
    );
  }
}
