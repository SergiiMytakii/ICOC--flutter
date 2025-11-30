import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icoc/core/user_languages.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/video_bloc/video_bloc.dart';
import 'package:icoc/presentation/widget/checkbox_list_tile.dart';

import 'package:icoc/core/constants.dart';
import 'package:icoc/core/notifications/push_notification_service.dart';

class BottomSheetVideoFilter extends StatefulWidget {
  const BottomSheetVideoFilter({super.key});

  @override
  State<BottomSheetVideoFilter> createState() => _BottomSheetVideoFilterState();
}

class _BottomSheetVideoFilterState extends State<BottomSheetVideoFilter> {
  final videosUserLanguagesHandler = getIt<VideosUserLanguagesHandler>();
  @override
  @override
  void initState() {
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
              children: List.generate(
                  videosUserLanguagesHandler.languages.length, (index) {
                return MyCheckboxListTile(
                    allLanguages: videosUserLanguagesHandler.languages,
                    color: ScreenColors.video,
                    label: videosUserLanguagesHandler.languages.keys
                        .toList()[index],
                    callback: (Map<String, dynamic> activeLanguages) async {
                      await videosUserLanguagesHandler
                          .saveAllLanguages(activeLanguages);
                      final activeSet = activeLanguages.entries
                          .where((e) => e.value == true)
                          .map((e) => e.key)
                          .toSet();
                      await getIt<PushNotificationService>()
                          .updateLanguageSubscriptions(activeSet);
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
