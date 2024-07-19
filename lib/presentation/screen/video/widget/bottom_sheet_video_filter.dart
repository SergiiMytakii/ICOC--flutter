import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/video_bloc/video_bloc.dart';
import 'package:icoc/presentation/widget/checkbox_list_tile.dart';

import 'package:icoc/constants.dart';
import 'package:icoc/core/helpers/shared_preferences_helper.dart';

class BottomSheetVideoFilter extends StatefulWidget {
  const BottomSheetVideoFilter({super.key});

  @override
  State<BottomSheetVideoFilter> createState() => _BottomSheetVideoFilterState();
}

class _BottomSheetVideoFilterState extends State<BottomSheetVideoFilter> {
  Map<String, dynamic> allLanguages = {};
  @override
  void initState() {
    allLanguages =
        SharedPreferencesHelper.getMap(StorageKeys.videosAllLanguages) ?? {};

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
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
                    color: ScreenColors.video,
                    label: allLanguages.keys.toList()[index],
                    callback: (Map<String, dynamic> activeLanguages) {
                      SharedPreferencesHelper.saveMap(
                          StorageKeys.videosAllLanguages, activeLanguages);
                      getIt<VideoBloc>().add(const VideoEvent.listRequested());
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
