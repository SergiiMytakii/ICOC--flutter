import 'dart:io';

import 'package:icoc/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

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
                'drawer_news'.tr,
              ),
              backgroundColor: Constants.screensColors['news'],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'drawer_news'.tr,
              ),
              backgroundColor: Constants.screensColors['news'],
              centerTitle: true,
            ),
            body: pageBody);
  }
}
