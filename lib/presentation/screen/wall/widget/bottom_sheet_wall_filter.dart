import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/wall/wall_bloc.dart';
import 'package:icoc/presentation/bloc/wall/wall_event.dart';
import 'package:icoc/presentation/widget/checkbox_list_tile.dart';

class BottomSheetWallFilter extends StatefulWidget {
  const BottomSheetWallFilter({super.key});

  @override
  State<BottomSheetWallFilter> createState() => _BottomSheetWallFilterState();
}

class _BottomSheetWallFilterState extends State<BottomSheetWallFilter> {
  final wallUserLanguagesHandler = getIt<WallUserLanguagesHandler>();
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
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Filter languages'.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children:
                  List.generate(wallUserLanguagesHandler.languages.length, (index) {
                return MyCheckboxListTile(
                    allLanguages: wallUserLanguagesHandler.languages,
                    color: ScreenColors.general,
                    label:
                        wallUserLanguagesHandler.languages.keys.toList()[index],
                    callback: (Map<String, dynamic> activeLanguages) async {
                      await wallUserLanguagesHandler
                          .saveAllLanguages(activeLanguages);
                      getIt<WallBloc>().add(const WallEvent.fetch());
                      setState(() {});
                    },
                    onlyOneActiveLangAllowed: false,
                    key: ValueKey('$index'));
              }),
            ),
          ),
        ],
      ),
    );
  }
}
