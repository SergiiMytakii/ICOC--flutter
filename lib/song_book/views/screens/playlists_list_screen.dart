import 'package:Projects/routes/routes.dart';
import 'package:Projects/shared/constants.dart';
import 'package:Projects/song_book/logic/controllers/songs_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getxfire/getxfire.dart';

class PlaylistsListScreen extends StatefulWidget {
  @override
  _PlaylistsListScreenState createState() => _PlaylistsListScreenState();
}

class _PlaylistsListScreenState extends State<PlaylistsListScreen> {
  late GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  final controller = Get.put(SongsController());

  @override
  void initState() {
    controller.getPlaylists();
    super.initState();
  }

  void _removePlaylist(Map<String, Object?> playlist, int index, int i) {
    {
      controller.removePlaylist(playlist);
      //animation
      final item = controller.playlists.removeAt(index);
      listKey.currentState!.removeItem(index,
          (_, animation) => playlistCard(context, index, animation, i, item),
          duration: const Duration(milliseconds: 500));
    }
  }

  void _insertNewPlaylist() {
    // final enteredNameOfNewPlaylist = _textController.text;
    // if (enteredNameOfNewPlaylist.isEmpty) return;
    Get.defaultDialog(
      title: 'name of playlist'.tr,
      content: TextField(
          controller: controller.textController.value,
          autofocus: true,
          onSubmitted: (_) async {
            await controller.createNewPlaylist();
            listKey.currentState?.insertItem(0);
            Get.back();
          }),
    );
  }

  Widget playlistCard(BuildContext context, int index,
      Animation<double> animation, int i, Map<String, Object?> playlist) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset(0, 0),
      ).animate(animation),
      child: Column(
        children: [
          Slidable(
            actionPane: SlidableScrollActionPane(),
            secondaryActions: [
              IconSlideAction(
                  caption: 'rename playlists'.tr,
                  color: Theme.of(context).primaryColorLight,
                  icon: Icons.drive_file_rename_outline,
                  onTap: () {
                    controller.isReadOnly.value = false;
                  }),
              IconSlideAction(
                caption: 'delete from playlists'.tr,
                color: Theme.of(context).primaryColorDark,
                icon: Icons.delete_outline,
                onTap: () => _removePlaylist(playlist, index, i),
              ),
            ],
            child: ListTile(
              leading: Icon(
                Icons.playlist_play_outlined,
                color: Constants.dividerColors[i],
              ),
              title: Obx(
                () => TextFormField(
                  showCursor: !controller.isReadOnly.value,
                  autofocus: !controller.isReadOnly.value,
                  readOnly: controller.isReadOnly.value,
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: TextEditingController(
                    text: playlist['playlistName'].toString(),
                  ),
                  style: Theme.of(context).textTheme.headline6,
                  onFieldSubmitted: (value) => controller.renamePlaylist(
                    playlist,
                    value,
                  ),
                  onTap: () {
                    controller.isReadOnly.value = true;
                    Get.toNamed(Routes.PLAYLISTS, arguments: playlist);
                  },
                ),
              ),
            ),
          ),
          Divider(
            indent: 50,
            color: Constants.dividerColors[i],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;

    return Obx(() => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('bottom_navigation_bar_playlists'.tr),
            backgroundColor:
                Constants.screensColors['songBook']!.withOpacity(0.8),
            actions: [
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _insertNewPlaylist();
                  }),
            ],
          ),
          body: controller.showList.value
              ? AnimatedList(
                  key: listKey,
                  physics: BouncingScrollPhysics(),
                  initialItemCount: controller.playlists.length,
                  itemBuilder: (BuildContext context, int index, animation) {
                    //change i for making different colors of divider
                    if (i < 4) {
                      i++;
                    } else {
                      i = 0;
                    }
                    return playlistCard(context, index, animation, i,
                        controller.playlists[index]);
                  },
                )
              : Center(child: Text('There is nothing here yet!'.tr)),
        ));
  }
}
