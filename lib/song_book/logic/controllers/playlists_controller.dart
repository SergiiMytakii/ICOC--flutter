import '/index.dart';

class PlaylistsController extends GetxController {
  RxString query = ''.obs;
  RxBool isReadOnly = true.obs;
  var playlists = <Map<String, Object?>>[].obs;
  RxBool showList = false.obs;
  final textController = TextEditingController().obs;
  final songsInPlaylist = <SongDetail>[].obs;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    getPlaylists();
    super.onInit();
  }

  Future getPlaylists() async {
    DatabaseHelperFTS4().getPlaylists().listen((event) {
      playlists.value = event;
      if (playlists.isNotEmpty) showList.value = true;
    });
  }

  Future<void> deletePlaylist(Map<String, Object?> playlist) async {
    await DatabaseHelperFTS4()
        .deletePlaylist(int.parse(playlist['id'].toString()));
  }

  void renamePlaylist(Map<String, Object?> playlist, String newName) async {
    if (newName.isEmpty) return;
    await DatabaseHelperFTS4()
        .renamePlaylists(int.parse(playlist['id'].toString()), newName);
    await getPlaylists();
    isReadOnly.value = true;
  }

  Future createNewPlaylist() async {
    if (textController.value.text.isEmpty) return;
    if (textController.value.text.isNotEmpty) {
      await DatabaseHelperFTS4().createPlaylist(textController.value.text);
      getPlaylists();
    }
    textController.value.clear();
  }

  addToPlaylist(String name, int id) async {
    await DatabaseHelperFTS4().insertIntoPlaylist(name, id);
    Get.showSnackbar(GetBar(
      duration: Duration(milliseconds: 800),
      message: 'Added to playlist'.tr,
    ));
  }

  void getSongsInPlaylist(int playlistId) async {
    DatabaseHelperFTS4().getSongsInPlaylist(playlistId).listen((songsFromDb) {
      songsInPlaylist.value = songsFromDb;
    });
  }

  void removeFromPlaylist(int playlistId, int id) {
    DatabaseHelperFTS4().removeFromPlaylist(playlistId, id);
    getSongsInPlaylist(playlistId);
  }
}
