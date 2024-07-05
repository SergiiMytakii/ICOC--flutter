import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/notifications_bloc/notifications_bloc.dart';
import 'package:icoc/core/helpers/in_app_review_helper.dart';
import 'package:icoc/presentation/screen/home/widget/background.dart';
import 'package:icoc/presentation/screen/home/widget/dimmed_circle.dart';
import 'package:icoc/presentation/screen/home/widget/globe_image.dart';
import 'package:icoc/presentation/screen/home/widget/notification_icon.dart';

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
  late final CarouselController _carouselController;
  late AnimationController _menuAnimationController;

  List<MenuItem> items = HomeScreenMenuItems.items();
  MenuItem currentItem = HomeScreenMenuItems.items().first;
  final isDrawerOpenNotifier = ValueNotifier<bool>(false);
  final angleNotifier = ValueNotifier<double>(0);

  void toggleDrawer() async {
    if (isDrawerOpenNotifier.value) {
      await _menuAnimationController.reverse();
    }
    isDrawerOpenNotifier.value = !isDrawerOpenNotifier.value;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      rateApp(context);
      getIt<NotificationsBloc>()
          .add(NotificationsListRequested(context.locale.languageCode));
    });

    _carouselController = CarouselController();

    _menuAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _menuAnimationController.dispose();
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
        BackgroundHomeScreen(),
        Positioned(
          top: 70,
          left: 16,
          child: _buildMenuButton(screenSize),
        ),
        Positioned(
          left: screenSize.height * 0.06,
          top: screenSize.height * 0.1,
          child: GlobeImage(angleNotifier: angleNotifier),
        ),
        Positioned(
          left: screenSize.height * 0.09,
          width: screenSize.width,
          top: screenSize.height * 0.18,
          child: _buildCaruselSlider(context, screenSize),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isDrawerOpenNotifier,
          builder: (context, isDrawerOpen, _) =>
              isDrawerOpen ? _buildMenu(screenSize) : const SizedBox(),
        ),
        Positioned(bottom: 16, left: 16, child: NotificationIcon()),
      ],
    );
  }

  Stack _buildMenu(Size screenSize) {
    return Stack(
      children: [
        Positioned(
          left: screenSize.height * 0.06,
          top: screenSize.height * 0.1,
          child: const DimmedCircle(),
        ),
        MyDrawer(_menuAnimationController),
      ],
    );
  }

  Builder _buildMenuButton(Size screenSize) {
    return Builder(builder: (BuildContext scaffoldContext) {
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
                    style: screenSize.width > 400
                        ? Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)
                        : Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                  ),
          ),
          onTap: () => toggleDrawer());
    });
  }

  GestureDetector _buildCaruselSlider(BuildContext context, Size screenSize) {
    return GestureDetector(
      onTap: () async {
        context.go('/${currentItem.routeName}');
      },
      child: CarouselSlider(
        carouselController: _carouselController,
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
    );
  }
}
