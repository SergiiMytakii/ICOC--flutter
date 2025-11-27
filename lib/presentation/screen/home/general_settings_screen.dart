import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:icoc/core/constants.dart';
import 'package:icoc/domain/data_sources/local/local_cache.dart';
import 'package:icoc/injection.dart';
import 'package:icoc/presentation/widget/modal_bottom_sheet.dart';

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({super.key});

  @override
  State<GeneralSettingsScreen> createState() => _GeneralSettingsScreenState();
}

class _GeneralSettingsScreenState extends State<GeneralSettingsScreen> {
  @override
  void initState() {
    FirebaseAnalytics.instance
        .logScreenView(screenName: 'General setings screen');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> languages = languagesCodes.keys.toList();
    final locale = Localizations.localeOf(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('app_bar_settings'.tr()),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SwitchListTile.adaptive(
              activeColor: AdaptiveTheme.of(context).theme.focusColor,
              title: Text(
                'settings_dark_theme'.tr(),
                style: AdaptiveTheme.of(context).theme.textTheme.bodyLarge,
              ),
              value: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark,
              onChanged: (_) {
                AdaptiveTheme.of(context).toggleThemeMode();
              },
              secondary: Icon(
                Icons.color_lens,
                color: AdaptiveTheme.of(context).theme.iconTheme.color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: AdaptiveTheme.of(context).theme.iconTheme.color,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        'App language'.tr(),
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    CountryFlag.fromCountryCode(
                        handleLanguage(locale.languageCode),
                        width: 20,
                        height: 15),
                    const SizedBox(width: 10),
                    Text(
                      locale.languageCode.tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => ModalBottomSheet(
                            height: MediaQuery.of(context).size.height / 1.4,
                            blurBackground: false,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              child: ListView(
                                children: languages.map((language) {
                                  return ListTile(
                                    onTap: () async {
                                      await context.setLocale(Locale(language));
                                      getIt<LocalCache>().saveString(
                                          StorageKeys.locale, language);
                                      FirebaseAnalytics.instance.logEvent(
                                          name: 'change language',
                                          parameters: {'language': language});
                                      context.pop();
                                    },
                                    title: Text(language.tr()),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    leading: CountryFlag.fromCountryCode(
                                        handleLanguage(language),
                                        width: 20,
                                        height: 15),
                                  );
                                }).toList(),
                              ),
                            ),
                          ));
                },
              ),
            ),
          ],
        ));
  }

  String handleLanguage(String language) {
    if (language == 'uk') return 'ua';
    if (language == 'en')
      return 'us';
    else
      return language;
  }
}
