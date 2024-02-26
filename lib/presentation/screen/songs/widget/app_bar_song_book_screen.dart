import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';
import 'package:icoc/presentation/widget/animated_filter_button.dart';

import '../../../widget/modal_bottom_sheet.dart';
import '../../../routes/app_routes.dart';
import 'bottom_sheet_song_filter.dart';

class IosAppbar extends StatefulWidget {
  IosAppbar(
    this.title,
    this.callback,
  );
  final String title;
  final Function callback;

  @override
  State<IosAppbar> createState() => _IosAppbarState();
}

class _IosAppbarState extends State<IosAppbar> {
  Map<String, dynamic> allLanguages = {};
  String firstLang = '';
  final GlobalKey tooltipKey = GlobalKey();
  bool _tooltipVisible = true;

  @override
  void initState() {
    setFirstLang();
    showTooltip();

    super.initState();
  }

  void showTooltip() {
    double tooltipShown =
        SharedPreferencesHelper.getDouble(StorageKeys.shouldShowTooltip) ?? 0.0;
    if (tooltipShown < 4.0) {
      Future.delayed(Duration(milliseconds: 1500)).then((value) {
        (tooltipKey.currentState as TooltipState).ensureTooltipVisible();
        Future.delayed(Duration(seconds: 6), () {
          if (mounted)
            setState(() {
              _tooltipVisible = false;
            });
        });
      });
      SharedPreferencesHelper.saveDouble(
          StorageKeys.shouldShowTooltip, tooltipShown + 1);
    }
  }

  void setFirstLang() {
    //this needed to display primary language
    final locale = SharedPreferencesHelper.getString(
          StorageKeys.locale,
        ) ??
        'en';
    allLanguages =
        SharedPreferencesHelper.getMap(StorageKeys.allSongsLanguages) ??
            {locale: true};
    allLanguages.removeWhere((key, value) => value == false);
    setState(() {
      firstLang = allLanguages.keys.first;
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return SliverAppBar(
      primary: true,
      title: Text(widget.title),
      centerTitle: true,
      automaticallyImplyLeading: true,
      leading: IconButton(
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          }),
      actions: [
        Stack(
          children: [
            Visibility(
              visible: _tooltipVisible,
              child: Tooltip(
                message: 'Filter languages'.tr(),
                key: tooltipKey,
                preferBelow: true,
                triggerMode: TooltipTriggerMode.manual,
                child: Container(
                  height: 40,
                  width: 30,
                ),
              ),
            ),
            AnimatedFilterIconButton(
              firstLanguage: firstLang,
              shouldAnimate: StorageKeys.shouldSongsFilterAnimate,
              color: ScreenColors.songBook,
              onTap: () => showModalBottomSheet(
                  scrollControlDisabledMaxHeightRatio: 2,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return ModalBottomSheet(
                        height: MediaQuery.of(context).size.height / 1.4,
                        blurBackground: false,
                        child: BottomSheetSongsFilter());
                  }).then(
                (value) => setState(() {
                  setFirstLang();
                }),
              ),
            ),
          ],
        ),
        buildAddSongButton(context)
      ],
      pinned: true,
      expandedHeight: 95.0,
      backgroundColor: MaterialStateColor.resolveWith((states) =>
          AdaptiveTheme.of(context).theme.appBarTheme.backgroundColor!),
      floating: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 45,
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 8,
            ),
            child: CupertinoSearchTextField(
              onChanged: (val) {
                widget.callback(val);
              },
              style: AdaptiveTheme.of(context).theme.textTheme.bodySmall,
              backgroundColor: AdaptiveTheme.of(context).theme.focusColor,
            ),
          ),
        ),
      ),
    );
  }
}

IconButton buildAddSongButton(BuildContext context) {
  return IconButton(
    icon: Icon(
      Icons.add,
    ),
    tooltip: 'icon_button_actions_app_bar_add_song'.tr(),
    onPressed: () {
      Navigator.pushNamed(context, Routes.ADD_SONG_SCREEN);
    },
  );
}
