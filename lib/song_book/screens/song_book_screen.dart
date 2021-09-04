import 'dart:io';
import 'package:flutter/cupertino.dart';
import '../../index.dart';

class SongBookScreen extends StatelessWidget {
  final controller = Get.put(SongsController());
  final DataSearch dataSearch = DataSearch();
  @override
  Widget build(BuildContext context) {
    //DatabaseHelper().deleteSong(187);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller.fetchDataFromFirebase(),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            Platform.isIOS
                ? iosAppbar(
                    context,
                    controller,
                    'app_bar_title'.tr,
                  )
                //in case its android platform
                : AndroidAppBar(),
            Obx(
              () => controller.query.value == ''
                  ? SongList()
                  : dataSearch.searchResults(controller.query.value),
            ),
          ],
        ),
      ),
    );
  }
}
