import 'package:Projects/shared/constants.dart';
import 'package:Projects/song_book/logic/controllers/slide_actions_controller.dart';
import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/presentation/screens/song_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getxfire/getxfire.dart';
import '../../presentation/widgets/playlists_modal_bottom_sheet.dart';

class SongCard extends StatelessWidget {
  final Song song;
  final orderLang;
  final GetxController? favController;
  final SlideActions slideAction;
  final Color dividerColor;

  SongCard(
      {required this.song,
      required this.orderLang,
      required this.slideAction,
      this.favController,
      required this.dividerColor});
  final slideActionsController = Get.put(SlideActionsController());

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          actionPane: SlidableScrollActionPane(),
          secondaryActions: [
            IconSlideAction(
              caption: slideActionsController.labelFirstCaption(slideAction),
              color: Theme.of(context).primaryColorLight,
              icon: Icons.favorite_border,
              onTap: () => slideActionsController.onTapHandlerFirstCaption(
                  slideAction, song.id, favController),
            ),
            IconSlideAction(
              caption: 'to playlist'.tr,
              color: Theme.of(context).primaryColorDark,
              icon: Icons.playlist_play_outlined,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return PlaylistsModalBottomSheet(song.id);
                    });

                final snackBar = SnackBar(
                  content: Text('Added to playlist'.tr),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ],
          child: ListTile(
            onTap: (() => Get.to(
                SongScreen(
                  song: song,
                  orderLang: orderLang,
                  //deleteFromFavorites: favController,
                ),
                transition: Transition.rightToLeftWithFade,
                duration: Duration(milliseconds: 250))),
            horizontalTitleGap: 0,
            leading: Text(song.id.toString(),
                style: Theme.of(context).textTheme.headline6),
            title: Text(
              //show title and text language accordingly to app lang
              chooseCardLang(song, orderLang)?[0] ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              chooseCardLang(song, orderLang)?[1] ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ),
        Divider(
          indent: 50,
          color: dividerColor,
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
