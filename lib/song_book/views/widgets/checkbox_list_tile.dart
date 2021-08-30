import 'package:icoc/shared/constants.dart';
import 'package:icoc/song_book/logic/controllers/song_lang_controller.dart';

import 'package:icoc/song_book/logic/controllers/songs_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getxfire/getxfire.dart';

class MyCheckboxListTile extends GetView<SongsController> {
  final ValueKey key;
  final String orderLang;

  MyCheckboxListTile(this.orderLang, this.key);

  @override
  Widget build(BuildContext context) {
    Get.put(SongsController());
    String lang = orderLang;

    return GetBuilder<SongLangController>(
      init: SongLangController(),
      builder: (songLangController) {
        return Container(
          child: CheckboxListTile(
              activeColor: Constants.screensColors['songBook'],
              key: key,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                lang.tr,
                style: Theme.of(context).textTheme.headline6,
              ),
              value: songLangController.songLang[lang],
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              secondary: Icon(Icons.reorder),
              onChanged: (val) {
                songLangController.setSongLang(lang, val!);
                controller.fetchSongsList();
              }),
        );
      },
    );
  }
}
