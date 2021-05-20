import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:oktoast/oktoast.dart';

class MyCheckboxListTile extends StatefulWidget {
  final Function? updateList;
  final int index;
  final ValueKey key;
  final List<String>? orderLang;

  MyCheckboxListTile(this.orderLang, this.index, this.key, this.updateList);

  @override
  _MyCheckboxListTileState createState() => _MyCheckboxListTileState();
}

class _MyCheckboxListTileState extends State<MyCheckboxListTile> {
  @override
  void initState() {
    _loadPreferences();
    super.initState();
  }

  bool _en = true;
  bool _ru = true;
  bool _uk = true;

  void _loadPreferences() async {
    SharedPreferences prefLanguages = await SharedPreferences.getInstance();
    setState(() {
      _en = (prefLanguages.getBool('en') ?? _en);
      _ru = (prefLanguages.getBool('ru') ?? _ru);
      _uk = (prefLanguages.getBool('uk') ?? _uk);
    });
  }

//
  bool? value(lang) {
    //print(" in value $lang");
    switch (lang) {
      case 'ru':
        return _ru;
      case 'uk':
        return _uk;
      case 'en':
        return _en;
    }
  }

  @override
  Widget build(BuildContext context) {
    String lang = widget.orderLang![widget.index];

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1)
          ]),
      child: CheckboxListTile(
          activeColor: Theme.of(context).primaryColor,
          key: widget.key,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            lang.tr(),
            style: Theme.of(context).textTheme.headline6,
          ),
          value: value(lang),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          secondary: Icon(Icons.reorder),
          onChanged: (_) async {
            SharedPreferences prefLanguages =
                await SharedPreferences.getInstance();

            setState(() {
              if (lang == 'ru') {
                _ru = !_ru;
                prefLanguages.setBool('ru', _ru);
              }
              if (lang == 'uk') {
                _uk = !_uk;
                prefLanguages.setBool('uk', _uk);
              }
              if (lang == 'en') {
                _en = !_en;
                prefLanguages.setBool('en', _en);
              }
              if (_ru == false && _uk == false && _en == false) {
                showToast('Choose at list one language!');
              }
            });

            // to refresh UI after choosing new lang preferences
            widget.updateList!();
          }),
    );
  }
}
