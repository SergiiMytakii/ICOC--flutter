import 'package:Projects/song_book/widgets/checkbox_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomSheetFilter extends StatefulWidget {
  final Function? updateList;

  BottomSheetFilter({this.updateList});

  @override
  _BottomSheetFilterState createState() => _BottomSheetFilterState();
}

class _BottomSheetFilterState extends State<BottomSheetFilter> {
  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  List<String> _orderLang = ['ru', 'uk', 'en'];

  void _loadPreferences() async {
    SharedPreferences prefLanguages = await SharedPreferences.getInstance();
    setState(() {
      _orderLang = (prefLanguages.getStringList('orderLang') ?? _orderLang);
    });
  }

  void setOrderLang(List<String> orderLang) async {
    SharedPreferences prefLanguages = await SharedPreferences.getInstance();
    setState(() {
      prefLanguages.setStringList('orderLang', orderLang);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 300,
      child: Column(
        children: [
          FittedBox(
            child: Text(
              'icon_button_actions_app_bar_filter'.tr(),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            height: 200,
            margin: EdgeInsets.only(top: 10),
            child: ReorderableListView(
              scrollDirection: Axis.vertical,
              onReorder: _onReorder,
              children: List.generate(_orderLang.length, (index) {
                return MyCheckboxListTile(
                    _orderLang, index, ValueKey('$index'), widget.updateList);
              }),
            ),
          ),
          FittedBox(
            child: Text('hint reorder lang'.tr()),
          )
        ],
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      //move item to the new position
      final String item = _orderLang.removeAt(oldIndex);
      _orderLang.insert(newIndex, item);
      //writing new order of lang-s to preferences
      setOrderLang(_orderLang);
      widget.updateList!();
    });
  }
}
