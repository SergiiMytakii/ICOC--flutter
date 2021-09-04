import '/index.dart';

class PlaylistsListScreen extends StatefulWidget {
  @override
  _PlaylistsListScreenState createState() => _PlaylistsListScreenState();
}

class _PlaylistsListScreenState extends State<PlaylistsListScreen> {
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final controller = Get.put(PlaylistsController());

  void _removePlaylist(Map<String, Object?> playlist) async {
    {
      await controller.deletePlaylist(playlist);
      controller.getPlaylists();
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
      Get.back();
    }
  }

  Widget playlistCard(
      BuildContext context, Map<String, Object?> playlist, int i) {
    return Column(
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
              onTap: () => _removePlaylist(playlist),
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
              ? ListView.builder(
                  key: listKey,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.playlists.length,
                  itemBuilder: (BuildContext context, int index) {
                    //change i for making different colors of divider
                    if (i < 4) {
                      i++;
                    } else {
                      i = 0;
                    }
                    return playlistCard(
                        context, controller.playlists[index], i);
                  },
                )
              : Center(child: Text('There is nothing here yet!'.tr)),
        ));
  }
}
