import 'package:Projects/song_book/models/song.dart';
import 'package:Projects/song_book/screens/song_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongCard extends StatefulWidget {
  final Song song;

  SongCard(this.song);

  @override
  _SongCardState createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  bool _favoriteStatus = false;

  @override
  Widget build(BuildContext context) {
    String myLocale = Localizations.localeOf(context).toString();

    final song = widget.song;
    return Column(
      children: [
        ListTile(
          onTap: (() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SongScreen(song)));
          }),
          horizontalTitleGap: 0,
          leading: Text(
            song.id.toString(),
            style: TextStyle(fontSize: 18),
          ),
          title: Text(
            //show title and text language accordingly to app lang
            chooseTitleLang(song, myLocale) ?? '',

            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            chooseTextLang(song, myLocale) ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          trailing: IconButton(
            icon: _favoriteStatus
                ? Icon(
              Icons.favorite_rounded,
              size: 32,
            )
                : Icon(
              Icons.favorite_border,
              size: 32,
            ),
            onPressed: () => setState(() {
              _favoriteStatus = !_favoriteStatus;
              // print(_favoriteStatus);
            }),
          ),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }

//return to the title of card title of song in the preferred language if it exist,
// or on the second language, as usual - russian
  chooseTitleLang(Song song, String myLocale) {
    //print(song.title);
    // print(myLocale);

    switch (myLocale) {
      case 'ru_RU':
        {
          if (song.title!['ru'] != null)
            return song.title!['ru'];
          else if (song.title!['uk'] != null)
            return song.title!['uk'];
          else if (song.title!['en'] != null) return song.title!['en'];
        }
        break;
      case 'uk_UK':
        {
          if (song.title!['uk'] != null)
            return song.title!['uk'];
          else if (song.title!['ru'] != null)
            return song.title!['ru'];
          else if (song.title!['en'] != null) return song.title!['en'];
        }
        break;
      case 'en_US':
        {
          if (song.title!['en'] != null)
            return song.title!['en'];
          else if (song.title!['ru'] != null)
            return song.title!['ru'];
          else if (song.title!['uk'] != null) return song.title!['uk'];
        }
        break;

      default:
        return song.title!['ru'];
    }
  }

  chooseTextLang(Song song, String myLocale) {
    switch (myLocale) {
      case 'ru_RU':
        {
          if (song.text!['ru1'] != null)
            return song.text!['ru1'];
          else if (song.text!['uk1'] != null)
            return song.text!['uk1'];
          else if (song.text!['en1'] != null) {
            return song.text!['en1'];
          }
        }
        break;
      case 'uk_UK':
        {
          if (song.text!['uk1'] != null)
            return song.text!['uk1'];
          else if (song.text!['ru1'] != null)
            return song.text!['ru1'];
          else if (song.text!['en1'] != null) return song.text!['en1'];
        }
        break;
      case 'en_US':
        {
          if (song.text!['en1'] != null)
            return song.text!['en1'];
          else if (song.text!['ru1'] != null)
            return song.text!['ru1'];
          else if (song.text!['uk1'] != null) return song.text!['uk1'];
        }
    }
  }
}
