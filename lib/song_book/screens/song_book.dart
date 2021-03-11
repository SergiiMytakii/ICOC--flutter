import 'package:Projects/menu/my_drawer.dart';
import 'package:Projects/services/database.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/widgets/bottom_navigation_bar.dart';
import 'package:Projects/song_book/widgets/bottom_sheet_filter.dart';
import 'package:Projects/song_book/widgets/song_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SongBook extends StatelessWidget {
  final int numberOfPage = 0;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Song?>?>.value(
      value: DatabaseService().songs,
      catchError: (_, error) => error as List<Song?>?,
      initialData: [],
      child: Scaffold(
          bottomNavigationBar: MyBottomNavigationBar(numberOfPage),
          drawer: Drawer(
            child: MyDrawer(),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                primary: true,
                title: Text(
                  'app_bar_title'.tr(),
                  style: TextStyle(fontSize: 28),
                ),
                titleTextStyle: TextStyle(fontSize: 18),
                centerTitle: true,
                elevation: 6,
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      size: 30,
                    ),
                    tooltip: 'icon_button_actions_app_bar_filter'.tr(),
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
                expandedHeight: 100.0,
                floating: true,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 38,
                      padding: EdgeInsets.only(
                        //top: 120,
                        left: 50,
                        right: 50,
                        bottom: 5,
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
                          fillColor: Theme.of(context).backgroundColor,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Theme.of(context).backgroundColor,
                                width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Theme.of(context).backgroundColor,
                                width: 1.0),
                          ),

                          prefixIcon: Icon(Icons.search),
                          //border: InputBorder.none,
                          hintText:
                              'hint_search_field_in_app_bar'.tr().toString(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SongList(),
            ],
          )),
    );
  }
}
