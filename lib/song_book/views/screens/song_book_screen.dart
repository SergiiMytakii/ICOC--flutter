import 'dart:io';
import 'package:getxfire/getxfire.dart';
import 'package:icoc/shared/constants.dart';
import 'package:icoc/song_book/logic/controllers/songs_controller.dart';
import 'package:icoc/song_book/logic/services/data_search.dart';
import 'package:icoc/song_book/views/widgets/bottom_sheet_filter.dart';
import 'package:icoc/song_book/views/widgets/song_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SongBookScreen extends StatelessWidget {
  final controller = Get.put(SongsController());
  final DataSearch dataSearch = DataSearch();
  @override
  Widget build(BuildContext context) {
    //DatabaseHelper().deleteSong(187);
    return Scaffold(
        body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        Platform.isIOS
            ? iosAppbar(context, controller)
            //in case its android platform
            : AndroidAppBar(),
        Obx(
          () => controller.query.value == ''
              ? SongList()
              : dataSearch.searchResults(controller.query.value),
        ),
      ],
    ));
  }
}

class AndroidAppBar extends StatelessWidget {
  const AndroidAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      primary: true,
      title: Text(
        'app_bar_title'.tr,
      ),
      centerTitle: true,
      backgroundColor: Constants.screensColors['songBook'],
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
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            })
      ],
      pinned: true,
    );
  }
}

Widget iosAppbar(BuildContext context, SongsController controller) {
  return SliverAppBar(
    primary: true,
    title: Text(
      'app_bar_title'.tr,
    ),
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
