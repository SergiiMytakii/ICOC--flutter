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

  // final song = Song(
  //     id: '0',
  //     title: {'rus': 'Прекрасна милость'},
  //     text: {
  //       'rus': "Прекрасна милость, как сладок звук,\n Она спасла меня.\n"
  //           " В грехе я был забыт и слеп – \n"
  //           'Прощен я и прозрел.\n'
  //           '\n'
  //           '\n'
  //           'Тяжелый труд, опасности –\n'
  //           'Чрез все, что я прошел –\n'
  //           'Меня хранила милость Твоя,\n'
  //           'Она со мной всегда!\n'
  //           '\n'
  //           '\n'
  //           'Пусть мы там будем тысячи лет,\n'
  //           'Сияя как звезда.\n'
  //           'У нас вся вечность впереди,\n'
  //           'Чтоб воспевать Отца!\n'
  //           '\n'
  //           '\n'
  //           ' Прекрасна милость, как сладок звук.\n'
  //           'Она спасла меня.\n'
  //           'В грехе я был забыт и слеп –\n'
  //           'Прощен я и прозрел!\n'
  //     },
  //     description: 'Слова: Дж. Ньютон,1779г.');

  @override
  Widget build(BuildContext context) {
    final song = widget.song;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      elevation: 6,
      child: ListTile(
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
          song.title['ru'] ?? '',
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          song.text['ru'] ?? '',
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
            print(_favoriteStatus);
          }),
        ),
      ),
    );
  }
}
