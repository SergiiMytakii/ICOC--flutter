import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Меню',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.language,
            size: 36,
          ),
          title: Text(
            'Новости',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('В разработке'),
        ),
        ListTile(
          leading: Icon(
            Icons.book,
            size: 36,
          ),
          title: Text(
            'Библия',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('В разработке'),
        ),
        ListTile(
          leading: Icon(
            Icons.import_contacts,
            size: 36,
          ),
          title: Text(
            'Первые принципы',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('В разработке'),
        ),
        ListTile(
          leading: Icon(
            Icons.question_answer,
            size: 36,
          ),
          title: Text(
            'Вопросы и ответы',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('В разработке'),
        ),
        SizedBox(
          height: 100,
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            'Настройки',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
