import '/index.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoritesController controller = Get.put(FavoritesController());
  @override
  Widget build(BuildContext context) {
    int i = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text('bottom_navigation_bar_favorites'.tr),
          centerTitle: true,
          backgroundColor: screensColors['songBook'],
        ),
        body: Obx(() => ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: controller.favSongs.length,
              itemBuilder: (BuildContext context, int index) {
                //change i to make different colors of divider
                if (i < 4) {
                  i++;
                } else {
                  i = 0;
                }
                return GetBuilder<OrderLangController>(
                  init: OrderLangController(),
                  builder: (orLangController) {
                    return SongCard(
                      song: controller.favSongs[index],
                      dividerColor: dividerColors[i],
                      slideActions: [
                        DeleteFromFavorites(
                            songId: controller.favSongs[index].id),
                        AddToPlayList(songId: controller.favSongs[index].id)
                      ],
                    );
                  },
                );
              },
            )));
  }
}
