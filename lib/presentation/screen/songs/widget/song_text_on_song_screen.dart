import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:logger/logger.dart';

import '../../../../core/bloc/font_size_bloc/font_size_bloc.dart';

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
    return BlocBuilder<FontSizeBloc, FontSizeState>(
      builder: (context, state) {
        if (state is FontSizeSuccess) {
          return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: SelectionArea(
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: (state.fontSize ?? 14) + 10),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        description,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontSize: (state.fontSize ?? 14),
                                fontStyle: FontStyle.italic),
                      ),
                    ),
                    SizedBox(height: 10),
                    textVersion.startsWith('<')
                        ? html.Html(
                            data: textVersion,
                            style: {
                              "body": html.Style(
                                  fontSize:
                                      html.FontSize(state.fontSize ?? 14)),
                            },
                          )
                        : Text(
                            textVersion,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: state.fontSize ?? 14),
                          )
                  ],
                ),
              ));
        } else {
          return Container();
        }
      },
    );
  }
}
