import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../widget/modal_bottom_sheet.dart';

class GeneralSettingsScreen extends StatefulWidget {
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
            SizedBox(
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: AdaptiveTheme.of(context).theme.iconTheme.color,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "App language".tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Expanded(child: Container()),
                    CountryFlag.fromCountryCode(
                        handleLanguage(locale.languageCode),
                        width: 20,
                        height: 15),
                    SizedBox(width: 10.0),
                    Text(
                      locale.languageCode.tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
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
                                      FirebaseAnalytics.instance.logEvent(
                                          name: 'change language',
                                          parameters: {'language': language});
                                      Navigator.pop(context);
                                    },
                                    title: Text(language.tr()),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 16),
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

  String textForItems(String language) {
    switch (language) {
      case 'ru':
        return 'dropdown_menu_lang_app_russian'.tr();

      case 'en':
        return 'dropdown_menu_lang_app_english'.tr();

      case 'uk':
        return 'dropdown_menu_lang_app_ukrainian'.tr();

      default:
        return 'dropdown_menu_lang_app_russian'.tr();
    }
  }

  String handleLanguage(String language) {
    if (language == 'uk') return 'ua';
    if (language == 'en')
      return 'us';
    else
      return language;
  }
}
