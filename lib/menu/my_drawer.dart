import 'package:Projects/generated/l10n.dart';
import 'package:Projects/servises/database.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Text(
            S.of(context).drawer_menu,
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
            S.of(context).drawer_news,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(S.of(context).drawer_in_development),
          onTap: () async {
            await DatabaseService().updateSongTest();
          },
        ),
        ListTile(
          leading: Icon(
            Icons.book,
            size: 36,
          ),
          title: Text(
            S.of(context).drawer_bible,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(S.of(context).drawer_in_development),
        ),
        ListTile(
          leading: Icon(
            Icons.import_contacts,
            size: 36,
          ),
          title: Text(
            S.of(context).drawer_first_principles,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(S.of(context).drawer_in_development),
        ),
        ListTile(
          leading: Icon(
            Icons.question_answer,
            size: 36,
          ),
          title: Text(
            S.of(context).drawer_q_and_a,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(S.of(context).drawer_in_development),
        ),
        SizedBox(
          height: 100,
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            S.of(context).drawer_settings,
            style: TextStyle(fontSize: 20),
          ),
        ),
        FlatButton(
          //move this button to the settings page later
          color: Theme.of(context).accentColor,
          child: Text('Поменять тему приложения (тест)'),
          onPressed: () => AdaptiveTheme.of(context).toggleThemeMode(),
        )
      ],
    );
  }
}
