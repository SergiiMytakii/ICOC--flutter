import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/modal_bottom_sheet.dart';
import '../../../routes/app_routes.dart';
import 'bottom_sheet_song_filter.dart';

class IosAppbar extends StatelessWidget {
  IosAppbar(
    this.title,
    this.callback,
  );

  final String title;
  final Function callback;
  @override
  Widget build(
    BuildContext context,
  ) {
    return SliverAppBar(
      primary: true,
      title: Text(title),
      centerTitle: true,
      automaticallyImplyLeading: true,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new, //todo for android
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          }),
      actions: [buildFilterButton(context), buildAddSongButton(context)],
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
                callback(val);
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

IconButton buildFilterButton(BuildContext context) {
  return IconButton(
    icon: Icon(
      Icons.filter_alt_outlined,
    ),
    tooltip: 'icon_button_actions_app_bar_filter'.tr(),
    onPressed: () {
      showModalBottomSheet(
          scrollControlDisabledMaxHeightRatio: 2,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return ModalBottomSheet(
                height: MediaQuery.of(context).size.height / 1.4,
                blurBackground: false,
                child: BottomSheetSongsFilter());
          });
    },
  );
}
