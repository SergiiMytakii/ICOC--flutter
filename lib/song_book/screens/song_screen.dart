import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/widgets/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongScreen extends StatelessWidget {
  final Song song;

  SongScreen(this.song);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: MyBottomNavigationBar(0),
        appBar: AppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              //Then we should find out with language
              song.title['ru'],
              style: TextStyle(fontSize: 28),
            ),
            titlePadding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
          ),
          bottom: TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w300),
            labelPadding: EdgeInsets.symmetric(vertical: 3),
            tabs: [Text('V1'), Text('V2'), Text('V3')],
          ),
          titleTextStyle: TextStyle(fontSize: 18),
          centerTitle: true,
          elevation: 8,
          actions: [
            IconButton(
              icon: Icon(
                Icons.share,
                size: 25,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.play_circle_outline,
                size: 25,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.audiotrack,
                size: 25,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.symmetric(vertical: 7),
                child: Text(
                  song.description,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                song.text['ru'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
