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
    if (textVersion.startsWith('<')) {
      var document = parse(textVersion, generateSpans: true);
      //log.v(document.body!.text);
    }

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
                  .headline5!
                  .copyWith(fontSize: _fontSize + 4),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.symmetric(vertical: 7),
              child: Text(
                description,
                style: Theme.of(context).textTheme.headline6!,
              ),
            ),
            // resources != null
            //     ? Container(
            //         alignment: Alignment.topRight,
            //         margin: EdgeInsets.symmetric(vertical: 7),
            //         child: Text(
            //           resources!['en1'],
            //           style: Theme.of(context).textTheme.headline6!,
            //         ),
            //       )
            //     : Container(),
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
                          .bodyText2!
                          .copyWith(fontSize: _fontSize),
                    ),
            )
          ],
        ));
  }
}
