import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/model/q&a/q&a_model.dart';
import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart';
import 'package:icoc/presentation/widget/font_size_adjust_bottom_sheet.dart';
import 'package:icoc/presentation/widget/scale_text.dart';
import 'package:url_launcher/url_launcher.dart';

class OneQandAScreen extends StatelessWidget {
  final QandAModel article;
  OneQandAScreen({
    super.key,
    required this.article,
  });
  static const fontStyle =
      TextStyle(color: ScreenColors.QandA, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    final fontSozeAdjust =
        FontSizeAdjustBottomSheet(context: context, color: ScreenColors.QandA);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'drawer_q_and_a'.tr(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.text_fields_outlined,
              ),
              onPressed: () => fontSozeAdjust.bottomSheet()),
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<FontSizeBloc, FontSizeState>(
            builder: (context, state) {
              return state.maybeWhen(
                success: (fontSize) => ScaleText(
                  fontSize: fontSize ?? 14,
                  child: SelectionArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Question:'.tr(),
                          style: fontStyle.copyWith(fontSize: fontSize),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          article.question,
                          style: TextStyle(fontSize: fontSize),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Answer:'.tr(),
                          style: fontStyle.copyWith(fontSize: fontSize),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          article.answer,
                          style: TextStyle(fontSize: fontSize),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (article.date != null)
                          Text(
                            '${'Date:'.tr()} ${article.date}',
                            style: fontStyle.copyWith(fontSize: fontSize),
                          ),
                        if (article.author != null)
                          Text(
                            '${'Author:'.tr()} ${article.author}',
                            style: fontStyle.copyWith(fontSize: fontSize),
                          ),
                        if (article.translatedBy != null)
                          Text(
                            '${'Translated by:'.tr()} ${article.translatedBy}',
                            style: fontStyle.copyWith(fontSize: fontSize),
                          ),
                        if (article.source != null)
                          GestureDetector(
                            onTap: () async {
                              final urlString = article.source!.toLowerCase();
                              final url = urlString.startsWith('http')
                                  ? Uri.parse(urlString)
                                  : Uri.parse('https://$urlString');

                              if (await canLaunchUrl(url)) {
                                launchUrl(url);
                              }
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 16,
                              child: Row(
                                children: [
                                  Text(
                                    'Source:'.tr(),
                                    style:
                                        fontStyle.copyWith(fontSize: fontSize),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${article.source}',
                                      style: fontStyle.copyWith(
                                        decoration: TextDecoration.underline,
                                        fontSize: fontSize,
                                        color: Colors.blue,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                orElse: () => Container(),
              );
            },
          )),
    );
  }
}
