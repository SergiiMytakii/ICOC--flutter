import 'dart:io';
import 'package:icoc/shared/constants.dart';
import 'package:icoc/song_book/logic/services/data_search.dart';
import 'package:icoc/song_book/views/widgets/bottom_sheet_filter.dart';
import 'package:icoc/song_book/views/widgets/song_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SongBookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //DatabaseHelper().deleteSong(187);
    return Scaffold(
        body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        Platform.isIOS
            ? IosAppbar()
            //in case its android platform
            : AndroidAppBar(),
        SongList(),
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

class IosAppbar extends StatelessWidget {
  const IosAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      middle: Text(
        'app_bar_title'.tr,
        style: TextStyle(color: Colors.white),
      ),
      // title: Text(
      //   'app_bar_title'.tr,
      // ),
      backgroundColor: Constants.screensColors['songBook'],
      // centerTitle: true,
      trailing: IconButton(
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

      // pinned: true,
      // expandedHeight: 90.0,
      // floating: true,
      // stretch: true,
      // flexibleSpace: FlexibleSpaceBar(
      //   background: Align(
      //     alignment: Alignment.bottomCenter,
      //     child: Container(
      //       height: 40,
      //       padding: EdgeInsets.only(
      //         //top: 120,
      //         left: 10,
      //         right: 10,
      //         bottom: 8,
      //       ),
      largeTitle: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
        child: CupertinoSearchTextField(
          onChanged: (val) {
            showSearch(context: context, delegate: DataSearch());
          },
          backgroundColor: Colors.white.withOpacity(0.2),
          // textAlignVertical: TextAlignVertical.bottom,
          // style: TextStyle(fontSize: 20),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
        ),
      ),
      //   focusedBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(10),
      //     borderSide: BorderSide.none,
      //   ),
      //   prefixIcon: Icon(Icons.search),
      //   //border: InputBorder.none,
      //   hintText: 'hint_search_field_in_app_bar'.tr,
      // ),
      // ),
    );
    //     ),
    //   ),
    // );
  }
}
