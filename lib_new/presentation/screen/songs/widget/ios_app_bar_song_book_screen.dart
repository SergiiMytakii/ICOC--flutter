import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../widget/modal_bottom_sheet.dart';
import '../../home_screen.dart';
import '../../routes/app_routes.dart';
import '../add_song_screen.dart';
import 'bottom_sheet_filter.dart';

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
      backgroundColor: screensColors['songBook'],
      centerTitle: true,
      automaticallyImplyLeading: true,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          }),
      actions: [buildFilterButton(context), buildAddSongButton(context)],
      pinned: true,
      expandedHeight: 90.0,
      floating: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 40,
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 8,
            ),
            child: CupertinoSearchTextField(
              onChanged: (val) {
                callback(val);
              },
              //onSuffixTap: () => controller.query.value = '',
              backgroundColor: Colors.white.withOpacity(0.2),
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddSongScreen()));
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
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return ModalBottomSheet(
                height: MediaQuery.of(context).size.height / 1.8,
                blurBackground: false,
                child: BottomSheetFilter());
          });
    },
  );
}
