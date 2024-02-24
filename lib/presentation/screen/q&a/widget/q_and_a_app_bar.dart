import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QandAAppbar extends StatelessWidget {
  QandAAppbar({
    required this.title,
    required this.callback,
  });
  final String title;
  final Function callback;
  @override
  Widget build(
    BuildContext context,
  ) {
    return SliverAppBar(
      primary: true,
      title: Text(title),
      centerTitle: true,
      automaticallyImplyLeading: true,
      pinned: true,
      expandedHeight: 95.0,
      backgroundColor: MaterialStateColor.resolveWith((states) =>
          AdaptiveTheme.of(context).theme.appBarTheme.backgroundColor!),
      floating: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 45,
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 8,
            ),
            child: CupertinoSearchTextField(
              onChanged: (val) {
                callback(val);
              },
              style: AdaptiveTheme.of(context).theme.textTheme.bodySmall,
              backgroundColor: AdaptiveTheme.of(context).theme.focusColor,
            ),
          ),
        ),
      ),
    );
  }
}
