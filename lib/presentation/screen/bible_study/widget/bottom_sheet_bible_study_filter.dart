import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/presentation/widget/checkbox_list_tile.dart';

import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';

class BottomSheetBibleStudyFilter extends StatefulWidget {
  const BottomSheetBibleStudyFilter({super.key});

  @override
  State<BottomSheetBibleStudyFilter> createState() =>
      _BottomSheetBibleStudyFilterState();
}

class _BottomSheetBibleStudyFilterState
    extends State<BottomSheetBibleStudyFilter> {
  Map<String, dynamic> allLanguages = {};
  @override
  void initState() {
    allLanguages =
        SharedPreferencesHelper.getMap(StorageKeys.bibleStudyLanguages) ?? {};

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height / 1.6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Center(
              child: Text(
                'Filter languages'.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: List.generate(allLanguages.length, (index) {
                return MyCheckboxListTile(
                    allLanguages: allLanguages,
                    color: ScreenColors.bibleStudy,
                    label: allLanguages.keys.toList()[index],
                    callback: (Map<String, dynamic> activeLanguages) {
                      SharedPreferencesHelper.saveMap(
                          StorageKeys.bibleStudyLanguages, activeLanguages);
                      getIt<BibleStudyBloc>().add(BibleStudyListRequested());
                    },
                    key: ValueKey('$index'));
              }),
            ),
          ),
        ],
      ),
    );
  }
}
