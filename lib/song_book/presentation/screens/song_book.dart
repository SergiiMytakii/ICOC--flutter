import 'dart:io';

import 'package:Projects/shared/constants.dart';
import 'package:Projects/song_book/logic/services/data_search.dart';
import 'package:Projects/song_book/presentation/widgets/bottom_sheet_filter.dart';
import 'package:Projects/song_book/presentation/widgets/song_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SongBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //DatabaseHelper().deleteSong(187);
    return Scaffold(
        body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        Platform.isIOS
            ? SliverAppBar(
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
                        left: 50,
                        right: 50,
                        bottom: 8,
                      ),
                      child: TextFormField(
                        onChanged: (val) {
                          // TODO
                          //implement search here
                          //print(val);
                        },
                        textAlignVertical: TextAlignVertical.bottom,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).primaryColorLight,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorLight,
                                width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorLight,
                                width: 1.0),
                          ),
                          prefixIcon: Icon(Icons.search),
                          //border: InputBorder.none,
                          hintText: 'hint_search_field_in_app_bar'.tr,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            //in case its android platform
            : SliverAppBar(
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
              ),
        SongList(),
      ],
    ));
  }
}
