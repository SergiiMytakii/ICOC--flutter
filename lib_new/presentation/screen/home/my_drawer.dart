import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class AnimatedDrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;
  final Animation<Offset> animation;

  AnimatedDrawerItem(
      {required this.icon,
      required this.title,
      required this.route,
      required this.animation});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.white),
        ),
        onTap: () => Navigator.pushNamed(
          context,
          route,
        ),
      ),
    );
  }
}

class MyDrawer extends StatefulWidget {
  MyDrawer(this.animationController);
  final AnimationController animationController;
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late Animation<Offset> animation;
  final double itemSlideDuration = 0.2; //
  late List<Animation<Offset>> itemAnimations;

  static const double itemDelayFactor = 0.2;
  @override
  void initState() {
    itemAnimations = List.generate(
      4,
      (index) => Tween<Offset>(
        begin: Offset(-1.0, 0.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: widget.animationController,
          curve: Interval(
            index * itemDelayFactor, // Delay each item by a factor of its index
            (index + 1) * itemDelayFactor, // Ensures they don't overlap
            curve: Curves.easeInOut,
          ),
        ),
      ),
    );

    widget.animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> drawerItems = [
      {
        'icon': Icons.info,
        'title': 'Terms of Use'.tr(context: context),
        'route': Routes.TERMS_OF_USE,
      },
      {
        'icon': Icons.share,
        'title': 'drawer_share_app'.tr(context: context),
        'route': Routes.SHARE_APP_SCREEN,
      },
      {
        'icon': Icons.info,
        'title': 'drawer_about_app'.tr(context: context),
        'route': Routes.ABOUT_APP_SCREEN,
      },
      {
        'icon': Icons.settings,
        'title': 'drawer_settings'.tr(context: context),
        'route': Routes.SETTINGS,
      },
    ];

    return SizedBox(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: drawerItems.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimatedDrawerItem(
                icon: drawerItems[index]['icon'] as IconData,
                title: drawerItems[index]['title'].toString(),
                route: drawerItems[index]['route'].toString(),
                animation: itemAnimations[index]);
          },
        ),
      ),
    );
  }
}
