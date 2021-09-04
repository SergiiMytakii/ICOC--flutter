import 'dart:io';
import 'package:flutter/cupertino.dart';
import '../../index.dart';

class MainScreen extends GetView<MainScreenController> {
  tableItem(BuildContext context, String title, Color color, IconData icon,
      double sizeOfCell, String routeName) {
    return Container(
      height: sizeOfCell,
      width: sizeOfCell,
      padding: const EdgeInsets.all(7.5),
      child: InkWell(
        onTap: () => Get.toNamed(routeName),
        splashColor: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
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
        ),
      ),
    );
  }

  final size = Get.size;
  double sizeOfCell() => (size.width - 15) / 2;
  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenController());
    //ImportSongs().loadSongsFromJson();  - if needed to insert songs to database from json file
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('ICOC'),
        leading: Builder(
          builder: (context) => IconButton(
              icon: Platform.isIOS
                  ? Icon(CupertinoIcons.ellipsis)
                  : Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
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
      body: SingleChildScrollView(
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
                defaultColumnWidth: FixedColumnWidth(sizeOfCell()),
                children: [
                  TableRow(
                    children: [
                      tableItem(
                          context,
                          'drawer_song_book'.tr,
                          Constants.screensColors['songBook']!,
                          Icons.music_note,
                          sizeOfCell(),
                          Routes.SONGBOOK),
                      tableItem(
                          context,
                          'drawer_news'.tr,
                          Constants.screensColors['news']!,
                          Icons.language,
                          sizeOfCell(),
                          Routes.NEWS),
                    ],
                  ),
                  TableRow(
                    children: [
                      tableItem(
                          context,
                          'drawer_first_principles'.tr,
                          Constants.screensColors['firstPrinciples']!,
                          Icons.import_contacts,
                          sizeOfCell(),
                          Routes.FIRST_PRINCIPLES),
                      tableItem(
                          context,
                          'drawer_q_and_a'.tr,
                          Constants.screensColors['Q&A']!,
                          Icons.question_answer,
                          sizeOfCell(),
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
  }
}
