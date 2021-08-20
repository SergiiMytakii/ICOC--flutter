import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icoc/shared/constants.dart';
import 'package:icoc/song_book/logic/controllers/songs_controller.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'bottom_sheet_filter.dart';

Widget iosAppbar(BuildContext context, dynamic controller, String title) {
  return SliverAppBar(
    primary: true,
    title: Text(title),
    backgroundColor: Constants.screensColors['songBook'],
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(
          Icons.filter_alt_outlined,
        ),
        tooltip: 'icon_button_actions_app_bar_filter'.tr,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return BottomSheetFilter();
              });
        },
      ),
    ],
    pinned: true,
    expandedHeight: 90.0,
    floating: true,
    stretch: true,
    flexibleSpace: FlexibleSpaceBar(
      background: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 40,
          padding: EdgeInsets.only(
            //top: 120,
            left: 10,
            right: 10,
            bottom: 8,
          ),
          child: CupertinoSearchTextField(
            onChanged: (val) {
              controller.query.value = val;
            },
            backgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
      ),
    ),
  );
}
