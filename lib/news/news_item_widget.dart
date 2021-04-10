import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsItemWidget extends StatelessWidget {
  String title = "Зачем Бог создал ад и почему отправляет людей в ад?";
  String category = "Библейская археология";
  String imageUrl = "https://icocnews.ru/wp-content/uploads/2021/03/zachem-bog-sozdal-ad.jpg";
  String snippet =
      "Если Бог является любящим, то зачем Бог создал ад? Если Бог такой любящий согласно Библии, то почему он отправляет людей в ад просто из-за того, что люди не верят в Него? Многие люди ведь совершают большое количество добрых поступков, несмотря на то, что не верят в Бога.";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
      ),
      Row(children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 4.0),
          child: Text(
            category,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black38,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ]),
      Image.network(imageUrl, height: 160),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(snippet),
        ),
      )
    ]);
  }
}
