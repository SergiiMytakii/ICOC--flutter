import 'package:Projects/news/news_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          NewsItemWidget(),
        ],
      ),
    );
  }
}
