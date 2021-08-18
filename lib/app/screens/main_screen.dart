import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:icoc/app/core/controllers/main_screen_controller.dart';
import 'package:icoc/routes/routes.dart';
import 'package:icoc/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getxfire/getxfire.dart';
import '../menu/my_drawer.dart';

class MainScreen extends GetView<MainScreenController> {
  final size = Get.size;
  double get sizeOfCell => (size.width - 15) / 2;

  _buildTableItem(BuildContext context, String title, Color color,
      IconData icon, String routeName) {
    final item = Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 36,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.6),
            color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    return Container(
      height: sizeOfCell,
      width: sizeOfCell,
      padding: const EdgeInsets.all(7.5),
      child: Platform.isIOS
          ? GestureDetector(
              onTap: () => Get.toNamed(routeName),
              child: item,
            )
          : InkWell(
              onTap: () => Get.toNamed(routeName),
              splashColor: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(15),
              child: item,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenController());
    //ImportSongs().loadSongsFromJson();  - if needed to insert songs to database from json file
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 0,
              margin: EdgeInsets.all(15),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    child: Image.asset('assets/images/verse_of_day.jpeg'),
                  ),
                  PositionedDirectional(
                    bottom: 0,
                    width: size.width - 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Container(
                        color: Colors.black12.withOpacity(0.3),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Отрывок дня',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).accentIconTheme.color),
                            ),
                            Icon(Icons.share_outlined,
                                color: Theme.of(context).accentIconTheme.color),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.5),
              child: Table(
                defaultColumnWidth: FixedColumnWidth(sizeOfCell),
                children: [
                  TableRow(
                    children: [
                      _buildTableItem(
                          context,
                          'drawer_song_book'.tr,
                          Constants.screensColors['songBook']!,
                          Icons.music_note,
                          Routes.SONGBOOK),
                      _buildTableItem(
                          context,
                          'drawer_news'.tr,
                          Constants.screensColors['news']!,
                          Icons.language,
                          Routes.NEWS),
                    ],
                  ),
                  TableRow(
                    children: [
                      _buildTableItem(
                          context,
                          'drawer_first_principles'.tr,
                          Constants.screensColors['firstPrinciples']!,
                          Icons.import_contacts,
                          Routes.FIRST_PRINCIPLES),
                      _buildTableItem(
                          context,
                          'drawer_q_and_a'.tr,
                          Constants.screensColors['Q&A']!,
                          Icons.question_answer,
                          Routes.Q_AND_ANSVERS),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody, //todo appBar
            navigationBar: CupertinoNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('ICOC'),
              actions: [
                Icon(Icons.notifications_none_outlined),
                SizedBox(
                  width: 15,
                )
              ],
              elevation: 6,
            ),
            drawer: Drawer(
              child: MyDrawer(),
            ),
            body: pageBody);
  }
}
