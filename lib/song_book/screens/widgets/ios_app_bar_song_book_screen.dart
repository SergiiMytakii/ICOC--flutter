import '/index.dart';
import 'package:flutter/cupertino.dart';

Widget iosAppbar(BuildContext context, dynamic controller, String title) {
  return SliverAppBar(
    primary: true,
    title: Text(title),
    backgroundColor: screensColors['songBook'],
    centerTitle: true,
    actions: [
      IconButton(
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
      ),
    ],
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
            suffixMode: OverlayVisibilityMode.always,
            onChanged: (val) {
              print(val);
              controller.query.value = val;
            },
            backgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
      ),
    ),
  );
}
