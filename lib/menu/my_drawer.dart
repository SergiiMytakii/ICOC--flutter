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
          leading: Icon(Icons.settings),
          title: Text(
            'drawer_settings'.tr().toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GeneralSettings();
            }));
          },
        ),
        ListTile(
          leading: Icon(
            Icons.info,
          ),
          title: Text(
            'drawer_about_app'.tr(),
            style: Theme.of(context).textTheme.headline6,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.share,
          ),
          title: Text(
            'drawer_share_app'.tr(),
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text('drawer_in_development'.tr()),
        ),
      ],
    );
  }
}
