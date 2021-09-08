import '/index.dart';

class PlaylistScreen extends StatefulWidget {
  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final controller = Get.put(PlaylistsController());
  var playlist = Get.arguments;

  @override
  void initState() {
    controller.getSongsInPlaylist(playlist['id']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;

    return playlist != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(playlist['playlistName']),
              centerTitle: true,
              backgroundColor: screensColors['songBook'],
              actions: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: Get.context!,
                        isScrollControlled: true,
                        enableDrag: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.black.withOpacity(0.2),
                        builder: (context) => ModalBottomSheet(
                          child: AddSongFromPlaylist(playlist),
                        ),
                      );
                    },
                    icon: Icon(Icons.add_outlined))
              ],
            ),
            body: Obx(
              () => ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.songsInPlaylist.length,
                itemBuilder: (BuildContext context, int index) {
                  //change i for making different colors of divider
                  if (i < 4) {
                    i++;
                  } else {
                    i = 0;
                  }
                  return GetBuilder<OrderLangController>(
                    init: OrderLangController(),
                    builder: (orLangController) {
                      return PlaylistSongCard(
                          song: controller.songsInPlaylist[index],
                          orderLang: orLangController.orderLang,
                          dividerColor: dividerColors[i],
                          playlistId: playlist['id']);
                    },
                  );
                },
              ),
            ),
          )
        : Scaffold(
            body: Center(
              child: Text('Ooops...can\'t load data'),
            ),
          );
  }
}
