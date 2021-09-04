import '/index.dart';

class DataSearchFromPlaylists extends DataSearch {
  final PlaylistsController playlistsController =
      Get.put(PlaylistsController());
  final playlist;
  DataSearchFromPlaylists(this.playlist);

  @override
  onTapHandler(int id) async {
    print('playlist ' + playlist['playlistName']);
    await playlistsController.addToPlaylist(playlist['playlistName'], id);
    playlistsController.getSongsInPlaylist(playlist['id']);
  }
}
