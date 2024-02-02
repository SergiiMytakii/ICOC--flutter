import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
                    trailingIcon: _orderSongsLanguagesButtons(
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

  Widget _orderSongsLanguagesButtons(String label) {
    return SizedBox(
      height: 40,
      width: 114,
      child: Row(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: IconButton(
                padding: EdgeInsets.zero,
                color: Colors.white,
                style: ButtonStyle(
                    enableFeedback: true,
                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                    backgroundColor:
                        MaterialStateProperty.all(ScreenColors.songBook)),
                onPressed: () async {
                  _handleTapUpward(label);
                },
                icon: Icon(Icons.arrow_upward)),
          ),
          SizedBox(
            width: 12,
          ),
          SizedBox(
            width: 32,
            height: 32,
            child: IconButton(
                padding: EdgeInsets.zero,
                color: Colors.white,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ScreenColors.songBook)),
                onPressed: () async {
                  _handleTapDownward(label);
                },
                icon: Icon(Icons.arrow_downward)),
          ),
          SizedBox(
            width: 6,
          ),
          _buildPopUpMenuButton(label),
        ],
      ),
    );
  }

  SizedBox _buildPopUpMenuButton(String label) {
    return SizedBox(
      width: 32,
      height: 32,
      child: PopupMenuButton(
        onSelected: (value) {
          if (value == 'To the top') _moveToTop(label);
          if (value == 'To the bottom') _moveToBottom(label);
        },
        color: AdaptiveTheme.of(context).theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              Platform.isIOS ? 10.0 : 0), // Rounded corners
        ),
        itemBuilder: (BuildContext context) {
          return [
            _buildPopupMenuItem('To the top'),
            _buildPopupMenuItem('To the bottom'),
            _buildHelp(),
          ];
        },
        icon: Icon(
          CupertinoIcons.ellipsis,
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String value) {
    return PopupMenuItem<String>(
      padding: EdgeInsets.zero,
      value: value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              value.tr(),
            ),
          ),
          Platform.isIOS
              ? Divider(
                  color: const Color.fromARGB(157, 158, 158, 158),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildHelp() {
    return PopupMenuItem<String>(
      enabled: false,
      padding: EdgeInsets.zero,
      value: '?',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '*Language on the top'.tr(),
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
            ),
            Text(
              'will be displayed first'.tr(),
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _moveToTop(String label) async {
    List<MapEntry<String, dynamic>> list = allLanguages.entries.toList();
    final index = allLanguages.keys.toList().indexOf(label);
    final value = list.removeAt(index);
    list.insert(0, value);
    setState(() {
      allLanguages = Map.fromEntries(list);
    });
    await _saveAndRefresh();
  }

  Future<void> _moveToBottom(String label) async {
    List<MapEntry<String, dynamic>> list = allLanguages.entries.toList();
    final index = allLanguages.keys.toList().indexOf(label);
    final value = list.removeAt(index);
    list.add(value);
    setState(() {
      allLanguages = Map.fromEntries(list);
    });
    await _saveAndRefresh();
  }

  Future<void> _handleTapUpward(String label) async {
    List<MapEntry<String, dynamic>> list = allLanguages.entries.toList();
    final index = allLanguages.keys.toList().indexOf(label);
    if (index == 0) return;
    final newIndex = index - 1;
    final value = list.removeAt(index);
    list.insert(newIndex, value);
    setState(() {
      allLanguages = Map.fromEntries(list);
    });
    await _saveAndRefresh();
  }

  Future<void> _handleTapDownward(String label) async {
    List<MapEntry<String, dynamic>> list = allLanguages.entries.toList();
    final index = allLanguages.keys.toList().indexOf(label);
    if (index == list.length - 1) return;
    final newIndex = index + 1;
    final value = list.removeAt(index);
    list.insert(newIndex, value);
    setState(() {
      allLanguages = Map.fromEntries(list);
    });
    await _saveAndRefresh();
  }

  Future<void> _saveAndRefresh() async {
    await SharedPreferencesHelper.saveMap(
        StorageKeys.allSongsLanguages, allLanguages);
    context.read<SongsBloc>().add(SongsRequested());
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
}
