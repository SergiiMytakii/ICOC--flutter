import 'package:Projects/services/db_sqlite/sqlite_helper_fts4.dart';
import 'package:Projects/song_book/screens/playlists.dart';
import 'package:flutter/material.dart';

class PlaylistsModalBottomSheet extends StatefulWidget {
  final int id;

  PlaylistsModalBottomSheet(this.id);
  @override
  _PlaylistsModalBottomSheetState createState() =>
      _PlaylistsModalBottomSheetState();
}

class _PlaylistsModalBottomSheetState extends State<PlaylistsModalBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  void _submitData() async {
    final enteredNameOfNewPlaylist = _textController.text;
    if (enteredNameOfNewPlaylist.isEmpty) return;
    await DatabaseHelperFTS4().createPlaylist(enteredNameOfNewPlaylist);
    await DatabaseHelperFTS4()
        .insertIntoPlaylist(enteredNameOfNewPlaylist, widget.id);

    Navigator.of(context).pop();
  }

  void _loadPlaylists() async {}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          Text(
            'Добавить в плейлисты',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add),
                      labelText: 'Новый плейлист',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    controller: _textController,
                    onSubmitted: (_) => _submitData(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  icon: Icon(
                    Icons.check,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: _submitData,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text('Добавить в существующий плейлист'),
          Container(
            height: 50,
            padding: const EdgeInsets.only(
              top: 10,
              right: 65,
            ),
            child: DropdownButtonFormField(
              onTap: () => _loadPlaylists,
              value: 1,
              items: [
                DropdownMenuItem(
                  child: Text('Собрание'),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text('Детские'),
                  value: 2,
                ),
              ],
              onChanged: (value) => setState(() {}),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
