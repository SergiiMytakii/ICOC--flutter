import 'package:icoc/song_book/logic/services/data_search.dart';

class AddSongsFromPlaylists extends DataSearch {
  String playlistName;
  AddSongsFromPlaylists(this.playlistName);

  @override
  onTapHandler(int id) {
    print(playlistName);
    return super.onTapHandler(id);
  }
}
