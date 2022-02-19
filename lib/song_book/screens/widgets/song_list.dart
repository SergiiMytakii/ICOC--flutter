import '/index.dart';

class SongList extends StatelessWidget {
  final SongsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Obx(() {
      return controller.loaded.value
          ? SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //iterate index of divider color
                  if (i < 4) {
                    i++;
                  } else {
                    i = 0;
                  }

                  return SongCard(
                    song: controller.songsFromFB[index],
                    dividerColor: dividerColors[i],
                    slideActions: [
                      AddToFavorites(songId: controller.songsFromFB[index].id),
                      AddToPlayList(songId: controller.songsFromFB[index].id)
                    ],
                  );
                },
                childCount: controller.songsFromFB.length,
              ),
            )
          : SliverToBoxAdapter(
              child: Column(
              children: [
                Loading(
                  color: screensColors['songBook'],
                ),
                TextButton(
                  onPressed: () {
                    controller.isSelected.value = false;
                    controller.fetchDataFromFirebase();
                  },
                  child: AnimatedDefaultTextStyle(
                    textAlign: TextAlign.center,
                    style: controller.isSelected.value
                        ? TextStyle(
                            color: screensColors['songBook'],
                            fontWeight: FontWeight.bold,
                          )
                        : TextStyle(color: Colors.transparent),
                    duration: Duration(seconds: 2),
                    child: Text(
                      controller.updateLoadingProgress.value,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ));
    });
  }
}
