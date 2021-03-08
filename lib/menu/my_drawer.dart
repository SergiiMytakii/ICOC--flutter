import 'package:Projects/generated/l10n.dart';
import 'package:Projects/services/database.dart';
import 'package:Projects/settings/general_settings.dart';
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
          child: Column(
            children: [
              Text(
                S.of(context)!.drawer_menu,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 30,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.language,
            size: 36,
          ),
          title: Text(
            S.of(context)!.drawer_news,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(S.of(context)!.drawer_in_development),
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
            S.of(context)!.drawer_bible,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(S.of(context)!.drawer_in_development),
        ),
        ListTile(
          leading: Icon(
            Icons.import_contacts,
            size: 36,
          ),
          title: Text(
            S.of(context)!.drawer_first_principles,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(S.of(context)!.drawer_in_development),
        ),
        ListTile(
          leading: Icon(
            Icons.question_answer,
            size: 36,
          ),
          title: Text(
            S.of(context)!.drawer_q_and_a,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(S.of(context)!.drawer_in_development),
        ),
        SizedBox(
          height: 100,
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            S.of(context)!.drawer_settings,
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GeneralSettings();
            }));
          },
        ),
      ],
    );
  }
}
