import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/core/data_sources/local/local_cache.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/main.dart';
import 'package:icoc/constants.dart';
import 'package:icoc/presentation/bloc/songs_bloc/songs_bloc.dart';

class BottomSheetSongsFilter extends StatefulWidget {
  const BottomSheetSongsFilter({super.key});

  @override
  State<BottomSheetSongsFilter> createState() => _BottomSheetSongsFilterState();
}

class _BottomSheetSongsFilterState extends State<BottomSheetSongsFilter> {
  bool orderByTitle = true;
  Map<String, dynamic> allLanguages = {};
  String primaryLang = '';

  bool get isOneActiveLang =>
      allLanguages.entries.toList().where((entry) => entry.value).length == 1;
  @override
  void initState() {
    primaryLang =
        getIt<LocalCache>().getString(StorageKeys.primaryLang) ?? locale;
    allLanguages =
        getIt<LocalCache>().getMap(StorageKeys.allSongsLanguages) ?? {};

    orderByTitle =
        getIt<LocalCache>().getBool(StorageKeys.orderByTitle) ?? true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
          const Padding(
            padding: EdgeInsets.all(8),
            child: Divider(
              thickness: 1.5,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              Text('Language'.tr()),
              const Spacer(),
              Text('Primary'.tr()),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          Expanded(
            // margin: EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: allLanguages.length,
                itemBuilder: (context, index) {
                  final lang = allLanguages.keys.toList()[index];
                  final isActive = allLanguages.values.toList()[index];
                  final isPrimary = primaryLang == lang;
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    secondary: isActive ? _primaryLangSwitch(lang) : null,
                    activeColor: ScreenColors.songBook,
                    title: Text(lang.tr(),
                        style: Theme.of(context).textTheme.titleLarge!),
                    value: isActive,
                    key: ValueKey('$index'),
                    onChanged: (val) {
                      allLanguages[lang] = val ?? false;
                      if (val! && isOneActiveLang) {
                        primaryLang = lang;
                      }
                      if (!val && isPrimary) _setPrimaryAnotherLang();

                      _saveAndRefresh();
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _primaryLangSwitch(String label) {
    return Switch.adaptive(
        value: primaryLang == label,
        onChanged: (val) {
          setState(() {
            if (val) {
              primaryLang = label;
            } else {
              getIt<LocalCache>().removeValue(StorageKeys.primaryLang);
              _setPrimaryAnotherLang();
            }
            _saveAndRefresh();
          });
        });
  }

  Future<void> _saveAndRefresh() async {
    await getIt<LocalCache>()
        .saveMap(StorageKeys.allSongsLanguages, allLanguages);
    getIt<LocalCache>().saveString(StorageKeys.primaryLang, primaryLang);
    getIt<SongsBloc>().add(const SongsEvent.songsRequested());
    setState(() {});
  }

  InkWell _sortButton(BuildContext context, String title, bool active) {
    const Color activeColor = ScreenColors.songBook;
    final Color unActiveColor = Theme.of(context).canvasColor;
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
            color: active ? activeColor : unActiveColor,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: activeColor)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: active ? unActiveColor : activeColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _orderSongs(bool orderByTitle) async {
    await getIt<LocalCache>().saveBool(StorageKeys.orderByTitle, orderByTitle);
    getIt<SongsBloc>().add(const SongsEvent.songsRequested());
  }

  void _setPrimaryAnotherLang() {
    final activeLang = allLanguages.entries
        .toList()
        .firstWhere(
          (entry) => entry.value,
          orElse: () => MapEntry(locale, true),
        )
        .key;
    primaryLang = activeLang;
  }
}
