import 'package:Projects/services/db_sqlite/sqlite_helper_fts.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/screens/song_screen.dart';
import 'package:Projects/song_book/widgets/playlists_modal_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:easy_localization/easy_localization.dart';

class SongCard extends StatefulWidget {
  final Song song;
  final List<String> orderLang;
  final Function? deleteFromFavorites;
  final bool slideAction;
  final Color dividerColor;

  SongCard(
      {required this.song,
      required this.orderLang,
      required this.slideAction,
      this.deleteFromFavorites,
      required this.dividerColor});

  @override
  _SongCardState createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  @override
  Widget build(BuildContext context) {
    final song = widget.song;

    return Column(
      children: [
        Slidable(
          actionPane: SlidableScrollActionPane(),
          secondaryActions: [
            IconSlideAction(
              caption: widget.slideAction
                  ? 'delete from favorites'.tr()
                  : 'to favorite'.tr(),
              color: Theme.of(context).primaryColorLight,
              icon: Icons.favorite_border,
              onTap: () {
                ///if this is favorites list - we delete item on tap
                if (widget.slideAction) {
                  final snackBar = SnackBar(
                    content: Text('Deleted from favorites'.tr()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  DatabaseHelperFTS().deleteFromFavorites(song.id);
                  widget.deleteFromFavorites!(song.id);
                } else {
                  ///if this is  songs list - we we add item to favorites  on tap
                  final snackBar = SnackBar(
                    content: Text('Added to favorite list'.tr()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  DatabaseHelperFTS().addToFavorites(song.id);
                }
              },
            ),
            IconSlideAction(
              caption: 'to playlist'.tr(),
              color: Theme.of(context).primaryColorDark,
              icon: Icons.playlist_play_outlined,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return PlaylistsModalBottomSheet();
                    });

                final snackBar = SnackBar(
                  content: Text('Added to playlist'.tr()),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }, //todo implement action: showModalBottomSheet
              //todo     where you can create ore choose existing playlist
            ),
          ],
          child: ListTile(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SongScreen(
                            song: song,
                            orderLang: widget.orderLang,
                            deleteFromFavorites: widget.deleteFromFavorites,
                          )));
            }),
            horizontalTitleGap: 0,
            leading: Text(song.id.toString(),
                style: Theme.of(context).textTheme.headline6),
            title: Text(
              //show title and text language accordingly to app lang
              chooseCardLang(song, widget.orderLang)?[0] ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              chooseCardLang(song, widget.orderLang)?[1] ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ),
        Divider(
          indent: 50,
          color: widget.dividerColor,
        ),
      ],
    );
  }
}

// return to the title of card title of song on the preferred language if it exist,
// or on the second language, or on third
List<String?>? chooseCardLang(Song song, List<String> orderLang) {
  String? title;
  String? text;
  // print(song.title);
  // print(song.text);

  //check every key and if it fit to FIRST preferred lang and not equal null
  //we return value  of this key
  song.title.keys.forEach((key) {
    if (key == orderLang[0] && key != null) {
      title = song.title[orderLang[0]];
      text = song.text[orderLang[0]];
    }
  });
  if (title != null) return [title, text];

  //check every key and if it fit to SECOND preferred lang and not equal null
  //we return value  of this key
  song.title.keys.forEach((key) {
    if (key == orderLang[1] && key != null) {
      title = song.title[orderLang[1]];
      text = song.text[orderLang[1]];
    }
  });
  if (title != null) return [title, text];

  //check every key and if it fit to THIRD  preferred lang and not equal null
  //we return value  of this key
  song.title.keys.forEach((key) {
    if (key == orderLang[2] && key != null) {
      title = song.title[orderLang[2]];
      text = song.text[orderLang[2]];
    }
  });
  if (title != null) return [title, text];
}
