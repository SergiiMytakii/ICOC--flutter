import '/index.dart';

class DataSearchFromPlaylists extends DataSearch {
  final PlaylistsController playlistsController = Get.find();
  final playlist;
  DataSearchFromPlaylists(this.playlist);

  @override
  onTapHandler(BuildContext context, SongDetail song, String lang) async {
    print('playlist ' + playlist['playlistName']);
    await playlistsController.addToPlaylist(playlist['playlistName'], song.id);
    playlistsController.getSongsInPlaylist(playlist['id']);
  }
}
