

import 'package:Projects/services/import_songs.dart';
import 'package:flutter/material.dart';

import '../menu/my_drawer.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {





  @override
  Widget build(BuildContext context) {
    ImportSongs().loadSongsFromJson();
    return Scaffold(
      appBar: AppBar(
        title: Text('ICOC'),

      ),
      drawer: Drawer(
        child:  MyDrawer(),),

      body: Center( child:
      Text('Main Screen', style: Theme.of(context).textTheme.headline3,),
      ),
    );
  }
}