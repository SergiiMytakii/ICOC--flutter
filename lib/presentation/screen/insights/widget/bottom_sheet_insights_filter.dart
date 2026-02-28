import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icoc/core/constants.dart';
import 'package:icoc/core/notifications/push_notification_service.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/bloc/insights/insights_bloc.dart';
import 'package:icoc/presentation/bloc/insights/insights_event.dart';
import 'package:icoc/presentation/bloc/insights/insights_state.dart';
import 'package:icoc/domain/model/insights/post.dart';

class BottomSheetInsightsFilter extends StatelessWidget {
  const BottomSheetInsightsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height / 2.5,
      child: BlocBuilder<InsightsBloc, InsightsState>(
        builder: (BuildContext context, InsightsState state) {
          return state.maybeWhen(
            loaded: (
              List<Post> posts,
              List<String> availableLanguages,
              Map<String, bool> selectedLanguages,
              Set<String> likedPostIds,
              Set<String> busyPostIds,
              String? actionMessage,
            ) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Filter languages'.tr(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Expanded(
                    child: availableLanguages.isEmpty
                        ? const Center(
                            child: Text('No language filters available'),
                          )
                        : ListView.builder(
                            itemCount: availableLanguages.length,
                            itemBuilder: (BuildContext context, int index) {
                              final String langCode = availableLanguages[index];
                              final String label = languagesCodes[langCode] ??
                                  langCode.toUpperCase();
                              return CheckboxListTile(
                                value: selectedLanguages[langCode] == true,
                                activeColor: ScreenColors.general,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(
                                  label,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                onChanged: (bool? value) async {
                                  if (value == null) {
                                    return;
                                  }
                                  final Map<String, bool> nextSelected =
                                      <String, bool>{
                                    for (final String key in availableLanguages)
                                      key: selectedLanguages[key] == true,
                                  };
                                  nextSelected[langCode] = value;
                                  if (!nextSelected.values
                                      .any((bool selected) => selected)) {
                                    nextSelected[langCode] = true;
                                  }
                                  await getIt<PushNotificationService>()
                                      .syncTopicLangSubscriptionsFor(
                                    'insights',
                                    nextSelected,
                                  );
                                  if (!context.mounted) {
                                    return;
                                  }
                                  context.read<InsightsBloc>().add(
                                        InsightsEvent.languagesChanged(
                                          nextSelected,
                                        ),
                                      );
                                },
                              );
                            },
                          ),
                  ),
                ],
              );
            },
            orElse: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
          );
        },
      ),
    );
  }
}
