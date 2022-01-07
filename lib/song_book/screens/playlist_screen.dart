import '/index.dart';

class PlaylistScreen extends StatefulWidget {
  final Map playlist;
  const PlaylistScreen({
    Key? key,
    required this.playlist,
  }) : super(key: key);
  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final controller = Get.put(PlaylistsController());

  @override
  void initState() {
    controller.getSongsInPlaylist(widget.playlist['id']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.playlist['playlistName'] ?? 'No data'),
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
                    child: AddSongFromPlaylist(widget.playlist),
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
                SongDetail song = controller.songsInPlaylist[index];
                return SongCard(
                  song: song,
                  dividerColor: dividerColors[i],
                  slideActions: [
                    AddToFavorites(songId: song.id),
                    AddToPlayList(songId: song.id),
                    RemoveFromPlaylist(
                        playlistId: widget.playlist['id'], songId: song.id)
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
