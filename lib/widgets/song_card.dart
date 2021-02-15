import 'package:Projects/models/song.dart';
import 'package:Projects/screens/song_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final song = Song(
      id: 0,
      title: {'rus': 'Прекрасна милость'},
      text: {
        'rus': "Прекрасна милость, как сладок звук,\n Она спасла меня.\n"
            " В грехе я был забыт и слеп – \n"
            'Прощен я и прозрел.\n'
            '\n'
            '\n'
            'Тяжелый труд, опасности –\n'
            'Чрез все, что я прошел –\n'
            'Меня хранила милость Твоя,\n'
            'Она со мной всегда!\n'
            '\n'
            '\n'
            'Пусть мы там будем тысячи лет,\n'
            'Сияя как звезда.\n'
            'У нас вся вечность впереди,\n'
            'Чтоб воспевать Отца!\n'
            '\n'
            '\n'
            ' Прекрасна милость, как сладок звук.\n'
            'Она спасла меня.\n'
            'В грехе я был забыт и слеп –\n'
            'Прощен я и прозрел!\n'
      },
      description: 'Слова: Дж. Ньютон,1779г.');

  @override
  Widget build(BuildContext context) {
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
          style: TextStyle(fontSize: 22),
        ),
        title: Text(
          song.title['rus'],
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          song.text['rus'],
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        trailing: Icon(
          Icons.favorite_border,
          size: 32,
        ),
      ),
    );
  }
}
