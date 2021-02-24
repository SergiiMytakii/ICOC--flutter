import 'package:Projects/generated/l10n.dart';
import 'package:Projects/menu/my_drawer.dart';
import 'package:Projects/song_book/widgets/bottom_navigation_bar.dart';
import 'package:Projects/song_book/widgets/bottom_sheet_filter.dart';
import 'package:Projects/song_book/widgets/song_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MyBottomNavigationBar(),
        drawer: Drawer(
          child: MyDrawer(),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              primary: true,
              title: Text(
                S.of(context).app_bar_title,
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
                  tooltip: S.of(context).Icon_button_actions_app_bar_filter,
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
                background: Container(
                  padding: EdgeInsets.only(
                    top: 80,
                    left: 60,
                    right: 60,
                    bottom: 5,
                  ),
                  child: TextFormField(
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
                      hintText: S.of(context).hint_search_field_in_app_bar,
                    ),
                  ),
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 75,
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    child: SongCard(),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
