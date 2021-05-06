import 'package:flutter/material.dart';

import '../menu/my_drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    //ImportSongs().loadSongsFromJson();  - if needed to insert songs to database from json file
    return Scaffold(
      appBar: AppBar(
        title: Text('ICOC'),
      ),
      drawer: Drawer(
        child: MyDrawer(),
      ),
      body: ListView(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.asset('assets/images/verse_of_day.jpeg'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(Icons.favorite),
                      SizedBox(
                        width: 6,
                      ),
                      Text('Отрывок дня'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
