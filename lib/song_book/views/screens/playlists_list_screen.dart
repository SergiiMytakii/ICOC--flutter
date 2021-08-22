import 'package:icoc/routes/routes.dart';
import 'package:icoc/shared/constants.dart';
import 'package:icoc/song_book/logic/controllers/playlists_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getxfire/getxfire.dart';

class PlaylistsListScreen extends StatefulWidget {
  @override
  _PlaylistsListScreenState createState() => _PlaylistsListScreenState();
}

class _PlaylistsListScreenState extends State<PlaylistsListScreen> {
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final controller = Get.put(PlaylistsController());

  @override
  void initState() {
    controller.getPlaylists();
    super.initState();
  }

  void _removePlaylist(Map<String, Object?> playlist, int index, int i) {
    {
      controller.deletePlaylist(playlist);
      //animation
      final item = controller.playlists.removeAt(index);
      listKey.currentState!.removeItem(index,
          (_, animation) => playlistCard(context, index, animation, i, item),
          duration: const Duration(milliseconds: 500));
    }
  }

  void _insertNewPlaylist() {
    Get.defaultDialog(
      title: 'name of playlist'.tr,
      textConfirm: 'Ok',
      confirmTextColor: Colors.blueAccent,
      onConfirm: () => _submitForm(),
      buttonColor: Colors.transparent,
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: controller.textController.value,
          autofocus: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter name of playlist'.tr;
            }
            bool coincidence = false;
            controller.playlists.forEach((element) {
              if (element.values.contains(value)) coincidence = true;
            });
            if (coincidence == true)
              return 'The playlist with given name alredy exist'.tr;
            return null;
          },
          onEditingComplete: () => _submitForm(),
        ),
      ),
    );
  }

  Future _submitForm() async {
    if (formKey.currentState!.validate()) {
      await controller.createNewPlaylist();
      await Future.delayed(Duration(milliseconds: 100));
      listKey.currentState?.insertItem(0);
      print('insert card');
      Get.back();
    }
  }

  Widget playlistCard(BuildContext context, int index,
      Animation<double> animation, int i, Map<String, Object?> playlist) {
    Future.delayed(Duration(milliseconds: 500));
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
                  color: Constants.screensColors['songBook']!.withOpacity(0.5),
                  icon: Icons.drive_file_rename_outline,
                  onTap: () {
                    controller.isReadOnly.value = false;
                  }),
              IconSlideAction(
                caption: 'delete from playlists'.tr,
                color: Constants.screensColors['songBook'],
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
            backgroundColor: Constants.screensColors['songBook'],
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
