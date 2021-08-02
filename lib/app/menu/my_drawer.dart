import 'package:Projects/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getxfire/getxfire.dart';

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
                'drawer_menu'.tr,
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
            Icons.settings,
          ),
          title: Text(
            'drawer_settings'.tr,
            style: Theme.of(context).textTheme.headline6,
          ),
          onTap: () => Get.offAndToNamed(
            Routes.SETTINGS,
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.info,
          ),
          title: Text(
            'drawer_about_app'.tr,
            style: Theme.of(context).textTheme.headline6,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.share,
          ),
          title: Text(
            'drawer_share_app'.tr,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text('drawer_in_development'.tr),
        ),
      ],
    );
  }
}