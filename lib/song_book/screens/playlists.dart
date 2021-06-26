import 'package:Projects/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:Projects/shared/constants.dart';
import 'package:Projects/shared/loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class Playlists extends StatefulWidget {
  @override
  _PlaylistsState createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  List<Map<String, Object?>> playlists = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  bool loaded = false;

  _removePlaylist(Map<String, Object?> playlist, int index, int i) {
    {
      DatabaseHelperFTS4()
          .deleteFromPlaylists(int.parse(playlist['id'].toString()));

      final item = playlists.removeAt(index);
      print('item $item');

      listKey.currentState!.removeItem(index,
          (_, animation) => playlistCards(context, index, animation, i, item),
          duration: const Duration(milliseconds: 500));
    }
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
                  onTap: () {}),
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
    playlists = Provider.of<List<Map<String, Object?>>>(context);
    listKey.currentState?.insertItem(0);
    print(playlists.length);
    int i = 0;
    if (playlists.isEmpty) {
      setState(() {
        loaded = false;
      });
    } else {
      setState(() {
        loaded = true;
      });
    }
    return loaded
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('bottom_navigation_bar_playlists').tr(),
            ),
            body: AnimatedList(
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
            ))
        : Loading();
  }
}
