import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:icoc/news/paging.dart';

import 'news_item_widget.dart';

class NewsListScreen extends StatefulWidget {
  @override
  _NewsListScreenState createState() => new _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: RefreshIndicator(
          child: LoadMore(
            isFinish: count >= 60,
            onLoadMore: _loadMore,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return NewsItemWidget();
              },
              itemCount: count,
            ),
            whenEmptyLoad: false,
            delegate: DefaultLoadMoreDelegate(),
            textBuilder: DefaultLoadMoreTextBuilder.chinese,
          ),
          onRefresh: _refresh,
        ),
      ),
    );
  }

  int get count => list.length;

  List<int> list = [];

  void initState() {
    super.initState();
    list.addAll(List.generate(30, (v) => v));
  }

  void load() {
    print("load");
    setState(() {
      list.addAll(List.generate(5, (v) => v));
      print("data count = ${list.length}");
    });
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    load();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    list.clear();
    load();
  }
}
