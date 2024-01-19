import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icoc/presentation/screen/routes/app_routes.dart';

import '../../widget/menu_item_card.dart';
import 'my_drawer.dart';
import 'widget/menu_items.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final CarouselController carouselController;
  late AnimationController animationController;
  MenuItem currentItem = HomeScreenMenuItems.items(null).first;
  double _angle = 0;

  bool isDrawerOpen = false;

  void toggleDrawer() async {
    if (isDrawerOpen) {
      await animationController.reverse();
    }
    setState(() {
      isDrawerOpen = !isDrawerOpen;
    });
  }

  void hideDrawer() async {
    if (isDrawerOpen) {
      await animationController.reverse();
    }
    setState(() {
      isDrawerOpen = false;
    });
  }

  List<MenuItem> items = [];
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      setState(() {
        items = HomeScreenMenuItems.items(context);
      });
    });

    carouselController = CarouselController();

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        GestureDetector(
          onTap: hideDrawer,
          child: Image.asset(
            'assets/images/sky.jpeg',
            height: screenSize.height,
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned(
          top: 70,
          left: 16,
          child: Builder(builder: (BuildContext scaffoldContext) {
            return GestureDetector(
                child: isDrawerOpen
                    ? Icon(
                        Icons.close,
                        color: Colors.white,
                      )
                    : Text(
                        'Menu'.tr(context: context),
                        style: TextStyle(color: Colors.white),
                      ),
                onTap: () => toggleDrawer());
          }),
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
                  setState(() {
                    currentItem = items[index];
                  });
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
        if (isDrawerOpen) Positioned(child: MyDrawer(animationController)),
        Positioned(
            bottom: 16, left: 16, child: _buildNotificationsIcon(context))
      ],
    );
  }

  Widget _buildNotificationsIcon(BuildContext context) {
    final int amountNotifications = 1;
    return Stack(children: [
      IconButton(
        icon: Icon(
          Icons.notifications_none_outlined,
          color: Colors.white,
          size: 26,
        ),
        onPressed: () =>
            Navigator.of(context).pushNamed(Routes.NOTIFICATIONS_SCREEN),
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
    Navigator.pushNamed(context, currentItem?.routeName ?? '');
  }
}

class VerseOfTheDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Some Verse From Bible');
  }
}
