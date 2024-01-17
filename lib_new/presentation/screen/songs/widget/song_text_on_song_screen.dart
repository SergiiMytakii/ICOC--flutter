import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:html/parser.dart';
import 'package:logger/logger.dart';

class SongTextOnSongScreen extends StatelessWidget {
  SongTextOnSongScreen({
    required this.title,
    required this.textVersion,
    required this.description,
    this.resources,
  });

  final String textVersion;
  final String description;
  final String title;
  final Map? resources;
  // final SongScreenController? controller;
  final log = Logger();

  @override
  Widget build(BuildContext context) {
    double _fontSize = 14; //todo add bloc
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: _fontSize + 10),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.symmetric(vertical: 7),
              child: Text(
                description,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: _fontSize + 6),
              ),
            ),
            SizedBox(height: 10),
            SelectionArea(
              child: textVersion.startsWith('<')
                  ? html.Html(
                      data: textVersion,
                      style: {
                        "body": html.Style(fontSize: html.FontSize(_fontSize)),
                      },
                    )
                  : Text(
                      textVersion,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: _fontSize),
                    ),
            )
          ],
        ));
  }
}
