import 'package:Projects/widgets/bottom_sheet_filter.dart';
import 'package:Projects/widgets/song_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Меню',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.language,
                size: 36,
              ),
              title: Text(
                'Новости',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('В разработке'),
            ),
            ListTile(
              leading: Icon(
                Icons.book,
                size: 36,
              ),
              title: Text(
                'Библия',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('В разработке'),
            ),
            ListTile(
              leading: Icon(
                Icons.import_contacts,
                size: 36,
              ),
              title: Text(
                'Первые принципы',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('В разработке'),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                size: 36,
              ),
              title: Text(
                'Вопросы и ответы',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('В разработке'),
            ),
            SizedBox(
              height: 100,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Настройки',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Песенник",
          style: TextStyle(fontSize: 28),
        ),
        titleTextStyle: TextStyle(fontSize: 18),
        centerTitle: true,
        elevation: 8,
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_alt_outlined,
              size: 30,
              color: Colors.white,
            ),
            onPressed: (() {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                          alignment: Alignment.topLeft,
                        ),
                        BottomSheetFilter()
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      body: ListView(
        children: [
          SongCard(),
          SongCard(),
          SongCard(),
          SongCard(),
          SongCard(),
          SongCard(),
          SongCard(),
          SongCard(),
          SongCard(),
          SongCard(),
        ],
      ),
    );
  }
}
