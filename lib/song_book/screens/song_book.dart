
import 'package:Projects/services/db_sqlite/sqlite_helper.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/widgets/bottom_sheet_filter.dart';
import 'package:Projects/song_book/widgets/song_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SongBook extends StatefulWidget {



  @override
  _SongBookState createState() => _SongBookState();
}

class _SongBookState extends State<SongBook> {

  //rebuild widget after changing lang settings
  void updateList(){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    //DatabaseHelper().deleteSong(187);
      return StreamProvider<List<Song>>.value(
      catchError: (_, error) => error as List<Song>,
      value: DatabaseHelper().getAllSongs(),
      initialData: [],
      child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                primary: true,
                title: Text(
                  'app_bar_title'.tr(),

                ),

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
                            return BottomSheetFilter(updateList: updateList);
                          });
                    },
                  ),
                ],
                pinned: true,
                expandedHeight: 85.0,
                floating: true,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 35,
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
