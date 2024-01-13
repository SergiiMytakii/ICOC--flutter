import 'dart:io';
import '../../../index.dart';

class SongBookScreen extends StatefulWidget {
  @override
  State<SongBookScreen> createState() => _SongBookScreenState();
}

class _SongBookScreenState extends State<SongBookScreen> {
  final SongsController controller = Get.find();

  final DataSearch dataSearch = DataSearch();
  @override
  void dispose() {
    controller.query.value = '';
    super.dispose();
  }

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
              () => controller.query.value.length < 3
                  ? SongList()
                  : dataSearch.searchResults(controller.query.value),
            ),
          ],
        ),
      ),
    );
  }
}
