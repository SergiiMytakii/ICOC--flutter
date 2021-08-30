import 'package:getxfire/getxfire.dart';
import 'package:icoc/song_book/logic/controllers/playlists_controller.dart';
import 'package:icoc/song_book/logic/services/data_search.dart';

class DataSearchFromPlaylists extends DataSearch {
  final PlaylistsController playlistsController =
      Get.put(PlaylistsController());
  final playlist;
  DataSearchFromPlaylists(this.playlist);

  @override
  onTapHandler(int id) async {
    await playlistsController.addToPlaylist(playlist['playlistName'], id);
    playlistsController.getSongsInPlaylist(playlist['id']);
  }
}
