import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/bloc/font_size_bloc/font_size_bloc.dart';
import 'package:icoc/core/model/q&a_model.dart';
import 'package:icoc/presentation/widget/font_size_adjust_bottom_sheet.dart';
import 'package:icoc/presentation/widget/scale_text.dart';

class OneQandAScreen extends StatelessWidget {
  OneQandAScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fontSozeAdjust =
        FontSizeAdjustBottomSheet(context: context, color: ScreenColors.QandA);
    final article = ModalRoute.of(context)!.settings.arguments as QandAModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'drawer_q_and_a'.tr(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.text_fields_outlined,
              ),
              onPressed: () => fontSozeAdjust.bottomSheet()),
        ],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              BlocBuilder<FontSizeBloc, FontSizeState>(
                builder: (context, state) {
                  if (state is FontSizeSuccess) {
                    return ScaleText(
                      fontSize: state.fontSize ?? 14,
                      child: SelectionArea(
                        child: Text(
                          article.text,
                          style: TextStyle(fontSize: state.fontSize),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          )),
    );
  }
}
