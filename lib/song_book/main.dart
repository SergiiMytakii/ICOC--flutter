import 'package:Projects/song_book/screens/song_book.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICOC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SongBook(),
    );
  }
}
