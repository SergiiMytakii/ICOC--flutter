import 'package:flutter/cupertino.dart';

class Song {
  final int id;
  final String description;
  final Map<String, String> title;
  final Map<String, String> text;
  final List resources;
  final String createdAt;
  final Map<String, String> chords;

  Song(
      {@required this.id,
      @required this.title,
      this.description,
      @required this.text,
      this.chords,
      this.resources,
      this.createdAt});
}
