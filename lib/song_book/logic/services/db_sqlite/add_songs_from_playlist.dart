import 'package:icoc/song_book/logic/services/data_search.dart';

class DataSearchFromPlaylists extends DataSearch {
  String playlistName;
  DataSearchFromPlaylists(this.playlistName);

  @override
  onTapHandler(int id) {
    print(playlistName);
    return super.onTapHandler(id);
  }
}
