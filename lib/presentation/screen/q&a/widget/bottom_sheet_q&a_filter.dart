import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/q&a_bloc/list_q&a/q&a_bloc.dart';
import 'package:icoc/presentation/widget/checkbox_list_tile.dart';

import 'package:icoc/core/constants.dart';

class BottomSheetQandAFilter extends StatefulWidget {
  const BottomSheetQandAFilter({super.key});

  @override
  State<BottomSheetQandAFilter> createState() => _BottomSheetQandAFilterState();
}

class _BottomSheetQandAFilterState extends State<BottomSheetQandAFilter> {
  final qAndAUserLanguagesHandler = getIt<QandAUserLanguagesHandler>();
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
                  qAndAUserLanguagesHandler.languages.length, (index) {
                return MyCheckboxListTile(
                    allLanguages: qAndAUserLanguagesHandler.languages,
                    color: ScreenColors.QandA,
                    label: qAndAUserLanguagesHandler.languages.keys
                        .toList()[index],
                    callback: (Map<String, dynamic> activeLanguages) async {
                      await qAndAUserLanguagesHandler
                          .saveAllLanguages(activeLanguages);
                      getIt<QandABloc>().add(const QandAEvent.requested());
                      setState(() {});
                    },
                    onlyOneActiveLangAllowed: true,
                    key: ValueKey('$index'));
              }),
            ),
          ),
        ],
      ),
    );
  }
}
