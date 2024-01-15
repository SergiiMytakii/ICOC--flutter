import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/bloc/bloc/songs_bloc.dart';
import '../../../../core/helpers/shared_preferences_helper.dart';
import 'checkbox_list_tile.dart';

class BottomSheetFilter extends StatefulWidget {
  @override
  State<BottomSheetFilter> createState() => _BottomSheetFilterState();
}

class _BottomSheetFilterState extends State<BottomSheetFilter> {
  bool orderByTitle = false;
  List<String> allLanguages = [];
  List<String> orderLang = [];
  @override
  void initState() {
    SharedPreferencesHelper.getList(SharedPreferencesKeys.orderLanguages)
        .then((value) {
      setState(() {
        orderLang = value ?? [];
        print(orderLang);
      });
    });
    SharedPreferencesHelper.getBool(SharedPreferencesKeys.orderByTitle)
        .then((value) {
      orderByTitle = value ?? true;
      setState(() {});
    });
    SharedPreferencesHelper.getList(SharedPreferencesKeys.allSongsTitleKeys)
        .then((value) {
      allLanguages = value ?? [];
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }

      //move item to the new position
      final String item = allLanguages.removeAt(oldIndex);
      allLanguages.insert(newIndex, item);
      //writing new order of lang-s to preferences
      setOrderLang();
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      height: MediaQuery.of(context).size.height / 2.1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Center(
              child: Text(
                'Sort by'.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _sortButton(context, 'By number'.tr(), orderByTitle == false),
              _sortButton(context, 'By tittle'.tr(), orderByTitle == true)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              thickness: 1.5,
            ),
          ),
          FittedBox(
              child: Text(
            'hint reorder lang'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: screensColors['songBook']),
            textAlign: TextAlign.center,
          )),
          Expanded(
            // margin: EdgeInsets.only(top: 10),
            child: ReorderableListView(
              scrollDirection: Axis.vertical,
              onReorder: _onReorder,
              children: List.generate(allLanguages.length, (index) {
                return MyCheckboxListTile(allLanguages, orderLang,
                    allLanguages[index], ValueKey('$index'));
              }),
            ),
          ),
        ],
      ),
    );
  }

  _sortButton(BuildContext context, String title, bool active) {
    Color activeColor = screensColors['songBook']!;
    Color unActive = Theme.of(context).canvasColor;
    return InkWell(
      onTap: () {
        setState(() {
          orderByTitle = !orderByTitle;
        });
        _orderSongs(orderByTitle);
      },
      child: Container(
        height: 36,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            color: active ? activeColor : unActive,
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: activeColor)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: active ? unActive : activeColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _orderSongs(bool orderByTitle) async {
    await SharedPreferencesHelper.saveBool(
        SharedPreferencesKeys.orderByTitle, orderByTitle);
    context.read<SongsBloc>().add(SongsRequested());
  }

  void setOrderLang() async {
    //save reordered list
    await SharedPreferencesHelper.saveList(
        SharedPreferencesKeys.allSongsTitleKeys, allLanguages);
    //save the same order in filtered languages
    final List<String> reorderedLanguages = List.from(allLanguages);
    reorderedLanguages.removeWhere((item) => !orderLang.contains(item));
    await SharedPreferencesHelper.saveList(
        SharedPreferencesKeys.orderLanguages, reorderedLanguages);
    context.read<SongsBloc>().add(SongsRequested());
    setState(() {});
  }
}
