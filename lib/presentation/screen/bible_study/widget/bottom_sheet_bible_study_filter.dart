import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/bible_study_bloc/bible_study_bloc.dart';
import 'package:icoc/presentation/widget/checkbox_list_tile.dart';

import 'package:icoc/core/constants.dart';
import 'package:icoc/core/notifications/push_notification_service.dart';

class BottomSheetBibleStudyFilter extends StatefulWidget {
  const BottomSheetBibleStudyFilter({super.key});

  @override
  State<BottomSheetBibleStudyFilter> createState() =>
      _BottomSheetBibleStudyFilterState();
}

class _BottomSheetBibleStudyFilterState
    extends State<BottomSheetBibleStudyFilter> {
  final bibleStudyUserLanguagesHandler =
      getIt<BibleStudyUserLanguagesHandler>();
  @override
  void initState() {
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
              children: List.generate(
                  bibleStudyUserLanguagesHandler.languages.length, (index) {
                return MyCheckboxListTile(
                    allLanguages: bibleStudyUserLanguagesHandler.languages,
                    color: ScreenColors.bibleStudy,
                    label: bibleStudyUserLanguagesHandler.languages.keys
                        .toList()[index],
                    callback: (Map<String, dynamic> activeLanguages) async {
                      await bibleStudyUserLanguagesHandler
                          .saveAllLanguages(activeLanguages);
                      final activeSet = activeLanguages.entries
                          .where((e) => e.value == true)
                          .map((e) => e.key)
                          .toSet();
                      await getIt<PushNotificationService>()
                          .updateLanguageSubscriptions(activeSet);
                      getIt<BibleStudyBloc>()
                          .add(const BibleStudyEvent.listRequested());
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
