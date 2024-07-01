import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:icoc/core/helpers/in_app_review_helper.dart';
import 'package:icoc/core/model/notifications_model.dart';
import 'package:icoc/presentation/routes/app_routes.dart';

import 'package:icoc/presentation/widget/menu_item_card.dart';
import 'package:icoc/presentation/screen/home/my_drawer.dart';
import 'package:icoc/presentation/screen/home/widget/menu_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final CarouselController carouselController;
  late AnimationController animationController;
  List<MenuItem> items = HomeScreenMenuItems.items();
  MenuItem currentItem = HomeScreenMenuItems.items().first;
  final isDrawerOpenNotifier = ValueNotifier<bool>(false);
  final angleNotifier = ValueNotifier<double>(0);
  void toggleDrawer() async {
    if (isDrawerOpenNotifier.value) {
      await animationController.reverse();
    }
    isDrawerOpenNotifier.value = !isDrawerOpenNotifier.value;
  }

  void hideDrawer() async {
    if (isDrawerOpenNotifier.value) {
      await animationController.reverse();
    }
    isDrawerOpenNotifier.value;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      rateApp(context);
      getIt<NotificationsBloc>()
          .add(NotificationsListRequested(context.locale.languageCode));
    });

    carouselController = CarouselController();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: Platform.isAndroid == true,
      child: Scaffold(
        body: buildBody(context),
      ),
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
            width: screenSize.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 70,
          left: 16,
          child: Builder(builder: (BuildContext scaffoldContext) {
            return GestureDetector(
                child: ValueListenableBuilder<bool>(
                  valueListenable: isDrawerOpenNotifier,
                  builder: (context, isDrawerOpen, _) => isDrawerOpen
                      ? const Icon(
                          Icons.close,
                          color: Colors.white,
                        )
                      : Text(
                          'Menu'.tr(context: context),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                ),
                onTap: () => toggleDrawer());
          }),
        ),
        Positioned(
          left: screenSize.height * 0.06,
          top: screenSize.height * 0.1,
          child: ValueListenableBuilder<double>(
            valueListenable: angleNotifier,
            builder: (context, angle, _) => Transform.rotate(
              angle: angle,
              child: Container(
                width: screenSize.height * 0.8,
                height: screenSize.height * 0.8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.white,
                      Colors.transparent,
                    ],
                    stops: [0.85, 1],
                    focal: Alignment(0, 0),
                    focalRadius: 0.15,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Image.asset(
                    'assets/images/globe1.png',
                    width: screenSize.height * 0.70,
                    height: screenSize.height * 0.70,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: screenSize.height * 0.09,
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
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 6),
                viewportFraction: 0.3,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                autoPlayAnimationDuration: const Duration(milliseconds: 1200),
                scrollDirection: Axis.vertical,
                onPageChanged: (index, reason) {
                  currentItem = items[index];
                  HapticFeedback.heavyImpact();
                },
                onScrolled: (scrollPosition) {
                  angleNotifier.value = scrollPosition! - 10000;
                },
              ),
              items: items.map((item) => MenuItemCard(item)).toList(),
            ),
          ),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isDrawerOpenNotifier,
          builder: (context, isDrawerOpen, _) => isDrawerOpen
              ? Positioned(child: MyDrawer(animationController))
              : const SizedBox(),
        ),
        Positioned(
            bottom: 16, left: 16, child: _buildNotificationsIcon(context)),
      ],
    );
  }

  Widget _buildNotificationsIcon(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        int unreadNotificationsCount = 0;
        if (state is GetNotificationsListSuccessState) {
          unreadNotificationsCount =
              countUnreadNotifications(state.notifications);
          if (unreadNotificationsCount > 0) {
            FlutterAppBadger.updateBadgeCount(unreadNotificationsCount);
          } else {
            FlutterAppBadger.removeBadge();
          }
        }
        return Stack(alignment: AlignmentDirectional.center, children: [
          state is GetNotificationsListSuccessState &&
                  unreadNotificationsCount > 0
              ? Positioned(
                  left: 13,
                  bottom: 20,
                  width: 26,
                  height: 20,
                  child: Container(
                    color: Colors.red,
                    child: FittedBox(
                      child: Text(unreadNotificationsCount.toString()),
                    ),
                  ),
                )
              : Container(),
          IconButton(
            icon: const Icon(
              Icons.messenger_outline,
              color: Colors.white,
              size: 36,
            ),
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.NOTIFICATIONS_SCREEN),
          ),
        ]);
      },
    );
  }

  void navigateToScreen(BuildContext context) {
    Navigator.pushNamed(context, currentItem.routeName);
  }

  int countUnreadNotifications(List<NotificationsModel> notifications) {
    return notifications.where((element) => element.isRead == false).length;
  }
}
