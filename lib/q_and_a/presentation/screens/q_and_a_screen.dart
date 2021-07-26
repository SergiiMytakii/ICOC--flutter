import 'package:Projects/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class QuestionsAndAnwers extends StatelessWidget {
  const QuestionsAndAnwers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'drawer_q_and_a'.tr,
        ),
        backgroundColor: Constants.screensColors['Q&A']!.withOpacity(0.8),
        centerTitle: true,
      ),
      body: Center(
        child: Text('There is nothing here yet...'),
      ),
    );
  }
}
