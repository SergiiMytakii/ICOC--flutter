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
              title: Text(
                "Песенник",
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
                    color: Colors.white,
                  ),
                  tooltip: 'Фильтр по языкам',
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
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        hintText: 'Поиск песни '),
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
