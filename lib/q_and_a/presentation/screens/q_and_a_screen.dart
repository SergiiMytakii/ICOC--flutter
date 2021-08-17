import 'dart:io';

import 'package:icoc/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class QuestionsAndAnwers extends StatelessWidget {
  const QuestionsAndAnwers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageBody = SafeArea(
      child: Center(child: Text('There is nothing here yet...')),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: CupertinoNavigationBar(
              middle: Text(
                'drawer_q_and_a'.tr,
              ),
              backgroundColor: Constants.screensColors['Q&A'],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'drawer_q_and_a'.tr,
              ),
              backgroundColor: Constants.screensColors['Q&A'],
              centerTitle: true,
            ),
            body: pageBody);
  }
}
