import '/index.dart';

class SongList extends GetView<SongsController> {
  final log = Logger();
  @override
  Widget build(BuildContext context) {
    Get.put(SongsController());
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

                  return GetBuilder<OrderLangController>(
                    init: OrderLangController(),
                    builder: (orLangController) {
                      return SongCard(
                        song: controller.songs[index],
                        orderLang: orLangController.orderLang,
                        dividerColor: dividerColors[i],
                      );
                    },
                  );
                },
                childCount: controller.songs.length,
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
