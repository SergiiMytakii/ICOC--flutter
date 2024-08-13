import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/model/q&a/q&a_model.dart';
import 'package:icoc/presentation/bloc/font_size_bloc/font_size_bloc.dart';
import 'package:icoc/presentation/widget/font_size_adjust_bottom_sheet.dart';
import 'package:icoc/presentation/widget/scale_text.dart';

class OneQandAScreen extends StatelessWidget {
  final QandAModel article;
  OneQandAScreen({
    super.key,
    required this.article,
  });

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
          child: Column(
            children: [
              BlocBuilder<FontSizeBloc, FontSizeState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (fontSize) => ScaleText(
                      fontSize: fontSize ?? 14,
                      child: SelectionArea(
                        child: Text(
                          article.text,
                          style: TextStyle(fontSize: fontSize),
                        ),
                      ),
                    ),
                    orElse: () => Container(),
                  );
                },
              )
            ],
          )),
    );
  }
}
