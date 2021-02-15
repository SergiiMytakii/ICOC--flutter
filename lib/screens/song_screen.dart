import 'package:Projects/models/song.dart';
import 'package:flutter/material.dart';

class SongScreen extends StatelessWidget {
  final Song song;

  SongScreen(this.song);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Then we should make AppBar Theme field

        title: Text(
          //Then we should find out with language
          song.title['rus'],
          style: TextStyle(fontSize: 28),
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
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                song.description,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 20),
              Text(
                song.text['rus'],
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
