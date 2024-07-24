import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:icoc/presentation/widget/scale_text.dart';
import 'package:logger/logger.dart';

import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart';

class SongTextOnSongScreen extends StatelessWidget {
  SongTextOnSongScreen({
    super.key,
    required this.title,
    required this.textVersion,
    required this.description,
  });

  final String textVersion;
  final String description;
  final String title;

  final log = Logger();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontSizeBloc, FontSizeState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (fontSize) => ScaleText(
            fontSize: fontSize ?? 14,
            child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: SelectionArea(
                  child: Column(
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontSize: (fontSize ?? 14) + 5,
                                fontWeight: FontWeight.bold),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          description,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: (fontSize ?? 14),
                                  fontStyle: FontStyle.italic),
                        ),
                      ),
                      const SizedBox(height: 10),
                      textVersion.startsWith('<')
                          ? html.Html(
                              data: textVersion,
                              style: {
                                'body': html.Style(
                                    alignment: Alignment.center,
                                    fontSize: html.FontSize(fontSize ?? 14)),
                              },
                            )
                          : Text(
                              textVersion,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: fontSize ?? 14),
                            ),
                      const SizedBox(
                        height: 300,
                      )
                    ],
                  ),
                )),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
