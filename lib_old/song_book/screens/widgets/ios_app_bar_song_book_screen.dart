import '../songs/add_song_screen.dart';

import '../../../index.dart';
import 'package:flutter/cupertino.dart';

Widget iosAppbar(
    BuildContext context, SongsController controller, String title) {
  return SliverAppBar(
    primary: true,
    title: Text(title),
    backgroundColor: screensColors['songBook'],
    centerTitle: true,
    leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
        ),
        tooltip: 'icon_button_actions_app_bar_filter'.tr,
        onPressed: () {
          Get.back();
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
              controller.query.value = val;
            },
            //onSuffixTap: () => controller.query.value = '',
            backgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
      ),
    ),
  );
}

IconButton buildFilterButton(BuildContext context) {
  return IconButton(
    icon: Icon(
      Icons.filter_alt_outlined,
    ),
    tooltip: 'icon_button_actions_app_bar_filter'.tr,
    onPressed: () {
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return ModalBottomSheet(
                height: Get.size.height / 1.8,
                blurBackground: false,
                child: BottomSheetFilter());
          });
    },
  );
}

IconButton buildAddSongButton(BuildContext context) {
  return IconButton(
    icon: Icon(
      Icons.add,
    ),
    tooltip: 'icon_button_actions_app_bar_add_song'.tr,
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddSongScreen()));
    },
  );
}