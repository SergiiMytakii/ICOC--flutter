import 'package:flutter_html/flutter_html.dart' as html;

import '/index.dart';

class SongTextOnSongScreen extends StatelessWidget {
  SongTextOnSongScreen(
      {required this.title,
      required this.textVersion,
      required this.description,
      this.resources,
      this.controller});

  final String textVersion;
  final String description;
  final String title;
  final Map? resources;
  final SongScreenController? controller;
  final log = Logger();

  @override
  Widget build(BuildContext context) {
    SlidesController slidesController = Get.find();
    if (textVersion.startsWith('<')) {
      var document = parse(textVersion, generateSpans: true);
      slidesController.slideText.value = document.body!.text;
      //log.v(document.body!.text);
    } else
      slidesController.slideText.value = textVersion;
    slidesController.slideTitle.value = title;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Obx(() {
        double _fontSize = controller!.fontSize.value;
        return Column(
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
            textVersion.startsWith('<')
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
          ],
        );
      }),
    );
  }
}
