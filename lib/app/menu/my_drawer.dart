import '../../index.dart';

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
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/logo_icoc_drawer.png')),
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
          onTap: () => Get.offAndToNamed(Routes.ABOUT_APP_SCREEN),
        ),
        ListTile(
          leading: Icon(
            Icons.share,
          ),
          title: Text(
            'drawer_share_app'.tr,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6,
          ),
          onTap: () => Get.offAndToNamed(Routes.SHARE_APP_SCREEN),
        ),
        ListTile(
          leading: Icon(
            Icons.info,
          ),
          title: Text(
            'Terms of Use'.tr,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6,
          ),
          onTap: () => Get.offAndToNamed(Routes.TERMS_OF_USE),
        ),
      ],
    );
  }
}
