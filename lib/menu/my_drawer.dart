
import 'package:Projects/settings/general_settings.dart';
import 'package:Projects/song_book/widgets/bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
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
                'drawer_menu'.tr().toString(),
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
            Icons.music_note,/**/
            size: 36,
          ),
          title: Text(
            'drawer_song_book'.tr().toString(),
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {

            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyBottomNavigationBar();
            }));
          },

        ),
        ListTile(
          leading: Icon(
            Icons.language,
            size: 36,
          ),
          title: Text(
            'drawer_news'.tr().toString(),
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('drawer_in_development'.tr().toString()),

        ),

        ListTile(
          leading: Icon(
            Icons.import_contacts,
            size: 36,
          ),
          title: Text(
            'drawer_first_principles'.tr().toString(),
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('drawer_in_development'.tr().toString()),
        ),
        ListTile(
          leading: Icon(
            Icons.question_answer,
            size: 36,
          ),
          title: Text(
            'drawer_q_and_a'.tr().toString(),
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('drawer_in_development'.tr().toString()),
        ),
        SizedBox(
          height: 100,
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            'drawer_settings'.tr().toString(),
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