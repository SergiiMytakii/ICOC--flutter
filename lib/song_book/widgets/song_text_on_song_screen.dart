import 'package:flutter/cupertino.dart';

class SongTextOnSongScreen extends StatelessWidget {
  const SongTextOnSongScreen({this.title, this.textVersion, this.description});

  final String? textVersion;
  final String? description;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            title ?? 'here should be a title',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.symmetric(vertical: 7),
            child: Text(
              description ?? 'here should be description',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            textVersion ?? 'here should be a text of song',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
