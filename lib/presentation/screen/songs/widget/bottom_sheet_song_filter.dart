import 'dart:collection';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/presentation/widget/checkbox_list_tile.dart';

import '../../../../constants.dart';
import '../../../../core/bloc/songs_bloc/songs_bloc.dart';
import '../../../../core/helpers/shared_preferences_helper.dart';

class BottomSheetSongsFilter extends StatefulWidget {
  @override
  State<BottomSheetSongsFilter> createState() => _BottomSheetSongsFilterState();
}

class _BottomSheetSongsFilterState extends State<BottomSheetSongsFilter> {
  bool orderByTitle = false;
  Map<String, dynamic> allLanguages = {};
  @override
  void initState() {
    allLanguages =
        SharedPreferencesHelper.getMap(StorageKeys.allSongsLanguages) ?? {};

    super.initState();
  }

  // void _onReorder(int oldIndex, int newIndex) {
  //   if (oldIndex < newIndex) {
  //     newIndex -= 1;
  //   }

  //   //move item to the new position
  //   final String item = allLanguages.removeAt(oldIndex);
  //   allLanguages.insert(newIndex, item);
  //   //writing new order of lang-s to preferences
  //   setOrderLang();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      height: MediaQuery.of(context).size.height / 1.5,
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
                .copyWith(color: ScreenColors.songBook),
            textAlign: TextAlign.center,
          )),
          Expanded(
            // margin: EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: allLanguages.length,
                itemBuilder: (context, index) {
                  return MyCheckboxListTile(
                    allLanguages: allLanguages,
                    trailingIcon: _orderSongsLangugagesButtons(
                        allLanguages.keys.toList()[index]),
                    color: ScreenColors.songBook,
                    label: allLanguages.keys.toList()[index],
                    key: ValueKey('$index'),
                    callback: (Map<String, dynamic> langsToSave) {
                      SharedPreferencesHelper.saveMap(
                              StorageKeys.allSongsLanguages, langsToSave)
                          .then((value) =>
                              context.read<SongsBloc>().add(SongsRequested()));
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _orderSongsLangugagesButtons(String label) {
    return SizedBox(
      height: 40,
      width: 100,
      child: Row(
        children: [
          IconButton(
              style: ButtonStyle(
                  enableFeedback: true,
                  elevation: MaterialStateProperty.all(15),
                  padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  backgroundColor:
                      MaterialStateProperty.all(ScreenColors.songBook)),
              onPressed: () async {
                List<MapEntry<String, dynamic>> list =
                    allLanguages.entries.toList();
                final index = allLanguages.keys.toList().indexOf(label);
                if (index == 0) return;
                final newIndex = index - 1;
                final value = list.removeAt(index);
                list.insert(newIndex, value);
                setState(() {
                  allLanguages = Map.fromEntries(list);
                });
                await SharedPreferencesHelper.saveMap(
                    StorageKeys.allSongsLanguages, allLanguages);
                context.read<SongsBloc>().add(SongsRequested());
              },
              icon: Icon(Icons.arrow_upward)),
          IconButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ScreenColors.songBook)),
              onPressed: () async {
                List<MapEntry<String, dynamic>> list =
                    allLanguages.entries.toList();
                final index = allLanguages.keys.toList().indexOf(label);
                if (index == list.length - 1) return;
                final newIndex = index + 1;
                final value = list.removeAt(index);
                list.insert(newIndex, value);
                setState(() {
                  allLanguages = Map.fromEntries(list);
                });
                await SharedPreferencesHelper.saveMap(
                    StorageKeys.allSongsLanguages, allLanguages);
                context.read<SongsBloc>().add(SongsRequested());
              },
              icon: Icon(Icons.arrow_downward))
        ],
      ),
    );
  }

  _sortButton(BuildContext context, String title, bool active) {
    Color activeColor = ScreenColors.songBook;
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
        StorageKeys.orderByTitle, orderByTitle);
    context.read<SongsBloc>().add(SongsRequested());
  }

  // void setOrderLang() async {
  //   //save reordered list
  //   await SharedPreferencesHelper.saveList(
  //       StorageKeys.allSongsLanguages, allLanguages);
  //   //save the same order in filtered languages
  //   final List<String> reorderedLanguages = List.from(allLanguages);
  //   reorderedLanguages.removeWhere((item) => !orderLang.contains(item));
  //   await SharedPreferencesHelper.saveList(
  //       StorageKeys.orderLanguages, reorderedLanguages);
  //   context.read<SongsBloc>().add(SongsRequested());
  //   setState(() {});
  // }
}
