import 'package:Projects/routes/routes.dart';
import 'package:Projects/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getxfire/getxfire.dart';
import '../menu/my_drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  tableItem(String title, Color color, IconData icon, double sizeOfCell,
      String routeName) {
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

  double sizeOfCell(BuildContext ctx) =>
      (MediaQuery.of(ctx).size.width - 15) / 2;
  @override
  Widget build(BuildContext context) {
    print(sizeOfCell(context));
    //ImportSongs().loadSongsFromJson();  - if needed to insert songs to database from json file
    return Scaffold(
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
                    width: MediaQuery.of(context).size.width - 30,
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
                defaultColumnWidth: FixedColumnWidth(sizeOfCell(context)),
                children: [
                  TableRow(
                    children: [
                      tableItem(
                          'drawer_song_book'.tr,
                          Constants.screensColors['songBook']!,
                          Icons.music_note,
                          sizeOfCell(context),
                          Routes.SONGBOOK),
                      tableItem(
                          'drawer_news'.tr,
                          Constants.screensColors['news']!,
                          Icons.language,
                          sizeOfCell(context),
                          Routes.NEWS),
                    ],
                  ),
                  TableRow(
                    children: [
                      tableItem(
                          'drawer_first_principles'.tr,
                          Constants.screensColors['firstPrinciples']!,
                          Icons.import_contacts,
                          sizeOfCell(context),
                          Routes.FIRSTPRINCIPLES),
                      tableItem(
                          'drawer_q_and_a'.tr,
                          Constants.screensColors['Q&A']!,
                          Icons.question_answer,
                          sizeOfCell(context),
                          Routes.QANDANVERS),
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
