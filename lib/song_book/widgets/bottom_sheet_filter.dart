import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomSheetFilter extends StatefulWidget {
  @override
  _BottomSheetFilterState createState() => _BottomSheetFilterState();
}

class _BottomSheetFilterState extends State<BottomSheetFilter> {
  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  bool _en;
  bool _ru;
  bool _ukr;

  _loadPreferences() async {
    SharedPreferences prefLanguages = await SharedPreferences.getInstance();
    setState(() {
      _en = (prefLanguages.getBool('en') ?? true);
      _ru = (prefLanguages.getBool('ru') ?? true);
      _ukr = (prefLanguages.getBool('ukr') ?? true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      height: 300,
      child: Column(
        children: [
          Text(
            'Языки песен: ',
            style: TextStyle(fontSize: 25),
          ),
          CheckboxListTile(
              title: const Text(
                'Русский',
                style: TextStyle(fontSize: 22),
              ),
              value: _ru,
              tristate: true,
              contentPadding: EdgeInsets.only(left: 150),
              onChanged: (bool value) async {
                SharedPreferences prefLanguages =
                    await SharedPreferences.getInstance();
                setState(() {
                  _ru = !_ru;
                  prefLanguages.setBool('ru', _ru);
                });
              }),
          CheckboxListTile(
              title: const Text(
                'Украинский',
                style: TextStyle(fontSize: 22),
              ),
              value: _ukr,
              tristate: true,
              contentPadding: EdgeInsets.only(left: 150),
              onChanged: (bool value) async {
                SharedPreferences prefLanguages =
                    await SharedPreferences.getInstance();

                setState(() {
                  _ukr = !_ukr;
                  prefLanguages.setBool('ukr', _ukr);
                });
              }),
          CheckboxListTile(
              title: const Text(
                'Английский',
                style: TextStyle(fontSize: 22),
              ),
              value: _en,
              tristate: true,
              contentPadding: EdgeInsets.only(left: 150),
              onChanged: (bool value) async {
                SharedPreferences prefLanguages =
                    await SharedPreferences.getInstance();
                setState(() {
                  _en = !_en;
                  prefLanguages.setBool('en', _en);
                });
              }),
        ],
      ),
    );
  }
}
