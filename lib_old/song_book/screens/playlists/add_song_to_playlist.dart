import '../../../index.dart';

class AddSongToPlaylistsScreen extends GetView<PlaylistsController> {
  final int id;
  AddSongToPlaylistsScreen(this.id);

  @override
  Widget build(BuildContext context) {
    Get.put(PlaylistsController());
    controller.getPlaylists();
    int i = 0;
    final size = Get.size;

    return Container(
      height: size.height / 1.25,
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Create new playlist'.tr,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.playlist_play_outlined,
            color: dividerColors[0],
          ),
          title: TextFormField(
            autofocus: true,
            decoration: InputDecoration(border: InputBorder.none),
            controller: controller.textController.value,
            style: Theme.of(context).textTheme.headline6,
            onFieldSubmitted: (value) {
              controller.createNewPlaylist();
              controller.addToPlaylist(value, id);
              Get.back();
            },
          ),
        ),
        Divider(
          color: dividerColors[0],
          thickness: 1.2,
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Or choose from existing playlists'.tr,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          height: size.height * 0.5,
          child: Obx(() => ListView.builder(
              itemCount: controller.playlists.length,
              itemBuilder: (BuildContext context, index) {
                if (i < 4) {
                  i++;
                } else {
                  i = 0;
                }

                return _playlistCard(controller.playlists[index], i);
              })),
        )
      ]),
    );
  }

  Widget _playlistCard(Map<String, Object?> playlist, int i) {
    return ListTile(
        leading: Icon(
          Icons.playlist_play_outlined,
          color: dividerColors[i],
        ),
        title: Text(
          playlist['playlistName'].toString(),
        ),
        onTap: () {
          controller.addToPlaylist(
            playlist['playlistName'].toString(),
            id,
          );
          Get.back();
        });
  }
}
