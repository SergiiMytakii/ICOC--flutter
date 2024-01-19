import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/presentation/widget/checkbox_list_tile.dart';

import '../../../../constants.dart';
import '../../../../core/helpers/shared_preferences_helper.dart';

class BottomSheetBibleStudyFilter extends StatefulWidget {
  @override
  State<BottomSheetBibleStudyFilter> createState() =>
      _BottomSheetBibleStudyFilterState();
}

class _BottomSheetBibleStudyFilterState
    extends State<BottomSheetBibleStudyFilter> {
  List<String> languages = [];
  List<String> allLanguages = [];
  @override
  void initState() {
    SharedPreferencesHelper.getList(SharedPreferencesKeys.bibleStudyLanguages)
        .then((value) {
      setState(() {
        languages = value ?? [];
        print(languages);
      });
    });
    SharedPreferencesHelper.getList(
            SharedPreferencesKeys.bibleStudyAllLanguages)
        .then((value) {
      setState(() {
        allLanguages = value ?? [];
        print(allLanguages);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
              scrollDirection: Axis.vertical,
              children: List.generate(allLanguages.length, (index) {
                return MyCheckboxListTile(
                    allLanguages: allLanguages,
                    activeLanguages: languages,
                    color: screensColors['bibleStudy']!,
                    label: allLanguages[index],
                    callback: (List<String> activeLanguages) {
                      SharedPreferencesHelper.saveList(
                          SharedPreferencesKeys.bibleStudyLanguages,
                          activeLanguages);
                      context
                          .read<BibleStudyBloc>()
                          .add(BibleStudyListRequested());
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
