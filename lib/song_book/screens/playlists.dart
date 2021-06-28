import 'package:Projects/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:Projects/shared/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Playlists extends StatefulWidget {
  @override
  _PlaylistsState createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  late GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  initState() {
    super.initState();
    DatabaseHelperFTS4().getPlaylists().listen((event) {
      setState(() {
        playlists = event;
      });
    });
  }

  final _textController = TextEditingController();
  List<Map<String, Object?>> playlists = [];
  bool loaded = false;

  void _removePlaylist(Map<String, Object?> playlist, int index, int i) {
    {
      DatabaseHelperFTS4()
          .deleteFromPlaylists(int.parse(playlist['id'].toString()));

      final item = playlists.removeAt(index);

      listKey.currentState!.removeItem(index,
          (_, animation) => playlistCards(context, index, animation, i, item),
          duration: const Duration(milliseconds: 500));
    }
  }

  void _submitNewNamePlaylist(Map<String, Object?> playlist) async {
    final enteredNameOfNewPlaylist = _textController.text;
    if (enteredNameOfNewPlaylist.isEmpty) return;
    await DatabaseHelperFTS4().renamePlaylists(
        int.parse(playlist['id'].toString()), enteredNameOfNewPlaylist);
    DatabaseHelperFTS4().getPlaylists().listen((event) {
      setState(() {
        playlists = event;
      });
    });
    Navigator.of(context).pop();
    _textController.clear();
  }

  void _submitData() async {
    final enteredNameOfNewPlaylist = _textController.text;
    if (enteredNameOfNewPlaylist.isEmpty) return;
    await DatabaseHelperFTS4().createPlaylist(enteredNameOfNewPlaylist);
    playlists.insert(0, {'id': '0', 'playlistName': enteredNameOfNewPlaylist});
    setState(() {});
    listKey.currentState?.insertItem(0);
    Navigator.of(context).pop();
    _textController.clear();
  }

  _buildAlertDialog(String title, Function onPressedHandler,
      Map<String, Object?>? playlist) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title.tr()),
          content: TextField(
            decoration: InputDecoration(
              labelText:
                  playlist != null ? playlist['playlistName'].toString() : '',
            ),
            controller: _textController,
            onSubmitted: (_) => playlist != null
                ? onPressedHandler(playlist)
                : onPressedHandler(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => playlist != null
                  ? onPressedHandler(playlist)
                  : onPressedHandler(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget playlistCards(BuildContext context, int index,
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
                  caption: 'rename playlists'.tr(),
                  color: Theme.of(context).primaryColorLight,
                  icon: Icons.drive_file_rename_outline,
                  onTap: () {
                    _buildAlertDialog(
                      'Rename playlist'.tr(),
                      _submitNewNamePlaylist,
                      playlist,
                    );
                  }),
              IconSlideAction(
                caption: 'delete from playlists'.tr(),
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
                title: Text(
                  playlist['playlistName'].toString(),
                  style: Theme.of(context).textTheme.headline6,
                )),
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
    if (playlists.isEmpty) {
      setState(() {
        loaded = false;
        print('setatste false');
      });
    } else {
      setState(() {
        loaded = true;
        print('setstate true');
      });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('bottom_navigation_bar_playlists').tr(),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                _buildAlertDialog('New playlist', _submitData, null),
          ),
        ],
      ),
      body: loaded
          ? AnimatedList(
              key: listKey,
              physics: BouncingScrollPhysics(),
              initialItemCount: playlists.length,
              itemBuilder: (BuildContext context, int index, animation) {
                //change i for making different colors of divider
                if (i < 4) {
                  i++;
                } else {
                  i = 0;
                }
                return playlistCards(
                    context, index, animation, i, playlists[index]);
              },
            )
          : Center(child: Text('There is nothing here yet!'.tr())),
    );
  }
}
