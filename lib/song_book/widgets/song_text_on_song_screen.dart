import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongTextOnSongScreen extends StatelessWidget {
  const SongTextOnSongScreen({this.title, this.textVersion, this.description});

  final String? textVersion;
  final String? description;
  final String? title;

  @override
  Widget build(BuildContext context) {
    // print(title);
    // print(textVersion);
    // print(description);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            title ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.symmetric(vertical: 7),
            child: Text(description ?? '',
                style: Theme.of(context).textTheme.headline5),
          ),
          SizedBox(height: 10),
          Text(
            textVersion ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
