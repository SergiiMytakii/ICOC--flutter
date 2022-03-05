import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:icoc/app/screens/notifications_screen.dart';
import 'package:path_provider/path_provider.dart';
import '../../index.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.put(MainScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('ICOC'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Platform.isIOS
                  ? Icon(CupertinoIcons.ellipsis)
                  : Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
        actions: [
          _buildNotificationsIcon(),
          SizedBox(
            width: 15,
          )
        ],
        elevation: 0,
      ),
      drawer: Drawer(
        child: MyDrawer(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              VerseOfTheDay(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.5),
                child: Table(
                  //defaultColumnWidth: FixedColumnWidth(sizeOfCell),
                  children: [
                    TableRow(
                      children: [
                        tableItem(
                            context,
                            'drawer_song_book'.tr,
                            screensColors['songBook']!,
                            Icons.music_note,
                            Routes.SONGBOOK),
                        tableItem(
                            context,
                            'drawer_news'.tr,
                            screensColors['news']!,
                            Icons.language,
                            Routes.NEWS),
                      ],
                    ),
                    TableRow(
                      children: [
                        tableItem(
                            context,
                            'drawer_first_principles'.tr,
                            screensColors['firstPrinciples']!,
                            Icons.import_contacts,
                            Routes.FIRST_PRINCIPLES),
                        tableItem(
                            context,
                            'drawer_q_and_a'.tr,
                            screensColors['Q&A']!,
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
      ),
    );
  }

  Obx _buildNotificationsIcon() {
    return Obx(() => Stack(children: [
          IconButton(
            icon: Icon(Icons.notifications_none_outlined),
            onPressed: () => Get.to(() => NotificationsScreen()),
          ),
          controller.amountNotifications > 0
              ? Positioned(
                  left: 10,
                  top: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 8,
                    child: FittedBox(
                        child: Text(controller.amountNotifications.toString())),
                  ))
              : Container()
        ]));
  }

  tableItem(BuildContext context, String title, Color color, IconData icon,
      String routeName) {
    double sizeOfCell = (MediaQuery.of(context).size.width - 15) / 2;
    return Container(
      height: sizeOfCell,
      width: sizeOfCell,
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () => Get.toNamed(routeName),
        splashColor: Theme.of(context).colorScheme.secondary,
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
}

class VerseOfTheDay extends StatelessWidget {
  final MainScreenController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.url.isNotEmpty
          ? Container(
              height: Get.size.height / 2.5,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 0,
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () => showBigPicture(context),
                      child: Hero(
                        tag: 'verse',
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Image.network(
                            controller.url.value,
                            height: Get.size.height / 2.5,
                            width: Get.size.width - 24,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        child: Container(
                          color: Colors.black12.withOpacity(0.3),
                          width: Get.size.width - 48,
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Verse of the day'.tr,
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () {
                                  shareImage(controller.url.value);
                                },
                                child: Icon(Icons.share_outlined,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              height: Get.size.height / 2.5,
              child: Center(child: CircularProgressIndicator.adaptive()),
            ),
    );
  }

  showBigPicture(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              elevation: 10,
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              content: GestureDetector(
                onTap: () => Get.back(),
                child: Hero(
                  tag: 'verse',
                  child: Image.network(
                    controller.url.value,
                  ),
                ),
              ),
            ));
  }

  void shareImage(String url) async {
    final response = await get(Uri.parse(url));
    final Directory temp = await getTemporaryDirectory();
    final File imageFile = File('${temp.path}/tempImage');
    imageFile.writeAsBytesSync(response.bodyBytes);
    Share.shareFiles(
      ['${temp.path}/tempImage'],
    );
  }
}
