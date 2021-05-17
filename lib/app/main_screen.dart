import 'package:Projects/song_book/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../menu/my_drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  tableItem(String title, Color color, IconData icon, double sizeOfCell) {
    return Container(
      height: sizeOfCell,
      width: sizeOfCell,
      padding: const EdgeInsets.all(7.5),
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return MyBottomNavigationBar();
            }),
          ),
        },
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
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.asset('assets/images/verse_of_day.jpeg'),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: Container(
                      color: Colors.black12,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Row(
                        children: [
                          Icon(Icons.share_outlined,
                              color: Theme.of(context).accentIconTheme.color),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Отрывок дня',
                            style: TextStyle(
                                color: Theme.of(context).accentIconTheme.color),
                          ),
                        ],
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
                        'drawer_song_book'.tr(),
                        Colors.green,
                        Icons.music_note,
                        sizeOfCell(context),
                      ),
                      tableItem(
                        'drawer_news'.tr(),
                        Colors.blue,
                        Icons.language,
                        sizeOfCell(context),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      tableItem(
                        'drawer_first_principles'.tr(),
                        Colors.deepOrange,
                        Icons.import_contacts,
                        sizeOfCell(context),
                      ),
                      tableItem(
                        'drawer_q_and_a'.tr(),
                        Colors.deepPurple,
                        Icons.question_answer,
                        sizeOfCell(context),
                      ),
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
