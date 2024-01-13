import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';
import '../widget/menu_item_card.dart';
import 'home/notifications_screen.dart';
import 'routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final CarouselController carouselController;
  late MenuItem currentItem;
  double _angle = 0;

  final List<MenuItem> items = [
    MenuItem('drawer_song_book'.tr(), screensColors['songBook']!,
        Icons.music_note, Routes.SONGBOOK),
    MenuItem('drawer_first_principles'.tr(), screensColors['firstPrinciples']!,
        Icons.import_contacts, Routes.FIRST_PRINCIPLES),
    MenuItem('drawer_q_and_a'.tr(), screensColors['Q&A']!,
        Icons.question_answer, Routes.Q_AND_ANSVERS),
    MenuItem(
      'Q&A with Andy Fleming'.tr(), screensColors['news']!,
      Icons.question_answer, Routes.PLAYLISTS_PLAYER,
      // arguments: [
      //   Q_AND_A_ANDY_FLEMING_PLAYLIST_ID,
      //   'Q&A with Andy Fleming'.tr,
      //   screensColors['news']!
      // ]
    ),
    MenuItem(
      'Bible school'.tr(), screensColors['general']!,
      Icons.video_collection, Routes.PLAYLISTS_PLAYER,
      // arguments: [
      //   BIBLE_SCHOOL_PLAYLIST_ID,
      //   'Bible school'.tr,
      //   screensColors['general']!,
      // ]
    ),
    MenuItem('drawer_news'.tr(), screensColors['news']!, Icons.language,
        Routes.MAIN_NEWS),
  ];

  @override
  void initState() {
    carouselController = CarouselController();
    currentItem = items[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Image.asset(
          'assets/images/sky.jpeg',
          height: screenSize.height,
          fit: BoxFit.fitHeight,
        ),
        Positioned(
          left: screenSize.height * 0.06,
          top: screenSize.height * 0.1,
          child: Transform.rotate(
            angle: _angle,
            child: Container(
              width: screenSize.height * 0.8,
              height: screenSize.height * 0.8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white, // Adjust the color for the shining effect
                    Colors.transparent,
                  ],
                  stops: [0.85, 1],
                  center: Alignment(0, 0), // Adjust the position of the shine
                  focal: Alignment(0, 0),
                  focalRadius: 0.15,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Image.asset(
                  'assets/images/globe1.png',
                  width: screenSize.height * 0.70,
                  height: screenSize.height * 0.70,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: screenSize.height * 0.08,
          width: screenSize.width,
          top: screenSize.height * 0.18,
          child: GestureDetector(
            onTap: () => navigateToScreen(context),
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: screenSize.height * 0.65,
                enlargeFactor: 0.55,
                autoPlay: true,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 6),
                viewportFraction: 0.3,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 1200),
                scrollDirection: Axis.vertical,
                onPageChanged: (index, reason) {
                  currentItem = items[index];
                  HapticFeedback.heavyImpact();
                  Feedback.forLongPress(context);
                },
                onScrolled: (scrollPosition) {
                  setState(() {
                    _angle = scrollPosition! - 10000;
                  });
                },
              ),
              items: items.map((item) => MenuItemCard(item)).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationsIcon(BuildContext context) {
    final int amountNotifications = 1;
    return Stack(children: [
      IconButton(
        icon: Icon(Icons.notifications_none_outlined),
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NotificationsScreen())),
      ),
      amountNotifications > 0
          ? Positioned(
              left: 10,
              top: 10,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 8,
                child: FittedBox(child: Text(amountNotifications.toString())),
              ))
          : Container()
    ]);
  }

  navigateToScreen(BuildContext context) {
    Navigator.pushNamed(context, currentItem.routeName);
  }
}

class VerseOfTheDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Some Verse From Bible');
  }
}

class MenuItem {
  final String title;
  final Color color;
  final IconData icon;
  final String routeName;
  MenuItem(
    this.title,
    this.color,
    this.icon,
    this.routeName,
  );
}
